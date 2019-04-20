
<%@page import="pw.sap.pojo.Ventas.QuerysVentas"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Ventas")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../archivos/errorSesion.jsp");
        }
    }
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
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" aria-haspopup="true" aria-expanded="false" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"><img class="ic" border="dropdown-toggle0" height="25" width="25" src="../archivos/img/ic_ordenventa.png"/>Orden de venta</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="Ordenventa.jsp" style="color: white">Agregar Orden</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_reportes.png" />Reporte</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="AgregarFactura.jsp" style="color: white">Factura</a>
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
            <!-- Seccion izquierda -->	    
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                    <div class="form-style-5">
                        <form onsubmit="return validaRegistraCliente();" action="../Clientes" method="POST">

                            <span id="titulo"><span class="number" style="background-color:#045FB4">1</span>Registra cliente</span><br>
                            <br><input type="text" onkeypress="return soloLetras(event)" id="nomCli" name="nomCli" placeholder="Nombre del cliente">
                            <input type="text" id="direc" name="direc" placeholder="Dirección">
                            <input type="text" onkeypress="return SoloNumeros(event)" id="cp" name="cp" placeholder="C&oacute;digo postal">
                            <input type="text" id="email" name="email" placeholder="Email">
                            <select type="text" id="estatus" name="estatus" placeholder="Estatus">
                                <option value="">Selecionar Estatus...</option>
                                <option value="Activo">Activo</option> 
                                <option value="No activo">No activo</option>
                            </select>
                            <center><button type="submit" style="background-color:#045FB4" name="registrar" class="btn btn-primary">Registrar</button></center>
                        </form>
                    </div>
                </div>

                <!-- Seccion central TABLA -->
                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                    <div class="table-responsive">
                         <center><h2>Clientes Registrados</h2></center>
                        <br>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID_Cliente</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Dirección</th>
                                    <th scope="col">C.P</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Estatus</th>
                                </tr>
                            </thead>
                            <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Ventas.QuerysVentas"/>
                            <%
                                ResultSet rsTabla = interTabla.tablaCliente(); 

                            %> 
                            <tbody>
                                    <%
                                        while(rsTabla.next()){
                                    %>
                                <tr id="modalInter">
                                    <td><%=rsTabla.getString(1)%></td>
                                    <td><%=rsTabla.getString(2)%></td>
                                    <td><%=rsTabla.getString(3)%></td>
                                    <td><%=rsTabla.getString(4)%></td>
                                    <td><%=rsTabla.getString(5)%></td>
                                    <td><%=rsTabla.getString(6)%></td>
                                </tr>
                                    <%
                                        }
                                    %>
                            </tbody>
                        </table>
                    </div> 

                </div>
                            
                <!-- Seccion derecha -->
                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                    <div class="form-style-5">
                        <span id="titulo"><span class="number" style="background-color:#045FB4">2</span>Modificar Cliente</span>
                        <br>
                            <center>
                                <form method="POST" action="../BuscarIDcliente" autocomplete="off">
                                    <br>
                                    <input type="number" id="IDcli" name="IDcli" class="form-control form-control-sm" placeholder="ID del cliente" required="required"/>
                                    <center><button type="submit" style="background-color:#045FB4" name="buscar" action="../BuscarIDcliente" class="btn btn-primary">Buscar</button></center>
                                </form>
                            </center>
                    </div>
                   

                </div>
                
                
            </div>

        </div>
</body>
</html>
