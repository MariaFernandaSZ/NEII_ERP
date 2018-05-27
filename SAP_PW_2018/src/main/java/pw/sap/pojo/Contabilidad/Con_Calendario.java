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
    /**
     * Metodo para insertar asiento general
     * @param modulo
     * @param comprobante
     * @param fechacap
     * @param concepto
     * @param periodo
     * @return
     * @throws SQLException 
     */
    public int insertarAsientoGeneral(int modulo,String comprobante,String fechacap,String concepto,int periodo) throws SQLException{
        openDB();        
        PreparedStatement ps;
        ps=conn.prepareStatement("INSERT INTO asientogeneral (modulo,tipo_comprobante,fecha_apli,concepto,periodo_conta) VALUES (?,?,'"+fechacap+"',?,?);");
        ps.setInt(1, modulo);
        ps.setString(2, comprobante);      
        ps.setString(3, concepto);
        ps.setInt(4, periodo);
        int r=ps.executeUpdate();
        closeDB();
        return r;
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
