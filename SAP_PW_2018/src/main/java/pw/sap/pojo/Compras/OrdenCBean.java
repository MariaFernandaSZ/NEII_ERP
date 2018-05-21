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
public class OrdenCBean {
    
    private String id_ordencompra;
    private String id_requisicion;
    private String fecha_orden;
    private String estatus;
    private String forma_pago;

    public OrdenCBean(String id_ordencompra, String id_requisicion, String fecha_orden, String estatus, String forma_pago) {
        this.id_ordencompra = id_ordencompra;
        this.id_requisicion = id_requisicion;
        this.fecha_orden = fecha_orden;
        this.estatus = estatus;
        this.forma_pago = forma_pago;
    }
//id_requisicion, fecha_orden, estatus, forma_pago
    public OrdenCBean(String id_requisicion, String fecha_orden, String estatus, String forma_pago) {
        this.id_requisicion = id_requisicion;
        this.fecha_orden = fecha_orden;
        this.estatus = estatus;
        this.forma_pago = forma_pago;
    }
    
    

    public String getId_ordencompra() {
        return id_ordencompra;
    }

    public void setId_ordencompra(String id_ordencompra) {
        this.id_ordencompra = id_ordencompra;
    }

    public String getId_requisicion() {
        return id_requisicion;
    }

    public void setId_requisicion(String id_requisicion) {
        this.id_requisicion = id_requisicion;
    }

    public String getFecha_orden() {
        return fecha_orden;
    }

    public void setFecha_orden(String fecha_orden) {
        this.fecha_orden = fecha_orden;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public String getForma_pago() {
        return forma_pago;
    }

    public void setForma_pago(String forma_pago) {
        this.forma_pago = forma_pago;
    }
    
    
    
}
