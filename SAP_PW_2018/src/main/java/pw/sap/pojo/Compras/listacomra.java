package pw.sap.pojo.Compras;

/**
 *
 * @author Marii
 */
public class listacomra  {
    private String list_folio;
    private OrdenCompraPojo ordencomprapojo;
    private String list_fecha;
    private String list_pago;
    private String list_factura;

    public listacomra() {
    }

    public listacomra(String list_folio, OrdenCompraPojo ordencomprapojo, String list_fecha, String list_pago, String list_factura) {
        this.list_folio = list_folio;
        this.ordencomprapojo = ordencomprapojo;
        this.list_fecha = list_fecha;
        this.list_pago = list_pago;
        this.list_factura = list_factura;
    }

    public String getList_folio() {
        return list_folio;
    }

    public void setList_folio(String list_folio) {
        this.list_folio = list_folio;
    }

    public OrdenCompraPojo getOrdencomprapojo() {
        return ordencomprapojo;
    }

    public void setOrdencomprapojo(OrdenCompraPojo ordencomprapojo) {
        this.ordencomprapojo = ordencomprapojo;
    }

    public String getList_fecha() {
        return list_fecha;
    }

    public void setList_fecha(String list_fecha) {
        this.list_fecha = list_fecha;
    }

    public String getList_pago() {
        return list_pago;
    }

    public void setList_pago(String list_pago) {
        this.list_pago = list_pago;
    }

    public String getList_factura() {
        return list_factura;
    }

    public void setList_factura(String list_factura) {
        this.list_factura = list_factura;
    }

    @Override
    public String toString() {
        return list_folio; //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
