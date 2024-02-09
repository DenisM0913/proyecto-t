<%-- 
    Document   : asistenciasInsert
    Created on : 18/01/2024, 10:05:11
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Interfaz para registrar una nueva capacitacion</title>
    </head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 70px;         
            display: flex;
            align-items: center;
            justify-content: center;

        }

    </style>
    <body style="background-color: #800000">
        <!-- Barra de navegación -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="bienvenido.jsp">Inicio</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">


                        <li class="nav-item">
                            <a class="nav-link" href="capasitacion.jsp">Regresar</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Salir</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

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
                            <!-- Encabezado para el formulario de inicio de sesión -->
                            <h2 class="text-center mb-5">Agregar/Modificar registro de capacitacion</h2>
                            <!-- Formulario de inicio de sesión con acción "Servlet1" y método POST -->
                            <form action="ServletInsertCapasitacion" method="post">
                                <!-- Campo de entrada para el nombre de usuario -->
                                <div class="form-group">
                                    <label for="idCapasitacion" class="form-label">Id Capacitacion</label>
                                    <input name="idCapasitacion" type="text" class="form-control" id="idCapasitacion">
                                </div>
                                <div class="form-group">
                                    <label for="cedula" class="form-label">Cedula del docente</label>
                                    <input name="usuario_idCedula" type="text" class="form-control" id="cedula">
                                </div>
                                <div class="form-group">
                                    <label for="nombreEvento" class="form-label">Nombre del evento</label>
                                    <input name="nombreEvento" type="text" class="form-control" id="fechaAsistencia">
                                </div>
                                <div class="form-group">
                                    <label for="tipoEvento" class="form-label">Tipo de evento</label>
                                    <input name="tipoEvento" type="text" class="form-control" id="horaEntrada">
                                </div>
                                <div class="form-group">
                                    <label for="auspiciante" class="form-label">Auspiciante del evento</label>
                                    <input name="auspiciante" type="text" class="form-control" id="horaSalida">
                                </div>
                                <div class="form-group">
                                    <label for="duracionHoras" class="form-label">Duracion del evento (horas)</label>
                                    <input name="duracionHoras" type="time" class="form-control" id="obserbaciones">
                                </div>
                                <div class="form-group">
                                    <label for="tipoCertificado" class="form-label">Tipo de certificado</label>
                                    <input name="tipoCertificado" type="text" class="form-control" id="cumpleOchoHoras">
                                </div>
                                <div class="form-group">
                                    <label for="certificadoPor" class="form-label">Certificado por</label>
                                    <input name="certificadoPor" type="text" class="form-control" id="hojaRuta">
                                </div>
                                <div class="form-group">
                                    <label for="fechaInicio" class="form-label">Fecha de inicio</label>
                                    <input name="fechaInicio" type="date" class="form-control" id="horaInicioHojaRuta">
                                </div>
                                <div class="form-group">
                                    <label for="fechaFin" class="form-label">Fecha fin</label>
                                    <input name="fechaFin" type="date" class="form-control" id="horaFinHojaRuta">
                                </div>
                                <div class="form-group">
                                    <label for="pais" class="form-label">Pais</label>
                                    <input name="pais" type="text" class="form-control" id="horaFinHojaRuta">
                                </div>
                                <br>
                                <!-- Botón de envío para el formulario de inicio de sesión -->
                                <input name="operacion" type="submit" class="btn btn-primary" value="Guardar"> 
                                <input name="operacion" type="submit" class="btn btn-primary" value="Editar"> 
                                <br>                                <%
                                    if (request.getAttribute("cajitamensajesbd") != null) {
                                        out.println(request.getAttribute("cajitamensajesbd"));
                                    }
                                %>
                            </form>
                        </div>
                    </div>       
                </div>
            </div>


    </body>
</html>
