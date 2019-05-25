/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webservices;

import java.io.IOException;
import java.io.PrintWriter;
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
 * @author fgb
 */
@WebServlet(name = "ConexionServidorTransporte", urlPatterns = {"/ConexionServidorTransporte"})
public class ConexionServidorTransporte extends HttpServlet {

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
        URL url = new URL("http://192.168.1.2:8080/CRM/SolicitudImplService?wsdl");
            QName qname = new QName("http://webservices.com/", "SolicitudImplService");
            //declarcion de variables
            String rfc, tipo_vehiculo, fecha_inicio, carga, pasajeros, origen, destino;
            rfc=request.getParameter("rfc");
            tipo_vehiculo=request.getParameter("tipo_vehiculo"); 
            fecha_inicio=request.getParameter("fecha_inicio");
            carga=request.getParameter("carga"); 
            pasajeros=request.getParameter("pasajeros"); 
            origen=request.getParameter("origen");
            destino=request.getParameter("destino");
            ArrayList <String> l=new ArrayList();          
            //creacion de servicio web
            Service s = Service.create(url, qname);
            IServicioTransporte c = s.getPort(com.webservices.IServicioTransporte.class);
            //llamada de método solicitarVehiculo
            l=c.solicitarVehiculo(rfc, tipo_vehiculo, fecha_inicio, carga, pasajeros, origen, destino);
            //obtencion de valores
            for (int i = 0; i < l.size(); i++) {
                System.out.println(l.get(i));
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
