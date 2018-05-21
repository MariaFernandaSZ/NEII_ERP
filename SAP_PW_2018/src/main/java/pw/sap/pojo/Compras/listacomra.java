package pw.sap.pojo.Compras;

/**
 *
 * @author Marii
 */
public class listacomra  {
    private String folio_compra;
    private String fecha_compra;

    public String getFolio_compra() {
        return folio_compra;
    }

    public String getFecha_compra() {
        return fecha_compra;
    }

    public void setFolio_compra(String folio_compra) {
        this.folio_compra = folio_compra;
    }

    public void setFecha_compra(String fecha_compra) {
        this.fecha_compra = fecha_compra;
    }
    
    
    public listacomra(String folio, String fecha) {
        this.folio_compra = folio;
        this.fecha_compra= fecha;
        
    }
    
    
}
