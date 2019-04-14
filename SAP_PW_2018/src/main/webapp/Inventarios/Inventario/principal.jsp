<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getSession().getAttribute("usuario") == null) {
        response.sendRedirect("../../archivos/sesion/errorSesion.jsp");
    } else {
        if (!request.getSession().getAttribute("area").equals("Inventarios") && !request.getSession().getAttribute("area").equals("Gerencia")) {
            response.sendRedirect("../../archivos/errorSesion.jsp");
        }
    }
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Principal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" integrity="sha256-CfcERD4Ov4+lKbWbYqXD6aFM9M51gN4GUEtDhkWABMo=" crossorigin="anonymous"></script>
        <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>  
        <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>  
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../css/estilosMax.css" rel="stylesheet" type="text/CSS">
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/tablacliente.css">
        <script src="../js/general.js"></script>
        <script>
            function fecha() {
                var valor = document.getElementById('fecha');
                var fecha = new Date();
                var dia;
                var mes;
                if (fecha.getDate() < 10) {
                    dia = '0' + fecha.getDate();
                } else {
                    dia = fecha.getDate();
                }
                if (fecha.getMonth() + 1 < 10) {
                    mes = '0' + (fecha.getMonth() + 1);
                } else {
                    mes = fecha.getMonth() + 1;
                }
                valor.value = (dia + '/' + mes + '/' + fecha.getFullYear());
                document.getElementById('fecha').innerHTML = valor.value;
            }
        </script>

    </head>
    <body onload="fecha();">

        <header class="sticky-top">
            <!--barra de navegacion creada con bootstrap-->
            <nav id="barraNavegadora" class="navbar navbar-expand-lg colorPrincipal" >
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav mr-auto">                    
                        <li class="nav-item">
                            <a href="principal.jsp" class="nav-link text-white"  aria-haspopup="true" aria-expanded="false"><h4>Modulo<br>Inventario</h4></a>
                        </li>
                        <li class="nav-item">
                            <a href="principal.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_inicio.png" /><p>Inicio</p></a>
                        </li>
                        <li class="nav-item">
                            <a href="inventario_g.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_productos.png" /><p>Inventario</p></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link text-white"  data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false"><img class="ic"  border="0" height="25" width="25" src="../../archivos/img/ic_problema.png" /><p class="dropdown-toggle">Problemas de Producto</p></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="merma.jsp" style="color: white;">Merma</a><span class="sr-only"></span>
                                <a class="dropdown-item" href="Producto_Re.jsp" style="color: white;">Devoluciones</a><span class="sr-only">(current)</span>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link text-white" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_recibe.png" /><p class="dropdown-toggle">Recepci&oacute;n de productos</p></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="entradas.jsp" style="color: white;">Historial de Entradas</a>
                                <a class="dropdown-item" href="salidas.jsp" style="color: white;">Historial de Salidas</a>
                            </div>
                        </li>
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

        <div id="principal">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 container-fluid" style="background-color: #f8f8f8;" ><!-- Seccion central (Visualizar tarea) -->

                    <div  class="row" style="height: 200px;">    
                        <img class="imagen" border="0" height="auto" width="50%" src="../../archivos/img/img_logo_2.png" />
                    </div>
                    <div class="row" style="margin-left: 5%; margin-right: 5%;">
                        <input class="text-center form-control" type="text" id="fecha" size="6"  style="width:100%;" disabled>
                    </div>
                    <div  class="row" style="margin-left: 5%; margin-right: 5%;">
                        <div class="row"> 
                            <br>
                        </div>
                        <div class="row">
                            <label class="form-check-label col-lg-8 col-md-8 col-sm-8 col-xs-8">Total de productos:</label>
                            <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text"   name="TotalPro" id="TotalPro" placeholder="12500" disabled="disable" style="width: 100%;"> 
                        </div>
                        <div class="row"> 
                            <br>
                        </div>
                        <div class="row">
                            <label class="form-check-label col-lg-8 col-md-8 col-sm-8 col-xs-8">Porcentaje de Merma:</label> 
                            <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text" disabled="disable" placeholder="30%" name="PorcenProP" id="PorcenMerm" style="width: 100%;">
                        </div>
                        <div class="row"> 
                            <br>
                        </div>
                        <div class="row">
                             <label class="form-check-label col-lg-8 col-md-8 col-sm-8 col-xs-8"> Porcentaje de Devoluciones:</label>
                             <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text" disabled="disable" placeholder="20%" name="PorcenProP" id="PorcenDevo" style="width: 100%;"> 
                        </div>
                        <div class="row"> 
                            <br>
                        </div>
                        <div class="row">
                          <label class="form-check-label col-lg-8 col-md-8 col-sm-8 col-xs-8">Porcentaje de compra de producto:</label> 
                          <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text" disabled="disable" placeholder="30%" name="PorcenComP" id="PorcenComP" style="width: 100%;">     
                        </div>
                        <div class="row"> 
                            <br>
                        </div>
                        <div class="row">
                           <label class="form-check-label col-lg-8 col-md-8 col-sm-8 col-xs-8">Porcentaje de venta de producto:</label>
                           <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text" disabled="disable" placeholder="20%" name="PorcenVenP" id="PorcenVenP" style="width: 100%;">    
                        </div>
                        <div class="row"> 
                            <br>
                        </div>
                    </div>
                    <br>
                </div>
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 container-fluid"><!-- Seccion derecha (Visualizar tarea) -->
                    <div class="row">
                        <p style="padding: 10px 10px"><span style="margin-right: 10px;"><img border="0" height="50" width="50" src="../../archivos/img/ic_inicio_grande.png" /></span>Inicio</p>
                    </div>
                    <div class="row justify-content-center" style="background-color: #f8f8f8; margin-left: 10%; margin-right: 10%;" >
                        <h2 class="titulos text-center" style="width: 100%;">Estadísticas </h2>  
                        <br>
                        <canvas id="gInventarios" width="100%" height="30px"></canvas>
                        <br>
                        <script type="text/javascript" src="../graficas/graficaInventarios.js"></script>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
