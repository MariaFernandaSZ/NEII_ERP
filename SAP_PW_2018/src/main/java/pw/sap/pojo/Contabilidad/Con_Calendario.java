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
import java.util.ArrayList;
import java.util.Properties;

/**
 *
 * @author fgb
 */
public class Con_Calendario {
        Connection conn;
    
    public Con_Calendario() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
    }

    /**
     * inicio de conexion de la base de datos con postgres
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
    * @throws SQLException
    */    
    public void closeDB() throws SQLException {
        conn.close();
    }
    
    
    public ResultSet consultaCalendario() throws SQLException{
        openDB();
        PreparedStatement ps;
                   
           ps=conn.prepareStatement("SELECT * FROM calendario_contable ORDER BY id_calen DESC LIMIT 3");
           
        ResultSet rs = ps.executeQuery();
        
        
          System.out.println(ps);
        
        closeDB();        
        return rs;
    }
    
      public ResultSet consultaesp(String folbus) throws SQLException{
        openDB();
        PreparedStatement ps;
        int valor=Integer.valueOf(folbus);
                   
           ps=conn.prepareStatement("SELECT * FROM calendario_contable Where id_calen= "+valor);
           
        ResultSet rs = ps.executeQuery();
        
        
          System.out.println(ps);
        
        closeDB();        
        return rs;
    }
    
     public int agregarcal (String folio,String clave, String fechain, String fechafin) throws SQLException, ClassNotFoundException {
        openDB();
        PreparedStatement ps;
        int resultado=1, fol,clave_cal;
        
        fol=Integer.valueOf(folio);
        clave_cal=Integer.valueOf(clave);
                   
           ps=conn.prepareStatement("insert into calendario_contable values ("+fol+","+clave_cal+",'"+fechain+"','"+fechafin+"');");
           
        resultado= ps.executeUpdate();        
                 
        closeDB();        
        return resultado;

    }
    
  
      
}
