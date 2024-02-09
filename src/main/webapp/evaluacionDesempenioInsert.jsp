<%-- 
    Document   : asistenciasInsert
    Created on : 18/01/2024, 10:05:11
    Author     : david
--%>
<%@page import="java.util.List"%>
<%@page import="MODELO.EvaluacionDesempenio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Interfaz para registrar una nueva </title>
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
                            <a class="nav-link" href="evalucionDesempe.jsp">Regresar</a>
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
                            <h2 class="text-center mb-5">Agregar/Modificar registro de evaluacion de desempeño</h2>
                            <!-- Formulario de inicio de sesión con acción "Servlet1" y método POST -->
                            <form action="ServletInsertEvaluacionDesempenio" method="post">
                                <!-- Campo de entrada para el nombre de usuario -->
                                <div class="form-group">
                                    <label for="idAsistencia" class="form-label">Id evaluacion de desempeño</label>
                                    <input name="idAsistencia" type="text" class="form-control" id="idAsistencia">
                                </div>
                                <div class="form-group">
                                    <label for="usuario_idCedula" class="form-label">Cedula del docente</label>
                                    <input name="usuario_idCedula" type="text" class="form-control" id="usuario_idCedula">
                                </div>
                                <div class="form-group">
                                    <label for="periodoEvaluacionDesde" class="form-label">Periodo de evaluacion desde</label>
                                    <input name="periodoEvaluacionDesde" type="date" class="form-control" id="periodoEvaluacionDesde">
                                </div>
                                <div class="form-group">
                                    <label for="periodoEvaluacionHasta" class="form-label">Periodo de evaluacion hasta</label>
                                    <input name="periodoEvaluacionHasta" type="date" class="form-control" id="periodoEvaluacionHasta">
                                </div>
                                <div class="form-group">
                                    <label for="nombreInstitucion" class="form-label">Nombre de la institucion</label>
                                    <input name="nombreInstitucion" type="text" class="form-control" id="nombreInstitucion">
                                </div>
                                <div class="form-group">
                                    <label for="puntaje" class="form-label">Puntaje</label>
                                    <input name="puntaje" type="text" class="form-control" id="puntaje">
                                </div>
                                <div class="form-group">
                                    <label for="calificacion" class="form-label">Calificacion</label>
                                    <input name="calificacion" type="text" class="form-control" id="calificacion">
                                </div>
                                <div class="form-group">
                                    <label for="observaciones" class="form-label">Observaciones</label>
                                    <input name="observaciones" type="text" class="form-control" id="observaciones">
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
        </div>
    </body>
</html>
