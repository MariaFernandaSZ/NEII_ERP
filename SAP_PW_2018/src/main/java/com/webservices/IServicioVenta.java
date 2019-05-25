package com.webservices;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

@WebService
public interface IServicioVenta {
    @WebMethod(operationName = "solicitarCompra")
    public String solicitarCompra(
            @WebParam(name = "fecha") String fecha,
            @WebParam(name = "descripcion") String descripcion,
            @WebParam(name = "cantidad") String cantidad,
            @WebParam(name = "preu") String preu,
            @WebParam(name = "IDP") String IDP,
            @WebParam(name = "IDC") String IDC
    );  
}
