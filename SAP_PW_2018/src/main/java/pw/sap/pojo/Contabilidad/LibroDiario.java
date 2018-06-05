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
import java.util.LinkedList;
import java.util.Properties;
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

    public static LinkedList consultaLibroDiariop(String modulo, String fechainicio, String fechafin) throws SQLException, ClassNotFoundException {
        Connection conn;
        Class.forName("org.postgresql.Driver");
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);

        LinkedList<ObjLibroDiario> l = new LinkedList<ObjLibroDiario>();
        PreparedStatement ps;
        ps = conn.prepareStatement("select ad.fecha_fac,a.nombre_area from asientogeneral as ag, asientodetalle as ad, areas as a where ag.id=ad.id_general and (a.nombre_area=? or (ag.fecha_apli >= ?  and ag.fecha_apli < ?) );");
        ps.setString(1, modulo);
        if (fechainicio == "" && fechafin == "") {
            ps.setNull(2, 0);
            ps.setNull(3, 0);
        } else {
            ps.setString(2, fechainicio);
            ps.setString(3, fechafin);
        }

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            ObjLibroDiario ld = new ObjLibroDiario();  
            ld.setModulo(rs.getString("nombre_area"));
            ld.setFecha(rs.getString("fecha_fac"));
            ld.setCargo(100);
            ld.setAbono(200);
            l.add(ld);
        }

        conn.close();
        return l;
    }

    public LinkedList consultaLibroDiario(String modulo, String fechainicio, String fechafin) throws SQLException {
        openDB();
        LinkedList<ObjLibroDiario> l = new LinkedList<ObjLibroDiario>();
        PreparedStatement ps;
        ps = conn.prepareStatement("select ad.fecha_fac,a.nombre_area from asientogeneral as ag, asientodetalle as ad, areas as a where ag.id=ad.id_general and (a.nombre_area=? or (ag.fecha_apli >= ?  and ag.fecha_apli < ?) );");

        ps.setString(1, modulo);

        if (fechainicio == "" && fechafin == "") {
            ps.setNull(2, 0);
            ps.setNull(3, 0);
        } else {
            ps.setString(2, fechainicio);
            ps.setString(3, fechafin);
        }

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            ObjLibroDiario ld = new ObjLibroDiario();
            ld.setModulo(rs.getString("modulo"));
            ld.setFecha(rs.getString("fecha_apli"));
            ld.setCargo(consultaLibroDiarioCargo(rs.getString("fecha_apli")));
            ld.setAbono(consultaLibroDiarioAbono(rs.getString("fecha_apli")));
            l.add(ld);
        }

        closeDB();
        return l;
    }

    public double consultaLibroDiarioCargo(String fecha) throws SQLException {
        openDB();
        double r;
        PreparedStatement ps = conn.prepareStatement("select sum(monto) from asientogeneral as ag, asientodetalle as ad where ag.id=ad.id_general and (cuenta='cargo' and ag.fecha_apli=?);");
        ps.setString(1, fecha);
        ResultSet rs = ps.executeQuery();
        r = rs.getDouble(0);
        closeDB();
        return r;
    }

    public double consultaLibroDiarioAbono(String fecha) throws SQLException {
        openDB();
        double r;
        PreparedStatement ps = conn.prepareStatement("select sum(monto) from asientogeneral as ag, asientodetalle as ad where ag.id=ad.id_general and (cuenta='abono' and ag.fecha_apli=?);");
        ps.setString(1, fecha);
        ResultSet rs = ps.executeQuery();
        r = rs.getDouble(0);
        closeDB();
        return r;
    }

}
