/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.Contabilidad;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pw.sap.db.Conexion;

/**
 *
 * @author fgb
 */
public class CalenContable extends HttpServlet {

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
        
        System.out.println("clave:"+request.getParameter("clave"));
        //ArrayList l=c.calenContable(Integer.parseInt(request.getParameter("clave")));
        ArrayList l=c.calenContable(request.getParameter("clave"));
        
        request.getSession().setAttribute("clave", l.get(0));        
        request.getSession().setAttribute("periodo", l.get(1));
        request.getSession().setAttribute("fechaini", l.get(2));
        request.getSession().setAttribute("fechafin", l.get(3));
        request.getSession().setAttribute("status", l.get(4));
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
         //registro para log
//        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Consulta de Calendarios contables");        
        
        response.sendRedirect("Contabilidad/calen_contable_1.jsp");
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
            Logger.getLogger(CalenContable.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CalenContable.class.getName()).log(Level.SEVERE, null, ex);
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
        System.out.println("entre por post");
        System.out.println("clave"+request.getAttribute("clave"));
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CalenContable.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CalenContable.class.getName()).log(Level.SEVERE, null, ex);
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
