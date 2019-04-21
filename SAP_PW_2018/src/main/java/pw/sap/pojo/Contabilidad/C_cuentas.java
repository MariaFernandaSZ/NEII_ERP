/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Contabilidad;

/**
 *
 * @author Marii
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.Properties;
import static org.apache.poi.hssf.usermodel.HeaderFooter.date;

public class C_cuentas {
    
      
    Connection conn;
  

    public C_cuentas() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
    }

    /**
     * inicio de conexion de la base de datos con postgres
     *
     * @throws SQLException
     */
    public void openDB() throws SQLException {
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
    }

    /**
     * Cierra la conexión con la base de datos
     *
     * @throws SQLException
     */
    public void closeDB() throws SQLException {
        conn.close();
    }
    
      public ResultSet Consultacuenta() throws SQLException, ClassNotFoundException {
        openDB();
        PreparedStatement ps;
                   
           ps=conn.prepareStatement("SELECT * FROM cuenta_cli ORDER BY id_cli DESC LIMIT 6");
           
        ResultSet rs = ps.executeQuery();
        
        
          System.out.println(ps);
        
        closeDB();        
        return rs;
    } 
      
          public ResultSet Consultacuenta2() throws SQLException, ClassNotFoundException {
        openDB();
        PreparedStatement ps;
                   
           ps=conn.prepareStatement("SELECT * FROM cuenta_prov ORDER BY id_cuenta DESC LIMIT 6");
           
        ResultSet rs = ps.executeQuery();
        
        
          System.out.println(ps);
        
        closeDB();        
        return rs;
    }
      
        public ResultSet Consultacuentaesp(String mod) throws SQLException, ClassNotFoundException {
        openDB();
        PreparedStatement ps;
        int valor=Integer.valueOf(mod); 
                   
           ps = conn.prepareStatement("select * \n"
                + "from cuenta_cli \n"
                + "where id_cli=" + valor + ";");
           
        ResultSet rs = ps.executeQuery();
        
        
          System.out.println(ps);
        
        closeDB();        
        return rs;
    }
        
           public ResultSet Consultacuentaesp2(String mod) throws SQLException, ClassNotFoundException {
        openDB();
        PreparedStatement ps;
        int valor=Integer.valueOf(mod); 
                   
           ps = conn.prepareStatement("select * \n"
                + "from cuenta_prov \n"
                + "where id_cuenta=" + valor + ";");
           
        ResultSet rs = ps.executeQuery();
        
        
          System.out.println(ps);
        
        closeDB();        
        return rs;
    }
        
 public int agregarcli (String id,String clave, String banco, String cvc, String fechexp) throws SQLException, ClassNotFoundException {
        openDB();
        PreparedStatement ps;
        int resultado=1;        
        int nuevo_id, nuevo_clave, nuevo_cvc;
        
        nuevo_id= Integer.valueOf(id);
        nuevo_clave= Integer.valueOf(clave);
        nuevo_cvc= Integer.valueOf(cvc);
                   
           ps=conn.prepareStatement("insert into cuenta_cli values ("+nuevo_id+","+nuevo_clave+",'"+banco+"',"+nuevo_cvc+",'"+fechexp+"');");
           
        resultado= ps.executeUpdate();        
                 
        closeDB();        
        return resultado;

    }
   
public int agregarprov (String id,String clave, String banco, String cvc, String fechexp) throws SQLException, ClassNotFoundException {
        openDB();
        PreparedStatement ps;
        int resultado=1;        
        int nuevo_id, nuevo_clave, nuevo_cvc;
        
        nuevo_id= Integer.valueOf(id);
        nuevo_clave= Integer.valueOf(clave);
        nuevo_cvc= Integer.valueOf(cvc);
                   
           ps=conn.prepareStatement("insert into cuenta_prov values ("+nuevo_id+","+nuevo_clave+",'"+banco+"',"+nuevo_cvc+",'"+fechexp+"');");
           
        resultado= ps.executeUpdate();        
                 
        closeDB();        
        return resultado;

    } 
    
}
