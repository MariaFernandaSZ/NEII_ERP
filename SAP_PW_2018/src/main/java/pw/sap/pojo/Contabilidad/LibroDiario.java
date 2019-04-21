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
import static pw.sap.pojo.Contabilidad.PlanCuentas.isNumeric;

/**
 *
 * @author maxim
 */
public class LibroDiario {

    Connection conn;

    public LibroDiario() throws ClassNotFoundException, SQLException {
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

   public ResultSet ConsultaDev(String mod) throws SQLException, ClassNotFoundException {
        openDB();
        PreparedStatement ps;
        int resultado= Integer.parseInt(mod);
        ResultSet rs =null;
       
        if(resultado == 0){ 
            
           ps=conn.prepareStatement("select cuenta, folio, fecha, tipo, modulo, monto, descripcion \n"
                + "from libro_diario;");
        rs = ps.executeQuery();
        
        }
        
        if(resultado!= 0){
        
        ps = conn.prepareStatement("select cuenta, folio, fecha, tipo, modulo, monto, descripcion \n"
                + "from libro_diario \n"
                + "where modulo=" + mod + ";");
        rs = ps.executeQuery();
        
        }      
        
        
        closeDB();        
        return rs;
    }

    public double consultaLibroDiarioCargo(String fechaini, String fechafin) throws SQLException {
        openDB();
        double r;
//        PreparedStatement ps = conn.prepareStatement("select sum(monto) from asientogeneral as ag, asientodetalle as ad where ag.id=ad.id_general and (cuenta='cargo' and (ag.fecha_apli >= ?  and ag.fecha_apli < ?));");
//        ps.setString(1, fechaini);
//        ps.setString(2, fechafin);
//        ResultSet rs = ps.executeQuery();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select sum(monto) from asientogeneral as ag, asientodetalle as ad where ag.id=ad.id_general and (cuenta='cargo' and (ag.fecha_apli >= '" + fechaini + "'  and ag.fecha_apli < '" + fechafin + "'));");
        rs.next();
        r = rs.getDouble(1);
        closeDB();
        return r;
    }

    public double consultaLibroDiarioAbono(String fechaini, String fechafin) throws SQLException, ParseException {
        openDB();
        double r;

        System.out.println("hola" + fechaini + fechafin);

//        PreparedStatement ps = conn.prepareStatement("select sum(monto) from asientogeneral as ag, asientodetalle as ad where ag.id=ad.id_general and (cuenta='abono' and (ag.fecha_apli >= ?  and ag.fecha_apli < ?));");
////        ps.setString(1, fechaini);
////        ps.setString(2, fechafin);
//        ps.setDate(1, finicio);
//        ps.setDate(2, ffin);
//        ResultSet rs = ps.executeQuery();
//        rs.next();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select sum(monto) from asientogeneral as ag, asientodetalle as ad where ag.id=ad.id_general and (cuenta='abono' and (ag.fecha_apli >= '" + fechaini + "'  and ag.fecha_apli < '" + fechafin + "'));");
        rs.next();
        r = rs.getDouble(1);
        closeDB();
        return r;
    }
    
      public ResultSet ConsultaMayor(String mod) throws SQLException, ClassNotFoundException {
        openDB();
        PreparedStatement ps;
        ResultSet rs =null;
           
        
        
        ps = conn.prepareStatement("select id_operacion, fecha, tipo, monto \n"
                + "from libro_mayor \n"
                + "where fecha='" + mod + "';");
        rs = ps.executeQuery();      
             
        
        
        closeDB();        
        return rs;
    }

}
