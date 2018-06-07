package pw.sap.servlets.compras;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.MalformedURLException;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import mx.com.servicecompra.compraServicio;
import pw.sap.db.Conexion;
import pw.sap.pojo.Compras.WebServiceCompra;

/**
 *
 * @author Josafat, Maximiliano y Francisco
 */
@WebServlet(name = "ServiceCompra", urlPatterns = {"/ServiceCompra"})
public class ServiceCompra extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, MalformedURLException {
        response.setContentType("text/html;charset=UTF-8");
        Conexion c = new Conexion();
        WebServiceCompra servicio = new WebServiceCompra();
        String cad;
        String procesar;
        ArrayList lista;
        URL url = new URL(request.getParameter("url"));
        String [] compra = request.getParameterValues("compraPendiente");
        QName qname = new QName("http://implementation.service.com.mx/", "compraImplementacion");
        Service service = Service.create(url, qname);
        compraServicio nm = service.getPort(compraServicio.class);
        for(String arreglo: compra){
            lista = c.consulta("empleado.cuenta,nomina.pago_total","nomina JOIN empleado ON nomina.id_emp = empleado.id_emp",
                                "nomina.status != 0", "AND nomina.id_nomina = "+arreglo, "", 2);
            cad = String.valueOf((BigDecimal) lista.get(1));
            procesar = servicio.servicio("00000001",lista.get(0).toString(), servicio.conversion(cad));
            switch(Integer.parseInt(nm.processor(procesar))){
                case 0:
                    c.actualizar("status = "+0, "nomina", "id_nomina = ", arreglo);
                    break;
                case 1:
                    c.actualizar("status = "+1, "nomina", "id_nomina = ", arreglo);
                    break;
                case 2:
                    c.actualizar("status = "+2, "nomina", "id_nomina = ", arreglo);
                    break;
                default:
                    c.actualizar("status = "+1, "nomina", "id_nomina = ", arreglo);
                    break;
            }
        }
        response.getWriter().write("Proceso Completado");
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
            Logger.getLogger(ServiceCompra.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServiceCompra.class.getName()).log(Level.SEVERE, null, ex);
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
