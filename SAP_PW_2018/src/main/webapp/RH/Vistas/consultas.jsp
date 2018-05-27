<div>
    <table style="margin: 0 auto;">
        <tr>
            <td align="center">
                <input type="button" class="btn text-white boton" id="consultaEmpleadoE" onclick="cargaFiltrosEmp();" value="Filtros"/>
            </td>
            <td align="center">
                <form id="formEmpleadoG" method="POST" action="../../Servlet_consultaEmpleadoGeneral">
                    <input type="submit" class="btn text-white boton" id="consultaEmpleadoG" value="General"/>
                </form>
            </td>
        </tr>
    </table>
</div>
<div id="resultadoConsultaEmp"></div>
