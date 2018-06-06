package mx.com.service;

import javax.jws.WebService;

/**
 *
 * @author Josafat, Maximiliano y Francisco
 */
@WebService(endpointInterface = "mx.com.service.nominaServicio")
public class nominaImplementacion implements nominaServicio {

    @Override
    public String processor(String data) {
        return WagesValPro.processor(data);
    }

}