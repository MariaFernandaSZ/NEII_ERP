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
        <script src="../js/validaciones.js"></script>
    </head>
    <body>
        <!-- BARRA NAVEGACIÓN-->
        <header class="sticky-top">
            <!--barra de navegacion creada con bootstrap-->
            <nav class="navbar navbar-expand-lg navbar-light barra">
                <a class="navbar-brand text-white" ><h3>Compras</h3></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="com_index.jsp" style="color: white">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="com_proveedor.jsp" style="color: white">Proveedores</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CompraOrden.jsp" style="color: white">Orden&nbsp;de&nbsp;compra</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="com_listadecom.jsp" style="color: white">Lista&nbsp;de&nbsp;compras</a>
                        </li> 
                    </ul>
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="com_ayuda.jsp" target="_blank" style="color: white">Ayuda(?)</a>
                        </li>
                        <li class="nav-item">
                            <a id="btn_gerencia" class="nav-link" href="../../Gerencia/IG/ig_inicio.jsp" style="color: white">Gerencia</a>                                
                            <script src="../../js/gerencia.js"></script>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../../CerrarSesion"  style="color: white">Salir</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <div id="principal">
            <div class="container-fluid">
                <div class="row">
                    <br>
                </div>
                <div class="row">
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12 form-style-5"> <!-- Seccion izquierda -->
                        <form method="POST" action="com_prod.jsp" onsubmit="return vali_almacen();">
                            <div id="titulo" class="col-12">
                                <span class="number">1</span>B&uacute;squeda de<br>producto por almacen</div>
                            <select id="almacen" name="field4">
                                <optgroup label="Almacenes">
                                    <option value="@">Seleccione&nbsp;una&nbsp;opci&oacute;n</option>
                                    <option value="almacen1">Almacen&nbsp;1</option>
                                    <option value="almacen2">Almacen&nbsp;2</option>
                                    <option value="almacen3">Almacen&nbsp;3</option>
                                    <option value="almacen4">Almacen&nbsp;4</option>
                                    <option value="todos">Todos</option>
                                </optgroup>
                            </select>

                            <span style="font-size: 18px">Ordenar&nbsp;por:</span>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="busprod" id="ord2" value="proveedor">
                                <label style="font-size: 18px" class="form-check-label" for="ord2">Proveedor</label>
                                <input class="form-check-input" type="radio" name="busprod" id="ord3" value="codigo">
                                <label style="font-size: 18px" class="form-check-label" for="ord3">C&oacute;digo</label>
                                <input class="form-check-input" type="radio" name="busprod" id="ord4" value="precio">
                                <label style="font-size: 18px" class="form-check-label" for="ord4">Precio</label>
                            </div>
                            
                            <center><input type="submit" value="Consultar" style="background-color: #9F150D" name="Buscar" class="btn btn-danger"></center>
                            <br>
                        </form>

                        <form method="POST" action="com_prod.jsp" onsubmit="return vali_codigo();">
                            <span id="titulo"><span class="number">2</span>B&uacute;squeda por<br>c&oacute;digo de producto</span>
                            <br><br>
                            <input type="number" name="codprod" placeholder="Código" id="codigo" required>
                            
                            <center><input type="submit" value="Consultar" style="background-color: #9F150D" name="Buscar" class="btn btn-danger"></center>                          
                        </form>
                        <br>
                         <form method="POST" action="com_prod.html" onsubmit="return vali_codigo();">
                            <span id="titulo"><span class="number">3</span>Eliminar por<br>c&oacute;digo de producto</span>
                            <br><br>
                            <input type="number" name="codprod" placeholder="Código" id="codigo" required>
                             <center><input type="submit" value="Eliminar" style="background-color: #9F150D" name="Eliminar" class="btn btn-danger"></center>
                             </from>
                    </div>                       


                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"><!-- Seccion central -->                          
                    </div>

                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12 form-style-5"><!-- Seccion derecha -->
                        <form action="../../ingresar_producto" method="post" onsubmit="return vali_nuevoproducto();">                        
                            <span id="titulo"><span class="number">4</span>Agregar<br>nuevo producto</span><br>
                            <br><input type="number" name="codprodnuevo" placeholder="Código de barras" id="codigo_nuevoprod" required>                             
                            <input type="text" name="nomproducto" placeholder="Nombre" id="nom_producto" required>
                            <select id="unidad" name="field4">
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
                            <input type="text" name="costoproducto" placeholder="Precio de venta" id="costo" required>
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
