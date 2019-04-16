<%
    /*if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Contabilidad")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../archivos/errorSesion.jsp");
        }
    }*/
%>
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
        <script src="../js/Contabilidad/validacion.js" type="text/javascript"></script>
        <script src="../js/Contabilidad/modales.js"    type="text/javascript"></script>
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
                            <a href="ct_index.jsp" class="nav-link text-white"  aria-haspopup="true" aria-expanded="false"><h3>Contabilidad</h3></a>
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
                               <img class="ic"  border="0" height="25" width="25" src="../archivos/img/ic_terceros.png" /> Aprobaciones
                            </a>
                            <div class="dropdown-menu" id="submenu">
                                <a class="nav-link text-white color" href="ct_ventas.jsp">Nóminas<span class="sr-only">(current)</span></a>
                                <a class="nav-link text-white color" href="ct_prov.jsp">Compras<span class="sr-only">(current)</span></a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="plan_cuentas.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_miembros.png" /><p>Cuentas</p></a>
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
            <div class="container-fluid">
                <div class="row">
                    <br>
                </div>
                <div class="row">
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12"> <!-- Seccion izquierda -->
                        <div class="form-style-5">
                            <form onsubmit="return validavacio('clave');" action="ct_ventas.html">
                                <span id="titulo"><span class="number">1</span>Ingresa la clave a buscar</span>
                                <div class="row">
                                    <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                                        <input type="text" id="clave" placeholder="ingresa clave a buscar"/>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                                        <input type="submit" value="buscar">
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <button id="btn-ven-conf" type="button" class="btn btn-light" onclick="configuraVENmodal()">Configurar</button>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-4">
                                        <button id="btn-ven-confimp" type="button" class="btn btn-light" onclick="configuraImpuestoVENmodal()">Configurar Impuestos</button>
                                    </div>
                                </div>
                            </form>    
                        </div>

                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"><!-- Seccion central -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Selecciona</th>                            
                                    <th>RFC</th>
                                    <th>Nombre</th>
                                    <th>Codigo</th>                            
                                </tr>
                                <tr>
                                    <td class="seleccion"><input type="checkbox"/></td>                            
                                    <td>APR9405033K0</td>
                                    <td>Abarrotes prueba</td>                            
                                    <td>NUT-AA</td>                            
                                </tr>
                                <tr>
                                    <td class="seleccion"><input type="checkbox"/></td>                            
                                    <td>APR9405033K0</td>
                                    <td>Abarrotes prueba</td>                            
                                    <td>NUT-AA</td>                            
                                </tr>
                                <tr>
                                    <td class="seleccion"><input type="checkbox"/></td>                            
                                    <td>APR9405033K0</td>
                                    <td>Abarrotes prueba</td>                            
                                    <td>NUT-AA</td>                            
                                </tr>
                                <tr>
                                    <td class="seleccion"><input type="checkbox"/></td>                            
                                    <td>APR9405033K0</td>
                                    <td>Abarrotes prueba</td>                            
                                    <td>NUT-AA</td>                            
                                </tr>
                            </table>   
                        </div>
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

        <!-- Modal CONFIGURAR-->
        <div class="modal fade" id="confven" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Configurar</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form action="ct_ventas.jsp" onsubmit="return ventas();" method="post">
                                <table>
                                    <tr>
                                        <td></td>
                                        <td colspan="4"><h1>Cliente</h1></td>
                                    </tr>                            
                                    <tr>
                                        <td>
                                            Cuenta contable:
                                        </td>
                                        <td>
                                            <input type="text" id="ventascuenta" placeholder="201.68"/>
                                        </td>                               
                                        <td>&nbsp;&nbsp;</td>
                                        <td>
                                            Nombre:
                                        </td>
                                        <td>
                                            <input type="text" id="ventasnombre" placeholder="abarrotes garras"/>
                                        </td>                               
                                    </tr>  
                                    <tr>
                                        <td></td>
                                        <td colspan="4"><h1>Cobro Anticipado</h1></td>
                                    </tr>                            
                                    <tr>
                                        <td>
                                            Cuenta contable:
                                        </td>
                                        <td>
                                            <input type="text" id="cobrocuenta" placeholder="201"/>
                                        </td>                               
                                        <td>&nbsp;&nbsp;</td>
                                        <td>
                                            Nombre:
                                        </td>
                                        <td>
                                            <input type="text" id="cobronombre" placeholder="abarrotes garras"/>
                                        </td>                               
                                    </tr>  

                                    <tr>
                                        <td></td>
                                        <td colspan="4"><h1>IEPS</h1></td>
                                    </tr>                            
                                    <tr>
                                        <td>
                                            Cuenta contable:
                                        </td>
                                        <td>
                                            <input type="text" id="iepscuenta" placeholder="201.68"/>
                                        </td>                               
                                        <td>&nbsp;&nbsp;</td>
                                        <td>
                                            Nombre:
                                        </td>
                                        <td>
                                            <input type="text" id="iepsnombre" placeholder="abarrotes garras"/>
                                        </td>                               
                                    </tr>  

                                    <tr>
                                        <td></td>
                                        <td colspan="4"><h1>Retenci&oacute;n ISR</h1></td>
                                    </tr>                            
                                    <tr>
                                        <td>
                                            Cuenta contable:
                                        </td>
                                        <td>
                                            <input type="text" id="isrcuenta" placeholder="201.68"/>
                                        </td>                               
                                        <td>&nbsp;&nbsp;</td>
                                        <td>
                                            Nombre:
                                        </td>
                                        <td>
                                            <input type="text" id="isrnombre" placeholder="abarrotes garras"/>
                                        </td>                               
                                    </tr>  

                                    <tr>
                                        <td></td>
                                        <td colspan="4"><h1>Retenci&oacute;n de IVA</h1></td>
                                    </tr>                            
                                    <tr>
                                        <td>
                                            Cuenta contable:
                                        </td>
                                        <td>
                                            <input type="text" id="ivacuenta" placeholder="201.68"/>
                                        </td>                               
                                        <td>&nbsp;&nbsp;</td>
                                        <td>
                                            Nombre:
                                        </td>
                                        <td>
                                            <input type="text" id="ivanombre" placeholder="abarrotes garras"/>
                                        </td>                               
                                    </tr>                                                                                                                         
                                </table> 
                                <input type="submit" value="AGREGAR"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal CONFIGURAR IMPUESTOS-->

        <div class="modal fade" id="confimpven" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Configurar Impuestos</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form action="ct_ventas.jsp" onsubmit="return ventasconfigimpuestos();" method="post">
                                <table>
                                    <tr>
                                        <td></td>
                                        <td colspan="4"><h1>IVA por trasladar</h1></td>
                                    </tr>                            
                                    <tr>
                                        <td>
                                            Cuenta contable:
                                        </td>
                                        <td>
                                            <input type="text" id="ivaportrasladar" placeholder="201.68"/>
                                        </td>                               
                                        <td>&nbsp;&nbsp;</td>
                                        <td>
                                            Tipo cuenta:
                                        </td>
                                        <td>
                                            <input type="text" id="ivaxtrasnombre" placeholder="IVA por trasladar"/>
                                        </td>                               
                                    </tr>  
                                    <tr>
                                        <td></td>
                                        <td colspan="4"><h1>IVA trasladado</h1></td>
                                    </tr>                            
                                    <tr>
                                        <td>
                                            Cuenta contable:
                                        </td>
                                        <td>
                                            <input type="text" id="ivatrascuenta" placeholder="208.1"/>
                                        </td>                               
                                        <td>&nbsp;&nbsp;</td>
                                        <td>
                                            Tipo cuenta:
                                        </td>
                                        <td>
                                            <input type="text" id="ivatrasnombre" placeholder="IVA trasladado"/>
                                        </td>                               
                                    </tr>  
                                </table>   
                                <input type="submit" value="APLICAR"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </body>
</html>
