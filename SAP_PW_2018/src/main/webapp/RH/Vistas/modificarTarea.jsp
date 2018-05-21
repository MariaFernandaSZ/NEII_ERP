<table class='tabla'>
    <tr>
        <td align='center' class='form-group'>
            <form autocomplete='off' method="POST" id="formModificarTarea" action="../../Servlet_modificarTarea">
                <h1 style='text-align: center;'>MODIFICAR UNA TAREA</h1>
                <table style="margin: 0 auto;">
                    <tr><td>ID de la tarea&nbsp;</td><td><input type='text' id='modificarIdTarea' name="modificarIdTarea" class='form-control form-control-sm' required></td></tr>
                </table>
                <table style="margin: 0 auto;">
                    <tr><td><input type='checkbox' name='info[]' id='chNombre' value='chNombre'></td><td><label class="form-check-label" for='chNombre'>&nbsp;Nombre de la tarea: </label></td><td><input type='text' id='modificarNombreTarea' name='modificarNombreTarea' class='form-control form-control-sm'></td></tr>
                    <tr><td><input type='checkbox' name='info[]' id='chEncargado' value='chEncargado'></td><td><label class="form-check-label" for='chEncargado'>&nbsp;Encargado de la tarea: </label></td><td><input type='text' id='modificarEncargadoTarea' name='modificarEncargadoTarea' class='form-control form-control-sm'></td></tr>
                    <tr><td><input type='checkbox' name='info[]' id='chFechai' value='chFechai'></td><td><label class="form-check-label" for='chFechai'>&nbsp;Fecha de Inicio: </label></td><td><input type='date' id='modificarFechaInicio' name='modificarFechaInicio' class='form-control form-control-sm'></td></tr>
                    <tr><td><input type='checkbox' name='info[]' id='chFechat' value='chFechat'></td><td><label class="form-check-label" for='chFechat'>&nbsp;Fecha T&eacute;rmino: </label></td><td><input type='date' id='modificarFechaFin' name='modificarFechaFin' class='form-control form-control-sm'></td></tr>
                    <tr><td colspan='3' align='center'><input type='submit' class='btn text-white boton' value='Modificar'></td></tr>
                    <tr><td colspan='3' align='center'><input type='reset' class='btn text-white boton' value='Reiniciar'></td></tr>
                </table>
            </form>
        </td>
    </tr>
</table>