/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Inventarios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

/**
 *
 * @author migue_f4t6hjx
 */
public class QuerysProducto {
    Connection conn;
    
    public QuerysProducto() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
    }
    
    
    public void openDB() throws SQLException {
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
    }
    
     public void closeDB() throws SQLException {
        conn.close();
    }
    
    
            public int agregar (String id_prod, String prov, String nombre, String tipo, String cant, String min, String max, String costo_uni, String costo_ven) throws SQLException, ClassNotFoundException{
         
                 openDB();
                 int valor=1;
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("INSERT INTO producto (id_producto, proveedor, nombre, tipo_producto, cantidad ,minimo, maximo,costo_unitario,costo_ventas) "
                                       + " VALUES ('"+id_prod+"','"+prov+"','"+nombre+"','"+tipo+"',"+cant+","+min+","+max+","+costo_uni+","+costo_ven+")");
                    valor = ps.executeUpdate();
          
                    System.out.println(ps);
                    
                    closeDB();
                    return valor;
                  
        }
    public int eliminar(String codigo) throws SQLException, ClassNotFoundException{
         
            openDB();
            int valor=1;
            
                     PreparedStatement ps;
                    
                     ps = conn.prepareStatement("delete from producto where id_producto="+codigo);
                    valor = ps.executeUpdate();
        
            closeDB();
            return valor;
        }
    
     public int insercionRegistro(int id_emp, String area, String des) throws SQLException{
        openDB();
        int valor=1;
        PreparedStatement ps;
        ps=conn.prepareStatement("INSERT INTO log(id_emp,area,des) VALUES ("+id_emp+",'"+area+"','"+des+"');");
        valor= ps.executeUpdate();
        closeDB();        
        return valor;
    }
    
    
   
}
