/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webservices;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;

/**
 *
 * @author maxim
 */
@WebServlet(name = "ConexionServidorTelecomunicaciones", urlPatterns = {"/ConexionServidorTelecomunicaciones"})
public class ConexionServidorTelecomunicaciones extends HttpServlet {

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
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        URL url = new URL("http://192.168.1.3:8383/SAP_PW_2018/VentaProductosWS?wsdl");
        QName qname = new QName("http://webservices.com/", "VentaProductosWS");
        //declarcion de variables
        String fecha = request.getParameter("fechaOV");
        String descripcion = request.getParameter("desOV");
        String cantidad = request.getParameter("cantidad");
        String preu = request.getParameter("costo");
        String IDP = request.getParameter("idpro");
        String IDC = request.getParameter("idcli");

        //creacion de servicio web
        Service s = Service.create(url, qname);
        IServicioVenta c = s.getPort(com.webservices.IServicioVenta.class);
        //llamada de método solicitarVehiculo
        //obtencion de valores
        System.out.println(c.solicitarCompra(fecha,descripcion,cantidad,preu,IDP,IDC));

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
        processRequest(request, response);
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
        processRequest(request, response);
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
