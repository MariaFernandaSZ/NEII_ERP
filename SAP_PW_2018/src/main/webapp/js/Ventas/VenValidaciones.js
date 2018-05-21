//function validaTabla(){
//   
//      var nFilas = $("#listaProductos tr").length;
//
//      if(nFilas==0){
//        alert("No se han aÃ±adido productos");
//        
//        return false;
//      }else{
//        validaFechas();
//      }
//
//}
//  
// 
//function validaFechas(){
//           
//           
//
//      var primeraFecha = document.getElementById("fecha1").value;
//      
//
//      var segundaFecha = document.getElementById("fecha2").value;
//    var dosdiez = new Date('2010-01-01');
//      var anioPF = primeraFecha.substr(0,4);
//      var diaPF = primeraFecha.substr(8,10);
//      var m = primeraFecha.substr(5,6);
//      var mesPF = m.substr(0,2);
//
//      var anioSF = segundaFecha.substr(0,4);
//      var diaSF = segundaFecha.substr(8,10);
//      var mS = segundaFecha.substr(5,6);
//      var mesSF = mS.substr(0,2);
//      
//
//      var f1 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
//      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014
//      
//
//    var ini= new Date("2010-01-01");
//    
//   
//      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
//                
//            alert("Alguna fecha no ha sido ingresada");
//               
//            return false;
//      }else if(f1<ini){
//          alert("fecha de inicio no debe ser menor al año 2010")
//      } else{
//            if(f1>f2){
//                alert("Fecha de venta es mayor a fecha de entrega");
//            }else{
//                validaTipoPago();
//            }
//      }
//}
//
//  
//function validaCantidadPago() {
//
//      var anticipoPago = document.getElementById("anticipo").value;
//      var res = document.getElementById("resto").value;
//
//      if( !/^([0-9])*$/.test(anticipoPago)||anticipoPago==null||anticipoPago==0)  {
//   
//        alert("Ingrese cantidad de anticipo.");
//   
//        return false;
//      }else if (res<(2*anticipoPago)){
//          
//      }
//          else{
//        validaTipoPago();
//      }
//
//}
//
//
//function validaTablaCONTADO(){
//           
//      var nFilas = $("#listaProductos tr").length;
//
//      if(nFilas==0){
//                
//          alert("No se han añadido productos");
//            
//          return false;
//      }else{
//            
//        validaFechasCONTADO();
//      }
//
//}
//
//
//function validaFechasCONTADO(){
//      
//      var primeraFecha = document.getElementById("fecha1").value;
//      
//
//      var segundaFecha = document.getElementById("fecha2").value;
//
//      var anioPF = primeraFecha.substr(0,4);
//      var diaPF = primeraFecha.substr(8,10);
//      var m = primeraFecha.substr(5,6);
//      var mesPF = m.substr(0,2);
//
//      var anioSF = segundaFecha.substr(0,4);
//      var diaSF = segundaFecha.substr(8,10);
//      var mS = segundaFecha.substr(5,6);
//      var mesSF = mS.substr(0,2);
//
//      var f1 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
//      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014
//
//       var ini= new Date("2010-01-01");
//      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
//                
//            alert("Alguna fecha no ha sido ingresada");
//               
//            return false;
//      }else if(f1<ini){
//          alert("fecha de inicio no debe ser menor al año 2010")
//      } else{
//            if(f1>f2){
//                alert("Fecha de venta es mayor a fecha de entrega");
//            }else{
//                validaTipoPago();
//            }
//      }
//}
//
//
//function validaTablaPARCIAL(){
// 
//      var nFilas = $("#listaProductos tr").length;
//
//    
//      if(nFilas==0){
//              
//          alert("No se han aÃ±adido productos");
//      
//          return false;
//      }else{
//     
//          validaFechasPARCIAL();
//      }
//}
//
//   
//
//
//     function validaFechasPARCIAL(){
//      
//      var primeraFecha = document.getElementById("fecha1").value;
//      
//
//      var segundaFecha = document.getElementById("fecha2").value;
//
//      var anioPF = primeraFecha.substr(0,4);
//      var diaPF = primeraFecha.substr(8,10);
//      var m = primeraFecha.substr(5,6);
//      var mesPF = m.substr(0,2);
//
//      var anioSF = segundaFecha.substr(0,4);
//      var diaSF = segundaFecha.substr(8,10);
//      var mS = segundaFecha.substr(5,6);
//      var mesSF = mS.substr(0,2);
//
//      var f1 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
//      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014
//      
//      
//     var ini= new Date("2010-01-01"); 
//      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
//                
//            alert("Alguna fecha no ha sido ingresada");
//               
//            return false;
//      }else if(f1<ini){
//          alert("la fecha de inicio no debe ser menor al año 2010");
//      }else{
//            if(f1>f2){
//                alert("Fecha de venta es mayor a fecha de entrega");
//            }else{
//                validaPARCIALIDAD();
//            }
//      }
//      
//          if( !(/^\d{1,9}$/.test(anticipo1)) ) {
//            alert("falta anticipo");
//          return false;
//        }else if(anticipo1=="" || anticipo1 == null || anticipo1.length == 0 || /^\s+$/.test(anticipo1)|| res>(2*anticipo1)){
//           alert("el anticipo debe ser mayor al 30% del total"); 
//        }
//}
//
//function validaPARCIALIDAD(){
//
//      var parcialidad = document.getElementById("tipoParcial").value;
//
//      if( parcialidad=="selectPar")  {
//
//          alert("Ingrese tipo de parcialidad");
//           
//          return false;
//      }else{
//            
//        validaTipoPago();
//  
//      }
//}
//
//function validaTablaCOT(){
//          
//    var nFilas = $("#listaProductos tr").length;
//
//     
//    if(nFilas==0){
//              
//      alert("No se han aÃ±adido productos");
//             
//      return false;
//
//    }else{
//            
//      validaFechasCOT();
//    }
//}
//
//function validaFechasCOT(){
//         
//      var primeraFecha = document.getElementById("fecha1").value;
//      
//
//      var segundaFecha = document.getElementById("fecha2").value;
//
//      var anioPF = primeraFecha.substr(0,4);
//      var diaPF = primeraFecha.substr(8,10);
//      var m = primeraFecha.substr(5,6);
//      var mesPF = m.substr(0,2);
//
//      var anioSF = segundaFecha.substr(0,4);
//      var diaSF = segundaFecha.substr(8,10);
//      var mS = segundaFecha.substr(5,6);
//      var mesSF = mS.substr(0,2);
//
//      var f1 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
//      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014
//
//       var ini= new Date("2010-01-01");
//      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
//                
//            alert("Alguna fecha no ha sido ingresada");
//               
//            return false;
//      }else if(f1<ini){
//          alert("la fecha de inicio no debe ser menor al año 2010");
//      }else{
//            if(f1>f2){
//                alert("Fecha de venta es mayor a fecha de entrega");
//            }else{
//                alert("CARGANDO...");
//            }
//      }
//}
//
//function validaTablaReportes(){
//         
//    var nFilas = $("#listaProductos tr").length;
//
//       
//    if(nFilas==0){
//              
//        alert("No se ha cargado reporte");
//        
//        return false;
//    }else{
//    
//        validaFechasReportes();
//    }
//}
//
//
function validaFechasReportes(){
var hoy= new Date();           
      var primeraFecha = document.getElementById("fecha1").value;
      

      var segundaFecha = document.getElementById("fecha2").value;

      var anioPF = primeraFecha.substr(0,4);
      var diaPF = primeraFecha.substr(8,10);
      var m = primeraFecha.substr(5,6);
      var mesPF = m.substr(0,2);

      var anioSF = segundaFecha.substr(0,4);
      var diaSF = segundaFecha.substr(8,10);
      var mS = segundaFecha.substr(5,6);
      var mesSF = mS.substr(0,2);

     var f1 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
      var f11 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014
   
     var limit= f1.setMonth(f1.getMonth()-12);
     var fechafin=new Date(document.getElementById('fecha2').value);    
  
      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
                
            alert("Alguna fecha no ha sido ingresada");
               
            return false;
      }else if(f1<limit){
          alert("la fecha de inicio no debe ser menor a un año");
          return false;
      }else if (fechafin>hoy){
        alert('la fecha final no puede ser mayor a la actual');
//        document.getElementById('fecha2').value="";
        return false;
    }else{
            if(f11>f2){
                alert("Fecha de inicio es mayor a fecha de termino");
            }else{
                alert("CARGANDO...");
            }
      }
}
//
//function validaSelectVenta(){
//
//        
//    var venta = document.getElementById("ventasInter").value;
//
//  
//    if(venta=="venta"){
//               
//      alert("Selecciona una venta");
//    }else{
//   
//        validaTipoPago();
//    }
//}
//
//
//function validaTipoPago(){
//
//
//      var tipoDePago = document.getElementById("tipoPago").value;
//
//      if(tipoDePago=="select") {
//                 
//          alert("Seleccione un tipo de pago.");
//              
//          return false;
//      }else{
//                 
//          if(tipoDePago=="efectivo"){
//                  
//            $.post('modales/pagoEfectivo.jsp',function(xx){
//
//                $('#tmpModal').html(xx);
//
//                $('#pagoEfectivo').modal('show');
//            }); 
//
//          }else{
//                  
//            $.post('modales/pagoTarjeta.jsp',function(xx){
//
//                $('#tmpModal').html(xx);
//
//                $('#pagoTarjeta').modal('show');
//            }); 
//
//          }
//
//      }            
//
//}

        



