<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Compras")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../../archivos/errorSesion.jsp");
        }
    }
%>
<html>
    <head>
        <title>Principal</title>
        <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" integrity="sha256-CfcERD4Ov4+lKbWbYqXD6aFM9M51gN4GUEtDhkWABMo=" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/tablacliente.css">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>        
        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>       
        <link href="../../css/estilosMax.css" rel="stylesheet" type="text/CSS">

        <script src="../js/validaciones.js"></script>
        
        </head>
    <body onload="fecha();">
        <!-- BARRA NAVEGACIÓN-->
        <header class="sticky-top">
            <!--barra de navegacion creada con bootstrap-->
            <nav id="barraNavegadora" class="navbar navbar-expand-lg colorPrincipal">
                
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        
                        <li class="nav-item">
                            <a href="principalCompras.jsp" class="nav-link text-white"  aria-haspopup="true" aria-expanded="false"><h4>Modulo<br>Compras</h4></a>
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link text-white"  data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false"><img class="ic"  border="0" height="25" width="25" src="../../archivos/img/producto.png" /><p class="dropdown-toggle">Productos</p></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="com_index.jsp" style="color: white;">Productos</a><span class="sr-only"></span>
                                <a class="dropdown-item" href="com_Cotizaciones.jsp" style="color: white;">Cotizaciones</a><span class="sr-only"></span>
                                <a class="dropdown-item" href="com_Cat.jsp" style="color: white;">Categorias</a><span class="sr-only">(current)</span>
                            </div>
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link text-white"  data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false"><img class="ic"  border="0" height="25" width="25" src="../../archivos/img/proveedor.png" /><p class="dropdown-toggle">Proveedores</p></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="com_proveedor.jsp" style="color: white;">Proveedores</a><span class="sr-only"></span>
                                <a class="dropdown-item" href="com_Contratos.jsp" style="color: white;">Contratos</a><span class="sr-only"></span>
                            </div>
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link text-white"  data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false"><img class="ic"  border="0" height="25" width="25" src="../../archivos/img/ordenCompra.png" /><p class="dropdown-toggle">Orden de Compra</p></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="CompraOrden.jsp" style="color: white;">Orden de compra</a><span class="sr-only"></span>
                                <a class="dropdown-item" href="com_CancelarOC.jsp" style="color: white;">Cancelación Orden</a><span class="sr-only">(current)</span>
                            </div>
                        </li>
                        
                        <li class="nav-item">
                            <a href="com_facturas.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/factura.png" /><p>Facturas</p></a>                        </li>
                    </ul>
                </div>
                
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="ayuda.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_ayuda.png" /><p>Ayuda(?)</p></a>                       
                    </li>
                    <li class="nav-item">
                        <a href="../../CerrarSesion" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_salir.png" /><p>Salir</p></a>                       
                    </li>
                </ul>
                
            </nav>
        </header>
        
        <!-- CONTENIDO-->   
        <div class="container-fluid contenido">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion izquierda -->


                    <div class="form-style-5">
                        <form>
                            <span id="titulo"><span class="number">1</span>Facturas</span><br><br>

                            <span style="font-size: 18px">Fecha de inicio</span><br><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" min="2017-01-01" type="date" id="fecha1" name="fechaIn" /></span><br>

                            <span style="font-size: 18px">Fecha de termino</span><br><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" id="fecha2" name="fechaTerm" /></span><br><br>

                            <script>
                            document.getElementById('fecha2').value = new Date().toISOString().substring(0, 10);
                            </script>                               

                            <center>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportFacturas" id="report1" value="todasFactura" checked >
                                    <label style="font-size: 18px" class="form-check-label" for="report1">
                                        Todas las facturas
                                    </label>
                                </div>     
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportFacturas" id="report2" value="clientesFac">
                                    <label style="font-size: 18px" class="form-check-label" for="report2">
                                        Facturas por clientes
                                    </label>
                                </div> <br>

                                <button type="button" name="cargaFacturas" style="background-color: #3498DB" onclick="validaFechasReportes()" class="btn ">Cargar reporte</button>
                            </center>
                        </form>
                    </div>

                </div>


                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12"><!-- Seccion central TABLA -->
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">Folio de factura</th>
                                    <th scope="col">Fecha de expedici&oacute;n</th>
                                    <th scope="col">Cliente</th>
                                    <th scope="col">RFC de cliente</th>
                                    <th scope="col">Domicilio</th>
                                    <th scope="col">Forma de pago</th>
                                    <th scope="col">Subtotal</th>
                                    <th scope="col">IVA</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr onclick="window.location = 'EjemploFactura.pdf'">
                                    <td>fac42576</td>
                                    <td>22/Marzo/2018</td>
                                    <td>ITTOL</td>
                                    <td>ITTOL7507241H0</td>
                                    <td>Av. Tecnol&oacute;gico, S/N</td>
                                    <td>Pago en una sola exhibici&oacute;n</td>
                                    <td>$290,500.00</td>
                                    <td>$8,360.00</td>
                                    <td>$298,860.00</td>
                                </tr>
                            </tbody>
                        </table>
                    </div> 

                </div>

            </div>

        </div> 
        
        
        
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body> 
</html>