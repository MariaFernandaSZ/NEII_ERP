
package pw.sap.pojo.Inventarios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import pw.sap.db.Conexion;
import pw.sap.pojo.Ventas.ClienteBean;

/**
 *
 * @author migue_f4t6hjx
 */


public class registro {
   
    Connection conn;
    
    public registro() throws ClassNotFoundException, SQLException {
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
    
    
            public void agregarMerma(String codigo, String fecha, String tipo, String cantidad, String motivo) throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("INSERT INTO merma(id_producto,fecha_merma,tipo_merma,cantidad_merma,motivo) "
                                       + " VALUES ('"+codigo+"','now()','"+tipo+"',"+cantidad+",'"+motivo+"')");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  
        }
    public void eliminarDevolucion(String codigo) throws SQLException, ClassNotFoundException{
         
            openDB();
            
                     PreparedStatement ps;
                    
                     ps = conn.prepareStatement("delete from devolucion where id_devolucion="+codigo);
                    ResultSet rs= ps.executeQuery();
                    System.out.println(ps);
        
            closeDB();
        }
    
    
               
   
   
   public void agregarDevolucion(String codigo, String fecha, String cantidad, String observaciones) throws SQLException, ClassNotFoundException{
         
            openDB();
            
                     PreparedStatement ps;
                    
                     ps = conn.prepareStatement("INSERT INTO devolucion(id_producto,fecha_devolucion,cantidad_devuelta,motivo) "
                                       + " VALUES ('"+codigo+"','now()',"+cantidad+",'"+observaciones+"')");
                    ResultSet rs= ps.executeQuery();
                    System.out.println(ps);
        
            closeDB();
        }
          
    public void eliminarMerma (String codigo) throws SQLException, ClassNotFoundException{
         
            openDB();
            
                     PreparedStatement ps;
                    
                    ps = conn.prepareStatement("delete from merma where id_merma="+codigo);
                    ResultSet rs= ps.executeQuery();
                    System.out.println(ps);
        
            closeDB();
        }   
   
}
