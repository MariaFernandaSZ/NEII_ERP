<table class="tabla">
    <tr><td align="center" class="form-group">
            <form autocomplete='off' method='POST' onsubmit='return modificarEmpleado();'>
                <table style="margin: 0 auto;">
                    <tr><td colspan='3' align='center'><h1>MODIFICAR&nbsp;INFORMACI&Oacute;N</h1></td></tr>
                    <tr><td colspan='2' align="center">ID&nbsp;empleado</td><td align="left"><input type='text' id='modificarIdEmpleado' name='id_empleado' class='form-control form-control-sm' required></td></tr>
                    <tr><td><input type='checkbox' name='dato[]' value='nombre'></td><td>Nombre</td><td><input type='text' id='modificarNombreEmpleado' name='nombre' class='form-control form-control-sm'></td></tr>
                    <tr><td><input type='checkbox' name='dato[]' value='apellido'></td><td>Apellido</td><td><input type='text' id='modificarApellidoEmpleado' name='apellido' class='form-control form-control-sm'></td></tr>
                    <tr><td><input type='checkbox' name='dato[]' value='direccion'></td><td>Direcci&oacute;n</td><td><input type='text' id='modificarDireccionEmpleado' name='direccion' class='form-control form-control-sm'></td></tr>
                    <tr><td><input type='checkbox' name='dato[]' value='RFC'></td><td>RFC</td><td><input type='text' id='modificarRFC' name='modificarRFC' class='form-control form-control-sm'></td></tr>
                     <tr><td><input type='checkbox' name='dato[]' value='telefono'></td><td>Tel&eacute;fono</td><td><input type='number' id='modificarTelefonoEmpleado' name='telefono' class='form-control form-control-sm'></td></tr>
                    <tr><td><input type='checkbox' name='dato[]' value='edocivil'></td><td>Estado&nbsp;civil</td>
                        <td>
                            <select name='edocivil' id='modificarEdocivilEmpleado' class='form-control form-control-sm'>
                                <option value='' selected='selected'>Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                                <option value='Casado(a)'>Casado(a)</option>
                                <option value='Viudo(a)'>Viudo(a)</option>
                                <option value='Soltero(a)'>Soltero</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td><input type='checkbox' name='dato[]' value='licencia'></td><td>Licencia&nbsp;m&eacute;dica</td><td><input type='text' id='modificarLicenciaEmpleado' name='licencia' class='form-control form-control-sm'></td></tr>
                    <tr><td><input type='checkbox' name='dato[]' value='sueldo'></td><td>Sueldo</td><td><input type='number' id='modificarSueldoEmpleado' name='sueldo' class='form-control form-control-sm'></td></tr>
                    <tr><td><input type='checkbox' name='dato[]' value='sueldoDia'></td><td>Sueldo&nbsp;por&nbsp;día</td><td><input type='number' id='modificarSueldoDEmpleado' name='sueldoDiario' class='form-control form-control-sm'></td></tr>
                    <tr><td><input type='checkbox' name='dato[]' value='area'></td><td>Área</td>
                        <td>
                            <select name='area' id='modificarAreaEmpleado' class='form-control form-control-sm'>
                                <option value='' selected='selected'>Selecciona&nbsp;un&nbsp;área...</option>
                            <option value='Recursos Humanos'>Recursos Humanos</option>
                            <option value='Contabilidad'>Contabilidad</option>
                            <option value='Gerencia'>Gerencia</option>
                            <option value='Inventarios'>Inventarios</option>
                            <option value='Compras'>Compras</option>
                            <option value='Ventas'>Ventas</option>
                            </select>
                        </td>
                    </tr>                           
                    <tr><td><input type='checkbox' name='dato[]' value='cargo'></td><td>Cargo</td>
                        <td>
                            <select name='cargo' id='modificarCargoEmpleado' class='form-control form-control-sm'>
                                <option value='' selected='selected'>Selecciona&nbsp;un&nbsp;cargo...</option>
                                <option value='Admin'>Administrador</option>
                                <option value='Empleado'>Empleado</option>
                                <option value='Jefe'>Jefe</option>
                                <option value='Gerente'>Gerente</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td colspan='3' align='center'>
                        <table style="margin: 0 auto;">
                            <tr><td align='center'><input type='submit' class='btn text-white boton' value='Modificar'></td><td align='center'><input type='reset' class='btn text-white boton' value='Reiniciar'></td></tr>
                        </table>
                    </td></tr>
                </table>
            </form>
    </td></tr>
</table>
