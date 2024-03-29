/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLADOR;

import MODELO.Permiso;
import MODELO.PermisoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author david
 */
@WebServlet(name = "ServletInsertPermiso", urlPatterns = {"/ServletInsertPermiso"})
public class ServletInsertPermiso extends HttpServlet {

                    //variables de tipo global
    PermisoDAO test;
    String mensaje;

    //metodo para dar la orden para conectar a la base de datos
    public void init() throws ServletException {
        //recibo los datos para dar la orden de coneccion a la bd
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUSERName = getServletContext().getInitParameter("jdbcUSERName");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
        try {
            test = new PermisoDAO(jdbcURL, jdbcUSERName, jdbcPassword);
            mensaje = "Conexión Exitosa";
        } catch (SQLException ex) {
            Logger.getLogger(Servlet1.class.getName()).log(Level.SEVERE, null, ex);
            mensaje = "Error de Conexión ";
        }
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletInsertPermiso</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletInsertPermiso at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
   int idPermiso;
    String motivo;
    String fechaHoraInicio;
    String fechaHoraFinal;
    String observaciones;
    double valordescontar;
    int usuario_idCedula;
    
    //estas variables se usaran para recibir los datos 
        String op;
        //zona de captura de datos
        //con esta linea de codigo podemos recibir cualquier dato que venga de la vista
        motivo = request.getParameter("motivo");
        fechaHoraInicio = request.getParameter("fechaHoraInicio");
        fechaHoraFinal = request.getParameter("fechaHoraFinal");
         observaciones = request.getParameter("observaciones");
        valordescontar = Double.parseDouble(request.getParameter("valordescontar"));
        usuario_idCedula = Integer.parseInt(request.getParameter("usuario_idCedula"));

          // Verificación de existencia de idPermiso en la solicitud
        String idPermisoParam = request.getParameter("idPermiso");
        if (idPermisoParam != null && !idPermisoParam.isEmpty()) {
            idPermiso = Integer.parseInt(idPermisoParam);
        } else {
            idPermiso = 0; // O asigna el valor que desees para indicar que no se proporcionó un id
        }

        op = request.getParameter("operacion");

        switch (op.toUpperCase()) {
            case "GUARDAR":
                Permiso objInsert = new Permiso(motivo, 
                        fechaHoraInicio, fechaHoraFinal,
                        observaciones, valordescontar, usuario_idCedula);

                if (test.registrarPermiso(objInsert)) {
                    mensaje = "Datos insertados correctamente";
                } else {
                    mensaje = "Error en la inserción de datos";
                }
                break;

            case "EDITAR":
                Permiso objact = new Permiso(idPermiso, motivo, 
                        fechaHoraInicio, fechaHoraFinal, 
                        observaciones, valordescontar, usuario_idCedula);

                if (test.EditarTODO(objact)) {
                    mensaje = "Registro actualizado";
                } else {
                    mensaje = "Error al actualizar el registro";
                }
                break;

            default:
                mensaje = "Operación no reconocida";
        }

        request.setAttribute("cajitamensajesbd", mensaje);

        RequestDispatcher objdevuelve = request.getRequestDispatcher("permisosInsert.jsp");
        objdevuelve.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
