<%@page import="java.util.ArrayList"%>
<%@page import="pw.sap.pojo.Ventas.Clientes"%>
<%@page import="java.util.LinkedList"%>
<%@page import="pw.sap.pojo.Ventas.QuerysVentas"%>
<%@page import="java.sql.ResultSet"%>

<%
    ArrayList lista = (ArrayList) request.getSession().getAttribute("ordenventa");
%>
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

    <body>
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
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" aria-haspopup="true" aria-expanded="false" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"><img class="ic" border="dropdown-toggle0" height="25" width="25" src="../archivos/img/ic_ordenventa.png"/>Orden de venta</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="Ordenventa.jsp" style="color: white">Agregar Orden</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_reportes.png" />Reporte</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="Factura.jsp" style="color: white">Factura</a>
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

        <!-- CONTENIDO -->
        <div class="container-fluid contenido">
            <div class="row">
                <div class="col-lg-1 col-md-1 col-sm-12 col-xs-12">
                    <center>
                        <button type="submit" style="background-color:#045FB4" name="buscar" class="btn btn-primary"><a href="Cobros.jsp"><h5><font color=white>Regresar</font></h5></a></button>
                        <br>
                        <br>
                        <br>
                        <img class="ic" border="dropdown-toggle0" height="200" width="200" src="../archivos/img/producto.gif"/>
                    </center>
                </div>
                <div class="col-lg-11 col-md-11 col-sm-12 col-xs-12">
                    <div class="form-style-5">
                        <form action="../Cobros" method="POST">
                             <div class="row">
                            <div class="col-xs-12 col-md-12">
                            <span id="titulo"><span class="number" style="background-color:#045FB4">1</span>Informacion del producto</span><br>
                            </div>
                            <br>
                            <br>
                            <div class="col-xs-3 col-md-3">
                            <font face="Comic Sans MS"><label>Id Orden Venta:</label></font>
                            <input type="number" id="idov" name="idov" placeholder="ID" placeholder="ID orden venta" value="<%= lista.get(0) %>" required="required">
                            </div>
                            <div class="col-xs-4 col-md-4">
                            <font face="Comic Sans MS"><label>Subtotal:</label></font>
                            <input type="text" onkeypress="return SoloNumeros(event)" id="st" name="st" value="<%= lista.get(4) %>" placeholder="Subtotal">
                            </div>
                            <div class="col-xs-5 col-md-5">
                            <font face="Comic Sans MS"><label>Total:</label></font>
                            <input type="text" onkeypress="return SoloNumeros(event)" id="total" name="t" value="<%= lista.get(5) %>" placeholder="Total">
                            </div>
                            <div class="col-xs-12 col-md-12">
                            <font face="Comic Sans MS"><label>Descripción:</label></font>
                            <input type="text" id="descF" name="descF"  value="<%= lista.get(2) %>" placeholder="Descripcion">
                            </div>
                            <div class="col-xs-12 col-md-12">
                            <span id="titulo"><span class="number" style="background-color:#045FB4">2</span>Forma de Pago</span><br>
                            </div>
                            <div class="col-xs-6 col-md-6">
                            <font face="Comic Sans MS"><label>Tipo de pago:</label></font>
                            <select type="text" id="tipo" name="tipo"  required="required">
                                <option value="">Selecionar ...</option>
                                <option value="Tarjeta Credito">Tarjeta Credito</option> 
                                <option value="Tarjeta Debito">Tarjeta Débito</option>
                            </select>
                            </div>
                            <div class="col-xs-6 col-md-6">
                            <font face="Comic Sans MS"><label>Número del Títular:</label></font>
                            <input type="text" id="nombre" name="nombre" placeholder="Nombre">
                            </div>
                             <div class="col-xs-4 col-md-4">
                            <font face="Comic Sans MS"><label>Número de tarjeta:</label></font>
                            <input type="number" id="tarjeta" name="tarjeta" onkeypress="return SoloNumeros(event)" placeholder="0000 0000 0000 0000">
                            </div>
                             <div class="col-xs-4 col-md-4">
                            <font face="Comic Sans MS"><label>Fecha de expiración</label></font>
                            <input type="date" id="fecha" name="fecha" placeholder="Descripcion">
                            </div>
                             <div class="col-xs-4 col-md-4">
                            <font face="Comic Sans MS"><label>CVC:</label></font>
                            <input type="number" id="numero" name="cvc"  name="cvc" onkeypress="return SoloNumeros(event)" placeholder="CVC">
                            </div>
                            <div class="col-xs-12 col-md-12">
                                <center><button type="submit" style="background-color:#045FB4" name="registrar" class="btn btn-primary">Registrar</button></center>
                            </div>
                            </div>
                        </form>
                    </div>
                </div>                    
             </div>  
       </div>
        
    </body>
</html>
