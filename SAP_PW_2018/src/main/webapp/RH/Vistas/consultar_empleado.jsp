

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <title>RRHH</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../css/VenEstilos.css" rel="stylesheet" type="text/CSS">
        <link href="../../css/VenLaterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../../css/VenTablacliente.css">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" integrity="sha256-CfcERD4Ov4+lKbWbYqXD6aFM9M51gN4GUEtDhkWABMo=" crossorigin="anonymous"></script>
        <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../../js/Ventas/VenGeneral.js"></script>
        <script src="../../js/Ventas/VenValidaciones.js"></script>
        <script src="../../js/Ventas/muestraModales.js"></script>
        <link href="../../css/estilosMax.css" rel="stylesheet" type="text/css"/>
        
    </head>
    
    <body style="width:100%; height:100%;">

        <!-- BARRA NAV -->
        <header class="sticky-top"> 
            <nav id="barraNavegadora" class="navbar navbar-expand-lg colorPrincipal" >
                <a class="navbar-brand" style="color: white;" href="modificarNomina.jsp"><h4>Módulo<br>RRHH</h4><span class="sr-only">(current)</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span></button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a href="verCalendario.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../imagen/marzo.jpg" /><p>Vercalendario</p></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" aria-haspopup="true" aria-expanded="false" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"><img class="ic" border="dropdown-toggle0" height="25" width="25" src="../imagen/persona.png"/>Nominas</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="nomina.jsp" style="color: white">Nomina</a>
                                <a class="dropdown-item" href="agregarNomina.jsp" style="color: white">agregar nomina</a>
                                 <a class="dropdown-item" href="modificarNomina.jsp" style="color: white">modificar nomina</a>
                                 <a class="dropdown-item" href="consultar_nomina.jsp" style="color: white">consultar nomina</a>
                                 <a class="dropdown-item" href="enviarNomina.jsp" style="color: white">enviar nomina</a>
                                 
                                 <a class="dropdown-item" href="consultasNomina.jsp" style="color: white">consultas de nomina</a>
                            </div>
                            
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../imagen/persona.png" />Tareas</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="agregarTarea.jsp" style="color: white">Agregar tarea</a>
                                <a class="dropdown-item" href="consultar_tareas.jsp" style="color: white">Consutar tareas</a>
                                <a class="dropdown-item" href="eliminarTarea.jsp" style="color: white">eliminar tareas</a>
                                <a class="dropdown-item" href="modificarTarea.jsp" style="color: white">modificar tareas</a>
                                 <a class="dropdown-item" href="consultasTareas.jsp" style="color: white">consutas de tareas</a>
                            </div>
                        </li>
                        
                         <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../imagen/persona.png" />Empleados</a>
                             <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="contratar.jsp" style="color: white">contratar empleado</a>
                                <a class="dropdown-item" href="despedir.jsp" style="color: white">despedir empleado</a>
                                <a class="dropdown-item" href="consultar_empleado.jsp" style="color: white">consultar empleado</a>
                                 <a class="dropdown-item" href="modificar.jsp" style="color: white">modifica empleado</a>
                             
                            </div>
                        </li>
                        
                        
                       
                    </ul>
                 
                    
                    <li class="nav-item">
                        <a href="ayuda_consulta.jsp" class="nav-link text-white" target="_blank" style="color: white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_ayuda.png" /><p>Ayuda</p></a>
                    </li>
                  
                    
                    
                    <li class="nav-item">
                        <a href="../../CerrarSesion" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_salir.png" /><p>Salir</p></a>
                    </li>
                </div>
            </nav>
        </header>
        
         <!-- CONTENIDO-->
        <div class="container-fluid contenido">
            <div class="row">

                
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">



                    
                    
<form autocomplete='off' method="POST" id="formConsultarEmpleado" action="../../Servlet_consultarEmpleado">
    <table style="margin: 0 auto;">
        <tr><td align="center">
                <select name="area" id="area" class="form-control form-control-sm"><!-- Lista para seleccion de area -->
                    <option value="" selected="selected">Selecciona&nbsp;un&nbsp;&aacute;rea...</option>
                    <option value="Recursos Humanos">Recursos&nbsp;Humanos</option>
                    <option value="Ventas">Ventas</option>
                    <option value="Compras">Compras</option>
                    <option value="Inventarios">Inventario</option>
                    <option value="Contabilidad">Contabilidad</option>
                    <option value="Gerencia">Gerencia</option>
                </select>
       </td></tr>
    </table>
    <table style="margin: 0 auto;">
        <tr><td align="center">ID&nbsp;empleado:<input type="text" placeholder="ingrese id del empleado" id="id_empleado" name="id_empleado" class="form-control form-control-sm"></td></tr>
    </table>
    <table style="margin: 0 auto;"><tr><td align="center">Mostrar</td></tr></table>
    <table style="margin: 0 auto;"><!-- Diferentes filtros para mostrar datos -->
        <tr><td><input type="checkbox" id="direccion" name="mostrar[]" value="direccion_emp"></td><td><label class="form-check-label" for="direccion">&nbsp;Direcci&oacute;n</label></td></tr>
        <tr><td><input type="checkbox" id="rfc" name="mostrar[]" value="rfc_emp"></td><td><label class="form-check-label" for="rfc">RFC</label></td></tr>
        <tr><td><input type="checkbox" id="telefono" name="mostrar[]" value="telefono_emp"></td><td><label class="form-check-label" for="telefono">Tel&eacute;fono</label></td></tr>
        <tr><td><input type="checkbox" id="licencia" name="mostrar[]" value="licencia_medica"></td><td><label class="form-check-label" for="licencia">Licencia&nbsp;m&eacute;dica</label></td></tr>
        <tr><td><input type="checkbox" id="edo_civil" name="mostrar[]" value="edo_civil_emp"></td><td><label class="form-check-label" for="edo_civil">Estado&nbsp;civil</label></td></tr>
        <tr><td><input type="checkbox" id="sueldo" name="mostrar[]" value="sueldo_emp"></td><td><label class="form-check-label" for="sueldo">Sueldo</label></td></tr>
        <tr><td><input type="checkbox" id="cargo" name="mostrar[]" value="cargo_emp"></td><td><label class="form-check-label" for="cargo">Cargo</label></td></tr>
        <tr><td><input type="checkbox" id="area_emp" name="mostrar[]" value="area_emp"></td><td><label class="form-check-label" for="area_emp">&Aacute;rea</label></td></tr>
    </table>
    <table style="margin: 0 auto;"><tr><td align="center">Ordenar&nbsp;por...</td></tr></table>
    <table style="margin: 0 auto;">
        <tr><td><input type="radio" id="orden_alfabeto" name="ordenar" value="alfabeto"></td><td><label class="form-check-label" for="orden_alfabeto">&nbsp;Orden&nbsp;alfab&eacute;tico</label></td></tr>
        <tr><td><input type="radio" id="orden_area" name="ordenar" value="area"></td><td><label class="form-check-label" for="orden_area">&nbsp;Orden&nbsp;por&nbsp;&aacute;rea</label></td></tr>
    </table>
    <table style="margin: 0 auto;"><tr><td align="center"><input type="submit" id="consulta" class="btn text-white boton" value="Consultar"></td></tr></table>
</form>


                    
                                   
                    
                    
                                 </div>
                
                              
                   </div>

        </div>
 </body>
</html>