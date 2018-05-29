package pw.sap.servlets.log;

import com.csvreader.CsvWriter;
import java.io.IOException;
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
import pw.sap.pojo.log.Registro;

/**
 *
 * @author Josafat Rosas Ortiz
 */
@WebServlet(name = "GenerarCSV", urlPatterns = {"/GenerarCSV"})
public class GenerarCSV extends HttpServlet {

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
        String ruta = request.getParameter("rutaCSV");
        Filtros filtro = new Filtros();
        ArrayList<Registro> registro = new ArrayList();
        String referencia = filtro.filtrosQuery(request.getParameter("bdayG"), request.getParameter("horaInicioG"),
                                                request.getParameter("horaFinG"));
        ArrayList lista = c.consulta("des,to_char(id_emp,'99999'),area,to_char(fecha,'yyyy-mm-dd'),to_char(hora,'HH24:MI:SS')", "log", referencia, "", "", 5);
        for(int i = 0 ; i < lista.size() ; i++){
            if(i%5==0 && i!=0){
                registro.add(new Registro((String)lista.get(i-5),""+lista.get(i-4),(String)lista.get(i-3),
                        ""+lista.get(i-2),""+lista.get(i-1)));
            }
        }
        CsvWriter csv = new CsvWriter(ruta+"\\log.csv");
        for(Registro registro1: registro){
            String [] datos = registro1.arreglo();
            csv.writeRecord(datos);
        }
        csv.close();
        response.sendRedirect("Gerencia/IG/ig_inicio.jsp");
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
            Logger.getLogger(GenerarCSV.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GenerarCSV.class.getName()).log(Level.SEVERE, null, ex);
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
