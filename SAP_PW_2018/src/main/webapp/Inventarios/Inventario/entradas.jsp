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
        <title>Historial de Entradas</title>
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
            function InsertarEnt() {
                var fechaEnt = document.getElementById('fechaEnt');
                var fechaCad = document.getElementById('fechaCad');
                if (fechaEnt < fechaCad) {
                    alert("Fecha de caducidad debe ser mayor que la de entrada");
                } else {
                    alert("Se han insertado los datos correctamente");
                }
            }

            function EspecificaEnt() {
                var coba = document.getElementById('CoBa');
                var IDEnt = document.getElementById('IDEnt');
                var IDOrdenCom = document.getElementById('IDOrdenCom');
                var TipoPro = document.getElementById('TipoPro');
                if (coba.length === 0 && IDEnt.length === 0 && IDOrdenCom.length === 0 && TipoPro.length === 0) {
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
                                        <label class="form-check-label col-lg-6 col-md-6 col-sm-8 col-xs-6">Ingresar lote:</label>
                                    </td>
                                </tr>
                                <tr>
                            <form action="../../ingresarEntrada" method="POST">
                                <td>
                                    <input type="text" name="no_lote" id="no_lote" placeholder="N&uacute;mero de compra" required="required" pattern="[0-9]{7}" maxlength="7" title="El n&uacute;mero de lote debe ser de 7 digitos (n&uacute;meros)" class="form-control" />
                                </td>
                                <td>
                                    <input type="submit" name="BuscaM" id="BuscaM" class="btn btn-secondary form-control" value="Ingresar" style="width: 100%;"/>
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
                        <p style="padding: 10px 10px"><span style="margin-right: 10px;"><img border="0" height="50" width="50" src="../../archivos/img/ic_entrada.png" /></span>Entradas</p>
                    </div>
                    <div class="row justify-content-center" style="background-color: #f8f8f8; margin-left: 10%; margin-right: 10%;" >
                        <h2 class="titulos text-center" style="width: 100%;">Entradas</h2>  
                        <br>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Orden de compra</th>
                                        <th scope="col">Proveedor</th>
                                        <th scope="col">Producto</th>
                                        <th scope="col">Cantidad</th>
                                        <th scope="col">Fecha</th>
                                    </tr>
                                </thead>
                                <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Inventarios.QuerysInventarios"/>
                                <%
                                    ResultSet rsTabla = interTabla.consultaEntrada();
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
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                            <br>
                            <h2 class="titulos text-center" style="width: 100%;">Lotes</h2>  
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Lote</th>
                                        <th scope="col">Orden de compra</th>
                                        <th scope="col">Fecha de Ingreso</th>      
                                    </tr>
                                </thead>
                                <%
                                    ResultSet rs = interTabla.consultaLote();
                                %> 
                                <tbody>
                                    <%
                                        while (rs.next()) {
                                    %>
                                    <tr id="modalInter">
                                        <td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(1)%></td>
                                        <td><%=rs.getString(2)%></td>
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


        <!-- Insertar Datos-->
        <div class="modal fade" id="Insertar"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Insertar datos</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form method="POST" action="entradas.jsp" >
                                <span id="titulo"><span class="number">1</span>Ingresa el id de orden de compra</span><br>
                                <span>Id orden de compra</span><span><input type="text" name="IDOrdenCom" id="IDOrdenCom" placeholder="##########" maxlength="7" pattern="[A-Za-z0-9]{7}" title="El id de orden de compra debe ser de 7 digitos (n&uacute;meros y letras))" required="required"/></span>
                                <input type="submit" style="background-color: #9F150D; width: 140px" value="continuar" class="btn btn-danger"/>
                                <br>
                            </form>
                            <br>
                            <form method="POST" action="entradas.jsp" onsubmit="return InsertarEnt()">

                                <span id="titulo"><span class="number">2</span>Visualiza lso productos y selecciona los productos a ingresar</span><br>
                                <br><div class="table-responsive">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>Selecciona</th>
                                            <th>Id de producto</th>
                                            <th>Proveedor</th>
                                            <th>Nombre del producto</th>
                                            <th>Tipo de producto</th>
                                            <th>Cantidad en existencia</th>
                                            <th>M&iacute;nimo</th>
                                            <th>M&aacute;ximo</th>
                                            <th>Costo unitario</th>
                                            <th>Costo total</th>
                                            <th>Unidad de medida</th>

                                        </tr>
                                        <tr>
                                            <td class="seleccion"><input type="radio" id="producto" name="Producto"></td>
                                            <td><%= request.getAttribute("id_producto")%></td>
                                            <td><%= request.getAttribute("proveedor")%></td>
                                            <td><%= request.getAttribute("nombre_pro")%></td>
                                            <td><%= request.getAttribute("tipo_pro")%></td>
                                            <td><%= request.getAttribute("cant_exist")%></td>
                                            <td><%= request.getAttribute("min_pro")%></td>
                                            <td><%= request.getAttribute("max_pro")%></td>
                                            <td><%= request.getAttribute("costo_uni")%></td>
                                            <td><%= request.getAttribute("costo_ven")%></td>
                                            <td><%= request.getAttribute("uni_med")%></td>

                                        </tr>

                                    </table>    
                                </div>
                                <br><br><button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                <input type="submit" style="background-color: #9F150D; width: 140px" value="Confirmar compra" class="btn btn-danger" onsubmit="return InsertarEnt()"/>
                                <button type="button" name="Registrar entrada" data-toggle="modal" data-target="#Registrar" style="background-color: #9F150D; width:185px;" class="btn btn-danger" >Registrar Entrada</button><br><br>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Insertar Datos-->
        <div class="modal fade" id="Registrar"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Insertar datos</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form method="POST" action="entradas.jsp" onsubmit="return InsertarEnt()">
                                <span id="titulo"><span class="number">1</span>Ingresa el n&uacute;mero de compra</span><br>

                                <span>Id orden de compra</span><span><input type="text" name="id_compra" id="id_compra" placeholder="##########" maxlength="7" pattern="[0-9]{7}" title="El id de orden de compra debe ser de 7 digitos (n&uacute;meros)" required="required"/></span>
                                <span>Fecha de registro</span><span><input type="text" id="fecha_ingreso" name="fecha_ingreso" disabled="disabled"/></span>
                                <br><br><button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                <input type="submit" style="background-color: #9F150D; width: 90px" value="Insertar" class="btn btn-danger" onsubmit="return InsertarEnt() location.href = 'entradas.jsp'"/>

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
                            <form method="POST" action="../../EntradasConsulta_E" onsubmit="return EspecificaEnt()">
                                <span id="titulo"><span class="number">1</span>Elige e ingresa los datos de los registros que desea consultar</span>

                                <br><br><span>ID de producto:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text" name="id_producto" id="id_producto" placeholder="##########" maxlength="13" pattern="[0-9]{13}" title="El id de producto debe ser de 13 digitos (n&uacute;meros)" required/></span>
                                <br><br><span>ID de orden de compra:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text" name="id_compra" id="id_compra" placeholder="##########" maxlength="7" pattern="[0-9]{7}" title="El id de orden de compra debe ser de 7 digitos (n&uacute;meros)" required/></span>
                                <br><br><span>Fecha de ingreso:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="date" name="fecha_ingreso" placeholder="dd/mm/aaaa" maxlength="100" title="El El formato de fecha debe ser dd/mm/aaaa" required/></span>
                                <br><br>
                                <br><br><button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" style="background-color: #9F150D" class="btn btn-danger" value="Continuar" id="BuscaEs" onsubmit="return EspecificaEnt()"><br>
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
