<%@page import="java.sql.ResultSet"%>
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
<html>
    <head>
        <title>Historial de salidas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../css/estilosMax.css" rel="stylesheet" type="text/CSS">
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/tablacliente.css">
        <script src="../js/validaciones.js"></script>
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

            function InsertarSal() {
                alert("Se han insertado los datos correctamente");
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
                    <div  class="row">
                        <table  border="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <br>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-center" colspan="2">
                                        <label class="form-check-label col-lg-6 col-md-6 col-sm-8 col-xs-6"> Consultar registro por id de producto:</label>
                                    </td>
                                </tr>
                                <tr>
                            <form action="../Inventario/SalidasporOrd.jsp" method="GET">
                                <td>
                                    <input class="form-control" type="text" name="id_producto" id="id_producto" placeholder="ID de Producto" required="required" pattern="[0-9]{13}" maxlength="13" title="El id de producto debe ser de 13 digitos (n&uacute;meros)"/>
                                </td>
                                <td>
                                    <input type="submit" name="BuscaM" id="BuscaM"  class="btn btn-secondary form-control" value="Consultar" style="width: 100%;"/>
                                </td>
                            </form>
                            </tr>

                            <tr>
                                <td colspan="2">
                                    <br>
                                </td>
                            </tr>


                            <tr>
                                <td class="text-center" colspan="2">
                                    <label class="form-check-label col-lg-6 col-md-6 col-sm-8 col-xs-6"> Consulta registro por orden de venta:</label>
                                </td>
                            </tr>
                            <tr>
                            <form action="../Inventario/SalidasporOrd.jsp" method="GET">
                                <td>
                                    <input class="form-control" type="text" name="id_venta" id="id_venta" placeholder="Orden de venta" maxlength="7" pattern="[0-9]{7}" title="El id de orden de venta debe ser de 7 digitos (n&uacute;meros)" required/>
                                </td>
                                <td>
                                    <input type="submit" name="Busca" id="BuscaM" class="btn btn-secondary form-control" value="Consultar" style="width: 100%;"/>
                                </td>
                            </form>
                            </tr>


                            <tr>
                                <td colspan="2">
                                    <br>
                                </td>
                            </tr>
                            <tr>
                            <form  action="../Inventario/salidas.jsp" method="POST">
                                <td>
                                    <label style="margin-left: 20px; width: 90%;" class="form-check-label" >Consulta General:</label>
                                </td>
                                <td>  
                                    <input type="submit" name="ConsultaInG" class="btn btn-secondary form-control" value="Consultar" style="width: 100%;">
                                </td>
                            </form>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br>
                                </td>
                            </tr>
                            <tr>
                            <form  method="POST" action="../../reporte_salidas">
                                <td>
                                    <label style="margin-left: 20px; width: 90%;"  class="form-check-label">Generar Reporte</label>
                                </td>
                                <td> 
                                    <input class="btn btn-secondary form-control" type="submit" value="PDF" name="GP" style="width: 100%;" >
                                </td>
                            </form>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 container-fluid"><!-- Seccion derecha (Visualizar tarea) -->
                    <div class="row">
                        <p style="padding: 10px 10px"><span style="margin-right: 10px;"><img border="0" height="50" width="50" src="../../archivos/img/ic_salidas.png" /></span>Salidas</p>
                    </div>
                    <div class="row justify-content-center" style="background-color: #f8f8f8; margin-left: 10%; margin-right: 10%;" >
                        <h2 class="titulos text-center" style="width: 100%;">Salidas</h2>  
                        <br>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">ID Producto</th>
                                        <th scope="col">ID Orden de venta</th>
                                        <th scope="col">Cantidad vendida</th>
                                        <th scope="col">Monto total</th>
                                        <th scope="col">Fecha de salida</th>

                                    </tr>
                                </thead>
                                <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Inventarios.QuerysInventarios"/>
                                <%
                                    ResultSet rsTabla = interTabla.Consultasalidas();

                                %> 
                                <tbody>
                                    <%                                            while (rsTabla.next()) {
                                    %>
                                    <tr id="modalInter">
                                        <td><%=rsTabla.getString(1)%></td>
                                        <td><%=rsTabla.getString(2)%></td>
                                        <td><%=rsTabla.getString(3)%></td>
                                        <td><%=rsTabla.getString(4)%></td>
                                        <td><%=rsTabla.getString(5)%></td>


                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div> 
                    </div>
                </div>
            </div>
        </div>


        <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
