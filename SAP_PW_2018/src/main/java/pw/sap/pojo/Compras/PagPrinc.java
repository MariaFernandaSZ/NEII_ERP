/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Compras;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

/**
 *
 * @author Nesto
 */
public class PagPrinc {
    Connection conn;
    
    public PagPrinc() throws ClassNotFoundException, SQLException {
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
     
     public ResultSet prinProd() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                  
                                                    ps = conn.prepareStatement("select count(*) from producto");
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                    closeDB();
                  return rs;
         
                    
                    
          
                  
        }
     
     public ResultSet prinProv() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                  
                                                    ps = conn.prepareStatement("select count(*) from proveedor");
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                    closeDB();
                  return rs;
         
                    
                    
          
                  
        }
     
      public ResultSet prinOC() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                  
                                                    ps = conn.prepareStatement("select count(*) from orden_compra");
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                    closeDB();
                  return rs;
         
                    
                    
          
                  
        }
      
       public ResultSet prinFac() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                  
                                                    ps = conn.prepareStatement("select count(*) from factura");
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                    closeDB();
                  return rs;
         
                    
                    
          
                  
        }
    
}
