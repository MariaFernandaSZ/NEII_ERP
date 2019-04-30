
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
                        <a href="ayuda_modifica.jsp" class="nav-link text-white" target="_blank" style="color: white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_ayuda.png" /><p>Ayuda</p></a>
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
                
                
         <!-- Seccion izquierda -->
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                    <div class="form-style-5">
<div>
    <table class='tabla'>
        <tr>
            <td align='center' class='form-group'>
                <form autocomplete='off' id="formModNomina" method="POST" action="../../Servlet_modBuscaNomina">
                    <h1 style='text-align: center;'>MODIFICAR&nbsp;N&Oacute;MINA</h1>
                    <table style="margin: 0 auto;">
                        <tr>
                            <td>ID&nbsp;de&nbsp;N&oacute;mina: &nbsp;</td>
                            <td><input type='number' min="1" name="modificarIdNomina" id='modificarIdNomina' class='form-control form-control-sm' required="required"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"><input type="submit" id="modificarBuscaNomina" class='btn text-white boton' value="Buscar"/></td>
                            <td></td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</div>
                        
                         </div>
                </div>
           
                
                   <!-- Seccion central TABLA -->
                 <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                    <div class="table-responsive">
                        
                        
<div id="modNominaResultado" style="display: none;">
    <form autocomplete="off" method="POST" id="formGuardarModNomina" action="../../Servlet_modificarNomina">
        <table style="margin: 0 auto;">
            <tr>
                <td colspan="2"><input type="text" id="modificarNominaIdResultado" name="modificarNominaIdResultado" class='form-control form-control-sm' required="required"/></td>
                <td></td>
            </tr>
            <tr>
                <td>Nombre&nbsp;de&nbsp;la&nbsp;empresa:&nbsp;</td>
                <td><input type='text' id='modificarNominaEmpresa' name='modificarNominaEmpresa' class='form-control form-control-sm' required="required"></td></tr>
            <tr>
                <td>Fecha&nbsp;de&nbsp;Creaci&oacute;n:&nbsp;</td>
                <td><input type='date' id='modificarNominaFechaCreacion' name='modificarNominaFechaCreacion' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Fecha&nbsp;l&iacute;mite&nbsp;de&nbsp;pago:&nbsp;</td>
                <td><input type='date' id='modificarNominaFechaLimite' name='modificarNominaFechaLimite' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Id&nbsp;de&nbsp;Empleado:&nbsp;</td>
                <td><input type='number' min="1" id='modificarNominaIdEmpleado' name='modificarNominaIdEmpleado' class='form-control form-control-sm' required="required"></td>
            </tr>                    
            <tr>
                <td>Percepciones:&nbsp;</td>
                <td><input type='number' min="88.90" id='modificarNominaPercepciones' name='modificarNominaPercepciones' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Deducciones:&nbsp;</td>
                <td><input type='number' min="0.00" id='modificarNominaDeducciones' name='modificarNominaDeducciones' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>D&iacute;as&nbsp;pagados:&nbsp;</td>
                <td><input type='number' min="1" id='modificarNominaDias' name='modificarNominaDias' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Sueldo&nbsp;diario</td>
                <td><input type='number' min="88.90" id='modificarNominaPagoDias' name='modificarNominaPagoDias' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Pago&nbsp;total:&nbsp;</td>
                <td><input type='number' min="88.90" id='modificarNominaTotal' name='modificarNominaTotal' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Forma&nbsp;de&nbsp;pago:&nbsp;</td>
                <td><input type='text' id='modificarNominaPago' name='modificarNominaPago' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td colspan='2' align='center'><input type='submit' id="modificacionesNomina" class='btn text-white boton' value='Guardar'></td>
            </tr>
        </table>
    </form>
</div>
  
                        
                        
                         </div> 

                </div>
                
                
                
                   
                   
                      <!-- Seccion derecha -->
                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                 
                </div>
                      
                      
                      
                      
                      
                      
                      
                      
                
                
                   </div>

        </div>
 </body>
</html>