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

function agregarNomina(){
    alert('entre');
    var numeros = /[0-9]/;
    var letras = /[A-Za-z]/;
    var empresa = document.getElementById('empresa').value;
    if (numeros.test(empresa)) {
        alert('Modifique el nombre de la empresa,no es numerico');
        return false;
    }
    var fechaCreacion = document.getElementById('fechaCreacion').value;
    var fechaLimite = document.getElementById('fechaLimite').value;

    var now = moment();
    var fechac = new Date(fechaCreacion);
    var fechal = new Date(fechaLimite);

    if (fechac > now) {
        alert('la fecha de creacion  no puede ser mayor a la fecha actual');
        return false;
    }

    if (fechal < fechac) {
        alert('la fecha limite  no puede ser menor a la fecha de creacion');
        return false;
    }


    if (fechal === fechac) {
        alert('la fecha limite  no puede ser igual a la fecha de creacion');
        return false;
    }
    var idEmpleado = document.getElementById('idEmpleado').value;
            
    var percepciones = document.getElementById('percepciones').value;
    if (percepciones < 0) {
        alert('Modifique las percepciones, no deben ser negativas');
        return false;
    }
    var deducciones = document.getElementById('deducciones').value;
    if (deducciones < 0) {
        alert('Modifique las deducciones, no deben ser negativas');
        return false;
    }
    var diasPagados = document.getElementById('diasPagados').value;
    if (diasPagados < 0) {
        alert('Modifique los días pagados, no deben ser negativos');
        return false;
    }
    var pagoTotal = document.getElementById('pagoTotal').value;
    if (pagoTotal < 0) {
        alert('Modifique el pago total, no deben ser negativo');
        return false;
    }

    var formaPago = document.getElementById('formaPago').value;
    if (numeros.test(formaPago)) {
        alert('Modifique la forma de pago, no es numerico');
        return false;
    }
    
    document.forms[0].action = "../../Servlet_agregarNomina";


    $.get('../Vistas/agregarNomina.jsp', function (carga) {$('#tareaActual').html(carga);});

    
//    if(letras.test(idEmpleado)){alert('Modifique el ID del empleado, es numerico');return false;}
//    if(!(/^[a-zA-z0-9]{8}$/.test(idEmpleado))){
//                alert('Favor de ingresar el ID de empleado con los 8 digitos');                
//                return false;
//            }
        
}

