package pw.sap.pojo.log;

/**
 *
 * @author Josafat Rosas Ortiz
 */
public class Filtros {
    
    public String filtrosQuery(String area, String fechaInferior, String fechaSuperior, String fechaFija,
                               String horaInferior, String horaSuperior, String horaFija){
        String referencia = "id_emp is not null";
        if(area!=null && !area.equals("")){referencia = referencia+" AND area = '"+area+"'";}
        if(fechaFija!=null && !fechaFija.equals("")){
            referencia = referencia+" AND fecha = '"+fechaFija+"'";
        }else{
            if(fechaInferior!=null && !fechaInferior.equals("")){referencia = referencia+" AND '"+fechaInferior+"' <= fecha";}
            if(fechaSuperior!=null && !fechaSuperior.equals("")){referencia = referencia+" AND fecha <= '"+fechaSuperior+"'";}
        }
        if(horaFija!=null && !horaFija.equals("")){
        }else{
            if(horaInferior!=null && !horaInferior.equals("")){referencia = referencia+" AND '"+horaInferior+"' <= hora";}
            if(horaSuperior!=null && !horaSuperior.equals("")){referencia = referencia+" AND hora <= '"+horaSuperior+"'";}
        }
        return referencia;
    }
    
}