function validaIDCliente(){

            
      var idClient=document.getElementById("IDCliente").value;

   
         //id de la empresa obligatorio
            if( !(/^[A-Za-z]{3}[0-9]{4}$/.test(idClient)) ) {
             
          alert("Ingrese un id correto como, Ejemplo: cli1234");
       
          return false;
      }
     


}

 





      
 


function valmodalmail(){
    var mail=document.getElementById("correo").value;
    var formato=document.getElementById("formatoImp").selectedIndex;
    if(!(/\S+@\S+\.\S+/.test(mail))){
            alert('ERROR: Debe escribir un correo valido ejemplo:geovanni.ayalapea@gmail.com');
            return false;
        }
         if( formato == null || formato==0 ) {
              alert("seleccione un formato en el que desea enviar");
            return false;
          }
}

function valmodalimprimir(){

    var formato=document.getElementById("formatoImp").selectedIndex;
         if( formato == null || formato==0 ) {
              alert("seleccione un formato en el que desea imprimir");
            return false;
          }
     
}
  function validamodaldetalleCliente(){
 
       var id = document.getElementById("idEmpresa").value;
                var Max_nomEmp = 30;
        var lengthnomEmp = document.getElementById("nombreEmp").value.length;
       var efec=document.getElementById("nombreEmp").value;
                    var Max_rfcEmp = 13;
        var lengthrfcEmp = document.getElementById("rfcEmp").value.length;
        var tota=document.getElementById("rfcEmp").value;

            //select group lista

//nombre de la empresa obligatorio
        if(nomEmp == "" || nomEmp == null || nomEmp.length == 0 || /^\s+$/.test(nomEmp)){
            alert("ingrese un nombre de la empresa porfavor")
            return false;
        } else if (lengthnomEmp > Max_nomEmp) {
  alert("el maximo de caracteres para el nombe de la empresa es 30");
  return false;
}
           
        
//rfc obligatorio
         if(rfcEmp == "" || rfcEmp == null || rfcEmp.length == 0 || /^\s+$/.test(rfcEmp)){
            alert("ingrese un RFC de la empresa");
            return false;
        }else if (lengthrfcEmp != Max_rfcEmp) {
  alert("el numero de caracteres para el rfc de la empresa debe ser de 13");
  return false;
}
  
  }
