
<!DOCTYPE html>
<html>
    <head>
        <title>Contabilidad</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilos.css" type="text/css">
        <link href="../css/laterales.css" rel="stylesheet" type="text/css"/>
        <link href="../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>        
        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
         <link href="../css/estilosMax.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header class="sticky-top">
            <!--barra de navegacion creada con bootstrap-->
            <nav class="navbar navbar-expand-lg navbar-light barra">                
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <a class="navbar-brand text-white" href="ct_index.jsp"><h4>Contabilidad</h4></a>
                        <li class="nav-item">
                            <a id="inicio" href="ct_index.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_inicio.png" /><p>Inicio</p></a>
                        </li> 
                         <li class="nav-item">
                            <a id="impuestos" href="ct_impuestos.jsp" class="nav-link text-white color" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_financiera.png" /><p>Impuestos</p></a>
                        </li> 
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class="ic"  border="0" height="25" width="25" src="../archivos/img/ic_problema.png" />
                                Libros
                            </a>
                            <div class="dropdown-menu" id="submenu">
                                <a class="nav-link text-white color" href="ct_libro_diario.jsp">Libro Diario<span class="sr-only">(current)</span></a>
                                <a class="nav-link text-white color" href="ct_libro_mayor.jsp">Libro Mayor</a>
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Movimientos
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
                        <li class="nav-item">
                            
                            <a id="btn_gerencia" class="nav-link color" href="../Gerencia/IG/ig_inicio.jsp" style="color: white">Gerencia</a>                                
                            <script src="../js/gerencia.js"></script>
                                
                        </li>
                    </ul>                    
                     
                    <li class="nav-item">
                        <a href="ayuda.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_ayuda.png" /><p>Ayuda</p></a>                       
                    </li>
                    <li class="nav-item">
                        <a href="../../CerrarSesion" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_salir.png" /><p>Salir</p></a>                       
                    </li>
                
                </div>
            </nav>
        </header>

        <div id="principal">
            <div class="container-fluid">
                <div class="row">
                    <br>
                </div>
                <div class="row">
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12"> <!-- Seccion izquierda -->

                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"><!-- Seccion central -->
                        <table style="width: 100%; height: 100%; border-color: #9F150D" border="10">
                            <tr>
                                <td>
                                    ¡Bienvenido al M&oacute;dulo de Contabilidad!
                                </td>
                            </tr>
                        </table>  
                    </div>
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><!-- Seccion derecha -->
                        <table style="width:100%;height:100%;">                                        
                            <tr><td colspan="2">Informaci&oacute;n de la empresa</td></tr>
                            <tr><td colspan="2"><img src="" alt="logo de la empresa"></td></tr>
                        </table>
                    </div>    
                </div>
            </div> 
        </div>
    </body>
</html>
