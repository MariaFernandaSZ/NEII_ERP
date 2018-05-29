package pw.sap.servlets.log;

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
import pw.sap.pojo.log.Filtros;

/**
 *
 * @author maxim
 */
@WebServlet(name = "Consultalog", urlPatterns = {"/Consultalog"})
public class Consultalog extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        Conexion c = new Conexion();
        Filtros filtro = new Filtros();
        String referencia = filtro.filtrosQuery(request.getParameter("bday"), request.getParameter("horaInicio"),
                                                request.getParameter("horaFin"));
        ArrayList lista = c.consulta("des,id_emp,area,fecha,hora", "log", referencia, "", "", 5);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Consultalog</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<table class='table table-bordered'>");
            out.println("<tr>");
            out.println("</tr>");
            out.println("<tr>");
            for(int j = 0 ; j < lista.size() ; j++){
                if(j%5==0){out.println("</tr><tr>");}
                out.print("<td>"+lista.get(j)+"</td>");
            }
            out.println("</tr>");
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
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
            Logger.getLogger(Consultalog.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Consultalog.class.getName()).log(Level.SEVERE, null, ex);
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