//function validamodalagregarprod(){
//     var Max_codigo = 13;
//        var lengthcodigo = document.getElementById("codprod").value.length;
//    var codigo=document.getElementById("codprod").value;
//
//    var canti=document.getElementById("cant").value;
//    
//   if(codigo == "" || codigo == null || codigo.length == 0 || /^\s+$/.test(codigo)){
//            alert("ingrese un codigo");
//            return false;
//        } else if (lengthcodigo != Max_codigo) {
//  alert("el numero de caracteres para el codigo del producto debe ser de 13");
//  return false;
//}
//
// if( !(/^\d{1,4}$/.test(canti)) ) {
//            alert("ingrese una cantidad de productos");
//          return false;
//        }
//          
//}
function validamodalapagotarjeta(){

        
    var tar=document.getElementById("tarjeta").value;

    var me=document.getElementById("mes").value;
    var anio=document.getElementById("año").value;
    var cods=document.getElementById("codseguridad").value;
        var nomtar=document.getElementById("nomtar").value;
         var Max_nomtar = 64;
        var lengthnomtar = document.getElementById("nomtar").value.length;
    
 if(tar == "" || tar == null || tar.length == 0 || /^\s+$/.test(tar)){
       alert("ingrese su numero de tarjeta")     
        }else  if( !(/^\d{16}$/.test(tar)) ) {
            alert("ingrese los 16 digitos de su tarjeta: ejemplo 1234567891234567");
          return false;
        }
        
        if(me == "" || me == null || me.length == 0 || /^\s+$/.test(me)){
       alert("ingrese un mes")     
        }else  if( !(/^\d{2}$/.test(me)) ) {
            alert("ingrese los 2 dijitos del mes: ejemplo 12");
          return false;
        }else if(me<1 || me >12){
            alert("ingrese un mes entre 1  y 12");
            return false;
        }
        
          if(anio == "" || anio == null ||anio.length == 0 || /^\s+$/.test(anio)){
       alert("ingrese un año")     
        }else  if( !(/^\d{4}$/.test(anio)) ) {
            alert("ingrese los 4 digitos del año: ejemplo 2018");
          return false;
        }else if(anio<2018 || anio>2050){
            alert("ingrese un año que sea del actual al 2050");
            return false;
        }
         if(cods == "" || cods == null || cods.length == 0 || /^\s+$/.test(cods)){
       alert("ingrese un año")     
        }else  if( !(/^\d{3}$/.test(cods)) ) {
            alert("ingrese los 3 caracteres del codigo: ejemplo 218");
          return false;
        }
        
   if(nomtar == "" || nomtar == null || nomtar.length == 0 || /^\s+$/.test(nomtar)){
            alert("ingrese un nombre de la tarjeta");
            return false;
        } else if (lengthnomtar > Max_nomtar) {
  alert("el numero de caracteres maximo son 60");
  return false;
}
          
}

