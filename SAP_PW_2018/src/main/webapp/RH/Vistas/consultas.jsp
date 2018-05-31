<div>
    <table style="margin: 0 auto;">
        <tr><td align='center' colspan='2'><h1 style='text-align:center;'>CONSULTA&nbsp;DE&nbsp;EMPLEADOS</h1></td></tr>
        <tr>
            <td align="left">
                <input type="button" class="btn text-white boton" id="consultaEmpleadoE" onclick="cargaFiltrosEmp();" value="Filtros"/>
            </td>
            <td align="left">
                <form id="formEmpleadoG" method="POST" action="../../Servlet_consultaEmpleadoGeneral">
                    <input type="submit" class="btn text-white boton" id="consultaEmpleadoG" value="General"/>
                </form>
            </td>
             <td align="rigth">
                <form id="formEmpleadoD" method="POST" action="../../Servlet_consultaEmpleadoGeneral">
                    <input type="submit" class="btn text-white boton" id="consultaEmpleadoD" value="Despedidos"/>
                </form>
            </td>
        </tr>
    </table>
</div>

