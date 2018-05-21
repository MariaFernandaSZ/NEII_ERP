function fecha(){
    var valor = document.getElementById('fecha');
    var fecha = new Date();
    var dia;
    var mes;
    if(fecha.getDate() < 10){dia ='0'+fecha.getDate();}else{dia = fecha.getDate();}
    if(fecha.getMonth()+1 < 10){mes ='0'+(fecha.getMonth()+1);}else{mes = fecha.getMonth()+1;}
    valor.value = (dia+'/'+mes+'/'+fecha.getFullYear());
    document.getElementById('fecha').innerHTML = valor.value;
}

function agregarTarea(){
    var responsable = document.getElementById('agregarResponsable').value;
    var tarea = document.getElementById('agregarNombreTarea').value;
    var inicio = document.getElementById('agregarFechaInicio').value;
    var fin = document.getElementById('agregarFechaFin').value;
    alert('Tarea creada:\n\ Responsable: '+responsable+'\n\ Tarea: '+tarea+'\n\ Fecha de Inicio: '+inicio+'\n\ Fecha de termino: '+fin);
    $.get('../Vistas/agregarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    return false;
}

function eliminarTarea(){
    var nombre = document.getElementById('eliminarNombreTarea').value;
    var id = document.getElementById('eliminarIdTarea').value;
    if(nombre==="" && id===""){
        alert('Debe agregar el nombre o ID de la tarea a eliminar.');
        return false;
    }else{
        alert('Tarea eliminada.');
        $.get('../Vistas/eliminarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
        return false;
    }
}

function modificarTarea(){
    var control = document.getElementsByName('info[]');
    var modificarNombreTarea = document.getElementById('modificarNombreTarea').value;
    var modificarEncargadoTarea = document.getElementById('modificarEncargadoTarea').value;
    var modificarFechaInicio = document.getElementById('modificarFechaInicio').value;
    var modificarFechaFin = document.getElementById('modificarFechaFin').value;
    if(!control[0].checked&&!control[1].checked&&!control[2].checked&&!control[3].checked){
        alert('Elige un campo para modificar.');
        return false;
    }
    for(var i = 0 ; i < control.length ; i++){
        if(control[i].checked){
            switch(i){
                case 0:
                    if(modificarNombreTarea===''){alert('Ingresa el nuevo nombre de la tarea.');return false;}
                    break;
                case 1:
                    if(modificarEncargadoTarea===''){alert('Ingresa el ID del nuevo encargado de la tarea.');return false;}
                    break;
                case 2:
                    if(modificarFechaInicio===''){alert('Ingresa la nueva fecha de inicio.');return false;}
                    break;
                case 3:
                    if(modificarFechaFin===''){alert('Ingresa la nueva fecha de termino.');return false;}
                    break;
                default:
                    alert('Sin cambios');
                    return false;
                    break;
            }
        }
    }
    alert('Tarea modificada.');
    $.get('../Vistas/modificarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    return false;
}

function validaConsulta(){
    var area = document.getElementById('area').value;
    var id = document.getElementById('id_empleado').value;
    var datos = document.getElementsByName('mostrar[]');
    var orden = document.getElementsByName('ordenar');
    var mensaje = '';
    mensaje = mensaje+'Mostrando datos de '+area+' \n\ ';
    if(id!==''){mensaje = mensaje+'ID del empleado: '+id+' \n\ ';}
    for(var i = 0 ; i < datos.length ; i++){
        if(datos[i].checked){
            switch(i){
                case 0:
                    mensaje = mensaje+'Vacaciones \n\ ';
                    break;
                case 1:
                    mensaje = mensaje+'Dias trabajados \n\ ';
                    break;
                case 2:
                    mensaje = mensaje+'Dias de entrada puntual \n\ ';
                    break;
                case 3:
                    mensaje = mensaje+'Cargo \n\ ';
                    break;
                case 4:
                    mensaje = mensaje+'Licencia médica \n\ ';
                    break;
                default:
                    break;
            }
        }
    }
    for(var j = 0 ; j < orden.length ; j++){
        if(orden[j].checked){
            switch(j){
                case 0:
                    mensaje = mensaje+'Orden alfabético \n\ ';
                    break;
                case 1:
                    mensaje = mensaje+'Orden por fecha de ingreso \n\ ';
                    break;
                default:
                    break;
            }
        }
    }
    alert(''+mensaje);
    $.get('../Vistas/consulta.jsp',function(carga){$('#tareaActual').html(carga);});
    return false;
}

function validarContratar(){
    var nombre = document.getElementById('contratarNombre').value;
    var apellido = document.getElementById('contratarApellido').value;
    var direccion = document.getElementById('contratarDireccion').value;
    var telefono = document.getElementById('contratarTelefono').value;
    var edocivil = document.getElementById('contratarEdocivil').value;
    var sueldo = document.getElementById('contratarSueldo').value;
    var cargo = document.getElementById('contratarCargo').value;
    var numeros = /[0-9]/;
    var letras = /[A-Za-z]/;
    if(numeros.test(nombre)){alert('Nombre no valido');return false;}
    if(numeros.test(apellido)){alert('Apellido no valido');return false;}
    if(telefono.length!==10||letras.test(telefono)){alert('Numero telefonico no valido');return false;}
    if(sueldo < 88.50){alert('El sueldo debe ser mayor a $88.50');return false;}
    alert('ID de empleado: #########');
    $.get('../Vistas/contratar.jsp',function(carga){$('#tareaActual').html(carga);});
    return false;
}

function modificarEmpleado(){
    var modificarIdEmpleado = document.getElementById('modificarIdEmpleado').value;
    var dato = document.getElementsByName('dato[]');
    var modificarNombreEmpleado = document.getElementById('modificarNombreEmpleado').value;
    var modificarApellidoEmpleado = document.getElementById('modificarApellidoEmpleado').value;
    var modificarDireccionEmpleado = document.getElementById('modificarDireccionEmpleado').value;
    var modificarTelefonoEmpleado = document.getElementById('modificarTelefonoEmpleado').value;
    var modificarEdocivilEmpleado = document.getElementById('modificarEdocivilEmpleado').value;
    var modificarLicenciaEmpleado = document.getElementById('modificarLicenciaEmpleado').value;
    var modificarSueldoEmpleado = document.getElementById('modificarSueldoEmpleado').value;
    var modificarCargoEmpleado = document.getElementById('modificarCargoEmpleado').value;
    var numeros = /[0-9]/;
    var letras = /[A-Za-z]/;
    if(!dato[0].checked&&!dato[1].checked&&!dato[2].checked&&!dato[3].checked&&!dato[4].checked&&!dato[5].checked&&
            !dato[6].checked&&!dato[7].checked){
        alert('Selecciona un campo a modificar.');
        return false;
    }
    for(var k = 0 ; k < dato.length ; k++){
        if(dato[k].checked){
            switch(k){
                case 0:
                    if(modificarNombreEmpleado===''){alert('Ingresa el nuevo nombre del empleado.');return false;}
                    if(numeros.test(modificarNombreEmpleado)){alert('Nombre no valido.');return false;}
                    break;
                case 1:
                    if(modificarApellidoEmpleado===''){alert('Ingresa el nuevo apellido del empleado.');return false;}
                    if(numeros.test(modificarApellidoEmpleado)){alert('Apellido no valido.');return false;}
                    break;
                case 2:
                    if(modificarDireccionEmpleado===''){alert('Ingresa la nueva direccion del empleado.');return false;}
                    break;
                case 3:
                    if(modificarTelefonoEmpleado===''){alert('Ingresa el nuevo telefono del empleado.');return false;}
                    if(letras.test(modificarTelefonoEmpleado)){alert('Telefono no valido.');return false;}
                    break;
                case 4:
                    if(modificarEdocivilEmpleado===''){alert('Selecciona el nuevo estado civil del empleado.');return false;}
                    break;
                case 5:
                    if(modificarLicenciaEmpleado===''){alert('Ingresa el nuevo estado de licencia medica del empleado.');return false;}
                    break;
                case 6:
                    if(modificarSueldoEmpleado===''){alert('Ingresa el nuevo sueldo del empleado.');return false;}
                    if(modificarSueldoEmpleado < 88.50){alert('El sueldo debe ser mayor a $88.50');return false;}
                    break;
                case 7:
                    if(modificarCargoEmpleado===''){alert('Selecciona el nuevo cargo del empleado.');return false;}
                    break;
                default:
                    break;
            }
        }
    }
    alert('Se ha modificado la informacion del empleado '+modificarIdEmpleado);
    $.get('../Vistas/modificar.jsp',function(carga){$('#tareaActual').html(carga);});
    return false;
}

function despedirEmpleado(){
    var despedirIdEmpleado = document.getElementById('despedirIdEmpleado').value;
    var despedirMotivo = document.getElementById('despedirMotivo').value;
    var despedirCargo = document.getElementById('despedirCargo').value;
    alert('El empleado '+despedirIdEmpleado+' con cargo '+despedirCargo+' \n\ ha sido retirado debido a: '+despedirMotivo);
    $.get('../Vistas/despedir.jsp',function(carga){$('#tareaActual').html(carga);});
    return false;
}

$(document).ready(function(){
    $('#verCalendario').click(function(){
        $.get('../Vistas/verCalendario.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#agregarTarea').click(function(){
        $.get('../Vistas/agregarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#eliminarTarea').click(function(){
        $.get('../Vistas/eliminarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#modificarTarea').click(function(){
        $.get('../Vistas/modificarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#contratar_empleado').click(function(){
        $.get('../Vistas/contratar.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#despedir_empleado').click(function(){
        $.get('../Vistas/despedir.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#modificar_empleado').click(function(){
        $.get('../Vistas/modificar.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#buscar_empleado').click(function(){
        $.get('../Vistas/consultar_empleado.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#contabilidad_nomina').click(function(){
        $.get('../Vistas/nomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#gerencia_nomina').click(function(){
        $.get('../Vistas/nomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#compras_nomina').click(function(){
        $.get('../Vistas/nomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ventas_nomina').click(function(){
        $.get('../Vistas/nomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#inventario_nomina').click(function(){
        $.get('../Vistas/nomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#rh_nomina').click(function(){
        $.get('../Vistas/nomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_calen').click(function(){
        $.get('../Vistas/ayuda_calen.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_agTarea').click(function(){
        $.get('../Vistas/ayuda_agTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_eliTarea').click(function(){
        $.get('../Vistas/ayuda_eliTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_modTarea').click(function(){
        $.get('../Vistas/ayuda_modTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_nomina').click(function(){
        $.get('../Vistas/ayuda_nomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_consulta').click(function(){
        $.get('../Vistas/ayuda_consulta.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_informacion').click(function(){
        $.get('../Vistas/ayuda_informacion.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_modifica').click(function(){
        $.get('../Vistas/ayuda_modifica.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_contrata').click(function(){
        $.get('../Vistas/ayuda_contrata.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_despedir').click(function(){
        $.get('../Vistas/ayuda_despedir.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_reporte').click(function(){
        $.get('../Vistas/ayuda_reporte.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_imprimir').click(function(){
        $.get('../Vistas/ayuda_imprimir.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#modificar').click(function(){
        $.get('../Vistas/modificar.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#contratar').click(function(){
        $.get('../Vistas/contratar.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#despedir').click(function(){
        $.get('../Vistas/despedir.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#imprimir').click(function(){
        $.get('../Vistas/imprimir.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $(document).on("submit","#formAgregarTarea", function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            alert(responseText);
            $('#agregarNombreTarea').val("");
            $('#agregarResponsable').val("");
            $('#agregarFechaInicio').val("");
            $('#agregarFechaFin').val("");
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formEliminarTarea", function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            alert(responseText);
            $('#eliminarIdTarea').val("");
            $('#eliminarNombreTarea').val("");
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formConsultarEmpleado",function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            $('#tareaActual').html(responseText);
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formModificarTarea", function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            alert(responseText);
            $('#modificarNombreTarea').val("");
            $('#modificarResponsable').val("");
            $('#modificarFechaInicio').val("");
            $('#modificarFechaFin').val("");
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formContratarEmpleado", function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            alert(responseText);
            $('#contratarNombre').val("");
            $('#contratarApellido').val("");
            $('#contratarDireccion').val("");
            $('#contratarRfc').val("");
            $('#contratarTelefono').val("");
            $('#contratarEdocivil').val("");
            $('#contratarSueldo').val("");
            $('#contratarArea').val("");
            $('#contratarCargo').val("");
        });
        event.preventDefault();
    });
});