
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <style>
            /* Estilo para centrar la imagen */
            .centrar-imagen {
                display: flex;
                justify-content: center;
                align-items: center;


                body {
     
                    /* Establece la altura del cuerpo para ocupar el 100% de la altura de la ventana (viewport height) */
                    height: 100vh;
                    /* Utiliza flexbox para centrar vertical y horizontalmente el contenido */
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    /* Elimina márgenes y rellenos predeterminados del cuerpo */
                    margin: 0;
                    padding: 0;
                }
                .card {
                    background-color: rgba(255, 255, 255, 0.8); /* Color de fondo semi-transparente para la tarjeta */
                }


            </style>
        </head>
        <body style="background-color: #800000">
            <!-- Contenedor principal con margen superior -->
            <div class="container mt-1">
                <!-- Fila en el sistema de grillas de Bootstrap -->
                <div class="row">
                    <!-- Crear una columna centrada en Bootstrap con un ancho específico en dispositivos grandes -->
                    <div class="col-lg-6 mx-auto">
                        <!-- Tarjeta para el formulario de inicio de sesión -->
                        <div class="card">

                            <!-- Cuerpo de la tarjeta con relleno -->
                            <div class="card-body p-5">
                                                            <div class="centrar-imagen">
                                <img src="./iconos/loggin.png" alt="Descripción de la imagen">
                            </div>
                                <!-- Encabezado para el formulario de inicio de sesión -->
                                <h2 class="text-center mb-5">Iniciar sesión</h2>
                                <!-- Formulario de inicio de sesión con acción "Servlet1" y método POST -->
                                <form action="Servlet1" method="post" id="loginForm">
                                    <!-- Campo de entrada para el nombre de usuario -->
                                    <div class="form-group">
                                        <label for="username">Usuario</label>
                                        <input type="text" id="nick" class="form-control" name="nick">
                                    </div>

                                    <!-- Campo de entrada para la contraseña -->
                                    <div class="form-group">
                                        <label for="password">Contraseña</label>
                                        <input type="password" id="contrasenia" class="form-control" name="contrasenia">
                                    </div>

                                    <!-- Botón de envío para el formulario de inicio de sesión -->
                                    <button type="submit" class="btn btn-primary btn-dark">Iniciar sesión</button>

                                    <!-- Código JSP para mostrar intentos restantes de inicio de sesión -->
                                    <%
                                        Integer numeroIntentos = (Integer) request.getSession().getAttribute("numeroIntentos");
                                        if (numeroIntentos != null && numeroIntentos > 0) {
                                            out.print("<p style='color:black;'>Intentos restantes: " + (3 - numeroIntentos) + "</p>");
                                        }
                                    %>
                                </form>
                                <br>
                                <form action="Servlet2" method="post" id="loginForm">
                                    <button type="submit" class="btn btn-primary btn-dark">Probar conexion</button>
                                    <br>
                                    <%
                                        if (request.getAttribute("cajitamensajesbd") != null) {
                                            out.println(request.getAttribute("cajitamensajesbd"));
                                        }
                                    %>
                                </form>


                            </div>       
                        </div>
                    </div>
                </div>
            </div>
        </body>

    </html>



