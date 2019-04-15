<%-- 
    Document   : merma1
    Created on : 28/05/2018, 02:13:13 AM
    Author     : montse
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="pw.sap.db.ConsultasGenerales"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="pw.sap.db.Conexion"%>
<%@page import="pw.sap.pojo.Inventarios.Merma"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Merma conocida</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/estilosMax.css" rel="stylesheet" type="text/CSS">
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/tablacliente.css">


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


            function EspecificaMC() {
                var coba = document.getElementById('CoBa');
                var IDMerma = document.getElementById('IDMerma');
                if (coba.length === 0 && IDMerma.length === 0) {
                    alert("Consulta vacia");
                } else {
                    alert("Consultando");
                }
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
                                        <label class="form-check-label col-lg-6 col-md-6 col-sm-8 col-xs-6">Consulta:</label>
                                    </td>
                                </tr>
                                <tr>
                            <form  action="../Inventario/merma_con.jsp" method="GET">
                                <td>
                                    <input class="form-control" style="margin-left: 20px; width: 90%;"  type="text" name="id_merma" id="id_merma" placeholder="Id de Merma"  maxlength="7" title="El id debe ser de 7 digitos (n&uacute;meros )" required >
                                </td>
                                <td>
                                    <input type="submit" name="BuscaMID"  class="btn btn-secondary mx-auto" value="Consultar" onclick="return fomCon()"/>
                                </td>
                            </form>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br>
                                </td>
                            </tr>
                            <tr>
                            <form  action="../Inventario/merma1.jsp"  method="POST">
                                <td>
                                    <label style="margin-left: 20px; width: 90%;" class="form-check-label" >Consulta General:</label>
                                </td>
                                <td>  
                                    <input type="submit" name="ConsultaInG"  class="btn btn-secondary mx-auto" value="Consultar">
                                </td>
                            </form>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label style="margin-left: 20px; width: 90%;" class="form-check-label">Consulta Especifica:</label>
                                </td>
                                <td>
                                    <button type="button" name="ConMC" data-toggle="modal" data-target="#ConsultaMC"  class="btn btn-secondary mx-auto">Consulta</button>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br>
                                </td>
                            </tr>
                            <tr>
                            <form  method="POST" action="../Inventario/merma_con.jsp">
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
                        <p style="padding: 10px 10px"><span style="margin-right: 10px;"><img border="0" height="50" width="50" src="../../archivos/img/ic_merma.png" /></span>Merma</p>
                    </div>
                    <div class="row justify-content-center" style="background-color: #f8f8f8; margin-left: 10%; margin-right: 10%;" >
                        <h2 class="titulos text-center" style="width: 100%;">Merma conocida</h2>  
                        <br>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">ID Producto</th>
                                        <th scope="col">ID de merma</th>
                                        <th scope="col">Fecha de registro</th>
                                        <th scope="col">Tipo</th>
                                        <th scope="col">Cantidad</th>
                                        <th scope="col">Observaciones</th>

                                    </tr>
                                </thead>
                                <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Inventarios.QuerysInventarios"/>
                                <%
                                    ResultSet rsTabla = interTabla.ConsultaGM();

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
                                        <td><%=rsTabla.getString(6)%></td>


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

        <!-- Modal Consulta especifica-->
        <div class="modal fade" id="ConsultaMC" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Consulta Espec&iacute;fica</h4>
                    </div>
                    <div class="modal-body">
                        <div style="background: #f8f8f8;">
                            <form style="margin-left: 15px; margin-right: 15px;" method="GET" action="../Inventarios/merma_con.jsp" onsubmit="return EspecificaMC()">
                                <h2 class="text-center" style="width: 100%;">Ingrese los datos a consultar</h2> 
                                <table border="0" cellspacing="0">
                                    <tbody>
                                    <td colspan="2">
                                        <br>
                                    </td>
                                    <tr>
                                        <td>Id de producto:</td>
                                        <td>
                                            <input class="form-control" style="width: 190px; height: 30px;text-align: center;" type="text" name="CoBa" id="CoBa" maxlength="13" placeholder="#######" pattern="[0-9]{13}" title="El id de producto debe ser de 13 digitos (n&uacute;meros)" required/>
                                        </td>
                                    </tr>
                                    <td colspan="2">
                                        <br>
                                    </td>
                                    <tr>
                                        <td>Fecha de merma:</td>
                                        <td>
                                            <input class="form-control" type="date" name="fecha_mer" id="fecha_mer"/>
                                        </td>
                                    </tr>
                                    <td colspan="2">
                                        <br>
                                    </td>
                                    <tr>
                                        <td>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                        </td>
                                        <td>
                                            <input type="submit" class="btn btn-secondary form-control mx-auto" value="Continuar" id="BuscaEs" onsubmit="return EspecificaMC()">
                                        </td>
                                    </tr>
                                    <td colspan="2">
                                        <br>
                                    </td>
                                    </tbody>
                                </table>
                            </form>
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

