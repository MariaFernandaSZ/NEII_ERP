/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.scm.pojo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import pw.sap.db.Conexion;

/**
 *
 * @author Nesto
 */
public class QuerySCM {
    
    Connection conn;
    
    public QuerySCM() throws ClassNotFoundException, SQLException {
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
    
    
    
    
    public ResultSet consultaRequisicion() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select req_folio, req_cantidad, req_fecha from requisicion;");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
    
    
    public ResultSet consultaVenta() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select id_ordenventa, total_pago, descripcion from ordenventa;");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
    
    public ResultSet consultaInventario() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select id_producto, nombre, tipo_producto, cantidad, minimo, maximo from producto;");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
    
    public ResultSet consultaMerma() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select id_merma, cantidad_merma, motivo from merma;");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
}
