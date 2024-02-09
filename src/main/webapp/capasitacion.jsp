<%-- 
    Document   : modificar
    Created on : 20/12/2023, 8:49:11
    Author     : david
--%>
<%@page import="java.util.List"%>
<%@page import="MODELO.Capasitacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>permisosCrud</title>
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
                            <a class="nav-link active" aria-current="page"  href="navegacionCrud.jsp">Modifcar datos y reportes</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Salir</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container mt-3 ">
            <div class="row ">
                <div class="col-md-20 offset-md-0">
                    <div class="card">
                        <div class="card-body">

                            <div class="mb-3">
                                <p style="font-size: larger;"><b>Control de capacitacion</b></p>
                                <p>Ingresar un nuevo registro</p> 
                                <div class="row mt-1">
                                    <div class="col-md-4">
                                        <a href="capasitacionInsert.jsp" class="btn btn-dark ">Ingresar</a>

                                    </div>
                                </div>
                                <br>
                                <p> Generar reporte </p> 
                                <div class="row mt-1">
                                    <div class="col-md-4">
                                        <button class="btn btn-primary">WORD</button>
                                    </div>
                                    <div class="col-md-4">
                                        <button class="btn btn-success">EXEL</button>
                                    </div>
                                    <div class="col-md-4">
                                        <button class="btn btn-danger">PDF</button>
                                    </div>
                                </div>

                            </div>

                            <!-- Formulario de control de asistencias -->
                            <form action="ServletGestionCapacitacion" method="post">
                                                              <div class="container-fluid">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="idCedula" class="form-label">Buscar docente</label>
                                <input name="idCedula" type="text" class="form-control" id="idCedula" placeholder="Ingresa la cédula">
                                <br>
                                <input name="operacion" type="submit" class="btn btn-dark"value="FILTRAR">
                                <input name="operacion" type="submit" class="btn btn-light text-dark border-dark" value="MOSTRAR TODOS LOS DATOS">

                            </div>
                            <div class="col-md-6">
                                <label for="deleteId" class="form-label">ID para eliminar su asistencia</label>
                                <input name="deleteId" type="text" class="form-control" id="deleteId">
                                <br>
                                <input name="operacion" type="submit" class="btn btn-light text-dark border-dark" value="ELIMINAR">
                            </div> 
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="idUpdate" class="form-label">ID para editar sus horas cumplidas</label>
                                <input name="idUpdate" type="text" class="form-control" id="idUpdate">
                                <br>
                                <input name="operacion" type="submit" class="btn btn-dark" value="EDITAR">
                                <a href="capasitacionInsert.jsp" class="btn btn-light text-dark border-dark">EDITAR TODO</a>


                            </div>
                            <div class="col-md-6">
                                <label for="datos" class="form-label">Nombre del evento</label>
                                <input name="datos" type="text" class="form-control" id="datos">
                                <br>
                            </div>
                        </div>
                </form>
            </div>


            <%
                           if (request.getAttribute("resultado") != null) {
                   out.println(request.getAttribute("resultado"));
                  out.println(request.getAttribute("resultadoUpdate"));                     
                         }                              
            %>


            <div class="col-sm-18">
                <table class="table table-hover">
                    <thead>
                        <tr>

                                      <th>Id</th>
                                          
                                            <th>Nombre del evento</th>
                                            <th>Tipo de evento</th>
                                            <th>Auspiciante</th>
                                            <th>Duracion en horas</th>
                                            <th>Tipo de certificado</th>
                                            <th>Certificado por</th>
                                            <th>Fecha de inicio</th>
                                            <th>Fecha de finanizacion</th>
                                            <th>Pais</th>
                                             <th>Cedula del docente</th>

                        </tr>
                    </thead>
                    <!---   ITERAR SOBRE LOS DATOS Y MOSTRAR CADA FILA EN ORDEN --->
                    <% 
                        if (request.getAttribute("cajitareporte") !=null) {
                            List<Capasitacion> arrCapas = (List<Capasitacion>) request.getAttribute("cajitareporte");
                            for (Capasitacion capas : arrCapas) {          
                    %>

                    <tr onclick="redirectToCapasitacionInsert('<%= capas.getIdCapasitacion() %>')">
                        <td><%= capas.getIdCapasitacion()%></td>
                        <td><%= capas.getNombreEvento()%></td>
                        <td><%= capas.getTipoEvento()%></td>
                        <td><%= capas.getAuspiciante()%></td>         
                        <td><%= capas.getDuracionHoras()%></td>
                        <td><%= capas.getTipoCertificado()%></td>
                        <td><%= capas.getCertificadoPor()%></td>
                        <td><%= capas.getFechaInicio()%></td>
                        <td><%= capas.getFechaFin()%></td>
                        <td><%= capas.getPais()%></td>
                          <td><%= capas.getUsuario_idCedula()%></td>
                        


                        <td class="text-center">
                            <div class="btn-group">

                            </div>
                        </td>
                    </tr>

                    <%
                                         }
                                  }
                    %>
                    <%
                                                       
                    %>

                    <script>
                        function redirectToAsistenciasInsert(id) {
                            window.location.href = "capasitacionInsert.jsp?id=" + id;
                        }
                    </script>
            </div>
        </div>
    </div>
  </div>
        </div>
    </div>
    </body>
</html>
