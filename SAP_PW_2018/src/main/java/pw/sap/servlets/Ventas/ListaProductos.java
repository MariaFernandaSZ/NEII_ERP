/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.Ventas;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.pojo.Ventas.ListaDeProductos;
import pw.sap.pojo.Ventas.ProductoBean;
import pw.sap.pojo.Ventas.VentaLista;

/**
 *
 * @author ricardozaldivar
 */
@WebServlet(name = "ListaProductos", urlPatterns = {"/ListaProductos"})
public class ListaProductos extends HttpServlet {

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
    
    ArrayList<VentaLista> ventList = new ArrayList();

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
        
        PrintWriter out = response.getWriter();
        
        String codprod = request.getParameter("codprod");
        int cant=Integer.parseInt(request.getParameter("cant"));
        String nomprod=request.getParameter("nomprod");
        double precioprod=Double.parseDouble(request.getParameter("precioprod"));
        double ivaprod=Double.parseDouble(request.getParameter("ivaprod"));
        double subtotal=Double.parseDouble(request.getParameter("subtotal"));
        
//        int cantidad = Integer.parseInt(cant);
//        double precio = Double.parseDouble(precioprod);
//        double iva = Double.parseDouble(ivaprod);
//        double subtotal = Double.parseDouble(sbtotal);
        
//        ArrayList<VentaLista> ventList = new ArrayList();
        
        ventList.add(new VentaLista(codprod,nomprod,cant,precioprod,ivaprod,subtotal));

                            out.println("<table class=\"table table-striped\" id=\"listaProductos\">");
                            out.println("<thead>");
                            out.println("<tr>");
                            out.println("<th scope=\"col\">C&oacute;digo</th>");
                            out.println("<th scope=\"col\">Nombre</th>");        
                            out.println("<th scope=\"col\">Cantidad</th>");        
                            out.println("<th scope=\"col\">Precio unitario</th>");
                            out.println("<th scope=\"col\">IVA</th>");
                            out.println("<th scope=\"col\">Subtotal</th>");
                            out.println("</tr>");    
                            out.println("</thead>");
                            out.println("<tbody>");

		for(int i=0; i<ventList.size(); i++){
			VentaLista prod = ventList.get(i);
			out.println("<tr>");
			out.println("<td>"+prod.getId_producto()+"</td>");			
			out.println("<td>"+prod.getNombre()+"</td>");
			out.println("<td>"+prod.getCantidad()+"</td>");
			out.println("<td>"+prod.getPrecioUnitario()+"</td>");
			out.println("<td>"+prod.getIva()+"</td>");
			out.println("<td>"+prod.getSubtotal()+"</td>");
			out.println("</tr>");
		}
		out.println("</tbody>");
                out.println("</table>");

//                    Gson gson = new Gson();
//            out.print(gson.toJson(new VentaLista(codprod,nomprod,cant,precioprod,ivaprod,subtotal)));
//            out.flush();
//            out.close();

        
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
