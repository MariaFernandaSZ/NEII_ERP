package pw.sap.servlets.inventarios;

import pw.sap.pojo.Inventarios.registro;
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
import pw.sap.pojo.Inventarios.Modificar;
import pw.sap.pojo.Inventarios.registro;
/**
 *
 * @author migue_f4t6hjx
 */
@WebServlet(name = "insertar_merma", urlPatterns = {"/insertar_merma"})
public class insertar_merma extends HttpServlet {



    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        String codigo = request.getParameter("id_producto");
        String fecha = request.getParameter("fecha_mer");
        String tipo = request.getParameter("tipo_merma");
        String cantidad = request.getParameter("cant_mer");
        String motivo = request.getParameter("motivo_mer");
        

        registro rg = new registro();
        Modificar mod = new Modificar();
        ArrayList l= rg.cantidadProducto(codigo);
        System.out.println(l.get(0)); 
       
       int cantidad_prod = Integer.parseInt((String) l.get(0));
       int cantidad_merma = Integer.parseInt(request.getParameter("cant_mer"));
       String total= String.valueOf(cantidad_prod - cantidad_merma);
       if(cantidad_merma<=cantidad_prod){
        rg.agregarMerma(codigo, fecha, tipo, cantidad, motivo);
            PrintWriter out=response.getWriter();
            
           
             rg.agregarMerma(codigo, fecha, tipo, cantidad, motivo);
            out.println("<script>");
            out.println("alert('Merma ingresada correctamente');");
            out.print("window.location='Inventarios/Inventario/merma.jsp'");
            out.println("</script>");

              mod.modificarCantidad(codigo, total);
            
       }else{
        PrintWriter out=response.getWriter();
            out.println("<script>");
            out.println("alert('No se puede mermar más de lo que existe');");
            out.print("window.location='Inventarios/Inventario/merma.jsp'");
            out.println("</script>");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(insertar_merma.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(insertar_merma.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(insertar_merma.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(insertar_merma.class.getName()).log(Level.SEVERE, null, ex);
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
