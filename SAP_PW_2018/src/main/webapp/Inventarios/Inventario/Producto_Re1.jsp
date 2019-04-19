<%-- 
    Document   : Producto_Re1
    Created on : 28/05/2018, 10:22:19 PM
    Author     : montse
--%>

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
        <title>Devoluciones</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/estilosMax.css" rel="stylesheet" type="text/CSS">
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/tablacliente.css">
        <script src="../js/general.js" type="text/javascript"></script>
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
            function InsertarDev() {
                alert("Se han insertado los datos correctamente");
            }
            function ModificarDev() {
                alert("Se han modificado los datos correctamente");
            }
            function EliminarDev() {
                alert("Se han eliminado los datos correctamente");
            }
            function EspecificaDev() {
                var coba = document.getElementById('CoBa');
                var IDDevolucion = document.getElementById('IDDevolucion');
                var IDOrdenCom = document.getElementById('IDOrdenCom');
                if (coba.length === 0 && IDDevolucion.length === 0 && IDOrdenCom.length === 0) {
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
                                        <label class="form-check-label col-lg-6 col-md-6 col-sm-8 col-xs-6">Consultar registro:</label>
                                    </td>
                                </tr>
                                <tr>
                            <form  action="../Inventario/Producto_Re.jsp" method="GET">
                                <td>
                                    <input class="form-control" type="text" name="id_devoluciones" id="id_devoluciones" placeholder="ID de Devoluci&oacute;n" required="required" maxlength="7" pattern="[0-9]{7}"title="El ide de producto debe ser de 7 digitos numericos"/>
                                </td>
                                <td>
                                    <input class="btn btn-secondary mx-auto" type="submit" name="BuscaM" id="BuscaM" class="btn btn-danger" value="Consultar"/>
                                </td>
                            </form>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br>
                                </td>
                            </tr>
                            <tr>
                            <form  action="../Inventario/Producto_Re1.jsp" method="POST">
                                <td>
                                    <label style="margin-left: 20px; width: 90%;" class="form-check-label" >Consulta General:</label>
                                </td>
                                <td>  
                                    <input type="submit" name="ConsultaInG" class="btn btn-secondary mx-auto" value="Consultar">
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
                                    <button type="button" name="ConEs" data-toggle="modal" data-target="#ConsultaEsp" class="btn btn-secondary mx-auto">Consultar</button>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br>
                                </td>
                            </tr>

                            <tr>
                                <td class="text-center" colspan="2">
                                    <label class="form-check-label col-lg-6 col-md-6 col-sm-8 col-xs-6">Eliminar registro:</label>
                                </td>
                            </tr>
                            <tr>
                            <form  action="../../Eliminar_Devolucion" method="POST" onsubmit="return EliminarDev()">
                                <td>
                                    <input class="form-control" type="text" name="id_devolucion" id="id_devolucion" placeholder="ID de Devoluci&oacute;n" pattern="[0-9]{7}" maxlength="7" required="required" title="El id de devoluci&oacute;n debe ser de 7 digitos numericos)"/>
                                </td>
                                <td>
                                    <input type="submit" name="EliminaM" id="EliminaM" class="btn btn-secondary mx-auto" value="Eliminar" onsubmit="return EliminaDev()" style="width: 100%;" />
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
                                    <label style="margin-left: 20px; width: 90%;" class="form-check-label">Registro de producto rechazado:</label>
                                </td>
                                <td>
                                    <button type="button" name="agregaProd" data-toggle="modal" data-target="#agregaProductos" class="btn btn-secondary mx-auto" style="width: 100%;" >Agregar</button>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br>
                                </td>
                            </tr>

                            <tr>
                            <form  method="POST" action="../Inventario/Producto_Re.jsp">
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
                        <p style="padding: 10px 10px"><span style="margin-right: 10px;"><img border="0" height="50" width="50" src="../../archivos/img/ic_devoluciones.png" /></span>Devoluciones</p>
                    </div>
                    <div class="row justify-content-center" style="background-color: #f8f8f8; margin-left: 10%; margin-right: 10%;" >
                        <h2 class="titulos text-center" style="width: 100%;">Devoluciones</h2>  
                        <br>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">ID Devoluci&oacute;n</th>
                                        <th scope="col">ID Compra</th>
                                        <th scope="col">Cantidad devuelta</th>
                                        <th scope="col">Fecha de devoluci&oacute;n</th>
                                        <th scope="col">Motivo</th>
                                        <th scope="col">ID de producto</th>

                                    </tr>
                                </thead>
                                <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Inventarios.QuerysInventarios"/>
                                <%
                                    ResultSet rsTabla = interTabla.ConsultaDev();

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

        <!-- Modal AGREGAR PRODUCTOS-->
        <div class="modal fade" id="agregaProductos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Agregar producto</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form method="POST" action="../../insertar_devolucion" onsubmit="return InsertarDev()">
                                <span id="titulo"><span class="number">1</span>Inserte el id de compra (Nota: el id debe existir)</span><br>
                                <span>Id de compra:&nbsp;&nbsp;</span><span><input  type="text" name="id_compra" id="id_compra" placeholder="##########" maxlength="7" pattern="[0-9]{7}" title="El id de compra debe ser de 7 digitos numericos" required="required"/></span>
                                <span id="titulo"><span class="number">2</span>Inserte Datos</span><br>
                                <span>Id de devolucion:&nbsp;&nbsp;</span><span><input  type="text" name="id_devolucion" id="id_devolucion" placeholder="##########" maxlength="7" pattern="[0-9]{7}" title="El id de devolucion debe ser de 7 digitos numericos" required="required"/></span>
                                <span >Cantidad devuelta:&nbsp;&nbsp;</span><span><input type="number" name="cant_dev" id="cant_dev" placeholder="1" min="1" max="999999999" pattern="[0-9]{1,999999999}" title="La cantidad devuelta debe contener almenos 1 producto (campo n&uacute;merico)" required="required"/></span>
                                <span >Fecha de devoluci&oacute;n:&nbsp;&nbsp;</span><span><input type="text" id="fecha_dev" name="fecha_dev" disabled="disabled"/></span>
                                <span >Motivo:&nbsp;&nbsp;</span><span><input type="text" name="motivo_dev" id="motivo_dev" placeholder="Descripci&oacute;n" required="required" maxlength="150"  title="El motivo debe contener de 1 a 150 car&aacute;cteres (n&uacute;meros y letras))"/></span>
                                <br><br><button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" value="Agregar" style="background-color: #9F150D" class="btn btn-danger" onsubmit="return InsertarDev() location.href = 'Producto_Re.jsp'"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Busqueda Especifica-->
        <div class="modal fade" id="ConsultaEsp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Consulta Espec&iacute;fica</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form method="GET" action="../Inventario/Producto_Re.jsp" onsubmit="return EspecificaDev()">
                                <span id="titulo"><span class="number">1</span>Elige e ingresa los datos de los registros que desea consultar</span>


                                <br><br><span>ID de producto:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text" name="id_productos" id="id_productos" placeholder="##########" maxlength="13" pattern="[0-9]{13}" title="El id de producto debe ser de 13 digitos numericos" ></span>
                                <br><br><span>ID de orden de compra:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text" name="id_compras" id="id_compras" placeholder="##########" maxlength="7" pattern="[0-9]{7}" title="El id de orden de compra debe ser de 7 digitos numericos" ></span>
                                <br><br><button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" style="background-color: #9F150D" class="btn btn-danger" value="Continuar" id="BuscaEs"><br>
                            </form>
                        </div>
                    </div></div>
            </div>
        </div>


        <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
