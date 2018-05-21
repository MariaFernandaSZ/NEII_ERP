/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Contabilidad;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PlanCuentas {

    Connection conn;

    public PlanCuentas() throws ClassNotFoundException, SQLException {
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
        connProp.put("password", "max1m1l1an0");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:8485/sap", connProp);
    }

    /**
     * Cierra la conexión con la base de datos
     *
     * @throws SQLException
     */
    public void closeDB() throws SQLException {
        conn.close();
    }

    public ArrayList consultaPlan(String clave) throws SQLException {
        openDB();
        ArrayList r = new ArrayList();
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT codigosat, descripcion FROM cuenta_sat WHERE codigosat=?");
        ps.setString(1, clave);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            //System.out.println(rs.getInt(1));
            r.add(rs.getString(1));
            r.add(rs.getString(2));
        }

        closeDB();
        return r;
    }

    public ArrayList consultaTodoPlan() throws SQLException {
        openDB();
        ArrayList r = new ArrayList();
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT codigosat, descripcion FROM cuenta_sat");
        ResultSet rs = ps.executeQuery();
        for (int i = 0; rs.next(); i++) {
            r.add(rs.getString(i));
        }

        closeDB();
        return r;
    }
    
    public ArrayList agregaPlan(String id) throws SQLException {
        openDB();
        ArrayList r = new ArrayList();
        PreparedStatement ps;
        ps = conn.prepareStatement("INSERT INTO tabla (campos) VALUES (valores)");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        for (int i = 0; rs.next(); i++) {
            r.add(rs.getString(i));
        }

        closeDB();
        return r;
    }
    
    public Boolean eliminaPlan(int id) throws SQLException {
        openDB();
        boolean resultado=false;
        PreparedStatement ps;
        ps=conn.prepareStatement("DELETE  FROM devolucion where id_devolucion=?");
        ps.setInt(1, id);
        ResultSet rs= ps.executeQuery();
        int coba2= ps.executeUpdate();
        closeDB();
        return resultado;
    }
    
    public Boolean editaPlan(int id, String valor) throws SQLException {
        openDB();
        Boolean resultado = false;
        PreparedStatement ps;
        ps = conn.prepareStatement("UPDATE tabla SET campoMod ? WHERE campocriterio=?");
        ps.setString(1, valor);
        ps.setInt(2, id);
        ResultSet rs = ps.executeQuery();
        closeDB();
        return resultado;
    }

    //Metodos de consulta de datos
    /**
     * consultaEspecifica de campos y posibilidad de where
     *
     * @param numcampos
     * @param campo
     * @param tabla
     * @throws SQLException
     */
    public int consultaEspecifica(int numcampos, String campo, String tabla) throws SQLException {
        openDB();
        int existendatos = 0;
        Statement stmt;
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT " + campo + " FROM " + tabla);

        while (rs.next()) {
            for (int i = 1; i <= numcampos; i++) {
                existendatos = 1;
                System.out.print(rs.getString(i));
            }
        }

        closeDB();
        return existendatos;
    }

    /**
     * Este método actualiza datos de una tabla siempre y cuando el campo a
     * modificar sea texto
     *
     * @param tabla
     * @param campoMod
     * @param valor1
     * @param campocriterio
     * @param valor2
     * @return
     * @throws SQLException
     */
    public int actualizarCampoTexto(String tabla, String campoMod, String valor1, String campocriterio, int valor2) throws SQLException {
        openDB();
        System.out.println("V2 Conexión: " + conn);
        PreparedStatement ps = conn.prepareStatement("UPDATE " + tabla + " SET " + campoMod + "= " + valor1 + " WHERE " + campocriterio + "=" + valor2 + ";");
        System.out.println(ps);
        int r = ps.executeUpdate();
        closeDB();
        return r;
    }

    //METODO DE INSERCION DE DATOS Fer
//    public int ingresarRegistro(String tabla, String valores) throws SQLException {
//        openDB();
////        System.out.println("V2 Conexión: " + conn);
//        PreparedStatement ps= conn.prepareStatement("INSERT INTO "+tabla+" VALUES ("+valores+")");
//        int r=ps.executeUpdate();
//        closeDB();
//        return r;
//    }
    //METODO DE ELIMINACION DE REGISTROS Lalo
    /**
     * elimina un registro siempre por medio de una valor numérico
     *
     * @param tabla
     * @param campocriterio
     * @param valor1
     * @return
     * @throws SQLException
     */
    public int eliminaRegistro(String tabla, String campocriterio, int valor1) throws SQLException {
        openDB();
        System.out.println("V2 Conexión: " + conn);
        PreparedStatement ps = conn.prepareStatement("DELETE FROM " + tabla + " WHERE " + campocriterio + "=?");
        ps.setInt(1, valor1);
        System.out.println(ps);
        int r = ps.executeUpdate();
        closeDB();
        return r;
    }
}
