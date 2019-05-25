

/* global bootbox */

$(".solicitar_servicio").click(function () {

    var instrucion = "carga_datos_vehiculo";
    var rfc = document.getElementById('cliente_rfc').value;
    var tipo_vehiculo = document.getElementById('tipo-vehiculo').value;
    var carga = document.getElementById('carga').value;
    var pasajeros = document.getElementById('pasajeros').value;
    var origen = document.getElementById('origen').value;
    var destino = document.getElementById('destino').value;
    var fecha_inicio = new Date(document.getElementById("fecha_inicio").value);
    var hoy = new Date();

    var fecha_inicio_v = new Date(document.getElementById("fecha_inicio").value);

    var day = ("0" + fecha_inicio_v.getDate()).slice(-2);
    var month = ("0" + (fecha_inicio_v.getMonth() + 1)).slice(-2);

    var fi = fecha_inicio_v.getFullYear() + "-" + (month) + "-" + (day);

    if (rfc === "" || rfc === null) {
        bootbox.alert({
            message: "No se ha cargado el rfc del cliente.",
            centerVertical: true,
            size: 'large'
        });
    } else if (tipo_vehiculo === "0") {
        bootbox.alert({
            message: "No se ha elegido el tipo de vehiculo.",
            centerVertical: true,
            size: 'large'
        });
    } else if (document.getElementById("fecha_inicio").value === "" || document.getElementById("fecha_inicio").value === null) {
        bootbox.alert({
            message: "No se ha elegido la fecha de inicio.",
            centerVertical: true,
            size: 'large'
        });
    } else if (fecha_inicio <= hoy) {
        bootbox.alert({
            message: "La fecha de inicio debe ser al menos un día después del la fecha de solicitud.",
            centerVertical: true,
            size: 'large'
        });
    } else if ((carga === "" || carga === null || carga === "0" || carga <= 0) && (tipo_vehiculo === "0" || tipo_vehiculo === "1" || tipo_vehiculo === "4" || tipo_vehiculo === "5")) {
        bootbox.alert({
            message: "No se ha elegido la carga.",
            centerVertical: true,
            size: 'large'
        });
    } else if ((carga > 36000) && (tipo_vehiculo === "1")) {
        bootbox.alert({
            message: "La carga máxima de un camión/trailer es de 36 Toneladas",
            centerVertical: true,
            size: 'large'
        });
    } else if ((carga > 170000) && (tipo_vehiculo === "4")) {
        bootbox.alert({
            message: "La carga máxima de un barco es de 170 Toneladas",
            centerVertical: true,
            size: 'large'
        });
    } else if ((carga > 113000) && (tipo_vehiculo === "5")) {
        bootbox.alert({
            message: "La carga máxima de un avión es de 113 Toneladas",
            centerVertical: true,
            size: 'large'
        });
    } else if ((pasajeros === "" || pasajeros === null || pasajeros === "0" || pasajeros <= 0) && (tipo_vehiculo === "0" || tipo_vehiculo === "2" || tipo_vehiculo === "3" || tipo_vehiculo === "5")) {
        bootbox.alert({
            message: "No se ha elegido la cantidad de pasajeros.",
            centerVertical: true,
            size: 'large'
        });
    } else if ((pasajeros > 100) && (tipo_vehiculo === "2")) {
        bootbox.alert({
            message: "La capacidad máxima de pasajeros de un autobus es de 100 personas",
            centerVertical: true,
            size: 'large'
        });
    } else if ((pasajeros > 7) && (tipo_vehiculo === "3")) {
        bootbox.alert({
            message: "La capacidad máxima de pasajeros de un automóvil es de 7 personas",
            centerVertical: true,
            size: 'large'
        });
    } else if ((pasajeros > 200) && (tipo_vehiculo === "5")) {
        bootbox.alert({
            message: "La capacidad máxima de pasajeros de un avión es de 200 personas",
            centerVertical: true,
            size: 'large'
        });
    } else if (origen === "" || origen === null) {
        bootbox.alert({
            message: "No se ha elegido punto de origen.",
            centerVertical: true,
            size: 'large'
        });
    } else if (destino === "" || destino === null) {
        bootbox.alert({
            message: "No se ha elegido punto de destino.",
            centerVertical: true,
            size: 'large'
        });
    } else {
        $.ajax({
            type:'post',
            url:'../ConexionServidorTransporte',
            datatype:'json',
            data:{rfc:rfc,tipo_vehiculo:tipo_vehiculo,carga:carga, pasajeros:pasajeros,origen:origen,destino:destino,fecha_inicio:fecha_inicio},
            success:function(result){
                
            }
            
        });
    }

});