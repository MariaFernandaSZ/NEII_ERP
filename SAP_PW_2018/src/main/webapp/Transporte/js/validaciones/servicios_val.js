function habilitarBusqueda(value)
{
    if (value === "0" || value === true) {
        $('#carga').val("");
        $('#pasajeros').val("");
        $('#txtMatricula').val("");
        $('#txtModelo').val("");
        $('#origen').val("");
        $('#destino').val("");
        $('#fecha_inicio').val("");
        $('#txtChofer').val("");
        $('#txtFecha_fin').val("");
        $('#txtKilometraje').val("");
        $('#txtCosto_combustible').val("");
        $('#txtCosto_casetas').val("");
        $('#txtCosto_total').val("");
        document.getElementById('carga').disabled = true;
        document.getElementById('pasajeros').disabled = true;

    } else if (value === "1" || value === true) {
        $('#carga').val("");
        $('#pasajeros').val("");
        $('#txtMatricula').val("");
        $('#txtModelo').val("");
        $('#txtChofer').val("");
        document.getElementById('pasajeros').disabled = true;
        document.getElementById('carga').disabled = false;

    } else if (value === "2" || value === true) {
        $('#carga').val("");
        $('#pasajeros').val("");
        $('#txtMatricula').val("");
        $('#txtModelo').val("");
        $('#txtChofer').val("");
        document.getElementById('carga').disabled = true;
        document.getElementById('pasajeros').disabled = false;

    } else if (value === "3" || value === true) {
        $('#carga').val("");
        $('#pasajeros').val("");
        $('#txtMatricula').val("");
        $('#txtModelo').val("");
        $('#txtChofer').val("");
        document.getElementById('carga').disabled = true;
        document.getElementById('pasajeros').disabled = false;

    } else if (value === "4" || value === true) {
        $('#carga').val("");
        $('#pasajeros').val("");
        $('#txtMatricula').val("");
        $('#txtModelo').val("");
        $('#txtChofer').val("");
        document.getElementById('pasajeros').disabled = true;
        document.getElementById('carga').disabled = false;

    } else if (value === "5" || value === true) {
        $('#carga').val("");
        $('#pasajeros').val("");
        $('#txtMatricula').val("");
        $('#txtModelo').val("");
        $('#txtChofer').val("");
        document.getElementById('pasajeros').disabled = false;
        document.getElementById('carga').disabled = false;

    }
}