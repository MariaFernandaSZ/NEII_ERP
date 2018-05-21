
package pw.sap.pojo.Compras;

/**
 *
 * @author Mauricio
 */
public class Proveedores
{
    private String nuevo_rfc;
    private String nuevo_nomemp;
    private String nuevo_nomenc;
    private String nuevo_correo;
    private String nuevo_tel;
    private String zona;

    public String getNuevo_rfc()
    {
        return nuevo_rfc;
    }

    public void setNuevo_rfc(String nuevo_rfc)
    {
        this.nuevo_rfc = nuevo_rfc;
    }

    public String getNuevo_nomemp()
    {
        return nuevo_nomemp;
    }

    public void setNuevo_nomemp(String nuevo_nomemp)
    {
        this.nuevo_nomemp = nuevo_nomemp;
    }

    public String getNuevo_nomenc()
    {
        return nuevo_nomenc;
    }

    public void setNuevo_nomenc(String nuevo_nomenc)
    {
        this.nuevo_nomenc = nuevo_nomenc;
    }

    public String getNuevo_correo()
    {
        return nuevo_correo;
    }

    public void setNuevo_correo(String nuevo_correo)
    {
        this.nuevo_correo = nuevo_correo;
    }

    public String getNuevo_tel()
    {
        return nuevo_tel;
    }

    public void setNuevo_tel(String nuevo_tel)
    {
        this.nuevo_tel = nuevo_tel;
    }

    public String getZona()
    {
        return zona;
    }

    public void setZona(String zona)
    {
        this.zona = zona;
    }

    public Proveedores(String nuevo_rfc, String nuevo_nomemp, String nuevo_nomenc, String nuevo_correo, String nuevo_tel, String zona)
    {
        this.nuevo_rfc = nuevo_rfc;
        this.nuevo_nomemp = nuevo_nomemp;
        this.nuevo_nomenc = nuevo_nomenc;
        this.nuevo_correo = nuevo_correo;
        this.nuevo_tel = nuevo_tel;
        this.zona = zona;
    }
}
