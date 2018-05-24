
package pw.sap.pojo.Inventarios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import pw.sap.db.Conexion;


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
    
    
            public int agregarMerma(String codigo, String fecha, String tipo, String cantidad, String motivo) throws SQLException, ClassNotFoundException{
         
                 openDB();
                 int valor=1;
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("INSERT INTO merma(id_producto,fecha_merma,tipo_merma,cantidad_merma,motivo) "
                                       + " VALUES ('"+codigo+"','now()','"+tipo+"',"+cantidad+",'"+motivo+"')");
                    valor = ps.executeUpdate();
          
                    System.out.println(ps);
                    
                    closeDB();
                    return valor;
                  
        }
    public int eliminarDevolucion(String codigo) throws SQLException, ClassNotFoundException{
         
            openDB();
            int valor=1;
            
                     PreparedStatement ps;
                    
                     ps = conn.prepareStatement("delete from devolucion where id_devolucion="+codigo);
                    valor = ps.executeUpdate();
        
            closeDB();
            return valor;
        }
    
    
               
   
   
   public int agregarDevolucion(String codigo, String fecha, String cantidad, String observaciones) throws SQLException, ClassNotFoundException{
         
            openDB();
            int valor=1;
                     PreparedStatement ps;
                    
                     ps = conn.prepareStatement("INSERT INTO devolucion(id_compra,cantidad_devuelta,fecha_devolucion,motivo) "
                                       + " VALUES ("+codigo+","+cantidad+",'now()','"+observaciones+"')");
                    valor = ps.executeUpdate();
                    System.out.println(ps);
        
            closeDB();
            return valor;
        }
          
    public int eliminarMerma (String codigo) throws SQLException, ClassNotFoundException{
         
            openDB();
            int valor=1;
                     PreparedStatement ps;
                    
                    ps = conn.prepareStatement("delete from merma where id_merma="+codigo);
                    valor = ps.executeUpdate();
                    System.out.println(ps);
        
            closeDB();
            return valor;
        }   
   
    
      public int insercionRegistro(int id_emp, String area, String des) throws SQLException{
        openDB();
        int valor=1;
        PreparedStatement ps;
        ps=conn.prepareStatement("INSERT INTO log(id_emp,area,desc) VALUES ("+id_emp+",'"+area+"','"+des+"'");
        valor= ps.executeUpdate();
        closeDB();        
        return valor;
    }
     
    
}
