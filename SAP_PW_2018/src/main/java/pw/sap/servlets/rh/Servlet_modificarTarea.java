package pw.sap.servlets.rh;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.db.Conexion;

/**
 *
 * @author Josafat Rosas Ortiz
 */
@WebServlet(name = "Servlet_modificarTarea", urlPatterns = {"/Servlet_modificarTarea"})
public class Servlet_modificarTarea extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        Conexion c = new Conexion();
        Integer resultado = 0;
        String [] valores = {request.getParameter("modificarNombreTarea"),request.getParameter("modificarEncargadoTarea"),
            request.getParameter("modificarFechaInicio"),request.getParameter("modificarFechaFin")};
        for(int i = 0 ; i < valores.length ; i++){
            if(!valores[i].equals("")){
                switch(i){
                    case 0:
                        resultado = c.actualizar("nombre='"+request.getParameter("modificarNombreTarea")+"'", 
                                "tarea", "id_tarea", " = "+request.getParameter("modificarIdTarea"));
                        break;
                    case 1:
                        resultado = c.actualizar("responsable="+request.getParameter("modificarEncargadoTarea"), 
                                "tarea", "id_tarea", " = "+request.getParameter("modificarIdTarea"));
                        break;
                    case 2:
                        resultado = c.actualizar("fecha_inicio='"+request.getParameter("modificarFechaInicio")+"'", 
                                "tarea", "id_tarea", " = "+request.getParameter("modificarIdTarea"));
                        break;
                    case 3:
                        resultado = c.actualizar("fecha_termino='"+request.getParameter("modificarFechaFin")+"'", 
                                "tarea", "id_tarea", " = "+request.getParameter("modificarIdTarea"));
                        break;
                }
            }
        }
        
        try (PrintWriter out = response.getWriter()) {
            if(resultado == 1){
                int i = c.insercionRegistro((int)request.getSession().getAttribute("usuario"), (String)request.getSession().getAttribute("area"), "Se modifico una tarea");
            
                out.println("Modificacion realizada correctamente");
            }else{
                int i = c.insercionRegistro((int)request.getSession().getAttribute("usuario"), (String)request.getSession().getAttribute("area"), "Intento de modificacion de tarea");
            
               
                out.println("Modificacion fallida");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Servlet_modificarTarea.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_modificarTarea.class.getName()).log(Level.SEVERE, null, ex);
        }
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
