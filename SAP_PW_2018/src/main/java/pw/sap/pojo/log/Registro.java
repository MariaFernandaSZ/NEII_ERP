package pw.sap.pojo.log;

/**
 *
 * @author Josafat Rosas Ortiz
 */
public class Registro {
    private String des;
    private String id_emp;
    private String area;
    private String fecha;
    private String hora;
    
    public Registro(String des, String id_emp, String area, String fecha, String hora){
        this.des = des;
        this.id_emp = id_emp;
        this.area = area;
        this.fecha = fecha;
        this.hora = hora;
    }
    
    public String [] arreglo(){
        String [] datos = {String.valueOf(des),String.valueOf(id_emp),String.valueOf(area),String.valueOf(fecha),String.valueOf(hora)};
        return datos;
    }
    
    public Registro(){}

    /**
     * @return the des
     */
    private String getDes() {
        return des;
    }

    /**
     * @param des the des to set
     */
    private void setDes(String des) {
        this.des = des;
    }

    /**
     * @return the id_emp
     */
    private String getId_emp() {
        return id_emp;
    }

    /**
     * @param id_emp the id_emp to set
     */
    private void setId_emp(String id_emp) {
        this.id_emp = id_emp;
    }

    /**
     * @return the area
     */
    private String getArea() {
        return area;
    }

    /**
     * @param area the area to set
     */
    private void setArea(String area) {
        this.area = area;
    }

    /**
     * @return the fecha
     */
    private String getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    private void setFecha(String fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the hora
     */
    private String getHora() {
        return hora;
    }

    /**
     * @param hora the hora to set
     */
    private void setHora(String hora) {
        this.hora = hora;
    }
    
    
}
