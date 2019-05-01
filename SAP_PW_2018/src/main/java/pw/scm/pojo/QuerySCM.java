/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.scm.pojo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import pw.sap.db.Conexion;
import pw.sap.pojo.Compras.Genera_IDCom;

/**
 *
 * @author Nesto
 */
public class QuerySCM {
    
    Connection conn;
    
    public QuerySCM() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
    }
    
    public void openDB() throws SQLException {
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
    }
   
    public void closeDB() throws SQLException {
        conn.close();
    }
    
    
    
    
    public ResultSet consultaRequisicion() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select req_folio, req_cantidad, req_fecha from requisicion;");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
    
    
    public ResultSet consultaVenta() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select id_ordenventa, total_pago, descripcion from ordenventa;");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
    
    public ResultSet consultaInventario() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select id_producto, nombre, tipo_producto, cantidad, minimo, maximo from producto;");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
    
    public ResultSet consultaMerma() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select id_merma, cantidad_merma, motivo from merma;");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
    
    
    public ResultSet consultaPedido() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select req_folio, id_producto, req_cantidad, req_fecha from requisicion;");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
    
    public ResultSet consultaVentaV() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select id_ordenventa, id_intermc, total_pago, fecha_entrega, descripcion from ordenventa;");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
    
    public boolean eliminar_Pedido(String req_folioE) throws SQLException, ClassNotFoundException{
         boolean agregado=false;
         
                 openDB();
                 try{
                 if(conn!=null){
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("delete from requisicion where req_folio='"+req_folioE+"';");
                    ResultSet rs= ps.executeQuery();
                    agregado=true;
                 }
                 closeDB();
                 } catch (SQLException e) {
                        agregado=false;
                        e.printStackTrace();
                    } 
                 return agregado;
        }
    
    public boolean eliminar_VentaV(String id_ordenventaE) throws SQLException, ClassNotFoundException{
         boolean agregado=false;
         
                 openDB();
                 try{
                 if(conn!=null){
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("delete from ordenventa where id_ordenventa='"+id_ordenventaE+"';");
                    ResultSet rs= ps.executeQuery();
                    agregado=true;
                 }
                 closeDB();
                 } catch (SQLException e) {
                        agregado=false;
                        e.printStackTrace();
                    } 
                 return agregado;
        }
    
    
    
}
