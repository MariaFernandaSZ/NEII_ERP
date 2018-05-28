/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Inventarios;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import pw.sap.db.Conexion;
import pw.sap.pojo.Inventarios.InvenGe;

/**
 *
 * @author montse
 */
public class QuerysInventarios {
    Connection conn;
    
    public QuerysInventarios() throws ClassNotFoundException, SQLException {
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
    
    
    public boolean consultaEspInvenG(InvenGe inv) throws SQLException, ClassNotFoundException{
            boolean agregado=false;
            openDB();
            try {
                
                    if(conn!=null){
                        Statement st;
                        st = conn.createStatement();
                        st.executeUpdate("SELECT '"+inv.getIDEnt()+"','"+inv.getIDOrdenCom()+"','"+ inv.getCoBa()+"','"+inv.getIDLote()+"','"+inv.getTipoPro()+"',"+inv.getCantidadRec()+",'"+inv.getFechaReg()+"','"+inv.getFechaCad()+"'FROM entrada WHERE id_producto="+"'"+inv.getCoBa()+"' or id_entrada='"+inv.getIDEnt()+"' or id_ordencompra='"+ inv.getIDOrdenCom()+"or tipo_producto='"+inv.getTipoPro()+"'");
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
    
     public ResultSet consultaGeneral(String producto) throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    if (producto != null) {
                                                    ps = conn.prepareStatement("select nombre,tipo_producto,prov_nom_emp,cantidad,minimo,costo_unitario, costo_venta  \n" +
                                                    "from producto\n" +
                                                    "inner join proveedor\n" +
                                                    "on producto.proveedor=proveedor.prov_rfc "
                                                    + "where id_producto='"+producto+"';");
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                    closeDB();
                  return rs;
         }else {
                     ps = conn.prepareStatement("select nombre,tipo_producto,prov_nom_emp,cantidad,minimo,costo_unitario, costo_venta  \n" +
                                                    "from producto\n" +
                                                    "inner join proveedor\n" +
                                                    "on producto.proveedor=proveedor.prov_rfc ;"
                                                   );
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                                                       closeDB();
                  return rs;
                    
                    }
                    
                    
          
                  
        }
    
    
      
}
