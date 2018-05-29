package pw.sap.pojo.log;

/**
 *
 * @author Josafat Rosas Ortiz
 */
public class Filtros {
    
    public String filtrosQuery(String fecha, String horaInferior, String horaSuperior){
        String referencia = "id_emp is not null";
        if(fecha!=null && !fecha.equals("")){referencia = referencia+" AND fecha = '"+fecha+"'";}
        if(horaInferior!=null && !horaInferior.equals("")){referencia=referencia+" AND '"+horaInferior+"'<=hora";}
        if(horaSuperior!=null && !horaSuperior.equals("")){referencia=referencia+" AND '"+horaSuperior+"'<=hora";}
        return referencia;
    }
    
}
