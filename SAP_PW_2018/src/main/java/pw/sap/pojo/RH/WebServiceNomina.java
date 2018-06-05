package pw.sap.pojo.RH;

import java.util.ArrayList;

/**
 *
 * @author Josafat Rosas Ortiz
 */
public class WebServiceNomina {
    
    public String servicio(String monto){
        String servicio="";
        while(monto.length() < 18){monto = "0" + monto;}
        System.out.println(monto + " length: "+monto.length());
        //servicio = cliente + cuenta + monto;
        return servicio;
    }
    
    public String conversion(String numero){
        String cadena = numero;
        ArrayList<String> lista = new <String> ArrayList();
        String [] monto = cadena.split("\\.");
        if(monto.length == 1){
            lista.add(monto[0]);
            lista.add("00");
        }else{
            lista.add(monto[0]);
            lista.add(monto[1]);
            if(lista.get(1).length() < 2){lista.set(1, lista.get(1) + "0");}
        }
        cadena = lista.get(0) + lista.get(1);
        return cadena;
    }
}
