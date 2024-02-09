<%-- 
    Document   : modificar
    Created on : 20/12/2023, 8:49:11
    Author     : david
--%>
<%@page import="java.util.List"%>
<%@page import="MODELO.Usuario"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
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
                                <p style="font-size: larger;"><b>Control de Docentes</b></p>
                                <p>Ingresar un nuevo registro</p> 
                                <div class="row mt-1">
                                    <div class="col-md-4">
                                        <a href="usuarioInsert.jsp" class="btn btn-light text-dark border-dark">Ingresar</a>
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
                            <form action="ServletGestionUsuario" method="post">
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
                                <label for="deleteId" class="form-label">ID para eliminar docente</label>
                                <input name="deleteId" type="text" class="form-control" id="deleteId">
                                <br>
                                <input name="operacion" type="submit" class="btn btn-light text-dark border-dark" value="ELIMINAR">
                            </div> 
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="idUpdate" class="form-label">ID para editar estado</label>
                                <input name="idUpdate" type="text" class="form-control" id="idUpdate">
                                <br>
                                <input name="operacion" type="submit" class="btn btn-dark" value="EDITAR">
                                <a href="usuarioInsert.jsp" class="btn btn-light text-dark border-dark">EDITAR TODO</a>


                            </div>
                            <div class="col-md-6">
                                <label for="datos" class="form-label">Estado</label>
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

                        <th>Cedula</th>
                                                                <th>Estado</th>
                                        <th>Usuario</th>
                                        <th>Contraseña</th>
                                        <th>Nacionalidad</th>
                                        <th>Regimen</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Fecha nacimiento</th>
                                        <th>Estado civil</th>
                                        <th>Servicio publico</th>
                                        <th>Bienes</th>
                                        <th>Tipo sangre</th>
                                        <th>Sexo</th>
                                        <th>Direccion</th>
                                        <th>Etnia</th>

                        </tr>
                    </thead>
                    <!---   ITERAR SOBRE LOS DATOS Y MOSTRAR CADA FILA EN ORDEN --->
                    <% 
                        if (request.getAttribute("cajitareporte") !=null) {
                            List<Usuario> arrCapas = (List<Usuario>) request.getAttribute("cajitareporte");
                            for (Usuario capas : arrCapas) {          
                    %>

                    <tr onclick="redirectToUsuarioInsert('<%= capas.getIdCedula() %>')">
                        <td><%= capas.getIdCedula()%></td>
                        <td><%= capas.getEstado()%></td>
                        <td><%= capas.getUsuario()%></td>
                        <td><%= capas.getContrasenia()%></td>         
                        <td><%= capas.getNacionalidad()%></td>
                        <td><%= capas.getRegimen()%></td>
                        <td><%= capas.getNombres()%></td>
                        <td><%= capas.getApellidos()%></td>
                        <td><%= capas.getFechaNacimiento()%></td>
                        <td><%= capas.getEstadoCivil()%></td>
                        
                         <td><%= capas.getFechaAntecedentesServicioPublico()%></td>
                        <td><%= capas.getFechaUltimaDeclaracionDeBienes()%></td>
                        <td><%= capas.getTipoSangre()%></td>
                        <td><%= capas.getSexo()%></td>
                        
                         <td><%= capas.getDireccion()%></td>
                        <td><%= capas.getEtnia()%></td>
                        


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
                            window.location.href = "usuarioInsert.jsp?id=" + id;
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