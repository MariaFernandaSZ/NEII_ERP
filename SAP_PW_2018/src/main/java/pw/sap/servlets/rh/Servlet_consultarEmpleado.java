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
@WebServlet(name = "Servlet_consultarEmpleado", urlPatterns = {"/Servlet_consultarEmpleado"})
public class Servlet_consultarEmpleado extends HttpServlet {

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
        ArrayList lista;
        int cont = 3;
        String id = request.getParameter("id_empleado");
        String orden = "ORDER BY id_vendedor";
        String campos = "id_vendedor,nombre,apellido";
        String [] filtro = request.getParameterValues("mostrar[]");
        if(filtro != null){
            if(filtro.length > 0){
                for(int k = 0 ; k < filtro.length ; k++){
                    campos = campos+","+filtro[k];
                    cont++;
                }
            }
        }
        if(request.getParameter("ordenar")!=null){
            if(request.getParameter("ordenar").equals("alfabeto")){orden = "ORDER BY nombre";}
            if(request.getParameter("ordenar").equals("area")){orden = "ORDER BY area";}
        }
        if(!id.equals("")){
            lista = c.consulta(campos, "empleado", "id_vendedor", "= "+id, orden, cont);
        }else{
            lista = c.consulta(campos, "empleado", "id_vendedor", "is not null ", orden, cont);
        }
        try (PrintWriter out = response.getWriter()) {
            out.println("<table class='table table-bordered'>");
            out.println("<tr>");
            for(int i = 0 ; i < lista.size() ; i++){
                if(i == cont){out.println("</tr><tr>");}
                out.print("<td>"+lista.get(i)+"</td>");
            }
            out.println("</tr>");
            out.println("</table>");
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
            Logger.getLogger(Servlet_consultarEmpleado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_consultarEmpleado.class.getName()).log(Level.SEVERE, null, ex);
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
