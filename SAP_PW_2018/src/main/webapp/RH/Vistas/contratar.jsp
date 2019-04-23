
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
                <a class="navbar-brand" style="color: white;" href="modificarNomina.jsp"><h4>M�dulo<br>RRHH</h4><span class="sr-only">(current)</span></a>
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
                        <a href="ayuda_contrata.jsp" class="nav-link text-white" target="_blank" style="color: white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_ayuda.png" /><p>Ayuda</p></a>
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



<table class='tabla'>
    <tr><td align='center' class='form-group'>
            <form autocomplete='off' method="POST" id="formContratarEmpleado" onsubmit="return validarContratar();">
            <table style="margin: 0 auto;">
                <tr><td colspan='2' align='center'><h1>CONTRATACI&Oacute;N</h1></td></tr>
                
                <tr><td>Nombre</td><td><input type='text' id='contratarNombre' placeholder="nombre" name='contratarNombre' class='form-control form-control-sm' required></td></tr>
                <tr><td>Apellido</td><td><input type='text' id='contratarApellido' placeholder="apellido" name='contratarApellido' class='form-control form-control-sm' required></td></tr>
                <tr><td>Direcci&oacute;n</td><td><input type='text' id='contratarDireccion' placeholder="direccion" name='contratarDireccion' class='form-control form-control-sm' required></td></tr>
                <tr><td>RFC</td><td><input type='text' id='contratarRfc' name='contratarRfc' placeholder="RFC" class='form-control form-control-sm' required></td></tr>
                <tr><td>Tel&eacute;fono</td><td><input type='number' id='contratarTelefono' placeholder="telefono" name='contratarTelefono' class='form-control form-control-sm' required></td></tr>
                <tr><td>Estado&nbsp;civil</td>
                    <td><select id='contratarEdocivil' name="contratarEdocivil" class='form-control form-control-sm' required>
                            <option value='' selected='selected'>Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                            <option value='Casado(a)'>Casado(a)</option>
                            <option value='Viudo(a)'>Viudo(a)</option>
                            <option value='Soltero(a)'>Soltero(a)</option>
                        </select>
                    </td>
                </tr>
                <tr><td>Licencia M&eacute;dica</td><td><input type='text' id='contratarlicenciaMedica' placeholder="licencia medica" name='contratarlicenciaMedica' class='form-control form-control-sm' required></td></tr>

                <tr><td>Sueldo</td><td><input type='number' id='contratarSueldo' name='contratarSueldo' placeholder="salario" class='form-control form-control-sm' required></td></tr>
                <tr><td>Cuenta</td><td><input type='text' id='cuenta' name='cuenta' placeholder=" cuenta de pagos" class='form-control form-control-sm' required></td></tr>               
                <tr><td>&Aacute;rea</td>
                    <td><select id='contratarArea' name="contratarArea" class='form-control form-control-sm' required>
                            <option value='' selected='selected'>Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                            <option value='Recursos Humanos'>Recursos Humanos</option>
                            <option value='Contabilidad'>Contabilidad</option>
                            <option value='Gerencia'>Gerencia</option>
                            <option value='Inventarios'>Inventarios</option>
                            <option value='Compras'>Compras</option>
                            <option value='Ventas'>Ventas</option>
                        </select>
                    </td>
                </tr>
                <tr><td>Cargo</td>
                    <td><select id='contratarCargo' name="contratarCargo" class='form-control form-control-sm' required>
                            <option value='' selected='selected'>Selecciona&nbsp;una&nbsp;cargo...</option>
                            <option value='Administrador'>Administrador</option>
                            <option value='Empleado'>Empleado</option>
                            <option value='Jefe'>Jefe</option>
                            <option value='Gerente'>Gerente</option>
                        </select>
                    </td>
                </tr>
                <tr><td align='center'><input type='submit' value='Finalizar' class='btn text-white boton'></td><td align='center'><input type='reset' value='Reiniciar' class='btn text-white boton'></td></tr>
            </table>
        </form>
    </td></tr>
</table>

                    
                    
                                        
                    
                    
                    
                                 </div>
                
                              
                   </div>

        </div>
 </body>
</html>