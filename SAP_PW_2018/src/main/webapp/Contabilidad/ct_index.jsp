
<!DOCTYPE html>
<html>
    <head>
        <title>Contabilidad</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilos.css" type="text/css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" integrity="sha256-CfcERD4Ov4+lKbWbYqXD6aFM9M51gN4GUEtDhkWABMo=" crossorigin="anonymous"></script>
        <link href="../css/laterales.css" rel="stylesheet" type="text/css"/>
        <link href="../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>        
        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link href="../css/estilosMax.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
         <header class="sticky-top">
            <!--barra de navegacion creada con bootstrap-->
            <nav id="barraNavegadora" class="navbar navbar-expand-lg colorPrincipal" >
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav mr-auto">                    
                        <li class="nav-item">
                            <a href="ct_index.jsp" class="nav-link text-white"  aria-haspopup="true" aria-expanded="false"><h4>Contabilidad</h4></a>
                        </li>
                        <li class="nav-item">
                            <a href="ct_index.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_inicio.png" /><p>Inicio</p></a>
                        </li>
                        <li class="nav-item">
                            <a href="ct_impuestos.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_financiera.png" /><p>Impuestos</p></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               <img class="ic"  border="0" height="25" width="25" src="../archivos/img/ic_comercial.png" /> Libros
                            </a>
                            <div class="dropdown-menu" id="submenu">
                                <a class="nav-link text-white color" href="ct_libro_diario.jsp">Diario<span class="sr-only">(current)</span></a>
                                <a class="nav-link text-white color" href="ct_libro_mayor.jsp">Mayor<span class="sr-only">(current)</span></a>
                            </div>
                        </li>
                          <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               <img class="ic"  border="0" height="25" width="25" src="../archivos/img/ic_terceros.png" /> Movimientos
                            </a>
                            <div class="dropdown-menu" id="submenu">
                                <a class="nav-link text-white color" href="asientos_conta.jsp">Asientos Contables<span class="sr-only">(current)</span></a>                        
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Consultas
                            </a>
                            <div class="dropdown-menu" id="submenu">
                                <a class="nav-link text-white color" href="ct_con_plan_cuentas.jsp">Plan de cuentas<span class="sr-only">(current)</span></a>
                                <a class="nav-link text-white color" href="ct_resultados.jsp">Estado de resultados</a>
                            </div>
                        </li>
                    </ul> 
                </div>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="ayuda.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_ayuda.png" /><p>Ayuda</p></a>                       
                    </li>
                    <li class="nav-item">
                        <a href="../../CerrarSesion" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_salir.png" /><p>Salir</p></a>                       
                    </li>
                </ul>
            </nav>
        </header>
        
        
    <div id="principal">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 container-fluid" style="background-color: #f8f8f8;" ><!-- Seccion central (Visualizar tarea) -->

                    <div  class="row" style="height: 200px;">    
                        <img class="imagen" border="0" height="auto" width="50%" src="../archivos/img/img_logo_2.png" />
                    </div>
                    <div  class="row" style="margin-left: 5%; margin-right: 5%;">
                        <div class="row">
                            <label class="form-check-label col-lg-8 col-md-8 col-sm-8 col-xs-8">Enero-Febrero:</label> 
                            <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text" disabled="disable" placeholder="15%" name="PorcenProP" id="PorcenMerm" style="width: 100%;">
                        </div>
                        <div class="row"> 
                            <br>
                        </div>
                        <div class="row">
                             <label class="form-check-label col-lg-8 col-md-8 col-sm-8 col-xs-8"> Marzo-Abril:</label>
                             <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text" disabled="disable" placeholder="20%" name="PorcenProP" id="PorcenDevo" style="width: 100%;"> 
                        </div>
                        <div class="row"> 
                            <br>
                        </div>
                        <div class="row">
                          <label class="form-check-label col-lg-8 col-md-8 col-sm-8 col-xs-8">Mayo-Junio:</label> 
                          <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text" disabled="disable" placeholder="10%" name="PorcenComP" id="PorcenComP" style="width: 100%;">     
                        </div>
                        <div class="row"> 
                            <br>
                        </div>
                        <div class="row">
                           <label class="form-check-label col-lg-8 col-md-8 col-sm-8 col-xs-8">Julio-Agosto:</label>
                           <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text" disabled="disable" placeholder="25%" name="PorcenVenP" id="PorcenVenP" style="width: 100%;">    
                        </div>
                        <div class="row"> 
                            <br>
                        </div>
                         <div class="row">
                           <label class="form-check-label col-lg-8 col-md-8 col-sm-8 col-xs-8">Septiembre-Octubre:</label>
                           <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text" disabled="disable" placeholder="18%" name="PorcenVenP" id="PorcenVenP" style="width: 100%;">    
                        </div>
                        <div class="row"> 
                            <br>
                        </div>
                         <div class="row">
                           <label class="form-check-label col-lg-8 col-md-8 col-sm-8 col-xs-8">Noviembre-Diciembre:</label>
                           <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text" disabled="disable" placeholder="12%" name="PorcenVenP" id="PorcenVenP" style="width: 100%;">    
                        </div>
                    </div>
                    <br>
                </div>
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 container-fluid"><!-- Seccion derecha (Visualizar tarea) -->
                    <div class="row">
                        <br><br>
                    </div>
                    <div class="row justify-content-center" style="background-color: #f8f8f8; margin-left: 10%; margin-right: 10%;" >
                        <h2 class="titulos text-center" style="width: 100%;">Ganancias</h2>  
                        <br>
                        <canvas id="gInventarios" width="100%" height="30px"></canvas>
                        <br>
                        <canvas id="Gconta" width="100%" height="35px"></canvas>
                        <script src="componentes/graficainicio.js" type="text/javascript"></script>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
