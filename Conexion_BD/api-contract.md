# API Contract - Cambios del día en `Conexion_BD`

## Alcance
Este documento **solo** describe los archivos, rutas y contratos derivados de los cambios realizados hoy para la funcionalidad de **inventario básico de reactivos** dentro del proyecto `CONTROLESCOLARSUP`.

No incluye contratos de otros módulos históricos del sistema.

---

## Resumen de cambios considerados

### Archivos creados hoy
- `src/main/java/action/InventarioReactivosAction.java`
- `src/main/webapp/pages/inventarioReactivos.jsp`
- `src/main/webapp/data/reactivos.json`
- `readme.ms`

### Archivos modificados hoy
- `src/main/java/struts.xml`
- `src/main/webapp/index.jsp`

---

## 1. Contrato de navegación MVC

### 1.1 Ruta Struts de entrada
**Nombre de acción:** `inventarioReactivos`

**Método Java asociado:** `action.InventarioReactivosAction#verInventario()`

**Resultado esperado:** `success`

**Vista resultante:** `pages/inventarioReactivos.jsp`

### 1.2 URL funcional esperada
```text
/Conexion_BD/inventarioReactivos.action
```

### 1.3 Método HTTP
```text
GET
```

### 1.4 Request contract
Esta acción no recibe parámetros obligatorios.

| Campo | Tipo | Requerido | Descripción |
|---|---|---:|---|
| N/A | N/A | No | La acción solo enruta a la vista JSP |

### 1.5 Response contract
| Campo | Tipo | Descripción |
|---|---|---|
| content-type | `text/html` | Render de la página JSP |
| body | HTML | Pantalla del inventario básico de reactivos |

### 1.6 Comportamiento
- La acción no consulta base de datos.
- La acción no modifica estado del servidor.
- La acción solo retorna la vista de inventario.

---

## 2. Contrato de datos estáticos

### 2.1 Recurso de datos
**Archivo servido por webapp:**
```text
/data/reactivos.json
```

**URL esperada desde navegador:**
```text
/Conexion_BD/data/reactivos.json
```

**Método HTTP esperado:**
```text
GET
```

### 2.2 Formato de respuesta
```json
[
  {
    "id_reactivo": "R001",
    "nombre": "Ácido clorhídrico",
    "cantidad_total": 12,
    "cantidad_consumida": 4
  }
]
```

### 2.3 Esquema del objeto `Reactivo`
| Campo | Tipo | Requerido | Regla |
|---|---|---:|---|
| `id_reactivo` | `string` | Sí | Identificador único visible en tabla |
| `nombre` | `string` | Sí | Nombre del reactivo |
| `cantidad_total` | `number` | Sí | Debe representar la existencia total registrada |
| `cantidad_consumida` | `number` | Sí | Debe representar la cantidad usada |

### 2.4 Campos derivados en cliente
Los siguientes valores **no vienen desde el JSON** y son calculados en la JSP mediante JavaScript:

| Campo derivado | Fórmula |
|---|---|
| `cantidad_actual` | `cantidad_total - cantidad_consumida` |
| `estado` | Depende de `cantidad_actual` |

### 2.5 Reglas de sanitización implementadas
En cliente se aplica esta lógica:
- si `cantidad_total` no es numérica, se toma como `0`
- si `cantidad_consumida` no es numérica, se toma como `0`
- si un valor numérico es negativo, se toma como `0`
- si `cantidad_actual < 0`, se ajusta a `0`

---

## 3. Contrato visual/funcional de la JSP

### 3.1 Vista
**Archivo:** `src/main/webapp/pages/inventarioReactivos.jsp`

### 3.2 Fuente de datos consumida por la vista
La vista realiza una lectura de:
```text
<contextPath>/data/reactivos.json
```

### 3.3 Elementos funcionales renderizados
La vista presenta:
- encabezado informativo del módulo
- tarjeta `Total de reactivos`
- tarjeta `Reactivos con alerta`
- tarjeta `Existencia acumulada`
- tabla con inventario
- alerta general si existe inventario bajo

### 3.4 Columnas de tabla
| Columna | Origen |
|---|---|
| `ID reactivo` | `id_reactivo` |
| `Nombre` | `nombre` |
| `Cantidad total` | `cantidad_total` |
| `Cantidad consumida` | `cantidad_consumida` |
| `Cantidad actual` | valor derivado |
| `Estado` | valor derivado |

