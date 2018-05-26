<table class='tabla'>
    <tr>
        <td align='center' class='form-group'>
            <form autocomplete='off' onsubmit='return modificarNomina();'>
                <h1 style='text-align: center;'>MODIFICAR UNA N&Oacute;MINA</h1>
                <table style="margin: 0 auto;">
                    <tr><td>ID de N&oacute;mina: &nbsp;</td><td><input type='number' id='modificarIdNomina' class='form-control form-control-sm' required></td></tr>
                </table>
                <table style="margin: 0 auto;">
                    <tr><td></td><td><label class="form-check-label" for='chEmpresa'>&nbsp;Nombre de la empresa: </label></td><td><input type='text' id='modificarNombreEm' name='nombreem' class='form-control form-control-sm'></td></tr>
                    <tr><td></td><td><label class="form-check-label" for='chFechac'>&nbsp;Fecha de Creaci&oacute;n: </label></td><td><input type='date' id='modificarFechaCreacion' name='fechac' class='form-control form-control-sm'></td></tr>
                    <tr><td></td><td><label class="form-check-label" for='chFechal'>&nbsp;Fecha l&iacute;mite de Pago : </label></td><td><input type='date' id='modificarFechaLimite' name='fechal' class='form-control form-control-sm'></td></tr>
                    <tr><td></td><td><label class="form-check-label" for='chpagototal'>&nbsp;Id del Empleado: </label></td><td><input type='number' id='modificarIdEmpleado' name='modificarIdEmpleado' class='form-control form-control-sm'></td></tr>                    
                    <tr><td></td><td><label class="form-check-label" for='chPercepciones'>&nbsp;Percepciones: </label></td><td><input type='number' id='modificarPercepciones' name='percepciones' class='form-control form-control-sm'></td></tr>
                    <tr><td></td><td><label class="form-check-label" for='chDeducciones'>&nbsp;Deducciones: </label></td><td><input type='number' id='modificarDeducciones' name='deducciones' class='form-control form-control-sm'></td></tr>
                    <tr><td></td><td><label class="form-check-label" for='chDiaspagados'>&nbsp;D&iacute;as pagados: </label></td><td><input type='number' id='modificardiasPagados' name='DiasPagados' class='form-control form-control-sm'></td></tr>
                    <tr><td></td><td><label class="form-check-label" for='chpagototal'>&nbsp;Pago total: </label></td><td><input type='number' id='modificarPagototal' name='Pagototal' class='form-control form-control-sm'></td></tr>
                    <tr><td></td><td><label class="form-check-label" for='chFormapago'>&nbsp;Forma de pago: </label></td><td><input type='text' id='modificarFormapago' name='Formapago' class='form-control form-control-sm'></td></tr>
                    
                    
                    <tr><td colspan='3' align='center'><input type='submit' class='btn text-white boton' value='Modificar'></td></tr>
                    <tr><td colspan='3' align='center'><input type='reset' class='btn text-white boton' value='Reiniciar'></td></tr>
                </table>
            </form>
        </td>
    </tr>
</table>
