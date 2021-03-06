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
        
        <div id="principal">
            <div class="container-fluid">
                <div class="row">
                    <br>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"> <!-- Seccion izquierda -->
                      
                        </div>                       
                    
                
                    <div style="background-color: #f4f7f8;" class="col-lg-6 col-md-6 col-sm-6 col-xs-12 form-style-5"><!-- Seccion central -->                          
                   <form method="POST" onsubmit="return vali_nueva_requi();">                        
                            <span id="titulo"><span class="number">1</span>Nueva requisici&oacute;n</span><br>
                            <br>
                            <input style="text-align: center;" type="date" name="fecha_nuevarequisicion" id="fecha_nueva requisicion"/>                            
                            <input type="number" name="codigoprod" placeholder="Código de barras del producto" id="requi_codigo_barras" required>
                             <select id="requi_unidad" name="field4">
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
                            <input type="number" name="cantproducto" placeholder="Cantidad" id="requi_cantidad" required>
                            <div class="row"> 
                                <div  class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">  
                                    <label>Fecha en la que se requiere el producto: </label>
                                </div>    
                                <div  class="col-lg-6 col-md-6 col-sm-6 col-xs-12 "> 
                                <input style="text-align: center;" type="date" name="fecha_nuevarequisicion"  id="fecha_nueva_requi"/>
                                </div>
                            </div>
                            <center><input type="submit" value="Mandar" style="background-color: #9F150D" name="nuevo" class="btn btn-danger"></center>                       
                    </form>
                    </div>
                    
                    <div  class="col-lg-3 col-md-3 col-sm-3 col-xs-12 "><!-- Seccion derecha -->
                       
                    </div>    
                </div>
            </div> 
       </div>
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body> 
</html>
