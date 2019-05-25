package com.webservices;

import java.sql.SQLException;
import java.util.ArrayList;
import pw.sap.pojo.Ventas.QuerysVentas;

public class ServicioVenta {

    public String doVenta(String fecha, String descripcion, String cantidad, String preu, String IDP, String IDC) throws ClassNotFoundException, SQLException {
        QuerysVentas c = new QuerysVentas();

        ArrayList prod = c.consulta("id_producto,costo_venta", "producto", "id_producto = '" + IDP + "'", 2);

        String campos = "fecha,descripcion_venta,cantidad," + "precio_unitario,precio_total,id_producto,id_cliente";

        int cant = Integer.parseInt(cantidad);
        
        int resultado = c.insertar(campos, "orden_venta",   "'" + fecha + "','" + descripcion + "'," + cantidad + ","
                + "" + prod.get(1) + "," + prod.get(1) + "*" + cant + ",'" + prod.get(0) + "'," + IDC + "");
   
        return String.valueOf(resultado);
    }

}
