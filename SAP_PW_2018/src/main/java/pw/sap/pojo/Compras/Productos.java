
package pw.sap.pojo.Compras;

/**
 *
 * @author Mauricio
 */
public class Productos
{
    private String codigo_nuevoprod;
    private String nom_producto;
    private String unidad;
    private String proveedor;
    private String maxproducto;
    private String minproducto;

    public Productos(String codigo_nuevoprod, String nom_producto, String unidad, String proveedor, String maxproducto, String minproducto)
    {
        this.codigo_nuevoprod = codigo_nuevoprod;
        this.nom_producto = nom_producto;
        this.unidad = unidad;
        this.proveedor = proveedor;
        this.maxproducto = maxproducto;
        this.minproducto = minproducto;
    }

    public String getCodigo_nuevoprod()
    {
        return codigo_nuevoprod;
    }

    public void setCodigo_nuevoprod(String codigo_nuevoprod)
    {
        this.codigo_nuevoprod = codigo_nuevoprod;
    }

    public String getNom_producto()
    {
        return nom_producto;
    }

    public void setNom_producto(String nom_producto)
    {
        this.nom_producto = nom_producto;
    }

    public String getUnidad()
    {
        return unidad;
    }

    public void setUnidad(String unidad)
    {
        this.unidad = unidad;
    }

    public String getProveedor()
    {
        return proveedor;
    }

    public void setProveedor(String proveedor)
    {
        this.proveedor = proveedor;
    }

    public String getMaxproducto()
    {
        return maxproducto;
    }

    public void setMaxproducto(String maxproducto)
    {
        this.maxproducto = maxproducto;
    }

    public String getMinproducto()
    {
        return minproducto;
    }

    public void setMinproducto(String minproducto)
    {
        this.minproducto = minproducto;
    }
}