//  function validamodalapagoEfectivo(){
//       var moneda = document.getElementById("job").selectedIndex;
//       
//       var efec=document.getElementById("efectivo").value;
//        var tota=document.getElementById("total").value;
//
//            //select group lista
//
// if( (moneda == null )) {
//  
//              alert("seleccione una moneda");
//  
// 
//             return false;
//  }else{
//
//        $('#pagoEfectivo').modal({
//        show:true
//        });
//  }
//if(efec == "" || efec == null || efec.length == 0 || /^\s+$/.test(efec)){
//            alert("ingrese un efectvo")
//            return false;
//        }
//  
//  }

//function validacionRegistraCliente(){
//             var Max_nomEmp = 30;
//        var lengthnomEmp = document.getElementById("nombreEmp").value.length;
//        var nomEmp=document.getElementById("nombreEmp").value;
//              var Max_rfcEmp = 13;
//        var lengthrfcEmp = document.getElementById("rfcEmp").value.length;
//        var rfcEmp=document.getElementById("rfcEmp").value;
//        var indice = document.getElementById("estado").selectedIndex;
//        
//            var Max_municipio = 40;
//        var lengthmunicipio = document.getElementById("municipioEmp").value.length;
//        var municipioEmp=document.getElementById("municipioEmp").value;
//        
//        var Max_calleEmp = 40;
//        var lengthcalleEmp = document.getElementById("calleEmp").value.length;
//        var calleEmp = document.getElementById("calleEmp").value;
//        
//        var codpostal = document.getElementById("codpostal").value;
//
//         var Max_nominter = 40;
//        var lengthnominter = document.getElementById("nombreintermediario").value.length;
//        var nombrecliente=document.getElementById("nombreintermediario").value;
//         var Max_apeinter = 60;
//        var lengthapeinter = document.getElementById("apellidointermediario").value.length;
//        var apellidocliente=document.getElementById("apellidointermediario").value;
//
//        var numeroTelefono=document.getElementById('telefonointermediario').value;
//
//        var correo=document.getElementById("correointermediario").value;
// 
//
////nombre de la empresa obligatorio
//        if(nomEmp == "" || nomEmp == null || nomEmp.length == 0 || /^\s+$/.test(nomEmp)){
//            alert("ingrese un nombre de la empresa porfavor")
//            return false;
//        } else if (lengthnomEmp > Max_nomEmp) {
//  alert("el maximo de caracteres para el nombe de la empresa es 30");
//  return false;
//}
//           
//        
////rfc obligatorio
//         if(rfcEmp == "" || rfcEmp == null || rfcEmp.length == 0 || /^\s+$/.test(rfcEmp)){
//            alert("ingrese un RFC de la empresa");
//            return false;
//        }else if (lengthrfcEmp != Max_rfcEmp) {
//  alert("el numero de caracteres para el rfc de la empresa debe ser de 13");
//  return false;
//}
//          //select group lista
//          if( indice == null || indice==0 ) {
//              alert("seleccione una opccion de Estado");
//            return false;
//          }
//
////nombre del municipio obligatorio
//        if (municipioEmp=="" || municipioEmp == null || municipioEmp.length == 0 || /^\s+$/.test(municipioEmp)) {
//            alert("ingrese el municipio donde se ubica");
//        } else if (lengthmunicipio > Max_municipio) {
//  alert("el maximo de caracteres para el nombre del municipio es 40");
//  return false;
//}
//
////nombre de la calle obligatorio
//        if (calleEmp=="" || calleEmp == null || calleEmp.length == 0 || /^\s+$/.test(calleEmp)) {
//            alert("ingrese la calle donde se ubica Ejemplo: Francisco |. Madero 20");
//        } else if (lengthcalleEmp > Max_calleEmp) {
//  alert("el maximo de caracteres para la calle de la empresa es 40");
//  return false;
//}
///*else if( !(/\w+\|.+[A-Za-z0-9 ]/.test(calleEmp)) ) {
//             
//          alert("Ingrese una calle y numero como en el siguente, Ejemplo: Francisco |. Madero 20");
//       
//          return false;
//      }*/
//
//        if( !(/^\d{5}$/.test(codpostal)) ) {
//            alert("ingrese un codigo postal de 5 numeros ejemplo:12345");
//          return false;
//        }
////nombre del cliente obligatorio
//        if (nombrecliente=="" || nombrecliente == null || nombrecliente.length == 0 || /^\s+$/.test(nombrecliente)) {
//            alert("ingrese un nombre de intermediario");
//        }else if (lengthnominter > Max_nominter) {
//  alert("el maximo de caracteres para el nombre del intermediario es 40");
//  return false;
//}
////apellido del cliente obligatorio
//        if (apellidocliente=="" || apellidocliente == null || apellidocliente.length == 0 || /^\s+$/.test(apellidocliente)) {
//            alert("ingrese un apellido de intermediario");
//        }else if (lengthapeinter > Max_apeinter) {
//  alert("el maximo de caracteres para los apellidos del intermediario es 60");
//  return false;
//}
//
//        if(!(/^\+52\s\d{10}$/.test(numeroTelefono))) {
//            alert("escribe un telefono valido ejemplo:+52 7225653154");
//            return false;
//        }
//
//        if(!(/\S+@\S+\.\S+/.test(correo))){
//            alert('ERROR: Debe escribir un correo vÃ¡lido ejemplo:geovanni.ayalapea@gmail.com');
//            return false;
//        }
//    }
 
