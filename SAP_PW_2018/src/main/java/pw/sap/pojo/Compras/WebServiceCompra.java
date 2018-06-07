package pw.sap.pojo.Compras;

import java.util.ArrayList;

/**
 *
 * @author Compras e inventarios
 */
public class WebServiceCompra {
    
    public String serviciocompra(String codigo_prod, String cantidad){
        String serviciocompra;
        while(codigo_prod.length() < 18){codigo_prod = "0" + codigo_prod;}
        while(cantidad.length() < 8){cantidad = "0" + cantidad;}
        serviciocompra = codigo_prod+cantidad;
        return serviciocompra;
    }
    
    public String fecha(String rfc_prov, String cod_cantidad, String fecha){
        String serviciocompra;
        String cadena = fecha;
//        ArrayList<String> lista = new <String> ArrayList();
        cadena = cadena.replace("-","");
        serviciocompra = rfc_prov+cod_cantidad+cadena;
        return serviciocompra;
    }
}
