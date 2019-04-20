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
        <title>Principal</title>
        <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" integrity="sha256-CfcERD4Ov4+lKbWbYqXD6aFM9M51gN4GUEtDhkWABMo=" crossorigin="anonymous"></script>
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
            
            <div class="row justify-content-center">
                
                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 container-fluid" style="background-color: #f8f8f8;" ><!-- Seccion central (Visualizar tarea) -->

                    <div  class="row" style="height: 200px;">    
                        <img class="imagen" border="0" height="auto" width="50%" src="../../archivos/img/img_logo_2.png" />
                    </div>
                    <div class="row" style="margin-left: 5%; margin-right: 5%;">
                        <input class="text-center form-control" type="text" id="fecha" size="6"  style="width:100%;" disabled>
                    </div>
                    
                    <br>
                    
                    <div>
                        <div><table>
                                
                                        <thead>
                                            <tr>
                                                <th class="bg-info" scope="col" style="text-align: center">total productos</th>
                                            </tr>
                                        </thead>
                                        <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Compras.PagPrinc"/>
                                    <%
                                        ResultSet rsTabla = interTabla.prinProd();
                                    %> 
                                    <tbody>
                                        <%
                                            while (rsTabla.next()) {
                                        %>
                                        <tr id="modalInter">
                                            <td class="table-success" style="text-align: center"><%=rsTabla.getString(1)%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                        
                                </table>
                                
                            </div>
                                    
                                    <br>
                                    <div><table>
                                
                                        <thead>
                                            <tr>
                                                <th class="bg-info" scope="col" style="text-align: center">total Proveedores</th>
                                            </tr>
                                        </thead>
                                        <jsp:useBean id="interTablaP" scope="page" class="pw.sap.pojo.Compras.PagPrinc"/>
                                    <%
                                        ResultSet rsTablaP = interTablaP.prinProv();
                                    %> 
                                    <tbody>
                                        <%
                                            while (rsTablaP.next()) {
                                        %>
                                        <tr id="modalInter">
                                            <td class="table-success" style="text-align: center"><%=rsTablaP.getString(1)%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                        
                                </table>
                                
                            </div>
                                    <br>
                                    <div><table>
                                
                                        <thead>
                                            <tr>
                                                <th class="bg-info" scope="col" style="text-align: center">total Ordenes de Compra</th>
                                            </tr>
                                        </thead>
                                        <jsp:useBean id="interTablaOC" scope="page" class="pw.sap.pojo.Compras.PagPrinc"/>
                                    <%
                                        ResultSet rsTablaOC = interTablaP.prinOC();
                                    %> 
                                    <tbody>
                                        <%
                                            while (rsTablaOC.next()) {
                                        %>
                                        <tr id="modalInter">
                                            <td class="table-success" style="text-align: center"><%=rsTablaOC.getString(1)%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                        
                                </table>
                                
                            </div>
                                    <br> 
                                    <div><table>
                                
                                        <thead>
                                            <tr>
                                                <th class="bg-info" scope="col" style="text-align: center">total Facturas</th>
                                            </tr>
                                        </thead>
                                        <jsp:useBean id="interTablaF" scope="page" class="pw.sap.pojo.Compras.PagPrinc"/>
                                    <%
                                        ResultSet rsTablaF = interTablaF.prinFac();
                                    %> 
                                    <tbody>
                                        <%
                                            while (rsTablaF.next()) {
                                        %>
                                        <tr id="modalInter">
                                            <td class="table-success" style="text-align: center"><%=rsTablaF.getString(1)%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                        
                                </table>
                                
                            </div>
                                    
                        </div>
                    
                </div>
                
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 container-fluid"><!-- Seccion derecha (Visualizar tarea) -->
                    
                    <br>
                    
                    <div class="row justify-content-center" style="background-color: #f8f8f8; margin-left: 10%; margin-right: 10%;" >
                        <h2 class="titulos text-center" style="width: 100%;">Estadísticas </h2>  
                        <br>
                        <canvas id="gCompras" width="100%" height="30px"></canvas>
                        <br>
                        <script type="text/javascript" src="../graficasC/graficaCompras.js"></script>
                    </div>
                </div>
                
            </div>
            
        </div>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body> 
</html>