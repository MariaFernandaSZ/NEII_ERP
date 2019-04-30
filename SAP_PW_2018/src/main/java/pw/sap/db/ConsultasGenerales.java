/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.Properties;
import pw.sap.pojo.Contabilidad.Calen_Contable;
import pw.sap.pojo.Contabilidad.Modulos;
import pw.sap.pojo.Inventarios.Merma;

/**
 *
 * @author fgb
 */
public class ConsultasGenerales {

    public static LinkedList consultaGeneral() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <Calen_Contable> l=new LinkedList<Calen_Contable>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM calen_contable order by clave asc");
            while (rs.next()) {
                Calen_Contable cc=new Calen_Contable();
                cc.setId(rs.getInt("id"));
                cc.setClave(rs.getString("clave"));
                cc.setPeriodo(rs.getInt("periodo"));                
                cc.setFechaini(rs.getString("fechaini"));
                cc.setFechafin(rs.getString("fechafin"));
                cc.setStatus(rs.getString("status"));                
                l.add(cc);
            }                    
        conn.close();
        return l;
    }
    public static LinkedList consultaPeriodoGeneral() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <Calen_Contable> l=new LinkedList<Calen_Contable>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT id,clave FROM calen_contable order by clave asc");
            while (rs.next()) {
                Calen_Contable cc=new Calen_Contable();
                cc.setId(rs.getInt("id"));
                cc.setClave(rs.getString("clave"));                
                l.add(cc);
            }                    
        conn.close();
        return l;
    }
    
    public static LinkedList consultaModulos() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <Modulos> l=new LinkedList<Modulos>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT id_area,nombre_area FROM areas order by id_area asc");
            while (rs.next()) {
                Modulos cc=new Modulos();
                cc.setId_area(rs.getInt("id_area"));
                cc.setNombre_area(rs.getString("nombre_area"));                
                l.add(cc);
            }                    
        conn.close();
        return l;
    }
   
    
  
    
    
    public static LinkedList consultaGMermac() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
        LinkedList <Merma> l=new LinkedList<Merma>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM merma where tipo_merma='MermaConocida' order by fecha_merma asc");
            while (rs.next()) {
                Merma cc=new Merma();
                cc.setId_producto(rs.getString("id_producto"));
                cc.setIDMerma(rs.getInt("id_merma"));
                cc.setFechaRe(rs.getString("fecha_merma"));                
                cc.setTipo(rs.getString("tipo_merma"));
                cc.setCantidad(rs.getInt("cantidad_merma"));
                cc.setObs(rs.getString("motivo"));                
                l.add(cc);
            }                    
        conn.close();
        return l;
    }
}