function agregarTarea(){
    var numeros = /[0-9]/;
    var letras = /[A-Za-z]/;
    
    var tarea = document.getElementById('agregarNombreTarea').value;
    
    if (numeros.test(tarea)) {
        alert('Modifique el nombre de la tarea, no es numerico');
        return false;
    }
    var responsable = document.getElementById('agregarResponsable').value;
    
    if (letras.test(responsable)) {
        alert('Modifique el ID del empleado, es numerico');
        return false;
    }

    var inicio = document.getElementById('agregarFechaInicio').value;
    var fin = document.getElementById('agregarFechaFin').value;
    
    var now = moment();
    var fechai = new Date(inicio);
    var fechaf = new Date(fin);

    if (fechai < now) {
        alert('la fecha de inicio  no puede ser menor a la fecha actual');
        return false;
    }

    if (fechaf < fechai) {
        alert('la fecha de fin  no puede ser menor a la fecha de inicio');
        return false;
    }

    if (fechai === fechaf) {
        alert('la fecha de fin  no puede ser igual a la fecha de inicio');
        return false;
    }
      
    alert('Tarea creada:\n\ ID del Responsable: '+responsable+'\n\ Tarea: '+tarea+'\n\ Fecha de Inicio: '+inicio+'\n\ Fecha de termino: '+fin);
       document.forms[0].action="../../Servlet_agregarTarea";

    $.get('../Vistas/agregarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
  
  }

function eliminarTarea(){
    var numeros = /[0-9]/;
   
        var nombre = document.getElementById('eliminarNombreTarea').value;
        if(numeros.test(nombre)){alert('Modifique el nombre, no es numerico');return false;}
        
        var id = document.getElementById('eliminarIdTarea').value;
//    if(!(/^[a-zA-z0-9]{8}$/.test(id))){
//                alert('Favor de ingresar el ID de empleado con los 8 digitos');                
//                return false;
//            }
    if(nombre==="" && id===""){
        alert('Debe agregar el nombre o ID de la tarea a eliminar.');
    }
               document.forms[0].action="../../Servlet_eliminarTarea";
}

function modificarTarea(){
    var numeros = /[0-9]/;
    
    var modificarNombreTarea = document.getElementById('modificarNombreTarea').value;
    var modificarEncargadoTarea = document.getElementById('modificarEncargadoTarea').value;
    var modificarFechaInicio = document.getElementById('modificarFechaInicio').value;
    var modificarFechaFin = document.getElementById('modificarFechaFin').value;
    if(numeros.test(modificarNombreTarea)){alert('Modifique el nombre de la tarea, no es numerico');return false;}
    var now = moment();
    var fechai = new Date(modificarFechaInicio);

                    if (fechai > now) {
        alert('la fecha de inicio  no puede ser superior a la actual');
        return false;
    }
    var fechaf = new Date(modificarFechaFin);
    if (fechaf < fechai) {
        alert('la fecha de fin no puede ser menor a la fecha de inicio');
                   
   
    $.get('../Vistas/modificarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
                   
    }
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
    var numeros = /[0-9]/;
    var letras = /[A-Za-z]/;
    var nombre = document.getElementById('contratarNombre').value;
    if (numeros.test(nombre)) {
        alert('Nombre no valido');
        return false;
    }
    var apellido = document.getElementById('contratarApellido').value;
    if (numeros.test(apellido)) {
        alert('Modifique el apellido del empleado, no es numerico');
        return false;
    }
    var direccion = document.getElementById('contratarDireccion').value;
        
    var RFC = document.getElementById('contratarRfc').value;

    if(!(/^[a-zA-z0-9]{13}$/.test(RFC))){
                alert('Favor de ingresar el RFC con los 13 caracteres');                
                return false;
            }   

    var telefono = document.getElementById('contratarTelefono').value;
    if (telefono.length !== 10 || letras.test(telefono)) {
        alert('Modifique el numero telefonico del empleado, es de 10 digitos');
        return false;
    }
    var edocivil = document.getElementById('contratarEdocivil').value;
    var licencia = document.getElementById('contratarlicenciaMedica').value;
    var sueldo = document.getElementById('contratarSueldo').value;
    if (sueldo < 88.50) {
        alert('El sueldo debe ser mayor a $88.50');
        return false;
    }

    var sueldo_diario = document.getElementById('contratarSueldoDiario').value;
     if (sueldo_diario < 88.50) {
        alert('El sueldo debe ser mayor a $88.50');
        return false;
    }
    
    var area = document.getElementById('contratarArea').value;
    var cargo = document.getElementById('contratarCargo').value;
   document.forms[0].action="../../Servlet_contratarEmpleado";
       //alert(document.forms[0]);
   //document.forms[0].submit();

    $.get('../Vistas/contratar.jsp',function(carga){$('#tareaActual').html(carga);});
}
function modificarNomina(){
    var numeros = /[0-9]/;
    var letras = /[A-Za-z]/;
    var modificarEmpresa = document.getElementById('modificarNombreEm').value;
    var modificarFechaCreacion = document.getElementById('modificarFechaCreacion').value;
    var modificarFechaLimite = document.getElementById('modificarFechaLimite').value;
    var modificarPercepciones = document.getElementById('modificarPercepciones').value;
    var modificarDeducciones = document.getElementById('modificarDeducciones').value;
    var modificardiasPagados = document.getElementById('modificardiasPagados').value;
    var modificarPagototal = document.getElementById('modificarPagototal').value;
    var modificarFormapago = document.getElementById('modificarFormapago').value;
    var modificarIdEmpleado = document.getElementById('modificarIdEmpleado').value;

//     if(!(/^[a-zA-z0-9]{8}$/.test(modificarIdEmpleado))){
//                alert("Favor de ingresar el ID de empleado con los 8 digitos");                
//                return false;
//            }

    if (numeros.test(modificarEmpresa)) {
        alert('Nombre de la empresa no valida.');
        return false;
    }
    var now = moment();
    var fechac = new Date(modificarFechaCreacion);
    if (fechac > now) {
        alert('la fecha de creacion  no puede ser superior a la actual');
        return false;
    }

    var fechal = new Date(modificarFechaLimite);
    var fechac = new Date(modificarFechaCreacion);
    if (fechal < fechac) {
        alert('Modifique la fecha de limite de pago, no puede ser menor a la fecha de creacion');
        return false;
    }
    if (fechal === fechac) {
        alert('Modifique la fecha de limite de pago, no puede ser igual a la fecha de creacion');
        return false;
    }

    if (modificarPercepciones < 0) {
        alert('Modifique las percepciones, no deben ser negativas');
        return false;
    }

    if (modificarDeducciones < 0) {
        alert('Modifique las deducciones, no deben ser negativas');
        return false;
    }

    if ((modificardiasPagados) < 0) {
        alert('Modifique los dias pagados, no acepta negativos');
        return false;
    }

    if ((modificarPagototal) < 0) {
        alert('El pago total no debe ser negativo');
        return false;
    }

    if (numeros.test(modificarFormapago)) {
        alert('Modifique la forma de pago, no es numerico');
        return false;
    }
    alert("Modificacion exitosa");
    $.get('../Vistas/modificarNomina.jsp', function (carga) {
        $('#tareaActual').html(carga);
    });
    return false;
               
            }
        
    
    


function modificarEmpleado(){
    var modificarIdEmpleado = document.getElementById('modificarIdEmpleado').value;
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
   
   
    if (numeros.test(modificarNombreEmpleado)) {
        alert('Nombre no valido.');
        return false;
    }

    if (numeros.test(modificarApellidoEmpleado)) {
        alert('Apellido no valido.');
        return false;
    }

    if (letras.test(modificarTelefonoEmpleado)) {
        alert('Telefono no valido.');
        return false;
    }

    if (modificarSueldoEmpleado < 88.50) {
        alert('El sueldo debe ser mayor a $88.50');
        return false;
    }
    alert('Se ha modificado la informacion del empleado ' + modificarIdEmpleado);
    $.get('../Vistas/modificar.jsp',function(carga){$('#tareaActual').html(carga);});
    return false;

                   
        }
        
        
function despedirEmpleado(){
    var despedirIdEmpleado = document.getElementById('despedirIdEmpleado').value;
    var fechadespedir = document.getElementById('despedirFecha').value;
    var despedirMotivo = document.getElementById('despedirMotivo').value;

    var now = moment();
                    var fechad = new Date(fechadespedir);
                    if (fechad > now) {
                alert('Modifique la fecha de despido, no puede ser superior a la actual');
                     return false;
                 }     

    
//    if(!(/^[a-zA-z0-9]{8}$/.test(despedirIdEmpleado))){
//                alert("Favor de ingresar el ID de empleado con los 8 digitos");                
//                return false;
//            }
    alert('El empleado con ID '+despedirIdEmpleado+' '+' \n\ ha sido retirado debido a: '+despedirMotivo);
       document.forms[0].action="../../Servlet_despedirEmpleado";

    $.get('../Vistas/despedir.jsp',function(carga){$('#tareaActual').html(carga);});
    
    }
    
 



$(document).ready(function(){
    $('#verCalendario').click(function(){
        $.get('../Vistas/verCalendario.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#agregarTarea').click(function(){
        $.get('../Vistas/agregarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#modificarTarea').click(function(){
        $.get('../Vistas/modificarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
   
    $('#consultarTarea').click(function(){
        $.get('../Vistas/consultar_tareas.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#eliminarTarea').click(function(){
        $.get('../Vistas/eliminarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
     $('#agregarNomina').click(function(){
        $.get('../Vistas/agregarNomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
     $('#modificarNomina').click(function(){
        $.get('../Vistas/modificarNomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
      $('#consultarNomina').click(function(){
        $.get('../Vistas/consultar_nomina.jsp',function(carga){$('#tareaActual').html(carga);});
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
    
      $('#imprimir').click(function(){
        $.get('../Vistas/imprimir.jsp',function(carga){$('#tareaActual').html(carga);});
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
   
    
//    $(document).on("submit","#formAgregarTarea", function(event){
//        var $form = $(this);
//        $.post($form.attr("action"), $form.serialize(), function(responseText){
//            alert(responseText);
//            $('#agregarNombreTarea').val("");
//            $('#agregarResponsable').val("");
//            $('#agregarFechaInicio').val("");
//            $('#agregarFechaFin').val("");
//        });
//        event.preventDefault();
//    });
    
//    $(document).on("submit","#formEliminarTarea", function(event){
//        var $form = $(this);
//        $.post($form.attr("action"), $form.serialize(), function(responseText){
//            alert(responseText);
//            $('#eliminarIdTarea').val("");
//            $('#eliminarNombreTarea').val("");
//        });
//        event.preventDefault();
//    });
    

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
////    
//    $(document).on("submit","#formContratarEmpleado", function(event){
//        var $form = $(this);
//        $.post($form.attr("action"), $form.serialize(), function(responseText){
//            alert(responseText);
//            $('#contratarNombre').val("");
//            $('#contratarApellido').val("");
//            $('#contratarDireccion').val("");
//            $('#contratarRfc').val("");
//            $('#contratarTelefono').val("");
//            $('#contratarEdocivil').val("");
//            $('#contratarlicenciaMedica').val("");           
//            $('#contratarSueldo').val("");
//            $('#contratarSueldoDiario').val("");
//            $('#contratarArea').val("");
//            $('#contratarCargo').val("");
//        });
//        event.preventDefault();
//    });

//$(document).on("submit","#formAgregarNomina", function(event){
//        var $form = $(this);
//        $.post($form.attr("action"), $form.serialize(), function(responseText){
//            alert(responseText);
//            $('#empresa').val("");
//            $('#fechaCreacion').val("");
//            $('#fechaLimite').val("");
//            $('#idEmpleado').val("");
//            $('#percepciones').val("");
//            $('#deducciones').val("");
//            $('#diasPagados').val("");
//            $('#pagoTotal').val("");
//            $('#formaPago').val("");
//        });
//        event.preventDefault();
//    });
    
});
