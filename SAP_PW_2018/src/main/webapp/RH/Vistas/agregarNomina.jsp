<table class='tabla'>
    <tr><td align='center' class='form-group'>
            <form autocomplete='off' onsubmit="return agregarNomina();">
                <table style="margin: 0 auto;">
                    <tr><td align='center' colspan='2'><h1 style='text-align:center;'>AGREGAR&nbsp;UNA&nbsp;NÓMINA</h1></td></tr>
                    <tr><td align='left'><label>Empresa: &nbsp; </label></td><td><input type='text' id='empresa' name='empresa' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Regímen&nbsp;Fiscal:&nbsp;</label></td><td><input type='text' id='regimenFiscal' name='regimenFiscal' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Fecha&nbsp;de&nbsp;Creación:&nbsp;</label></td><td><input type='date' id='fechaCreacion' name='fechaCreacion' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Fecha&nbsp;Limite&nbsp;de&nbsp;cobro:&nbsp;</label></td><td><input type='date' id='fechaLimite' name='fechaLimite' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>ID&nbsp;de&nbsp;Empleado:&nbsp;</label></td><td><input type='text' id='idEmpleado' name='idEmpleado' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Percepciones:&nbsp; </label></td><td><input type='number' id='percepciones' name='percepciones' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Deducciones:&nbsp; </label></td><td><input type='number' id='deducciones' name='deducciones' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Días&nbsp;Pagados:&nbsp; </label></td><td><input type='number' id='diasPagados' name='diasPagados' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Pago&nbsp;Total:&nbsp;</label></td><td><input type='number' id='pagoTotal' name='pagoTotal' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Forma&nbsp;de&nbsp;Pago:&nbsp;</label></td><td><input type='text' id='formaPago' name='formaPago' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='center'><input type='submit' class='btn text-white boton' value='Aceptar'></td><td align='center'><input type='reset' class='btn text-white boton' value='Reiniciar'></td></tr>

                </table>
            </form>
    </td></tr>
</table>