<%@page import="java.sql.ResultSet"%>
<%@page import="pw.sap.pojo.Contabilidad.LibroDiario"%>
<%@page import="pw.sap.obj.Contabilidad.ObjLibroDiario"%>
<%@page import="java.util.LinkedList"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Contabilidad</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilos.css" type="text/css">
        <link href="../css/laterales.css" rel="stylesheet" type="text/css"/>
        <link href="../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../js/Contabilidad/validacion.js" type="text/javascript"></script>
        <link href="../css/estilosMax.css" rel="stylesheet" type="text/css"/>
        <script src="../js/Contabilidad/modales.js"    type="text/javascript"></script>
    </head>
    <body>
         <header class="sticky-top">
            <!--barra de navegacion creada con bootstrap-->
            <nav id="barraNavegadora" class="navbar navbar-expand-lg colorPrincipal" >
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav mr-auto">                    
                        <li class="nav-item">
                            <a href="ct_index.jsp" class="nav-link text-white"  aria-haspopup="true" aria-expanded="false"><h3>Contabilidad</h3></a>
                        </li>
                        <li class="nav-item">
                            <a href="ct_index.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_inicio.png" /><p>Inicio</p></a>
                        </li>
                        <li class="nav-item">
                            <a href="ct_impuestos.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_financiera.png" /><p>Impuestos</p></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               <img class="ic"  border="0" height="25" width="25" src="../archivos/img/ic_comercial.png" /> Libros
                            </a>
                            <div class="dropdown-menu" id="submenu">
                                <a class="nav-link text-white color" href="ct_libro_diario.jsp">Diario<span class="sr-only">(current)</span></a>
                                <a class="nav-link text-white color" href="ct_libro_mayor.jsp">Mayor<span class="sr-only">(current)</span></a>
                            </div>
                        </li>
                          <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               <img class="ic"  border="0" height="25" width="25" src="../archivos/img/ic_terceros.png" /> Aprobaciones
                            </a>
                            <div class="dropdown-menu" id="submenu">
                                <a class="nav-link text-white color" href="ct_ventas.jsp">Nóminas<span class="sr-only">(current)</span></a>
                                <a class="nav-link text-white color" href="ct_prov.jsp">Compras<span class="sr-only">(current)</span></a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a href="plan_cuentas.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_miembros.png" /><p>Cuentas</p></a>
                        </li>
                    </ul> 
                </div>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="ayuda.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_ayuda.png" /><p>Ayuda</p></a>                       
                    </li>
                    <li class="nav-item">
                        <a href="../../CerrarSesion" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_salir.png" /><p>Salir</p></a>                       
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
                      <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12"> <!-- Seccion izquierda -->
                         
                        <center> <img class="imagen" border="0" height="auto" width="50%" src="../archivos/img/img_logo_2.png" /> </center>
                      
                        <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 container-fluid">
                            <br>
                            <span id="titulo"><h4>Libro diario</h4></span> <br>
                            <form action="ct_libro_diario_1.jsp" method="POST">
                                <div class="row">
                                    <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                                        M&oacute;dulo:
                                    </div>
                                    <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                                        <select name="modulo1" id="modulo1">
                                            <option value="x">Selecciona...</option>
                                            <option value="0">Todos</option>
                                            <option value="1">Compras</option>
                                            <option value="2">Ventas</option>
                                            <option value="3">Nóminas</option>
                                        </select>
                                    </div>    
                                </div>
                                <br>
                                <div class="row">                                
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                    
                                    <input class="btn btn-secondary form-control" id="filtro" name="filtro" type="submit" 
                                          style="background-color: #818B9F" value="Mostrar">                                  
                                    </div>      
                                </div> 
                            </form>   
                        </div> 
                    </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 container-fluid"><!-- Seccion central -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Cuenta</th>
                                    <th>Folio</th>
                                    <th>Fecha</th>
                                    <th>Tipo</th>
                                    <th>Módulo</th>
                                    <th>Monto</th>
                                    <th>Descripción</th>
                                </tr>                     
                            <jsp:useBean id="tabla" scope="page" class="pw.sap.pojo.Contabilidad.LibroDiario"/>
                                <%
                                    String mod= request.getParameter("modulo1");
                                    
                                    ResultSet rsTabla = tabla.ConsultaDev(mod);

                                %> 
                                <tbody>
                                    <%                                            while (rsTabla.next()) {
                                    %>
                                    <tr id="modalInter">
                                        <td><%=rsTabla.getString(1)%></td>
                                        <td><%=rsTabla.getString(2)%></td>
                                        <td><%=rsTabla.getString(3)%></td>
                                        <td><%=rsTabla.getString(4)%></td>
                                        <td><%=rsTabla.getString(5)%></td>
                                        <td><%=rsTabla.getString(6)%></td>
                                        <td><%=rsTabla.getString(7)%></td>

                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>                  

                            </table> 
                            <br/>
                            <form action="../LibroDiarioPdf" method="post" onsubmit="return libroPDF();">
                                <center>
                                    <input class="btn btn-secondary " style="background-color: #818B9F" type="submit" value="Exportar pdf" />
                                </center>
                            </form>
                        </div>
                    </div>    
                </div>
            </div> 
        </div>
    </body>
</html>

