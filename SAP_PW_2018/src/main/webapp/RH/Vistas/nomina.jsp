
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
                        <a href="ayuda_nomina.jsp" class="nav-link text-white" target="_blank" style="color: white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_ayuda.png" /><p>Ayuda</p></a>
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






<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="table-responsive"></div>
<table class="table table-bordered">
    <tr>
        <th>Empresa</th>
        <th>R&eacute;gimen&nbsp;f&iacute;scal</th>
        <th>Fecha&nbsp;de&nbsp;creaci&oacute;n</th>
        <th>Fecha&nbsp;l&iacute;mite&nbsp;cobro</th>
        <th>ID emp</th>
        <th>Nombre&nbsp;del&nbsp;emp</th>
        <th>RFC&nbsp;del&nbsp;emp</th>
        <th>Percepciones</th>
        <th>Deducciones</th>
        <th>D&iacute;as&nbsp;pagados</th>
        <th>Pago&nbsp;total</th>
        <th>Forma&nbsp;de&nbsp;pago</th>
    </tr>
    <tr>
        <td>Uno</td>
        <td>201801</td>
        <td>01/01/2019</td>
        <td>02/01/2019</td>
        <td>12345</td>
        <td>Geovanni Ayala</td>
        <td>AAPG971024HMCYXV00</td>
        <td>NO</td>
        <td>NO</td>
        <td>28</td>
        <td>$90,000</td>
        <td>Tarjeta de d�bito</td>
    </tr>  
</table>
    
    </div>
    
    </div>


 
                 
                      
                      
                      
                      
                      
                      
          </div>

        </div>
         
         </body>
         </html>
