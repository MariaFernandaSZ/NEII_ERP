/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Ventas;

/**
 *
 * @author asus
 */
public class Factura {
    
     int factura;
    String date;
    String cliente;
    String descripcion_venta;
    String subtotal;
    String total;

    public int getFactura() {
        return factura;
    }

    public String getDate() {
        return date;
    }

    public String getCliente() {
        return cliente;
    }

    public String getDescripcion_venta() {
        return descripcion_venta;
    }

    public String getSubtotal() {
        return subtotal;
    }

    public String getTotal() {
        return total;
    }

    public void setFactura(int factura) {
        this.factura = factura;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public void setDescripcion_venta(String descripcion_venta) {
        this.descripcion_venta = descripcion_venta;
    }

    public void setSubtotal(String subtotal) {
        this.subtotal = subtotal;
    }

    public void setTotal(String total) {
        this.total = total;
    }
    
   
    
    
    
}
