/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.Ventas;

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
import pw.sap.pojo.Ventas.QuerysVentas;

/**
 *
 * @author asus
 */
@WebServlet(name = "OrdenVenta", urlPatterns = {"/OrdenVenta"})
public class OrdenVenta extends HttpServlet {

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
        QuerysVentas c = new QuerysVentas();

        
        String fecha = request.getParameter("fechaOV");
        String descripcion = request.getParameter("desOV");
        String cantidad = request.getParameter("cantidad");
        String preu = request.getParameter("costo");
        String IDP = request.getParameter("idpro");
        String IDC = request.getParameter("idcli");
        
        ArrayList prod = c.consulta("id_producto,costo_venta", "producto","id_producto = '"+IDP+"'", 2);
        
        String campos="fecha,descripcion_venta,cantidad,"
                +"precio_unitario,precio_total,id_producto,id_cliente";
        
                int cant=Integer.parseInt(cantidad);
                 c.insertar(campos,"orden_venta",
                 "'"+fecha+"','"+descripcion+"',"+cantidad+","
                         +""+prod.get(1)+","+prod.get(1)+"*"+cant+",'"+prod.get(0)+"',"+IDC+"");
                 
                    response.sendRedirect("Ventas/Ordenventa.jsp"); 
        
        
        
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
            try {
                processRequest(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(OrdenVenta.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrdenVenta.class.getName()).log(Level.SEVERE, null, ex);
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
            try {
                processRequest(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(OrdenVenta.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrdenVenta.class.getName()).log(Level.SEVERE, null, ex);
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
