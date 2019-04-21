/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Contabilidad;

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
import pw.sap.obj.Contabilidad.ObjLibroDiario;
import pw.sap.obj.Contabilidad.ObjPlanDeCuentas;

/**
 *
 * @author Marii
 */
public class Impuestos {
     Connection conn;
  

    public Impuestos() throws ClassNotFoundException, SQLException {
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
    
      public ResultSet Consulta() throws SQLException, ClassNotFoundException {
        openDB();
        PreparedStatement ps;
                   
           ps=conn.prepareStatement("SELECT * FROM impuesto ORDER BY id_impuesto DESC LIMIT 1");
           
        ResultSet rs = ps.executeQuery();
        
        
          System.out.println(ps);
        
        closeDB();        
        return rs;
    }      
        
 public int agregar(String iva,String ieps, String isr) throws SQLException, ClassNotFoundException {
        openDB();
        PreparedStatement ps;
        int resultado=1;        
        double nuevo_iva, nuevo_ieps, nuevo_isr;
        
        nuevo_iva= Double.parseDouble(iva);
        nuevo_ieps= Double.parseDouble(ieps);
        nuevo_isr= Double.parseDouble(isr);
                   
           ps=conn.prepareStatement("insert into impuesto (iva, ieps, isr) values ("+nuevo_iva+","+nuevo_ieps+","+nuevo_isr+");");
           
        resultado= ps.executeUpdate();        
                 
        closeDB();        
        return resultado;

    }
    
}
