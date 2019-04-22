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
public class Producto {
    
    String id_producto;
    String proveedor;
    String nombre;
    String tipo_producto;
    String cantidad;
    String minimo;
    String maximo;
    String costo_unitario;
    String costo_venta;


    public String getId_producto() {
        return id_producto;
    }

    public String getProveedor() {
        return proveedor;
    }

    public String getNombre() {
        return nombre;
    }

    public String getTipo_producto() {
        return tipo_producto;
    }

    public String getCantidad() {
        return cantidad;
    }

    public String getMinimo() {
        return minimo;
    }

    public String getMaximo() {
        return maximo;
    }

    public String getCosto_unitario() {
        return costo_unitario;
    }

    public String getCosto_venta() {
        return costo_venta;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setTipo_producto(String tipo_producto) {
        this.tipo_producto = tipo_producto;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public void setMinimo(String minimo) {
        this.minimo = minimo;
    }

    public void setMaximo(String maximo) {
        this.maximo = maximo;
    }

    public void setCosto_unitario(String costo_unitario) {
        this.costo_unitario = costo_unitario;
    }

    public void setCosto_venta(String costo_venta) {
        this.costo_venta = costo_venta;
    }

  
    
    
}