function buscar(){
    var buscar=document.getElementById("busc").value;
     var tipo=document.getElementById("tipoBusqueda").selectedIndex;
    tipoBusqueda
     if(buscar == "" || buscar == null || buscar.length == 0 || /^\s+$/.test(buscar)){
            alert("ingrese lo que desea buscar")
            return false;
        }
         if( tipo == null || tipo==0 ) {
              alert("seleccione un Tipo para su reporte");
            return false;
          }
}


function validaRegistraInterm(){

  
       var Max_nominter = 40;
        var lengthnominter = document.getElementById("nombreInter2").value.length;
   var nombrecliente=document.getElementById("nombreInter2").value;
   
   var Max_apeinter = 60;
        var lengthapeinter = document.getElementById("apellidoInter2").value.length;
     
       var apellidosCliente=document.getElementById("apellidoInter2").value;
  
          var numeroTelefono=document.getElementById('telefonoInter2').value;
  
          var correo=document.getElementById("correoInter2").value;
                  var nomEmpresa = document.getElementById("eligeEmpre").selectedIndex;
            
            if( nomEmpresa == null || nomEmpresa==0 || nomEmpresa=="Empresa") {
  
                alert("seleccione una empresa");
                return false;
                
                }
            //nombre del cliente obligatorio
 
      
     if (nombrecliente=="" || nombrecliente == null || nombrecliente.length == 0 || /^\s+$/.test(nombrecliente)) {
  
              alert("ingrese un nombre de intermediario");
       
         return false;
            }else if (lengthnominter > Max_nominter) {
  alert("el maximo de caracteres para el nombre del intermediario es 40");
  return false;
}

    
        if (apellidosCliente=="" || apellidosCliente == null || apellidosCliente.length == 0 || /^\s+$/.test(apellidosCliente)) {
       
         alert("ingrese apellido del intermediario");
                return false;
            }else if (lengthapeinter > Max_apeinter) {
  alert("el maximo de caracteres para los apellidos del intermediario es 60");
  return false;
}

        
    if(!(/^\d{10}$/.test(numeroTelefono))) {
        
        alert("escribe un telefono valido ejemplo: 7223490089");
   
             return false;
            }

          
  if(!(/\S+@\S+\.\S+/.test(correo))){
               
 alert('ERROR: Debe escribir un correo vÃ¡lido ejemplo:geovanni.ayalapea@gmail.com');
         
       return false;
            }
        }
        
                