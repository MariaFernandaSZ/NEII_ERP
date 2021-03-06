package pw.sap.servlets.rh;

import com.google.gson.Gson;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.db.Conexion;

/**
 *
 * @author Josafat Rosas Ortiz
 */
@WebServlet(name = "Servlet_modBuscaNomina", urlPatterns = {"/Servlet_modBuscaNomina"})
public class Servlet_modBuscaNomina extends HttpServlet {

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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Conexion c = new Conexion();
        ArrayList lista = c.consulta("id_nomina,nombre_emp,to_char(fecha_creacion,'yyyy-mm-dd'),to_char(fecha_limite,'yyyy-mm-dd'),id_emp,percepciones,deducciones,"
                + "dias_pagados,sueldo_por_dia,pago_total,forma_pago","nomina", "id_nomina",
                " = "+request.getParameter("modificarIdNomina"),"", 11);
        if(!lista.isEmpty()){
            String json = new Gson().toJson(lista);
                   //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Consulta de una nomina");        
        
            response.getWriter().write(json);
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
            Logger.getLogger(Servlet_modBuscaNomina.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_modBuscaNomina.class.getName()).log(Level.SEVERE, null, ex);
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
