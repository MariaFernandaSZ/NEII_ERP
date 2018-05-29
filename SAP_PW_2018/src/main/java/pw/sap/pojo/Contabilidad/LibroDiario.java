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
import static pw.sap.pojo.Contabilidad.PlanCuentas.isNumeric;

/**
 *
 * @author maxim
 */
public class LibroDiario {
    
    Connection conn;

    public  LibroDiario() throws ClassNotFoundException, SQLException {
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
    
    public ArrayList consultaLibroDiario(String modulo, String tipo, String fechainicio, String fechafin) throws SQLException {
        openDB();
        ArrayList r = new ArrayList();
        PreparedStatement ps;
        
        ps = conn.prepareStatement("select ag.clave,a.nombre_area,ag.tipo_comprobante,ag.concepto,ad.descripcion,ag.fecha_apli,ad.porcentaje_dedu,ad.monto  from asientogeneral as ag, asientodetalle as ad, areas as a where ag.id=ad.id_general and ag.modulo=a.id_area;");
        
            ps.setNull(1,0);
            ps.setString(2, tipo);
        
        
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            r.add(rs.getString(1));
            r.add(rs.getString(2));
            r.add(rs.getString(3));
            r.add(rs.getString(4));
            r.add(rs.getString(5));
            r.add(rs.getString(6));
            r.add(rs.getString(7));
        }

        closeDB();
        return r;
    }
    
    
}
