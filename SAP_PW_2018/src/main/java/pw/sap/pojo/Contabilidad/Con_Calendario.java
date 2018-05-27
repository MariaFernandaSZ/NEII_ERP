/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Contabilidad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
    
    public int actualizarCalendario(String clave,String fechaini,String fechafin,int periodo,String status) throws SQLException{
        openDB();       
        PreparedStatement ps= conn.prepareStatement("update calen_contable set fechaini='"+fechaini+"', fechafin='"+fechafin+"', periodo="+periodo+", status='"+status+"' where clave='"+clave+"';");        
        int r=ps.executeUpdate();
        closeDB();
        return r;        
        
    }
}
