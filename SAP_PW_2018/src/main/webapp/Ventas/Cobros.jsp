
<html>
    <head>
        <title>Ventas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/VenEstilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/VenLaterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/VenTablacliente.css">
        <link href="../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" integrity="sha256-CfcERD4Ov4+lKbWbYqXD6aFM9M51gN4GUEtDhkWABMo=" crossorigin="anonymous"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../js/Ventas/VenGeneral.js"></script>
        <script src="../js/Ventas/VenValidaciones.js"></script>
        <script src="../js/Ventas/muestraModales.js"></script>
        <link href="../css/estilosMax.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>


        <!-- BARRA NAV -->
        <header class="sticky-top"> 
            <nav id="barraNavegadora" class="navbar navbar-expand-lg colorPrincipal" >
                <a class="navbar-brand" style="color: white;" href="mainVentas.jsp"><h4>Módulo<br>Ventas</h4><span class="sr-only">(current)</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span></button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a href="AgregarCliente.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_cliente.png" /><p>Clientes</p></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" aria-haspopup="true" aria-expanded="false" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"><img class="ic" border="dropdown-toggle0" height="25" width="25" src="../archivos/img/ic_ordenventa.png"/>Orden de venta</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="Ordenventa.jsp" style="color: white">Agregar Orden</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_reportes.png" />Reporte</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="Factura.jsp" style="color: white">Factura</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="Cobros.jsp" class="nav-link" style="color: white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_cobros.png" /><p>Cobros</p></a>
                        </li>
                    </ul>
                    <!--
                    <form class="form-inline my-2 my-lg-0">
                        <select class="form-control" id="tipoBusqueda">
                            <optgroup label="Elige tipo">
                                <option value="select">Selecciona</option>
                                <option value="id">Por ID</option>
                                <option value="nombre">Por nombre</option>
                                <option value="rfc">Por RFC</option>
                                <option value="estado">Por Estado</option>
                                <option value="municipio">Por Municipio</option>  
                            </optgroup>
                        </select>&nbsp;&nbsp;
                        <input class="form-control mr-sm-2" type="search" id="busc" placeholder="Buscar" aria-label="Search">
                        <button class="btn btn-outline-dark" style="color: white" onclick="buscar()" type="submit">Buscar</button>
                    </form>
                    -->
                    <li class="nav-item">
                        <a href="com_ayuda.jsp" class="nav-link text-white" target="_blank" style="color: white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_ayuda.png" /><p>Ayuda</p></a>
                    </li>
                    <!--
                    <li class="nav-item">
                        <a id="btn_gerencia" class="nav-link" href="../Gerencia/IG/ig_inicio.jsp" style="color: white">Gerencia</a>                                
                        <script src="../js/gerencia.js"></script>
                    </li>
                    -->
                    <li class="nav-item">
                        <a href="../CerrarSesion" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_salir.png" /><p>Salir</p></a>
                    </li>
                </div>
            </nav>
        </header>
        <!-- CONTENIDO -->   
        <div class="container-fluid contenido">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion izquierda -->


                    <div class="form-style-5">
                        <form>
                            <span id="titulo"><span class="number">1</span> Informaci&oacute;n de cliente</span><br>
                            <span class="idemp"><input type="text" name="IDCliente" id="IDCliente" placeholder="ID Cliente"></span>
                            <button type="button" name="cargar" onclick="validaIDCliente()" style="background-color: #9F150D" class="btn btn-danger">Cargar</button><br>
                            <br><select id="nomEmp" name="field4">
                                <optgroup label="Empresa">
                                    <option value="nomEmp">Nombre de empresa</option>
                                    <option value="Eejemp1">Cliente 1</option>
                                    <option value="Eejemp2">Cliente 2</option>
                                    <option value="Eejemp3">Cliente 3</option>
                                    <option value="Eejemp4">Cliente 4</option>
                                </optgroup>
                            </select> 
                            <select id="nomInter" name="field4">
                                <optgroup label="Intermediaio">
                                    <option value="nomInterm">Intermediario</option>
                                    <option value="Iejem1">Intermediario 1</option>
                                    <option value="Iejem2">Intermediario 2</option>
                                    <option value="Iejem3">Intermediario 3</option>
                                    <option value="Iejem4">Intermediario 4</option>
                                </optgroup>
                            </select> 
                            <select id="ventasInter" name="field4">
                                <optgroup label="ID Venta">
                                    <option value="venta">ven1233</option>
                                    <option value="Vejemplo1">ven1234</option>
                                    <option value="Vejemplo2">ven1235</option>
                                    <option value="Vejemplo3">ven1236</option>
                                    <option value="Vejemplo4">ven1237</option>
                                </optgroup>
                            </select> 


                            <span id="titulo"><span class="number">2</span>Pago</span><br><br>


                            <span >Forma pago</span>

                            <select id="tipoPago" name="field4">
                                <optgroup label="Pago">
                                    <option value="select">Selecciona</option>
                                    <option value="efectivo">Efectivo</option>
                                    <option value="tarjeta">Tarjeta</option>
                                </optgroup>
                            </select>

                            <center>
                                <span>Pago N&nbsp;&nbsp;&nbsp;</span>
                                <span class="idemp">
                                    <input style="width: 110px; height: 30px;text-align: center;" readonly="readonly" placeholder="$000.00" type="text" name="Montot"/>
                                </span>

                                <br><span>Intereses&nbsp;&nbsp;&nbsp;</span>
                                <span class="idemp">
                                    <input style="width: 100px; height: 30px;text-align: center;" readonly="readonly" placeholder="$000.00" type="text" name="Totalp"/>
                                </span><br>

                                <span>Total a pagar&nbsp;&nbsp;&nbsp;</span>
                                <span class="idemp">
                                    <input style="width: 100px; height: 30px;text-align: center;" readonly="readonly" placeholder="$000.00" type="text" name="Totalp"/>
                                </span><br>

                                <span>Fecha pr&oacute;x. pago</span>
                                <span class="idemp">
                                    <input style="width: 110px; height: 30px;text-align: center;" readonly="readonly" placeholder="dd/mm/aaaa" type="text" name="Pagoin"/>
                                </span><br><br>
                                <button type="button" name="loquidar" style="background-color: #9F150D" onclick="validaSelectVenta()" class="btn btn-danger">LIQUIDAR</button>
                            </center>	

                        </form>
                    </div>

                </div>

                <!-- Seccion central TABLA -->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">C&oacute;digo</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Cantidad</th>
                                    <th scope="col">Precio unitario</th>
                                    <th scope="col">IVA</th>
                                    <th scope="col">Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>7702111333581</td>
                                    <td>Impresora LaserJet HP</td>
                                    <td>2</td>
                                    <td>$572.00</td>
                                    <td>$91.52</td>
                                    <td>$1,144.00</td>
                                </tr>
                            </tbody>
                        </table>
                    </div> 

                </div>

                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion derecha -->


                    <div class="form-style-5">
                        <form>

                            <span id="titulo"><span class="number">3</span>Debe</span>
                            <center>
                                <span style="width: 110px;">Saldo pendiente</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Subtotal" readonly="readonly" placeholder="$000.00"/></span><br><br>


                                <span id="titulo"><span class="number">4</span>Resultados</span><br><br>

                                <span >Subtotal&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Subtotal" readonly="readonly" placeholder="$000.00"/></span><br>

                                <span >IVA&nbsp;&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="IVA" readonly="readonly" placeholder="$000.00"/></span><br>

                                <span >Descuento&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Descuento" readonly="readonly" placeholder="0%"/></span><br>

                                <span >N pago&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Total" readonly="readonly" placeholder="$000.00"/></span>


                                <br><br><button type="button" name="pagar" style="background-color: #9F150D" onclick="validaSelectVenta()" class="btn btn-danger">Pagar</button> <button type="button" name="cancelar" style="background-color: #9F150D" class="btn btn-danger">Cancelar</button>
                            </center>
                        </form>
                    </div>

                </div>
            </div>

        </div>           










        <!-- Modal PAGAR EFECTIVO-->
        <div class="modal fade" id="pagoEfectivo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Pago</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form>
                                <span id="titulo"><span class="number">1</span>Datos de venta</span>


                                <br><br><span class="idemp">Subtotal</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Subtotal" readonly="readonly" placeholder="$13,728.00"/></span>

                                <span class="idemp">IVA</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="IVA" readonly="readonly" placeholder="$2,196.48"/></span>

                                <span class="idemp">Descuento</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;"  type="text" name="Descuento" readonly="readonly" placeholder="0%"/></span>

                                <span class="idemp">TOTAL</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" id="total" type="text" name="Total" readonly="readonly" placeholder="$15,924.48"/></span>

                                <span id="titulo"><span class="number">2</span>Cobro</span><br><br>
                                <center>
                                    <span class="idemp">Moneda</span><span class="idemp">
                                        <select id="job" name="field4" style="width: 150px">
                                            <optgroup label="Moneda">
                                                <option value="peso">Peso mexicano</option>
                                                <option value="dolar">D&oacute;lar</option>
                                                <option value="euro">Euro</option>
                                                <option value="libra">Libra</option>
                                            </optgroup>
                                        </select> 
                                    </span>
                                    <br>
                                    <span class="idemp">Cantidad con la que se pagará:</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" id="efectivo" type="text" name="cantidadEfectivo" placeholder="$000.00"/></span>
                                </center>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" style="background-color: #9F150D" onclick="validamodalapagoEfectivo()" class="btn btn-danger">Realizar pago</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal PAGAR TARJETA-->
        <div class="modal fade" id="pagoTarjeta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Pago</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form>
                                <span id="titulo"><span class="number">1</span>Datos de venta</span>


                                <br><br><span class="idemp">Subtotal</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Subtotal" readonly="readonly" placeholder="$13,728.00"/></span>

                                <span class="idemp">IVA</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="IVA" readonly="readonly" placeholder="$2,196.48"/></span>

                                <span class="idemp">Descuento</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Descuento" readonly="readonly" placeholder="0%"/></span>

                                <span class="idemp">TOTAL</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Total" readonly="readonly" placeholder="$15,924.48"/></span>

                                <span id="titulo"><span class="number">2</span>Cobro</span><br><br>


                                <span style="width: 100px">N&uacute;mero de tarjeta&nbsp;&nbsp;</span><span class="idemp"><input style="width: 200px; height: 30px;text-align: center;" id="tarjeta" type="text" name="noTarjeta" placeholder="xxxx-xxxx-xxxx-xxxx"/></span>
                                <center>
                                    <br>
                                    <span class="idemp">Mes de expiraci&oacute;n</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" id="mes" type="text" name="MesTajeta" placeholder="MM"/></span>
                                    <span class="idemp">Año de expiraci&oacute;n</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" id="año" type="text" name="anioTarjeta" placeholder="AAAA"/></span>
                                    <br><br>
                                    <span class="idemp">C&oacute;digo de seguridad</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" id="codseguridad" type="text" name="codSeguridad" placeholder="CVC"/></span> <br><br>
                                </center>
                                <span style="width: 100px">Nombre de tarjeta&nbsp;&nbsp;</span><span class="idemp"><input style="width: 200px; height: 30px;text-align:  center;"  id="nomtar" type="text" name="nomTarjeta" placeholder="Nombre"/></span>                               

                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" style="background-color: #9F150D" onclick="validamodalapagotarjeta()" class="btn btn-danger">Realizar pago</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../js/Ventas/VenGeneral.js"></script>
        <script src="../js/Ventas/VenValidaciones.js"></script>

    </body>
</html>
