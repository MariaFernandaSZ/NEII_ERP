/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.inventarios;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import javax.servlet.http.HttpSession;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.db.Conexion;


/**
 *
 * @author montse
 */
@WebServlet(name = "ConsultaE_G", urlPatterns = {"/ConsultaE_G"})
public class ConsultaE_G extends HttpServlet {

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
        Conexion c=new Conexion();
        
       
        
        ArrayList l=c.consultaEG(Integer.parseInt(request.getParameter("CoBa")),Integer.parseInt(request.getParameter("IDEntrada")),Integer.parseInt(request.getParameter("IDOrdenCom")),"TipoPro");
        request.setAttribute("id_entrada", l.get(0));
        request.setAttribute("id_compra", l.get(1));
        request.setAttribute("id_producto", l.get(2));
        request.setAttribute("id_lote", l.get(3));
        request.setAttribute("tipo_producto", l.get(4));
        request.setAttribute("cantidad_recibido", l.get(5));
        request.setAttribute("fecha_registro", l.get(6));
        request.setAttribute("fecha_caducidad", l.get(7));
        
         int i = c.insercionRegistro((int)request.getSession().getAttribute("usuario"), (String)request.getSession().getAttribute("area"), "Se realizo una consulta general");
            
        
        request.getRequestDispatcher("Inventarios/Inventario/inventario_g.jsp").forward(request, response);
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConsultaE_G</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConsultaE_G at " + request.getContextPath() + "</h1>");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConsultaE_G.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConsultaE_G.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ConsultaE_G.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConsultaE_G.class.getName()).log(Level.SEVERE, null, ex);
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
