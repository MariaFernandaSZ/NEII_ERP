/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Inventarios;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import pw.sap.db.Conexion;
import pw.sap.pojo.Inventarios.Merma;

/**
 *
 * @author montse
 */
public class Modificar {
    
Connection conn;
    
    public Modificar() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
    }
    
    
    public void openDB() throws SQLException {
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "monse");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/PWBDD2", connProp);
    }
    
     public void closeDB() throws SQLException {
        conn.close();
    }
    
    
            public boolean modificarMerma(int IDMerma, String tipo, int cantidad, String observaciones) throws SQLException, ClassNotFoundException{
         
            boolean agregado=false;
            
            
            try {
                
                    if(conn!=null){
                        Statement st;
                        st = conn.createStatement();
                        st.executeUpdate("UPDATE merma set tipo_merma='"+tipo+"', cantidad_merma="+ cantidad+", observaciones='"+observaciones+"' where id_merma="+IDMerma);
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
}

