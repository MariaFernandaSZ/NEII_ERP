/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Compras;

/**
 *
 * @author Nesto
 */
public class OrdenCompraPojo {
    
    private String ord_folio;
    private requisicionPojo requisicionpojo;
    private Proveedores proveedores;
    private String ord_fecha;
    private String ord_pago;

    public OrdenCompraPojo() {
    }

    public OrdenCompraPojo(String ord_folio, requisicionPojo requisicionpojo, Proveedores proveedores, String ord_fecha, String ord_pago) {
        this.ord_folio = ord_folio;
        this.requisicionpojo = requisicionpojo;
        this.proveedores = proveedores;
        this.ord_fecha = ord_fecha;
        this.ord_pago = ord_pago;
    }

    public String getOrd_folio() {
        return ord_folio;
    }

    public void setOrd_folio(String ord_folio) {
        this.ord_folio = ord_folio;
    }

    public requisicionPojo getRequisicionpojo() {
        return requisicionpojo;
    }

    public void setRequisicionpojo(requisicionPojo requisicionpojo) {
        this.requisicionpojo = requisicionpojo;
    }

    public Proveedores getProveedores() {
        return proveedores;
    }

    public void setProveedores(Proveedores proveedores) {
        this.proveedores = proveedores;
    }

    public String getOrd_fecha() {
        return ord_fecha;
    }

    public void setOrd_fecha(String ord_fecha) {
        this.ord_fecha = ord_fecha;
    }

    public String getOrd_pago() {
        return ord_pago;
    }

    public void setOrd_pago(String ord_pago) {
        this.ord_pago = ord_pago;
    }

    @Override
    public String toString() {
        return ord_folio; //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
