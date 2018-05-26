<%-- 
    Document   : consultar_empleado
    Created on : 5/05/2018, 12:24:36 PM
    Author     : Windows 10 Pro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form autocomplete='off' method="POST" id="formConsultarEmpleado" action="../../Servlet_consultarEmpleado">
    <tr><td align='center' colspan='2'><h1 style='text-align:center;'>CONSULTA&nbsp;DE&nbsp;EMPLEADOS</h1></td></tr>
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
                    <option value="todo">Todos</option>
                </select>
       </td></tr>
    </table>
    <table style="margin: 0 auto;">
        <tr><td align="center">B&uacute;squeda&nbsp;espec&iacute;fica</td></tr>
        <tr><td align="center">ID&nbsp;empleado:<input type="text" id="id_empleado" name="id_empleado" class="form-control form-control-sm"></td></tr>
    </table>
    <table style="margin: 0 auto;"><tr><td align="center">Mostrar</td></tr></table>
    <table style="margin: 0 auto;"><!-- Diferentes filtros para mostrar datos -->
        <tr><td><input type="checkbox" id="direccion" name="mostrar[]" value="direccion"></td><td><label class="form-check-label" for="direccion">&nbsp;Direcci&oacute;n</label></td></tr>
        <tr><td><input type="checkbox" id="rfc" name="mostrar[]" value="rfc"></td><td><label class="form-check-label" for="rfc">RFC</label></td></tr>
        <tr><td><input type="checkbox" id="telefono" name="mostrar[]" value="telefono"></td><td><label class="form-check-label" for="telefono">Tel&eacute;fono</label></td></tr>
        <tr><td><input type="checkbox" id="edo_civil" name="mostrar[]" value="edo_civil"></td><td><label class="form-check-label" for="edo_civil">Estado&nbsp;civil</label></td></tr>
        <tr><td><input type="checkbox" id="sueldo" name="mostrar[]" value="sueldo"></td><td><label class="form-check-label" for="sueldo">Sueldo</label></td></tr>
        <tr><td><input type="checkbox" id="cargo" name="mostrar[]" value="cargo"></td><td><label class="form-check-label" for="cargo">&nbsp;Cargo</label></td></tr>
    </table>
    <table style="margin: 0 auto;"><tr><td align="center">Ordenar&nbsp;por...</td></tr></table>
    <table style="margin: 0 auto;">
        <tr><td><input type="radio" id="orden_alfabeto" name="ordenar" value="alfabeto"></td><td><label class="form-check-label" for="orden_alfabeto">&nbsp;Orden&nbsp;alfab&eacute;tico</label></td></tr>
        <tr><td><input type="radio" id="orden_area" name="ordenar" value="area"></td><td><label class="form-check-label" for="orden_area">&nbsp;Orden&nbsp;por&nbsp;&aacute;rea</label></td></tr>
    </table>
    <table style="margin: 0 auto;"><tr><td align="center"><input type="submit" id="consulta" class="btn text-white boton" value="Consultar"></td></tr></table>
</form>

