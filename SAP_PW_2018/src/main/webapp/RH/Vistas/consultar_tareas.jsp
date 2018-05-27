<%-- 
    Document   : consultar_empleado
    Created on : 5/05/2018, 12:24:36 PM
    Author     : Windows 10 Pro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form autocomplete='off' onsubmit='return validaConsulta();'>
    <tr><p><br></p></tr>
 <tr><td align='center' colspan='2'><h1 style='text-align:center;'>CONSULTA&nbsp;DE&nbsp;TAREAS</h1></td></tr>
         <table style="margin: 0 auto;">
                 <tr><p><br></p></tr>

             <tr><td align="center">Seleccione un &aacute;rea de la empresa: </td></tr>
    </table>

    <table style="margin: 0 auto;">
        <tr><td align="center">

                <select name="area" id="area" class="form-control form-control-sm" required><!-- Lista para seleccion de area -->
                    <option value="" selected="selected">Selecciona&nbsp;un&nbsp;&aacute;rea...</option>
                    <option value="Recursos Humanos">Recursos&nbsp;Humanos</option>
                    <option value="Ventas">Ventas</option>
                    <option value="Compras">Compras</option>
                    <option value="Inventario">Inventario</option>
                    <option value="Contabilidad">Contabilidad</option>
                    <option value="Gerencia">Gerencia</option>
                    <option value="Todos">Todos</option>
                </select>
       </td></tr>
    </table>
    <table style="margin: 0 auto;">
        <tr><p><br></p></tr>

    <tr><td align="center">B&uacute;squeda&nbsp;espec&iacute;fica</td></tr>
    <tr><td align="center">ID&nbsp;empleado:<input type="text" id="id_empleado" name="id_empleado" class="form-control form-control-sm"></td></tr>
    </table>
    
    <table style="margin: 0 auto;"><tr><td align="center"><input type="submit" id="consulta" class="btn text-white boton" value="Consultar"></td></tr></table>
</form>

