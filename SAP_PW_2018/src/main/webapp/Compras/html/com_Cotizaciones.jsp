<%@page import="pw.sap.servlets.Ventas.ListaProductos"%>
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
        <title>Cotizaciones</title>
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
                                <a class="dropdown-item" href="com_DevolP" style="color: white;">Devoluci&oacute;n Proveedor</a><span class="sr-only">(current)</span>
                            </div>
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link text-white"  data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false"><img class="ic"  border="0" height="25" width="25" src="../../archivos/img/ordenCompra.png" /><p class="dropdown-toggle">Orden de Compra</p></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="" style="color: white;">Orden de compra</a><span class="sr-only"></span>
                                <a class="dropdown-item" href="" style="color: white;">Cancelación Orden</a><span class="sr-only">(current)</span>
                            </div>
                        </li>
                        
                        <li class="nav-item">
                            <a href="" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/factura.png" /><p>Facturas</p></a>                        </li>
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
        
        <div class="container-fluid contenido">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion izquierda -->


                    <div class="form-style-5">
                        <form method="post">
                            <jsp:useBean id="idClient" scope="page" class="pw.sap.pojo.Ventas.QuerysVentas"/>
                            <jsp:useBean id="idInter" scope="page" class="pw.sap.pojo.Ventas.QuerysVentas"/>
                            <jsp:useBean id="idEmp" scope="page" class="pw.sap.pojo.Ventas.QuerysVentas"/>
                            <%
                                ResultSet rs = idClient.consultarIDEMP(); 
                                ResultSet rss = idInter.consultarIDInterm();
                                ResultSet remp = idEmp.consultarEmpleado(request.getSession().getAttribute("usuario").hashCode());
                                ListaProductos.ventList.clear();
                                ListaProductos.subtotalTotal_ov = 0;
                                ListaProductos.totalIva_ov = 0;
                                ListaProductos.TOTAL_ov = 0;

                            %>  
                            <span id="titulo"><span class="number">1</span> Informaci&oacute;n de cliente</span><br>
                            <span class="idemp"><input type="text" id="IDCliente" name="IDCliente" placeholder="ID Cliente"></span>
                            <button type="button" name="cargar" onclick="validaIDCliente(); this.form.action = '../ClienteID'" style="background-color: #3498DB" class="btn">Cargar</button><br>
                            <br><select id="nomEmp" name="nombreEmp">
                                <optgroup label="Empresa">
                                    <option value="emp1">Empresa</option>
                                    <%
                                        while(rs.next()){
                                    %>
                                    <option value="<%=rs.getString(1)%>"> <%=rs.getString(2)%> </option>
                                    <%
                                        }
                                    %>
                                </optgroup>
                            </select> 
                            <select id="nomInter" name="nombreEmp">
                                <optgroup label="Empresa">
                                    <option value="emp1">Intermediario</option>
                                    <%
                                        while(rss.next()){
                                    %>
                                    <option value="<%=rss.getString(1)%>"> <%=rss.getString(2)%> </option>
                                    <%
                                        }
                                    %>
                                </optgroup>
                            </select> 
                            <span id="titulo"><span class="number">2</span>Datos cotizaci&oacute;n</span><br><br>
                            <span >N&uacute;m. cotizaci&oacute;n</span><br><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" readonly="readonly" placeholder="001"/></span><br>

                            <span style="font-size: 18px">Fecha de cotizaci&oacute;n</span><br><span class="idemp"><input min="2010-01-01" style="width: 180px; height: 30px;text-align: center;" readonly="readonly" type="date" id="fecha1" name="fechaC" /></span><br>
                            <script>
                                document.getElementById('fecha1').value = new Date().toISOString().substring(0, 10);
                            </script>
                            <span style="font-size: 18px">Fecha de entrega</span><br><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" id="fecha2" name="fechaC" /></span>  <br>
                            <center><br><button type="button" name="vNeta" onclick="validaTablaCOT()" style="background-color: #3498DB" class="btn ">Mandar a venta neta</button><br>
                                <br><button type="button" name="vCred" onclick="validaTablaCOT()" style="background-color: #3498DB" class="btn ">Mandar a venta parcialidades</button><br>
                                <br><button type="button" name="vApart" onclick="validaTablaCOT()" style="background-color: #3498DB" class="btn ">Mandar a apart. de prod.</button><br></center>                   
                        </form>
                    </div>

                </div>

                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"><!-- Seccion central TABLA -->
                    <div class="table-responsive">
                        <div id="tablaProductos"></div>
                    </div> 
                </div>
          
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion derecha -->


                    <div class="form-style-5">

                        <form>

                            <span id="titulo"><span class="number">3</span>Vendedor</span><br> 
                             <% while(remp.next()){ %>
                            <br>ID VENDEDOR: <input type="text" name="nomVent" id="idVendedor" readonly="readonly" value="<%=request.getSession().getAttribute("usuario").hashCode()%>"></input> 
                            NOMBRE VENDEDOR<input type="text" name="nombreVent" readonly="readonly" placeholder="<%=remp.getString(1)%> <%=remp.getString(2)%>"></input> 
                            <% } %>
                            <center>
                                <button type="button" name="agregaProd" style="background-color: #3498DB" class="btn " id="btnModal" >Agregar producto</button><br>
                                <br><button type="button" name="EliminaProd" style="background-color: #3498DB" class="btn ">Eliminar producto</button><br>

                                <br><span id="titulo"><span class="number">4</span>Resultados</span><br>

                                <br><span >Subtotal&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Subtotal" id="subtotalOV" readonly="readonly" placeholder="$0000.00"/></span><br>

                                <br><span>IVA&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="IVA" id="totalIvaOV" readonly="readonly" placeholder="$0000.00"/></span>

                                <br><span>Descuento&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Descuento" readonly="readonly" placeholder="0%"/></span>

                                <br><span>TOTAL&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Total" id="totalOV" readonly="readonly" placeholder="$0000.00"/></span><br>


                                <br><button type="button" name="guardar" style="background-color: #3498DB" onclick="validaTablaCOT()" class="btn ">Guardar</button> <button type="button" name="cancelar" style="background-color: #3498DB" class="btn">Cancelar</button>
                            </center>
                        </form>
                    </div>

                </div>
            </div>

        </div>      

                                 <div class="modal fade" id="agregaProductos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Agregar producto</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
                    <form method="POST">
                            <span id="titulo"><span class="number">1</span>Añade</span>
                            
                            
                                <br><br><span>C&oacute;digo de producto:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" onkeypress="return searchKeyPress(event);" id="codprod" type="text" name="codprod" placeholder="###############"/></span>

                                <br><span >Cantidad:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" onkeypress="return cantOnPress(event);" id="cant" type="text" name="cant" placeholder="0"/></span>
                                <br><br>

                                <span id="titulo"><span class="number">2</span>Datos de producto</span>
                                <br><br>
                                <span id="nom">Nombre producto:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text"  name="nomProd" id="nomprod" readonly="readonly" placeholder="Nombre"/></span>
                                <br><br>
                                <span >Precio unitario:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="precioprod" id="precioprod" readonly="readonly" placeholder="$000.00"/></span>
                                <br><br>
                                <span>IVA:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="ivaprod" id="ivaprod" readonly="readonly" placeholder="$000.00"/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                                <span >Subtotal:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="subtotal" id="subtotal" readonly="readonly" placeholder="$000.00"/></span>
                    </form>        
                    
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" style="background-color: #3498DB" onclick="valAgrega() " class="btn">Agregar</button>
              </div>
            </div>
          </div>
        </div> 
        <div id="tmpModal"></div>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body> 
</html>