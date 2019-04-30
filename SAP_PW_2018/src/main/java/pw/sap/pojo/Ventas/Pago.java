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
public class Pago {
    
    int id_pago;
    String tipo_pago;
    String fecha_expiracion;
    String nombre_titular;
    String numero_tarjeta;
    String cvc;
    

    public int getId_pago() {
        return id_pago;
    }

    public String getTipo_pago() {
        return tipo_pago;
    }

    public String getFecha_expiracion() {
        return fecha_expiracion;
    }

    public String getNombre_titular() {
        return nombre_titular;
    }

    public String getNumero_tarjeta() {
        return numero_tarjeta;
    }

    public String getCvc() {
        return cvc;
    }

    public void setId_pago(int id_pago) {
        this.id_pago = id_pago;
    }

    public void setTipo_pago(String tipo_pago) {
        this.tipo_pago = tipo_pago;
    }

    public void setFecha_expiracion(String fecha_expiracion) {
        this.fecha_expiracion = fecha_expiracion;
    }

    public void setNombre_titular(String nombre_titular) {
        this.nombre_titular = nombre_titular;
    }

    public void setNumero_tarjeta(String numero_tarjeta) {
        this.numero_tarjeta = numero_tarjeta;
    }

    public void setCvc(String cvc) {
        this.cvc = cvc;
    }
    
    
}
