/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Compras;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import pw.sap.db.Conexion;
/**
 *
 * @author Nesto
 */
public class QuerysCompras {
    
    Connection conn;
    
    public QuerysCompras() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
    }
    
    public void openDB() throws SQLException {
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/PWS", connProp);
    }
    
    public void closeDB() throws SQLException {
        conn.close();
    }
    
    public boolean agregarProducto(Productos proBean) throws SQLException, ClassNotFoundException{
            boolean agregado=false;
            openDB();
            try {
                
                    if(conn!=null){
                        Statement st;
                        st = conn.createStatement();
                        //st.executeUpdate("INSERT INTO producto (id_producto, nombre_producto, unidad, maximo, minimo) VALUES ('"+proBean.getCodigo_nuevoprod()+"','"+proBean.getNom_producto()+"','"+proBean.getUnidad()+"',"+proBean.getMaxproducto()+","+proBean.getMinproducto()+")");
                        agregado=true;
                        st.close();
                    }
                closeDB();
                    } catch (SQLException e) {
                        agregado=false;
                        e.printStackTrace();
                    }
            return agregado;
        }
    
    public boolean agregarProveedores(Proveedores proBean) throws SQLException, ClassNotFoundException{
            boolean agregado=false;
            openDB();
            try {
                
                    if(conn!=null){
                        Statement st;
                        st = conn.createStatement();
//                        st.executeUpdate("INSERT INTO proveedor (rfc_proveedor, nombre_prov, telefono, correo_prov) VALUES ('"+proBean.getNuevo_rfc()+"','"+proBean.getNuevo_nomemp()+"',"+proBean.getNuevo_tel()+",'"+proBean.getNuevo_correo()+"')");
                        agregado=true;
                        st.close();
                    }
                closeDB();
                    } catch (SQLException e) {
                        agregado=false;
                        e.printStackTrace();
                    }
            return agregado;
        }
    
    public boolean agregarOrdenCompra(OrdenCompraPojo proBean) throws SQLException, ClassNotFoundException{
            boolean agregado=false;
            Genera_IDCom idorden = new Genera_IDCom();
            openDB();
            try {
                
                    if(conn!=null){
                        Statement st;
                        st = conn.createStatement();
//                        st.executeUpdate("INSERT INTO orden_compra VALUES('"+idorden.idOrdenCompra()+"','"+proBean.getId_requisicion()+"',"+proBean.getFecha_orden()+",'"+proBean.getEstatus()+"','"+proBean.getForma_pago()+"')");
                        agregado=true;
                        st.close();
                    }
                closeDB();
                    } catch (SQLException e) {
                        agregado=false;
                        e.printStackTrace();
                    }
            return agregado;
        }
    
    public String consultarOrdenC(){
         String id="";
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select id_ordencompra from orden_compra order by id_ordencompra desc limit 1");
          while(rs.next()){
           id = rs.getString(1);
          }
          rs.close();
          st.close();
         }catch(SQLException se){
          se.printStackTrace();
         }
         return id;
        }
    
    public OrdenCompraPojo detalleOrdenCompra(){
         OrdenCompraPojo ordenBean = null;
        String id_ordencompra; 
        String id_requisicion = null;
        String fecha_orden = null;
        String estatus = null;
        String forma_pago = null;
        
        
//         try{
//          openDB();
//          Statement st=conn.createStatement();
//          ResultSet rs=st.executeQuery("select id_ordencompra from orden_compra order by id_ordencompra desc limit 1");
//          while(rs.next()){
//           id_ordencompra = rs.getString(1);
//           id_requisicion = rs.getString(2);
//           fecha_orden = rs.getString(3);
//           estatus = rs.getString(4);
//           forma_pago = rs.getString(5);
//          }
//          ordenBean = new OrdenCBean(id_requisicion, fecha_orden, estatus, forma_pago);
//          rs.close();
//          st.close();
//         }catch(SQLException se){
//          se.printStackTrace();
//         }
         
         return ordenBean;
        } 
    
    public ResultSet consultarIDEMP(){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          rs=st.executeQuery("select id_ordencompra, estatus from orden_compra");
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
        }
    
    public ArrayList consultalistacompra (String folio) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT * FROM lista_compra WHERE folio=?");
        ps.setString(1, folio);
        System.out.println("cadena"+ps.toString());
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getString(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
            
        
    }
             closeDB(); 
        return r;
}
    
}
