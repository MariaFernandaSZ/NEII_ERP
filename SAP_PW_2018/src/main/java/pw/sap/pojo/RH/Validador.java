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
        for (String lista1 : lista) {
            if (lista1 == null || lista1.equals("")) {
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
    
    public String ordenConsultaEmp(String valor){
        String orden = "ORDER BY id_emp ASC";
        if(valor != null){
            switch(valor){
                case "alfabeto":
                    orden = "ORDER BY nombre_emp ASC";
                    break;
                case "area":
                    orden = "ORDER BY area_emp ASC";
                    break;
                default:
                    orden = "ORDER BY id_emp ASC";
                    break;
            }
        }
        return orden;
    }
    
    public String referenciaConsultaEmp(String area, String id){
        String referencia = "id_emp is not null";
        if(area!= null && id!=null && !area.equals("") && !id.equals("")){
            referencia = "area_emp = '"+area+"' AND id_emp = "+id;
        }else{
            if(area!=null && !area.equals("") && (id==null || id.equals(""))){
                referencia = "area_emp = '"+area+"'";
            }else{
                if(id!=null && !id.equals("") && (area==null || area.equals(""))){
                    referencia = "id_emp = "+id;
                }
            }
        }
        return referencia;
    }
}
