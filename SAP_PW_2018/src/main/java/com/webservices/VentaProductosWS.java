/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webservices;

/**
 *
 * @author maxim
 */

import java.sql.SQLException;
import javax.jws.WebService;

@WebService(endpointInterface = "com.webservices.IServicioVenta")
public class VentaProductosWS {
                
    public String solicitarCompra(String fecha, String descripcion, String cantidad, String preu, String IDP, String IDC) throws ClassNotFoundException, SQLException {
        return new ServicioVenta().doVenta(fecha,descripcion,cantidad,preu,IDP,IDC);
    }
}
