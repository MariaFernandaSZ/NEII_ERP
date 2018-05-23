/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Compras;
import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nesto
 */
public class OrdenCompraPojo {
    
    Connection conn;
    
    public OrdenCompraPojo() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
    }
    
    
    private String ord_folio;
    private String req_folio;
    private requisicionPojo requisicionpojo;
    private Proveedores proveedores;
    private String prov_rfc;
    private String ord_fecha;
    private String ord_pagotot;

    public String getReq_folio() {
        return req_folio;
    }

    public void setReq_folio(String req_folio) {
        this.req_folio = req_folio;
    }

    public String getProv_rfc() {
        return prov_rfc;
    }

    public void setProv_rfc(String prov_rfc) {
        this.prov_rfc = prov_rfc;
    }
    

    public OrdenCompraPojo(String ord_folio, String req_folio, String prov_rfc, String ord_fecha, String ord_pagotot) {
        this.ord_folio = ord_folio;
        this.req_folio = req_folio;
        this.prov_rfc = prov_rfc;
        this.ord_fecha = ord_fecha;
        this.ord_pagotot = ord_pagotot;
    }

    
    public OrdenCompraPojo(String req_folio, String prov_rfc, String ord_fecha, String ord_pagotot) {
        this.req_folio = req_folio;
        this.prov_rfc = prov_rfc;
        this.ord_fecha = ord_fecha;
        this.ord_pagotot = ord_pagotot;
    }
    
    

    

    public OrdenCompraPojo(String ord_folio, requisicionPojo requisicionpojo, Proveedores proveedores, String ord_fecha, String ord_pagotot) {
        this.ord_folio = ord_folio;
        this.requisicionpojo = requisicionpojo;
        this.proveedores = proveedores;
        this.ord_fecha = ord_fecha;
        this.ord_pagotot = ord_pagotot;
    }
    
    

    public OrdenCompraPojo(requisicionPojo requisicionpojo, Proveedores proveedores, String ord_fecha, String ord_pagotot) {
        this.requisicionpojo = requisicionpojo;
        this.proveedores = proveedores;
        this.ord_fecha = ord_fecha;
        this.ord_pagotot = ord_pagotot;
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

    public String getOrd_pagotot() {
        return ord_pagotot;
    }

    public void setOrd_pagotot(String ord_pagotot) {
        this.ord_pagotot = ord_pagotot;
    }

    @Override
    public String toString() {
        return ord_folio; //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
