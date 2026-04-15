INVENTARIO BÁSICO DE REACTIVOS - CONEXION_BD
============================================

Proyecto: CONTROLESCOLARSUP
Tecnología base: Java 8 + Struts 2 + Tomcat 9 + HTML5
Ubicación: `Conexion_BD`

1. OBJETIVO
-----------
Se agregó una vista web para llevar un inventario muy básico de reactivos.

La pantalla muestra:
- id del reactivo
- nombre
- cantidad total
- cantidad consumida
- cantidad actual
- estado del inventario

La cantidad actual se calcula con la fórmula:

cantidad_actual = cantidad_total - cantidad_consumida

Cuando la cantidad actual es menor o igual a 3, el sistema muestra una alerta visual de inventario bajo.


2. ARCHIVOS AGREGADOS
---------------------
Se crearon los siguientes archivos:

- `src/main/java/action/InventarioReactivosAction.java`
  Acción Struts que abre la pantalla del inventario.

- `src/main/webapp/pages/inventarioReactivos.jsp`
  Vista HTML5/JSP que carga el archivo JSON, calcula la cantidad actual y muestra alertas.

- `src/main/webapp/data/reactivos.json`
  Archivo de datos con la lista de reactivos.


3. ARCHIVOS MODIFICADOS
-----------------------
- `src/main/java/struts.xml`
  Se agregó la acción:
  `inventarioReactivos`

- `src/main/webapp/index.jsp`
  Se dejó un enlace de acceso rápido en caso de que el navegador no ejecute JavaScript.


4. RUTA DE ACCESO
-----------------
Una vez desplegado el proyecto en Tomcat, la pantalla se puede abrir con la ruta:

`/Conexion_BD/inventarioReactivos.action`

Ejemplo local:
`http://localhost:8080/Conexion_BD/inventarioReactivos.action`


5. ESTRUCTURA DEL JSON
----------------------
El archivo `reactivos.json` usa esta estructura:

[
  {
    "id_reactivo": "R001",
    "nombre": "Ácido clorhídrico",
    "cantidad_total": 12,
    "cantidad_consumida": 4
  }
]

Campos:
- `id_reactivo`: identificador único del reactivo
- `nombre`: nombre del reactivo
- `cantidad_total`: existencia total registrada
- `cantidad_consumida`: cantidad ya utilizada

Nota:
- `cantidad_actual` no se guarda en el JSON.
- `cantidad_actual` se calcula automáticamente en la pantalla.


6. REGLA DE ALERTA
------------------
La regla implementada es:

- Si `cantidad_actual <= 3`, se muestra alerta de inventario bajo.

Además:
- la fila del reactivo se resalta visualmente
- se muestra un mensaje general con los reactivos en estado crítico


7. COMPORTAMIENTO DE LA PANTALLA
--------------------------------
La página realiza lo siguiente:

1. Carga el archivo `data/reactivos.json`
2. Recorre la lista de reactivos
3. Calcula la cantidad actual
4. Muestra una tabla con el inventario
5. Cuenta cuántos reactivos están en alerta
6. Muestra tarjetas de resumen
7. Presenta una alerta visible cuando algún reactivo llega a 3 o menos


8. DATOS DE EJEMPLO
-------------------
Se dejaron varios reactivos de ejemplo para pruebas iniciales.

Si se desea modificar el inventario, basta con editar el archivo:

`src/main/webapp/data/reactivos.json`


9. LIMITACIONES ACTUALES
------------------------
Esta primera versión es básica.

Actualmente:
- los datos se leen desde un archivo JSON estático
- no hay formulario para altas, bajas o cambios
- no se guarda información en base de datos Oracle
- no se actualiza automáticamente del lado del servidor


10. POSIBLES MEJORAS FUTURAS
----------------------------
Se puede extender esta funcionalidad para:

- agregar formulario para registrar nuevos reactivos
- editar cantidades desde la interfaz
- guardar cambios desde Java
- persistir la información en Oracle
- integrar el inventario al menú principal del sistema
- generar reportes de reactivos con inventario bajo


11. PRUEBA RÁPIDA
-----------------
Pasos sugeridos:

1. Desplegar `Conexion_BD` en Tomcat 9
2. Abrir la URL:
   `http://localhost:8080/Conexion_BD/inventarioReactivos.action`
3. Verificar que se muestre la tabla
4. Cambiar un reactivo en el JSON para que la cantidad actual sea 3 o menor
5. Recargar la página y confirmar que aparezca la alerta


12. RESUMEN TÉCNICO
-------------------
Patrón usado:
- MVC

Controlador:
- `InventarioReactivosAction.java`

Vista:
- `inventarioReactivos.jsp`

Fuente de datos:
- `reactivos.json`

Criterio de alerta:
- cantidad actual menor o igual a 3
