<%-- 
    Document   : ModificarCliente
    Created on : 18/04/2019, 09:37:50 PM
    Author     : asus
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList lista = (ArrayList) request.getSession().getAttribute("cliente");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ventas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/VenEstilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/VenLaterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/VenTablacliente.css">
        <link href="../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" integrity="sha256-CfcERD4Ov4+lKbWbYqXD6aFM9M51gN4GUEtDhkWABMo=" crossorigin="anonymous"></script>
        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../js/Ventas/VenGeneral.js"></script>
        <script src="../js/Ventas/VenValidaciones.js"></script>
        <script src="../js/Ventas/muestraModales.js"></script>
        <link href="../css/estilosMax.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body style="width:100%; height:100%;">
        <!-- BARRA NAV -->
        <header class="sticky-top"> 
            <nav id="barraNavegadora" class="navbar navbar-expand-lg colorPrincipal" >
                <a class="navbar-brand" style="color: white;" href="mainVentas.jsp"><h4>Módulo<br>Ventas</h4><span class="sr-only">(current)</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span></button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a href="AgregarCliente.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_cliente.png" /><p>Clientes</p></a>
                        </li>
                        <li class="nav-item">
                            <a href="cotizacion.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_cotizacion.png" /><p>Cotizaci&oacute;n</p></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" aria-haspopup="true" aria-expanded="false" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"><img class="ic" border="dropdown-toggle0" height="25" width="25" src="../archivos/img/ic_ordenventa.png"/>Orden de venta</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="apartadoProducto.jsp" style="color: white">Apartar pedido</a>
                                <a class="dropdown-item" href="ventaParcialidades.jsp" style="color: white">Venta en parcialidades</a>
                                <a class="dropdown-item" href="ventaContado.jsp" style="color: white">Venta neta</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_reportes.png" />Reporte</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="ReporteFactura.jsp" style="color: white">Factura</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="Cobros.jsp" class="nav-link" style="color: white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_cobros.png" /><p>Cobros</p></a>
                        </li>
                    </ul>
                    <!--
                    <form class="form-inline my-2 my-lg-0">
                        <select class="form-control" id="tipoBusqueda">
                            <optgroup label="Elige tipo">
                                <option value="select">Selecciona</option>
                                <option value="id">Por ID</option>
                                <option value="nombre">Por nombre</option>
                                <option value="rfc">Por RFC</option>
                                <option value="estado">Por Estado</option>
                                <option value="municipio">Por Municipio</option>  
                            </optgroup>
                        </select>&nbsp;&nbsp;
                        <input class="form-control mr-sm-2" type="search" id="busc" placeholder="Buscar" aria-label="Search">
                        <button class="btn btn-outline-dark" style="color: white" onclick="buscar()" type="submit">Buscar</button>
                    </form>
                    -->
                    <li class="nav-item">
                        <a href="com_ayuda.jsp" class="nav-link text-white" target="_blank" style="color: white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_ayuda.png" /><p>Ayuda</p></a>
                    </li>
                    <!--
                    <li class="nav-item">
                        <a id="btn_gerencia" class="nav-link" href="../Gerencia/IG/ig_inicio.jsp" style="color: white">Gerencia</a>                                
                        <script src="../js/gerencia.js"></script>
                    </li>
                    -->
                    <li class="nav-item">
                        <a href="../CerrarSesion" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_salir.png" /><p>Salir</p></a>
                    </li>
                </div>
            </nav>
        </header>
        
         <!-- CONTENIDO-->
         
        <div class="container-fluid contenido">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <center><button type="submit" style="background-color:#045FB4" name="buscar" class="btn btn-primary"><a href="AgregarCliente.jsp"><h5><font color=white>Regresar</font></h5></a></button></center>
                    <img class="ic" border="dropdown-toggle0" height="200" width="200" src="../archivos/img/foco.gif"/>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="form-style-5">
                        <form onsubmit="return validaRegistraCliente();" action="../ActualizarCliente" method="POST">

                            <span id="titulo"><span class="number" style="background-color:#045FB4">1</span>Registra cliente</span><br>
                            <br>
                            <input type="text" name="idcli" id="idcli" value="<%= lista.get(0) %>" required="required" readonly="readonly">
                            <input type="text" onkeypress="return soloLetras(event)" id="nomCli" name="nomCli" value="<%= lista.get(1) %>" placeholder="Nombre del cliente">
                            <input type="text" id="direc" name="direc" value="<%= lista.get(2) %>"placeholder="Dirección">
                            <input type="text" onkeypress="return SoloNumeros(event)" id="cp" name="cp" value="<%= lista.get(3) %>"placeholder="C&oacute;digo postal">
                            <input type="text" id="email" name="email" value="<%= lista.get(4) %>" placeholder="Email">
                            <center><button type="submit" style="background-color:#045FB4" name="modificar" class="btn btn-primary">Modificar</button></center>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <img class="ic" border="dropdown-toggle0" height="400" width="500" src="../archivos/img/idea.gif"/>
                </div>           
            </div>
        </div>
    </body>
</html>
