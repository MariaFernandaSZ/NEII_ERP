package pw.sap.pojo.RH;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Josafat Rosas Ortiz
 */
public class Validador {
    
    public boolean noVacio(String [] lista){
        for(int i = 0 ; i < lista.length ; i++){
            if(lista[i] == null || lista[i].equals("")){
                return false;
            }
        }
        return true;
    }
    
    public boolean sinLetras(String [] lista){
        for (String lista1 : lista) {
            if (lista1.matches("[a-zA-Z]")) {
                return false;
            }
        }
        return true;
    }
    
    public boolean sinNumeros(String [] lista){
        for (String lista1 : lista) {
            if (lista1.matches("[0-9]")) {
                return false;
            }
        }
        return true;
    }
    
    public boolean fechaMayor(String fecha1, String fecha2) throws ParseException{
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date inicio = formato.parse(fecha1);
        Date fin = formato.parse(fecha2);
        if(fin.before(inicio)){
            return false;
        }
        return true;
    }
}
