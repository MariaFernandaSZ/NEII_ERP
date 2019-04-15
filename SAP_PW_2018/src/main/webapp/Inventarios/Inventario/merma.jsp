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
        <title>Merma</title>
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

            function InsertarMe(){
            alert("Se han insertado los datos correctamente");
            }
            function EliminarMe(){
            alert("Se han eliminado los datos correctamente");
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
                                    <td colspan="2">
                                        <br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label style="margin-left: 20px; width:90%;" class="form-check-label" >Nuevo Producto Merma:</label>
                                    </td>
                                    <td>  
                                        <button style="width: 100%;" type="button" name="agregaProd" data-toggle="modal" data-target="#agregaProductos" class="btn btn-secondary form-control">Agregar</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <br>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-center" colspan="2">
                                        <label class="form-check-label">Eliminar producto merma:</label>
                                    </td>
                                </tr>
                                <tr>
                            <form action="../../eliminarMerma" method="POST" onsubmit="return EliminarMe()">
                                <td>
                                    <input class="form-control" style="margin-left: 20px; width: 90%;" type="text" name="id_merma"  id="id_merma" placeholder="ID de Merma" maxlength="7" pattern="[0-9]{7}" title="El id de orden de merma debe ser de 7 digitos (n&uacute;meros)" required="required"></td>
                                <td>
                                    <input style="width: 100%;" type="submit" name="EliminaM" class="btn btn-secondary mx-auto" value="Eliminar" />
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
                                    <button  style="width: 100%;" class="btn btn-secondary form-control" type="button" name="ConEsIG" data-toggle="modal" data-target="#ConsultaIG" >Consulta</button>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label style="margin-left: 20px; width: 90%;"  class="form-check-label">Modificar</label>
                                </td>
                                <td> 
                                    <button style="width: 100%;" type="button" name="ModificaProd" data-toggle="modal" data-target="#ModificaProductos" class="btn btn-secondary form-control" onsubmit="return EliminarMe()">Modificar</button>
                                </td>
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
                        <p style="padding: 10px 10px"><span style="margin-right: 10px;"><img border="0" height="50" width="50" src="../../archivos/img/ic_problema_grande.png" /></span>Problemas de Producto</p>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 container-fluid"><!-- Seccion derecha (Visualizar tarea) -->
                            <p class="titulos">Merma conocida</p>  
                            <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="" id="cono">
                                                <img src="../imagenes/Mermas.jpg" class="img-thumbnail" alt="Merma conocida" width="300" height="320" onclick="location.href = 'merma_con.jsp'"> <br><br>
                                                <button type="button" class="btn btn-secondary form-control" onclick="location.href = 'merma_con.jsp'">Merma conocida</button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 container-fluid"><!-- Seccion derecha (Visualizar tarea) -->
                            <p class="titulos">Merma desconocida</p>            
                            <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="" id="desc" >
                                                <img src="../imagenes/Tyco-Storefront-Visibility.jpg" class="img-thumbnail" alt="Merma desconocida" width="300" height="320" onclick="location.href = 'merma_desc.jsp'"><br><br> 
                                                <button type="button" class="btn btn-secondary form-control" onclick="location.href = 'merma_desc.jsp'">Merma desconocida</button>
                                            </div>
                                        </td>
                                    </tr>
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
                        <div style="background: #f8f8f8;">
                            <form style="margin-left: 15px; margin-right: 15px;" method="POST" action="../../insertar_merma" onsubmit="return InsertarMe()">
                                <h2 class="text-center" style="width: 100%;">Inserte el Id del producto </h2> 
                                <table border="0" cellspacing="0">
                                    <tbody>
                                    <td colspan="2">
                                        <br>
                                    </td>
                                    <tr>
                                        <td>Id de producto:</td>
                                        <td><input  class="form-control" type="text" name="id_producto" id="id_producto" placeholder="0000000000" maxlength="7" pattern="[0-9]{7}" title="El id de producto debe ser de 13 digitos (n&uacute;meros)"/></td>
                                    </tr>
                                    <td colspan="2">
                                        <h2 class="text-center" style="width: 100%;">Inserte datos</h2> 
                                    </td>
                                    <td colspan="2">
                                        <br>
                                    </td>
                                    <tr>
                                        <td>Tipo de merma:</td>
                                        <td>
                                            <select class="form-control" id="tipo_merma" name="tipo_merma" required="required">
                                                <optgroup label="Merma">
                                                    <option value="MermaConocida">Merma Conocida </option>
                                                    <option value="MermaDesconocida">Merma Desconocida </option>
                                                </optgroup>
                                            </select>
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
                                        <td>Cantidad merma:</td>
                                        <td>
                                            <input class="form-control" type="number" id="cant_mer" name="cant_mer" placeholder="" min="1" max="999999999" pattern="[0-9]{1,999999999}" title="La cantidad merma debe contener almenos 1 producto (campo n&uacute;merico)" required="required"/>
                                        </td>
                                    </tr>
                                    <td colspan="2">
                                        <br>
                                    </td>
                                    <tr>
                                        <td>Observaciones:</td>
                                        <td>
                                            <input class="form-control"  type="text" id="motivo_mer" name="motivo_mer" pattern="[A-Za-z0-9]{1,150}" title="Debe contener de 1 a 150 car&aacute;cteres" placeholder="Comentarios" required="required" />
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
                                            <input type="submit" class="btn btn-secondary form-control mx-auto" value="Ingresar" id="IngresarM" onsubmit="return InsertarMe() location.href = 'merma.jsp'">
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
        <!-- Modal MODIFICAR PRODUCTOS-->
        <div class="modal fade" id="ModificaProductos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Modificar Producto</h4>
                    </div>
                    <div class="modal-body">
                        <div style="background: #f8f8f8;">
                            <form style="margin-left: 15px; margin-right: 15px;" method="POST" action="../../Modificar_Merma" onsubmit="return formularioModifica()">
                                <h2 class="text-center" style="width: 100%;">Inserte el id del merma a modifica</h2> 
                                <table border="0" cellspacing="0">
                                    <tbody>
                                    <td colspan="2">
                                        <br>
                                    </td>
                                    <tr>
                                        <td>ID de merma:</td>
                                        <td><input  class="form-control" type="text" name="id_merma" id="id_merma" placeholder="0000000000" maxlength="7" pattern="[0-9]{7}" title="El id de merma debe ser de 7 digitos (n&uacute;meros)"/></td>
                                    </tr>
                                    <td colspan="2">
                                        <h2 class="text-center" style="width: 100%;">Inserte datos a modificar</h2> 
                                    </td>
                                    <td colspan="2">
                                        <br>
                                    </td>
                                    <tr>
                                        <td>Tipo de merma:</td>
                                        <td>
                                            <select class="form-control" id="tipo_merma" name="tipo_merma" required="required">
                                                <optgroup label="Merma">
                                                    <option value="MermaConocida">Merma Conocida </option>
                                                    <option value="MermaDesconocida">Merma Desconocida </option>
                                                </optgroup>
                                            </select>
                                        </td>
                                    </tr>
                                    <td colspan="2">
                                        <br>
                                    </td>
                                    <tr>
                                        <td>Cantidad de merma:</td>
                                        <td>
                                            <input class="form-control"  type="number" id="cant_mer" name="cant_mer" placeholder="" min="1" max="999999999" pattern="[0-9]{1,999999999}" title="La cantidad merma debe contener almenos 1 producto (campo n&uacute;merico)" required="required"/>
                                        </td>
                                    </tr>
                                    <td colspan="2">
                                        <br>
                                    </td>
                                    <tr>
                                        <td>Observaciones:</td>
                                        <td>
                                            <input class="form-control"  type="text" id="motivo_mer" name="motivo_mer" pattern="[A-Za-z0-9]{1,150}" title="Debe contener de 1 a 150 car&aacute;cteres" placeholder="Comentarios" required="required" />
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
                                            <input type="submit"  class="btn btn-secondary form-control mx-auto" value="Modificar" id="ModificarM" onclick="return formularioModifica() location.href = 'merma.jsp'"><br>
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
