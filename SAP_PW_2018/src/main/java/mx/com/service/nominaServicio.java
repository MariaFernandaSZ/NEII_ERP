package mx.com.service;

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

/**
 *
 * @author Josafat, Maximiliano y Francisco
 */
@WebService()
@SOAPBinding(style = Style.RPC)
public interface nominaServicio {
    @WebMethod
    String processor(String data);
}