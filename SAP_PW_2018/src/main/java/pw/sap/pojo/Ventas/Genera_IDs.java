/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Ventas;

import java.sql.SQLException;

/**
 *
 * @author ricardozaldivar
 */
public class Genera_IDs {
    
    
    public String idClientes() throws ClassNotFoundException, SQLException{
        
        QuerysVentas c = new QuerysVentas();
        
        String idCli = c.consultarCli();
        
        if ("".equals(idCli) || idCli == null) {
            return "cli1";
        }else{
            String num = idCli.replace("cli", "");
            int con = Integer.parseInt(num)+1;
            return "cli"+String.valueOf(con);
        }
    }
    
        
    public String idIntermediario() throws ClassNotFoundException, SQLException{
        
        QuerysVentas c = new QuerysVentas();
        
        String idCli = c.consultarInter();
        
        if ("".equals(idCli) || idCli == null) {
            return "itr1";
        }else{
            String num = idCli.replace("itr", "");
            int con = Integer.parseInt(num)+1;
            return "itr"+String.valueOf(con);
        }
    }
}
