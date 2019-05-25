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
public class OrdenVentaO {
    
    int id_ordenventa;
    String fecha;
    String descripcion_venta;
    String cantidad;
    String precio_unitario;
    String precio_total;

    public int getId_ordenventa() {
        return id_ordenventa;
    }

    public String getFecha() {
        return fecha;
    }

    public String getDescripcion_venta() {
        return descripcion_venta;
    }

    public String getCantidad() {
        return cantidad;
    }

    public String getPrecio_unitario() {
        return precio_unitario;
    }

    public String getPrecio_total() {
        return precio_total;
    }

    public void setId_ordenventa(int id_ordenventa) {
        this.id_ordenventa = id_ordenventa;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setDescripcion_venta(String descripcion_venta) {
        this.descripcion_venta = descripcion_venta;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public void setPrecio_unitario(String precio_unitario) {
        this.precio_unitario = precio_unitario;
    }

    public void setPrecio_total(String precio_total) {
        this.precio_total = precio_total;
    }
    
    
    
}
