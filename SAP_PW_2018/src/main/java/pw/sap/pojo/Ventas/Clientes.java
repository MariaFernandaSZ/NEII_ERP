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
public class Clientes {
    int id;
    String nombre;
    String direccion;
    String cp;
    String email;

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getCp() {
        return cp;
    }

    public String getEmail() {
        return email;
    }
    
}
