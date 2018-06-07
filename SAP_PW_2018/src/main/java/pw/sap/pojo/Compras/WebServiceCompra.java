package pw.sap.pojo.Compras;

import java.util.ArrayList;

/**
 *
 * @author Compras e inventarios
 */
public class WebServiceCompra {
    
    public String servicio(String cliente, String cuenta, String monto){
        String servicio;
        while(monto.length() < 18){monto = "0" + monto;}
        servicio = cliente + cuenta + monto;
        return servicio;
    }
    
    public String conversion(String numero){
        String cadena = numero;
        ArrayList<String> lista = new <String> ArrayList();
        cadena.replace("-","\0");
   
        cadena = lista.get(0) + lista.get(1);
        return cadena;
    }
}
