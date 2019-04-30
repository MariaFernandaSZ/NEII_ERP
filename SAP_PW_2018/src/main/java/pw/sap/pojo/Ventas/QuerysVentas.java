/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Ventas;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Properties;
import pw.sap.db.Conexion;
import pw.sap.pojo.Ventas.Producto;
import pw.sap.pojo.Ventas.OrdenVenta;
import pw.sap.pojo.Ventas.Clientes;

/**
 *
 * @author ricardozaldivar
 */
public class QuerysVentas {
        
    Connection conn;
    
    public QuerysVentas() throws ClassNotFoundException, SQLException {
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
    
    
        public String consultarCli(){
         String id="";
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select id_emprc from empresa_cliente order by id_emprc desc limit 1");
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
        
        public String consultarFactu(){
         String id="";
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select folio from factura order by folio desc limit 1");
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
        
        public String consultarApartado(){
         String id="";
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select id_aparta from apartaprod order by id_aparta desc limit 1");
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
        
        public int consultarIDFactura(){
         int id = 0;
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select count(*) from Factura;");
          while(rs.next()){
           id = rs.getInt(1);
          }
          rs.close();
          st.close();
         }catch(SQLException se){
          se.printStackTrace();
         }
         return id+1;
        }
        
        public String consultarOrdenVenta(){
         String id="";
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select id_ordenventa from OrdenVenta order by id_ordenventa desc limit 1");
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
        
        public String consultarInter(){
         String id="";
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select id_interm from interm_cliente order by id_interm desc limit 1");
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
        
        public String consultaRFCReceptor(String RFC){
         String rfc="";
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("SELECT rfc_emp FROM empresa_cliente INNER JOIN interm_cliente ON interm_cliente.id_emprc = empresa_cliente.id_emprc where id_interm = '"+RFC+"'");
          while(rs.next()){
           rfc = rs.getString(1);
          }
          rs.close();
          st.close();
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rfc;
        }
        
       
    
        
        
         public ResultSet consultarIDInterm(){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          rs=st.executeQuery("select id_interm, nombre_inter from interm_cliente");
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
        }
         
         public ResultSet consultarEmpleado(int id_emp){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          rs=st.executeQuery("select nombre_emp,apellido_emp from empleado where id_emp="+id_emp);
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
        }
         
        public ResultSet buscaProductosVenta(String codigo){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          rs=st.executeQuery("select id_producto, nombre, costo_venta from producto where id_producto='"+codigo+"'");
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
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
          
        public ResultSet consultaProducto() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select factura.id, producto.id_producto, producto.nombre, factura.folio, producto.cantidad, producto.proveedor, producto.costo_unitario, factura.total_iva, factura.subtotal from producto INNER JOIN factura ON producto.proveedor = factura.rfc_receptor ;");
                     //ON producto.proveedor = factura.rfc_receptor
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
        //....................................KENIA MODULO VENTAS..............................................
        public Integer insertar(String campos, String tabla, String valores) throws SQLException {
        openDB();
        PreparedStatement ps;
        ps=conn.prepareStatement("INSERT INTO "+tabla+" ("+campos+") VALUES ("+valores+")");
        Integer rs = ps.executeUpdate();
        closeDB();
        return rs;
    }
     
        public ResultSet tablaCliente(){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          /**rs=st.executeQuery("SELECT empresa_cliente.id_emprc, nombre_emp, rfc_emp, nombre_inter, apellidos_inter, tel_inter, correo_inter FROM empresa_cliente INNER JOIN interm_cliente ON interm_cliente.id_emprc = empresa_cliente.id_emprc;");
          */
          rs=st.executeQuery("SELECT * FROM cliente");
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
        }
        
        public ResultSet tablaFactura(){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          /**rs=st.executeQuery("SELECT empresa_cliente.id_emprc, nombre_emp, rfc_emp, nombre_inter, apellidos_inter, tel_inter, correo_inter FROM empresa_cliente INNER JOIN interm_cliente ON interm_cliente.id_emprc = empresa_cliente.id_emprc;");
          */
          rs=st.executeQuery("SELECT * FROM factura");
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
        }
        
        public ResultSet tablaOrdenVenta(){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          /**rs=st.executeQuery("SELECT empresa_cliente.id_emprc, nombre_emp, rfc_emp, nombre_inter, apellidos_inter, tel_inter, correo_inter FROM empresa_cliente INNER JOIN interm_cliente ON interm_cliente.id_emprc = empresa_cliente.id_emprc;");
          */
          rs=st.executeQuery("SELECT * FROM orden_venta");
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
        }
        
        public ResultSet tablaPago(){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          /**rs=st.executeQuery("SELECT empresa_cliente.id_emprc, nombre_emp, rfc_emp, nombre_inter, apellidos_inter, tel_inter, correo_inter FROM empresa_cliente INNER JOIN interm_cliente ON interm_cliente.id_emprc = empresa_cliente.id_emprc;");
          */
          rs=st.executeQuery("SELECT * FROM pago_venta");
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
        }
        
        
        public ResultSet consultarIDEMP(){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          rs=st.executeQuery("select id_emprc, nombre_emp from empresa_cliente");
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
        }
        public ArrayList consulta(String campos, String tabla, String condicion, int cantidad) throws SQLException {
        openDB();
        ArrayList r=new ArrayList();
        PreparedStatement ps;
        ps=conn.prepareStatement("SELECT "+campos+" FROM "+tabla+" WHERE "+condicion);
        ResultSet rs= ps.executeQuery();        
            while(rs.next()){
                for(int i = 1 ; i <= cantidad ; i++){
                    r.add(rs.getObject(i));
                }
                
            }
            
        
        closeDB();        
        return r;
    }
        
        
        
        public Integer borrar(String tabla, String referencia) throws SQLException {
        openDB();
        PreparedStatement ps;
        ps=conn.prepareStatement("DELETE FROM "+tabla+" WHERE "+referencia);
        Integer rs = ps.executeUpdate();
        closeDB();
        return rs;
    }
        
    /**
     * este metodo permite actualizar datos de cualquier tabla
     * @param campos
     * @param tabla
     * @param referencia
     * @return
     * @throws SQLException 
     */
    
    public Integer actualizar(String campos, String tabla, String referencia) throws SQLException {
        openDB();
        PreparedStatement ps;
        ps=conn.prepareStatement("UPDATE "+tabla+" SET "+campos+" WHERE "+referencia);
        Integer rs = ps.executeUpdate();
        closeDB();
        return rs;
    }
    
    
     public static LinkedList opcionesProducto() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
       LinkedList <Producto> l=new LinkedList<>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT id_producto,nombre,tipo_producto,costo_venta FROM producto");
            while (rs.next()) {
                Producto p=new Producto();
                p.setId_producto(rs.getString("id_producto"));             
                p.setNombre(rs.getString("nombre")); 
                p.setTipo_producto(rs.getString("tipo_producto"));
                p.setCosto_venta(rs.getString("costo_venta")); 
                l.add(p);
            }                    
        conn.close();
        return l;
        }
    
     
      public static LinkedList opcionesOrdenVenta() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
       LinkedList <OrdenVenta> l=new LinkedList<>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT id_ordenventa FROM orden_venta");
            while (rs.next()) {
                OrdenVenta o=new OrdenVenta();
                o.setId_ordenventa(rs.getInt("id_ordenventa"));              
                l.add(o);
            }                    
        conn.close();
        return l;
        }
      
      public static LinkedList opcionesCliente() throws SQLException, ClassNotFoundException {        
        Connection conn;
        Class.forName("org.postgresql.Driver");
       LinkedList <Clientes> l=new LinkedList<>();
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
        Statement stmt;        
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT nombre FROM cliente");
            while (rs.next()) {
                Clientes c=new Clientes();
                c.setNombre(rs.getString("Nombre"));              
                l.add(c);
            }                    
        conn.close();
        return l;
        }
    
        
        
         
        //..................................................................................................

    
       

   
}
