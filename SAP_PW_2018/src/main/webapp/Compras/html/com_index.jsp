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
        <title>Compras</title>
        <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
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
                                <a class="dropdown-item" href="com_DevolP.jsp" style="color: white;">Devoluci&oacute;n Proveedor</a><span class="sr-only">(current)</span>
                            </div>
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link text-white"  data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false"><img class="ic"  border="0" height="25" width="25" src="../../archivos/img/ordenCompra.png" /><p class="dropdown-toggle">Orden de Compra</p></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="com_nuevarequisicion.jsp" style="color: white;">Orden de compra</a><span class="sr-only"></span>
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

        <div id="principal">
            <div class="container-fluid">
                <div class="row">
                    <br>
                </div>
                <div class="row">
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12 form-style-5"> <!-- Seccion izquierda -->
                        <form method="POST" action="../../Eliminar_producto" onsubmit="return vali_almacen();">
                            <div id="titulo" class="col-12">
                                <span class="number">1</span>Eliminar<br>producto por código</div>
                           <br>
                            <input type="number" name="codprod" placeholder="Código" id="codprod" required>
                                                       
                            <center><input type="submit" value="Eliminar" style="background-color: #3498DB" name="Buscar" class="btn btn-danger"></center>
                            <br>
                        </form>

                        <form method="POST" action="com_prod.jsp" >
                            <span id="titulo"><span class="number">2</span>B&uacute;squeda por<br>c&oacute;digo de producto</span>
                            <br><br>
                            <input type="number" name="codprod" placeholder="Código" id="codprod" required>
                            
                            <center><input type="submit" value="Consultar" style="background-color: #3498DB" name="Buscar" class="btn btn-danger"></center>                          
                        </form>
                        <br>
                         <!--<form method="POST" action="com_prod.html" onsubmit="return vali_codigo();">
                            <span id="titulo"><span class="number">3</span>Eliminar por<br>c&oacute;digo de producto</span>
                            <br><br>
                            <input type="number" name="codprod" placeholder="Código" id="codigo" required>
                             <center><input type="submit" value="Eliminar" style="background-color: #9F150D" name="Eliminar" class="btn btn-danger"></center>
                             </from>-->
                    </div>                       


                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"><!-- Seccion central --> 
                        <div class="table-responsive"><table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">código producto</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Unidad</th>
                                            <th scope="col">Proveedor</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Mínimo</th>
                                            <th scope="col">Precio Costo</th>
                                            <th scope="col">Precio Venta</th>
                                        </tr>
                                    </thead>
                                    <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Inventarios.QuerysProducto"/>
                                    <%
                                        ResultSet rsTabla = interTabla.consultaGeneral();
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
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table></div>
                    </div>

                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12 form-style-5"><!-- Seccion derecha -->
                        <form action="../../ingresar_producto" method="post" onsubmit="return vali_nuevoproducto();">                        
                            <span id="titulo"><span class="number">4</span>Agregar<br>nuevo producto</span><br>
                            <br><input type="number" name="codprodnuevo" placeholder="Código de barras" id="codigo_nuevoprod" required>                             
                            <input type="text" name="nomproducto" placeholder="Nombre" id="nom_producto" required>
                            <select id="unidad" name="unidadprod">
                                <optgroup label="Unidades">
                                    <option value="@">Seleccione&nbsp;una&nbsp;unidad</option>
                                    <option value="l">Litros</option>
                                    <option value="ml">Mililitros</option>
                                    <option value="k">Kilos</option>
                                    <option value="kg">Kilogramos</option>
                                    <option value="cajas">Cajas</option>                                
                                    <option value="unidad">unidades</option>
                                </optgroup>
                            </select>
                            <input type="text" name="costoproducto" placeholder="Costo del porducto" id="costo" required>
                            <input type="text" name="ventaproducto" placeholder="Precio de venta" id="costo" required>
                            <input type="text" name="provproducto" placeholder="Proveedor" id="proveedor" required>
                            <input type="number" name="maxproducto" placeholder="Máximo en inventario" id="max_inventario" required>
                            <input type="number" name="minproducto" placeholder="Mínimo en inventario" id="min_inventario" required>
                            <center><input type="submit" value="Agregar" style="background-color: #9F150D" name="nuevo" class="btn btn-danger"></center>                       
                        </form>
                    </div> 
                        
                </div>
            </div> 
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body> 
</html>
