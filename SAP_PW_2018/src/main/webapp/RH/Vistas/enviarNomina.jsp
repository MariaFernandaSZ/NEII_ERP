<%@page import="pw.sap.db.Conexion" %>
<%@page import="java.util.ArrayList" %>
<% 
    Conexion c = new Conexion();
    ArrayList lista = c.pendienteNomina();
%>
<form autocomplete="off" id="formEnviarNomina" name="formEnviarNomina" method="POST" action="">
    <table style="margin: 0 auto;">
        <tr>
            <td>URL</td><td align="center"><input type="number" id="url" name="url" class="form-control form-control-sm"/></td>
        </tr>
        <tr>
            <td>Puerto</td><td align="center"><input type="number" id="puerto" name="puerto" class="form-control form-control-sm"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" id="servicioNomina" name="servicioNomina" class="btn text-white boton" value="Enviar"/>
            </td>
        </tr>
    </table>
    <div>
        <table class="tabla table-bordered">
            <tr>
                <td align="center">N&oacute;mina</td>
                <td align="center">Empleado</td>
                <td align="center">Cuenta</td>
                <td align="center">Monto</td>
                <td align="center">Estado</td>
            </tr>
            <tr>
                <%
                    for(int i = 0 ; i < lista.size() ; i++){
                        if(i%5==0 && i!=0){out.println("</tr><tr>");}
                        out.print("<td  align='center'>"+lista.get(i)+"</td>");
                    }
                %>
            </tr>
        </table>
    </div>
</form>