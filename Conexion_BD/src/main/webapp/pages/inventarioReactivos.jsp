<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CONTROLESCOLARSUP - Inventario de Reactivos</title>
<style>
    :root {
        --azul: #0f4c81;
        --azul-suave: #eaf3fb;
        --gris: #5f6b7a;
        --borde: #d6dee8;
        --ok: #1f7a1f;
        --alerta: #b7791f;
        --critico: #b42318;
        --fondo-critico: #fff1f1;
    }
    * { box-sizing: border-box; }
    body {
        margin: 0;
        font-family: Arial, Helvetica, sans-serif;
        background: #f5f7fa;
        color: #1f2937;
    }
    .contenedor {
        max-width: 1100px;
        margin: 0 auto;
        padding: 24px;
    }
    .encabezado {
        background: linear-gradient(135deg, var(--azul), #155e9a);
        color: #fff;
        border-radius: 16px;
        padding: 24px;
        margin-bottom: 24px;
        box-shadow: 0 12px 25px rgba(15, 76, 129, 0.18);
    }
    .encabezado-contenido {
        display: flex;
        align-items: center;
        gap: 18px;
    }
    .encabezado-imagen {
        width: 72px;
        height: 72px;
        object-fit: contain;
        background: rgba(255, 255, 255, 0.14);
        border-radius: 14px;
        padding: 10px;
    }
    .encabezado-texto {
        flex: 1;
    }
    .encabezado h1 {
        margin: 0 0 8px;
        font-size: 28px;
    }
    .encabezado p {
        margin: 0;
        line-height: 1.5;
    }
    .tarjetas {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
        gap: 16px;
        margin-bottom: 24px;
    }
    .tarjeta {
        background: #fff;
        border: 1px solid var(--borde);
        border-radius: 14px;
        padding: 18px;
        box-shadow: 0 6px 16px rgba(15, 23, 42, 0.06);
    }
    .tarjeta span {
        display: block;
        color: var(--gris);
        font-size: 13px;
        margin-bottom: 8px;
        text-transform: uppercase;
        letter-spacing: .04em;
    }
    .tarjeta strong {
        font-size: 30px;
        color: var(--azul);
    }
    .panel {
        background: #fff;
        border: 1px solid var(--borde);
        border-radius: 16px;
        padding: 20px;
        box-shadow: 0 10px 24px rgba(15, 23, 42, 0.05);
    }
    .panel h2 {
        margin-top: 0;
        color: var(--azul);
    }
    .mensaje-alerta {
        display: none;
        margin-bottom: 18px;
        border-left: 6px solid var(--critico);
        background: var(--fondo-critico);
        color: var(--critico);
        padding: 14px 16px;
        border-radius: 12px;
        font-weight: bold;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    thead {
        background: var(--azul-suave);
    }
    th, td {
        padding: 12px;
        border-bottom: 1px solid var(--borde);
        text-align: left;
        font-size: 14px;
    }
    tbody tr:hover {
        background: #f9fbfd;
    }
    .estado {
        display: inline-block;
        border-radius: 999px;
        padding: 6px 10px;
        font-size: 12px;
        font-weight: bold;
    }
    .estado-ok { background: #e8f7eb; color: var(--ok); }
    .estado-alerta { background: #fff5e8; color: var(--alerta); }
    .estado-critico { background: #fdecec; color: var(--critico); }
    .fila-critica { background: #fff8f8; }
    .nota {
        margin-top: 16px;
        color: var(--gris);
        font-size: 13px;
    }
    @media (max-width: 768px) {
        .contenedor { padding: 14px; }
        .panel { overflow-x: auto; }
        th, td { white-space: nowrap; }
        .encabezado-contenido {
            flex-direction: column;
            align-items: flex-start;
        }
    }
</style>
</head>
<body>
    <div class="contenedor">
        <section class="encabezado">
            <div class="encabezado-contenido">
                <img class="encabezado-imagen" src="<%=request.getContextPath()%>/images/reactivo_quimico.png" alt="Reactivo químico"   >
                <div class="encabezado-texto">
                    <h1>Inventario básico de reactivos</h1>
                    <p>Sistema: <strong>COPILOTEST</strong> | Struts 2 | Java 8 | Tomcat 9</p>
                    <p>Regla de alerta: si la cantidad actual del reactivo es menor o igual a <strong>3</strong>, se marca como inventario bajo.</p>
                </div>
            </div>
        </section>

        <section class="tarjetas">
            <article class="tarjeta">
                <span>Total de reactivos</span>
                <strong id="totalReactivos">0</strong>
            </article>
            <article class="tarjeta">
                <span>Reactivos con alerta</span>
                <strong id="totalAlertas">0</strong>
            </article>
            <article class="tarjeta">
                <span>Existencia acumulada</span>
                <strong id="existenciaAcumulada">0</strong>
            </article>
        </section>

        <section class="panel">
            <h2>Listado general</h2>
            <div id="mensajeAlerta" class="mensaje-alerta"></div>
            <table>
                <thead>
                    <tr>
                        <th>ID reactivo</th>
                        <th>Nombre</th>
                        <th>Cantidad total</th>
                        <th>Cantidad consumida</th>
                        <th>Cantidad actual</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody id="tablaReactivos">
                    <tr>
                        <td colspan="6">Cargando inventario...</td>
                    </tr>
                </tbody>
            </table>
            <p class="nota">La cantidad actual se calcula automáticamente restando la cantidad consumida a la cantidad total.</p>
        </section>
    </div>

    <script>
        (function () {
            var LIMITE_ALERTA = 3;
            var rutaJson = '<%=request.getContextPath()%>/data/reactivos.json';
            var cuerpoTabla = document.getElementById('tablaReactivos');
            var mensajeAlerta = document.getElementById('mensajeAlerta');
            var totalReactivos = document.getElementById('totalReactivos');
            var totalAlertas = document.getElementById('totalAlertas');
            var existenciaAcumulada = document.getElementById('existenciaAcumulada');

            function sanitizarNumero(valor) {
                var numero = Number(valor);
                return isNaN(numero) || numero < 0 ? 0 : numero;
            }

            function calcularEstado(cantidadActual) {
                if (cantidadActual <= LIMITE_ALERTA) {
                    return { texto: 'Inventario bajo', clase: 'estado-critico', fila: 'fila-critica' };
                }
                if (cantidadActual <= LIMITE_ALERTA + 2) {
                    return { texto: 'Vigilar', clase: 'estado-alerta', fila: '' };
                }
                return { texto: 'Disponible', clase: 'estado-ok', fila: '' };
            }

            function renderizar(reactivos) {
                if (!Array.isArray(reactivos) || reactivos.length === 0) {
                    cuerpoTabla.innerHTML = '<tr><td colspan="6">No hay reactivos registrados.</td></tr>';
                    mensajeAlerta.style.display = 'none';
                    totalReactivos.textContent = '0';
                    totalAlertas.textContent = '0';
                    existenciaAcumulada.textContent = '0';
                    return;
                }

                var alertas = [];
                var existenciaTotal = 0;
                var filas = reactivos.map(function (reactivo) {
                    var cantidadTotal = sanitizarNumero(reactivo.cantidad_total);
                    var cantidadConsumida = sanitizarNumero(reactivo.cantidad_consumida);
                    var cantidadActual = cantidadTotal - cantidadConsumida;
                    if (cantidadActual < 0) {
                        cantidadActual = 0;
                    }
                    existenciaTotal += cantidadActual;

                    var estado = calcularEstado(cantidadActual);
                    if (cantidadActual <= LIMITE_ALERTA) {
                        alertas.push((reactivo.nombre || 'Reactivo sin nombre') + ' (' + cantidadActual + ')');
                    }

                    return '' +
                        '<tr class="' + estado.fila + '">' +
                            '<td>' + (reactivo.id_reactivo || '') + '</td>' +
                            '<td>' + (reactivo.nombre || '') + '</td>' +
                            '<td>' + cantidadTotal + '</td>' +
                            '<td>' + cantidadConsumida + '</td>' +
                            '<td>' + cantidadActual + '</td>' +
                            '<td><span class="estado ' + estado.clase + '">' + estado.texto + '</span></td>' +
                        '</tr>';
                }).join('');

                cuerpoTabla.innerHTML = filas;
                totalReactivos.textContent = String(reactivos.length);
                totalAlertas.textContent = String(alertas.length);
                existenciaAcumulada.textContent = String(existenciaTotal);

                if (alertas.length > 0) {
                    mensajeAlerta.style.display = 'block';
                    mensajeAlerta.textContent = 'Alerta: inventario bajo en ' + alertas.join(', ') + '. Favor de reabastecer.';
                } else {
                    mensajeAlerta.style.display = 'none';
                }
            }

            function mostrarError() {
                cuerpoTabla.innerHTML = '<tr><td colspan="6">No fue posible cargar el archivo JSON de reactivos.</td></tr>';
                mensajeAlerta.style.display = 'block';
                mensajeAlerta.textContent = 'No se pudo leer la información del inventario.';
            }

            fetch(rutaJson, { cache: 'no-store' })
                .then(function (respuesta) {
                    if (!respuesta.ok) {
                        throw new Error('Error al consultar el inventario');
                    }
                    return respuesta.json();
                })
                .then(renderizar)
                .catch(mostrarError);
        })();
    </script>
</body>
</html>
