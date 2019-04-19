<%@page import="pw.sap.servlets.Ventas.reporte"%>
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
<html>
    <head>
        <title>Ventas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/VenEstilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/VenLaterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/VenTablacliente.css">
        <link href="../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/> 
        
        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" integrity="sha256-CfcERD4Ov4+lKbWbYqXD6aFM9M51gN4GUEtDhkWABMo=" crossorigin="anonymous"></script>
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
                            <a href="clientes.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_cliente.png" /><p>Clientes</p></a>
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
                            <a href="#" class="nav-link dropdown-toggle" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_reportes.png" />Reportes</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="RVentasF.jsp" style="color: white">Reporte de ventas</a>
                                <a class="dropdown-item" href="RFacturas.jsp" style="color: white">Facturas</a>
                                <a class="dropdown-item" href="verCotizaciones.jsp" style="color: white">Cotizaciones archivadas</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="Cobros.jsp" class="nav-link" style="color: white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_cobros.png" /><p>Cobros</p></a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <select class="form-control" id="tipoBusqueda">
                            <optgroup label="Elige tipo">
                                <option value="select">Selecciona</option>
                                <option value="id">Por ID</option>
                                <option value="nombre">Por nombre del producto</option>
                                <option value="codigo">Por codigo de barras</option>
                                <option value="cliente">Por Cliente</option>
                                <option value="provee">Por proveedor</option> 
                            </optgroup>
                        </select>&nbsp;&nbsp;
                        <input class="form-control mr-sm-2" type="search" placeholder="Buscar" id="busc" aria-label="Search">
                        <button class="btn btn-outline-dark" style="color: white" onclick="buscar()" type="submit">Buscar</button>

                    </form>
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
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion izquierda -->


                    <div class="form-style-5">
                        <form  name="reporte" action="/SAP_PW/pdf">

                            <span id="titulo"><span class="number">1</span>Reporte</span><br><br>
                            <span style="font-size: 18px">Fecha de inicio</span><br><span class="idemp">
                                <input style="width: 180px; height: 30px;text-align: center;"  type="date" min="2017-01-01" id="fecha1" name="fechaIn" /></span><br>

                            <span style="font-size: 18px">Fecha de termino</span><br><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" id="fecha2" name="fechaTerm" /></span>  <br><br>

                            <script>
                            document.getElementById('fecha2').value = new Date().toISOString().substring(0, 10);
                            </script>                                

                            <center>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report1" value="todasV" checked>
                                    <label style="font-size: 18px" class="form-check-label" for="report1">
                                        Todas las ventas
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report2" value="proveedorV">
                                    <label style="font-size: 18px" class="form-check-label" for="report2">
                                        Ventas por proveedor
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report3" value="productoV" >
                                    <label style="font-size: 18px" class="form-check-label" for="report3">
                                        Ventas por producto
                                    </label>
                                </div>     
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report4" value="clienteV" >
                                    <label style="font-size: 18px" class="form-check-label" for="report4">
                                        Ventas por cliente
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report5" value="masV">
                                    <label style="font-size: 18px" class="form-check-label" for="report5">
                                        M&aacute;s vendidos
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report6" value="menosV" >
                                    <label style="font-size: 18px" class="form-check-label" for="report6">
                                        Menos vendidos
                                    </label>
                                </div>     
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report7" value="vendedorV">
                                    <label style="font-size: 18px" class="form-check-label" for="report7">
                                        Ventas por vendedor
                                    </label>
                                </div> <br>

                                <button type="button" name="cargaReport" style="background-color: #9F150D" id="btnReporte" onclick="validaFechasReportes()" class="btn btn-danger">Cargar reporte</button><br>
                                <br><button type="submit" value="Visualizar PDF" name="btnver" onsubmit="return InsertarEnt()" style="background-color: #9F150D" id="btnImprimir" onclick="validaFechasReportes()" class="btn btn-danger">Imprimir reporte</button><br>
                                <br><button type="button" name="mandaCorreoReport" style="background-color: #9F150D" id="btnMail" onclick="validaFechasReportes()" class="btn btn-danger">Mandar reporte por correo</button>
                            </center>
                        </form>
                    </div>

                </div>

 <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12"><!-- Seccion central TABLA -->
      <form method="POST" action="../../ReportesExcell" target="">
                    <div class="table-responsive">
                        <table class="table table-striped"> 
                                    <thead>
                                        <tr>
                                            <th scope="col">id_venta</th>
                                            <th scope="col">C&oacute;digo</th>
                                            <th scope="col">Producto</th>
                                            <th scope="col">IdCliente</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">RfcProveedor</th>
                                            <th scope="col">Precio unitario</th>
                                            <th scope="col">IVA</th>
                                            <th scope="col">Subtotal</th>
                                        </tr>
                                    </thead>
                                       <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Ventas.QuerysVentas"/>
                                    <%
                                        ResultSet rsTabla = interTabla.consultaProducto();
                                    %> 
                                    <tbody>
                                        <%
                                            while (rsTabla.next()) {
                                        %>
                                        <tr id="modalInter">
            
                                              <td><%=rsTabla.getString(1)%></td>
                                    <td><%=rsTabla.getString(2)%></td>
                                    <td><%=rsTabla.getString(3)%></td>
                                    <td><%=rsTabla.getString(4)%></td>
                                    <td><%=rsTabla.getString(5)%></td>
                                    <td><%=rsTabla.getString(6)%></td>
                                      <td><%=rsTabla.getString(7)%></td>
                                    <td><%=rsTabla.getString(8)%></td>
                                    <td><%=rsTabla.getString(9)%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table></div>  
                                    <br>
                                    
                        </form>  
 </div>
                    </div>    
                                    
                                   

            </div>

        </div>         

        <div id="tmpModal"></div> 



        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../js/Ventas/VenValidaciones.js"></script>
        <script src="../js/Ventas/muestraModales.js"></script>
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
