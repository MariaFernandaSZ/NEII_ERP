<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Ventas")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../archivos/errorSesion.jsp");
        }
    }
%>
<html>
    <head>
        <title>Ventas</title>
        <meta charset="UTF-8">
        <link href="../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/VenEstilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/VenLaterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/VenTablareporteventas1.css">
      <%--  <script>
    function descargarExcel(){
        //Creamos un Elemento Temporal en forma de enlace
        var tmpElemento = document.createElement('a');
        // obtenemos la información desde el div que lo contiene en el html
        // Obtenemos la información de la tabla
        var data_type = 'data:application/vnd.ms-excel';
        //var data_type = 'application/msword';
        var tabla_div = document.getElementById('tblReporte');
        var tabla_html = tabla_div.outerHTML.replace(/ /g, '%20');
        tmpElemento.href = data_type + ', ' + tabla_html;
        //Asignamos el nombre a nuestro EXCEL
        tmpElemento.download = 'Nombre_De_Mi_Excel.xls';
        // Simulamos el click al elemento creado para descargarlo
        tmpElemento.click();
    }
    descargarExcel();
</script>--%>
    </head>

    <body style="width:100%; height:100%;">

        <!-- BARRA NAV -->
        <header style="z-index: 2"> 
            <nav class="navbar navbar-expand-lg navbar-light menu" style="background-color: #9F150D;">
                <a class="navbar-brand" style="color: white;" href="mainVentas.jsp">Ventas</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span></button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="clientes.jsp" style="color: white"> Clientes </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cotizacion.jsp" style="color: white">Cotizaci&oacute;n</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Orden de venta
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="apartadoProducto.jsp">Apartar pedido</a>
                                <a class="dropdown-item" href="ventaParcialidades.jsp">Venta en parcialidades</a>
                                <a class="dropdown-item" href="ventaContado.jsp">Venta neta</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Reportes
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Reporte de ventas <span class="sr-only">(current)</span></a>
                                <a class="dropdown-item" href="RFacturas.jsp">Facturas</a>
                                <a class="dropdown-item" href="verCotizaciones.jsp">Cotizaciones archivadas</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Cobros.jsp" style="color: white">Cobros</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <select class="form-control" id="tipoBusqueda">
                            <optgroup label="Elige tipo">
                                <option value="select">Selecciona</option>
                                <option value="id">Por ID</option>
                                <option value="nombre">Por nombre del producto</option>
                                <option value="codigo">Por codigo de barras</option>
                                <option value="cliente">Por Cliente</option>
                                <option value="provee">Por proveedor</option> 
                            </optgroup>
                        </select>&nbsp;&nbsp;
                        <input class="form-control mr-sm-2" type="search" placeholder="Buscar" id="busc" aria-label="Search">
                        <button class="btn btn-outline-dark" style="color: white" onclick="buscar()" type="submit">Buscar</button>

                    </form>

                    <li class="nav-item">
                        <a class="nav-link" href="com_ayuda.jsp" target="_blank" style="color: white">Ayuda(?)</a>
                    </li>   
                    <li class="nav-item">
                        <a id="btn_gerencia" class="nav-link" href="../Gerencia/IG/ig_inicio.jsp" style="color: white">Gerencia</a>                                
                        <script src="../js/gerencia.js"></script>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../index.jsp" style="color: white">Salir</a>
                    </li>

                </div>
            </nav>
        </header>




        <!-- CONTENIDO-->   
        <div class="container-fluid contenido">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion izquierda -->


                    <div class="form-style-5">
                        <form>

                            <span id="titulo"><span class="number">1</span>Reporte</span><br><br>
                            <span style="font-size: 18px">Fecha de inicio</span><br><span class="idemp">
                                <input style="width: 180px; height: 30px;text-align: center;"  type="date" min="2017-01-01" id="fecha1" name="fechaIn" /></span><br>

                            <span style="font-size: 18px">Fecha de termino</span><br><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" id="fecha2" name="fechaTerm" /></span>  <br><br>

                            <script>
                            document.getElementById('fecha2').value = new Date().toISOString().substring(0, 10);
                            </script>                                

                            <center>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report1" value="todasV" checked>
                                    <label style="font-size: 18px" class="form-check-label" for="report1">
                                        Todas las ventas
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report2" value="proveedorV">
                                    <label style="font-size: 18px" class="form-check-label" for="report2">
                                        Ventas por proveedor
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report3" value="productoV" >
                                    <label style="font-size: 18px" class="form-check-label" for="report3">
                                        Ventas por producto
                                    </label>
                                </div>     
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report4" value="clienteV" >
                                    <label style="font-size: 18px" class="form-check-label" for="report4">
                                        Ventas por cliente
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report5" value="masV">
                                    <label style="font-size: 18px" class="form-check-label" for="report5">
                                        M&aacute;s vendidos
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report6" value="menosV" >
                                    <label style="font-size: 18px" class="form-check-label" for="report6">
                                        Menos vendidos
                                    </label>
                                </div>     
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportVentas" id="report7" value="vendedorV">
                                    <label style="font-size: 18px" class="form-check-label" for="report7">
                                        Ventas por vendedor
                                    </label>
                                </div> <br>

                                <button type="button" name="cargaReport" style="background-color: #9F150D" id="btnReporte" onclick="validaFechasReportes()" class="btn btn-danger">Cargar reporte</button><br>
                                <br><button type="button" name="impReport" style="background-color: #9F150D" id="btnImprimir" onclick="validaFechasReportes()" class="btn btn-danger">Imprimir reporte</button><br>
                                <br><button type="button" name="mandaCorreoReport" style="background-color: #9F150D" id="btnMail" onclick="validaFechasReportes()" class="btn btn-danger">Mandar reporte por correo</button>
                            </center>
                        </form>
                    </div>

                </div>


                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12"><!-- Seccion central TABLA -->
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">id_venta</th>
                                    <th scope="col">C&oacute;digo</th>
                                    <th scope="col">Producto</th>
                                    <th scope="col">Cliente</th>
                                    <th scope="col">Cantidad</th>
                                    <th scope="col">Proveedor</th>
                                    <th scope="col">Precio unitario</th>
                                    <th scope="col">IVA</th>
                                    <th scope="col">Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>ven42576</td>
                                    <td>7702111333581</td>
                                    <td>Laptop HP</td>
                                    <td>ITTOL</td>
                                    <td>10</td>
                                    <td>Hewlett-Packard</td>
                                    <td>$8,500.00</td>
                                    <td>$1,360.00</td>
                                    <td>$98,600.00</td>
                                </tr>
                            </tbody>
                        </table>
                    </div> 

                </div>

            </div>

        </div>         

        <div id="tmpModal"></div> 



        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../js/Ventas/VenValidaciones.js"></script>
        <script src="../js/Ventas/muestraModales.js"></script>

    </body>
</html>
