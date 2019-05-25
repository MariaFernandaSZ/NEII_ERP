package com.webservices;

import java.util.ArrayList;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

@WebService
public interface IServicioTransporte {
    
    @WebMethod(operationName = "solicitarVehiculo")
    public ArrayList<String> solicitarVehiculo(@WebParam(name = "rfc") String rfc,
            @WebParam(name = "tipo_vehiculo") String tipo_vehiculo,
            @WebParam(name = "fecha_inicio") String fecha_inicio,
            @WebParam(name = "carga") String carga,
            @WebParam(name = "pasajeros") String pasajeros,
            @WebParam(name = "origen") String origen,
            @WebParam(name = "destino") String destino);   
}
