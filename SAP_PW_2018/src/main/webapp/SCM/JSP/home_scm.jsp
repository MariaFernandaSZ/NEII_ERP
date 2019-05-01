<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("SCM")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../../archivos/errorSesion.jsp");
        }
    }
%>
<html>
    <head>
        <title>Principal SCM</title>
        <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" integrity="sha256-CfcERD4Ov4+lKbWbYqXD6aFM9M51gN4GUEtDhkWABMo=" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../../css/laterales.css" rel="stylesheet" type="text/CSS">
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
                            <a href="home_scm.jsp" class="nav-link text-white"  aria-haspopup="true" aria-expanded="false"><h4>Modulo<br>SCM</h4></a>
                        </li>
                        
                        <li class="nav-item">
                            <a href="Pedidos.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_area_producto.png" /><p>Pedidos</p></a>                        </li>
                        
                        <li class="nav-item">
                            <a href="Ventas.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_agenda_grande.png" /><p>Ventas</p></a>                        </li>
                        
                        
                        <li class="nav-item">
                            <a href="mayorista.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_area_terceros.png" /><p>Mayoristas</p></a>                        </li>
                        
                        <li class="nav-item">
                            <a href="minorista.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_area_comercial.png" /><p>Minoristas</p></a>                        </li>
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
                        
                        <div id="titulo" class="col-12">
                                <span class="number">1</span>Recibiendo pedidos</div>
                            <br>
                            
                        <div class="table-responsive"><table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">id requisición</th>
                                            <th scope="col">cantidad</th>
                                            <th scope="col">fecha</th>
                                            
                                        </tr>
                                    </thead>
                                    <jsp:useBean id="interTabla" scope="page" class="pw.scm.pojo.QuerySCM"/>
                                    <%
                                        
                                        ResultSet rsTabla = interTabla.consultaRequisicion();

                                    %> 
                                    <tbody>
                                        <%
                                            while (rsTabla.next()) {
                                        %>
                                        <tr id="modalInter">
                                            <td><%=rsTabla.getString(1)%></td>
                                            <td><%=rsTabla.getString(2)%></td>
                                            <td><%=rsTabla.getString(3)%></td>
                                            
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table></div> 
                                    <br>
                                    
                                    
                                    <div id="titulo" class="col-12">
                                <span class="number">2</span>Ventas</div>
                            <br>
                            
                        <div class="table-responsive"><table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">id venta</th>
                                            <th scope="col">total pago</th>
                                            <th scope="col">descripcion</th>
                                            
                                        </tr>
                                    </thead>
                                    <jsp:useBean id="interTablaV" scope="page" class="pw.scm.pojo.QuerySCM"/>
                                    <%
                                        
                                        ResultSet rsTablaV = interTablaV.consultaVenta();

                                    %> 
                                    <tbody>
                                        <%
                                            while (rsTablaV.next()) {
                                        %>
                                        <tr id="modalInter">
                                            <td><%=rsTablaV.getString(1)%></td>
                                            <td><%=rsTablaV.getString(2)%></td>
                                            <td><%=rsTablaV.getString(3)%></td>
                                            
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table></div> 
                                    <br>
                        
                    </div>                       


                    <div style="background-color: #f4f7f8;" class="col-lg-6 col-md-6 col-sm-6 col-xs-12 form-style-5"><!-- Seccion central --> 
                        
                        <div id="titulo" class="col-12">
                                <span class="number">3</span>Inventario</div>
                            <br>
                            
                        <div class="table-responsive"><table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">id producto</th>
                                            <th scope="col">nombre</th>
                                            <th scope="col">tipo de producto</th>
                                            <th scope="col">cantidad</th>
                                            <th scope="col">mínimo</th>
                                            <th scope="col">máximo</th>
                                            
                                        </tr>
                                    </thead>
                                    <jsp:useBean id="interTablaProd" scope="page" class="pw.scm.pojo.QuerySCM"/>
                                    <%
                                        
                                        ResultSet rsTablaProd = interTablaProd.consultaInventario();

                                    %> 
                                    <tbody>
                                        <%
                                            while (rsTablaProd.next()) {
                                        %>
                                        <tr id="modalInter">
                                            <td><%=rsTablaProd.getString(1)%></td>
                                            <td><%=rsTablaProd.getString(2)%></td>
                                            <td><%=rsTablaProd.getString(3)%></td>
                                            <td><%=rsTablaProd.getString(4)%></td>
                                            <td><%=rsTablaProd.getString(5)%></td>
                                            <td><%=rsTablaProd.getString(6)%></td>
                                            
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table></div>
                        
                    </div>

                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12 form-style-5"><!-- Seccion derecha -->
                        
                        
                        <div id="titulo" class="col-12">
                                <span class="number">4</span>Merma</div>
                            <br>
                            
                        <div class="table-responsive"><table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">id merma</th>
                                            <th scope="col">cantidad</th>
                                            <th scope="col">motivo</th>
                                            
                                            
                                        </tr>
                                    </thead>
                                    <jsp:useBean id="interTablaProdM" scope="page" class="pw.scm.pojo.QuerySCM"/>
                                    <%
                                        
                                        ResultSet rsTablaProdM = interTablaProdM.consultaMerma();

                                    %> 
                                    <tbody>
                                        <%
                                            while (rsTablaProdM.next()) {
                                        %>
                                        <tr id="modalInter">
                                            <td><%=rsTablaProdM.getString(1)%></td>
                                            <td><%=rsTablaProdM.getString(2)%></td>
                                            <td><%=rsTablaProdM.getString(3)%></td>
                                                                                        
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table></div>
                    </div> 
                        
                </div>
            </div> 
        </div>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body> 
</html>