### 3.5 Reglas de estado
| Condición | Estado mostrado |
|---|---|
| `cantidad_actual <= 3` | `Inventario bajo` |
| `cantidad_actual <= 5` y `> 3` | `Vigilar` |
| `cantidad_actual > 5` | `Disponible` |

### 3.6 Regla de alerta crítica
Se debe mostrar mensaje general de alerta cuando al menos un reactivo cumpla:
```text
cantidad_actual <= 3
```

### 3.7 Mensajes funcionales esperados
#### Sin datos
```text
No hay reactivos registrados.
```

#### Error al cargar JSON
```text
No fue posible cargar el archivo JSON de reactivos.
No se pudo leer la información del inventario.
```

#### Con reactivos críticos
```text
Alerta: inventario bajo en <lista de reactivos>. Favor de reabastecer.
```

---

## 4. Contrato del controlador Java

### 4.1 Clase
```java
action.InventarioReactivosAction
```

### 4.2 Método
```java
public String verInventario()
```

### 4.3 Firma lógica
| Entrada | Salida |
|---|---|
| sin parámetros | `"success"` |

### 4.4 Responsabilidad actual
- Exponer la acción Struts del módulo
- Retornar el resultado `success`
- Delegar la carga de datos al frontend vía JSON estático

### 4.5 Fuera de alcance actual
- persistencia en Oracle
- escritura del JSON
- altas, bajas o edición de reactivos
- autenticación/autorización específica para este módulo
- servicios REST dedicados

---

## 5. Contrato de configuración Struts

### 5.1 Registro configurado
```xml
<action name="inventarioReactivos" class="action.InventarioReactivosAction" method="verInventario">
    <result name="success">pages/inventarioReactivos.jsp</result>
</action>
```

### 5.2 Criterio de éxito
La navegación es correcta si:
- la acción `inventarioReactivos.action` resuelve sin error
- se renderiza `inventarioReactivos.jsp`
- la vista puede solicitar `data/reactivos.json`

---

## 6. Ejemplos de uso

### 6.1 Navegación a la vista
```text
GET /Conexion_BD/inventarioReactivos.action
```

**Resultado esperado:** HTML de la pantalla de inventario.

### 6.2 Consulta del JSON
```text
GET /Conexion_BD/data/reactivos.json
```

**Resultado esperado:** arreglo JSON de reactivos.

---

## 7. Casos borde contemplados en lo implementado hoy

| Caso | Comportamiento actual |
|---|---|
| JSON vacío | Se muestra `No hay reactivos registrados.` |
| JSON no disponible | Se muestra mensaje de error en tabla y alerta superior |
| cantidades negativas | Se normalizan a `0` |
| consumo mayor al total | `cantidad_actual` se ajusta a `0` |
| valor no numérico | Se normaliza a `0` |

---

## 8. Limitaciones conocidas del contrato actual
- No existe API REST de escritura.
- No existe endpoint POST para guardar reactivos.
- No existe versión de contrato para base de datos Oracle.
- La fuente de verdad actual es un archivo estático en `webapp`.
- El cálculo de `cantidad_actual` ocurre en cliente, no en backend.

---

## 9. Estado de validación del día
Con base en las validaciones realizadas hoy:

- acción Java nueva: válida
- configuración Struts actualizada: válida
- JSP nueva: válida
- JSON de ejemplo: presente y legible por la vista

---

## 10. Trazabilidad a cambios del día
Este contrato corresponde exclusivamente a:
- creación del módulo visual de inventario básico de reactivos
- creación del archivo JSON de reactivos
- creación de la acción Struts para abrir la vista
- documentación inicial asociada

---

## 11. Matriz de archivos impactados

| Archivo | Tipo de cambio | Propósito |
|---|---|---|
| `src/main/java/action/InventarioReactivosAction.java` | Creación | Acción Struts que enruta a la vista del inventario |
| `src/main/webapp/pages/inventarioReactivos.jsp` | Creación | Vista HTML5/JSP del inventario y lógica cliente de lectura/cálculo |
| `src/main/webapp/data/reactivos.json` | Creación | Fuente de datos estática de reactivos |
| `src/main/java/struts.xml` | Modificación | Registro de la acción `inventarioReactivos` |
| `src/main/webapp/index.jsp` | Modificación | Enlace de acceso alterno en escenario sin JavaScript |
| `readme.ms` | Creación | Documentación funcional breve del módulo agregado |
| `api-contract.md` | Creación/actualización | Contrato técnico de los cambios implementados hoy |