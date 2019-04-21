<%@page import="java.sql.ResultSet"%>
<%
    /*if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Contabilidad")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../archivos/errorSesion.jsp");
        }
    }*/
%>
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
        <script src="../js/Contabilidad/modales.js"    type="text/javascript"></script>
        <link href="../css/estilosMax.css" rel="stylesheet" type="text/css"/>
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
                         <li class="nav-item">
                            <a href="ct_calendario.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../archivos/img/ic_terceros.png" /><p>Calendario Contable</p></a>
                        </li>
                          <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               <img class="ic"  border="0" height="25" width="25" src="../archivos/img/ic_miembros.png" /> Cuentas
                            </a>
                            <div class="dropdown-menu" id="submenu">
                                <a class="nav-link text-white color" href="ct_ventas.jsp">Clientes<span class="sr-only">(current)</span></a>
                                <a class="nav-link text-white color" href="ct_prov.jsp">Proveedores<span class="sr-only">(current)</span></a>
                            </div>
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
                            <form action="ct_ventas2.jsp" method="POST">
                            <span id="titulo"><h4>Cuentas Clientes</h4></span> <br>                            
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                        N° de Cuenta:
                                    </div>
                                   <input type="number" class="form-control col-lg-6 col-md-6 col-sm-6 col-xs-6" name="id_cuenta" id="id_cuenta" style="width: 100%;" required >   
                                </div>
                                <br>
                                <div class="row">                                
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                    
                                    <input class="btn btn-secondary form-control" id="filtro" name="filtro" type="submit" 
                                          style="background-color: #818B9F" value="Mostrar">                                  
                                    </div>      
                                </div>                                
                        </div> 
                            </form>
                    </div>
                    </div>
                    
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 container-fluid"><!-- Seccion central -->
                        <div class="row justify-content-center" style="background-color: #f8f8f8; margin-left: 10%; margin-right: 10%;" >
                        <h2 class="titulos text-center" style="width: 100%;">Calendario</h2>  
                        <br>
                        <div class="table-responsive">
                            <table class="table table-bordered">                                
                                <tr>
                                   <th>Cuenta</th>
                                    <th>Clave cliente</th>
                                    <th>Banco</th>
                                    <th>CVC</th>
                                    <th>Fecha expiración</th>
                                </tr>  
                                <jsp:useBean id="tabla" scope="page" class="pw.sap.pojo.Contabilidad.C_cuentas"/>
                                <%
                                                                       
                                    ResultSet rsTabla = tabla.Consultacuenta();

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
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>  
                                
                            </table> 
                            <br/>
                        </div>
                        </div>
                    </div>   
                 
                               
                  <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><!-- Seccion derecha -->
                         <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 container-fluid">
                            <br>
                            <form action="../insertar_cuencli" method="POST">
                            <span id="titulo"><h4>Agregar Cuenta</h4></span> <br>                            
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                        N° de Cuenta:
                                    </div>
                                   <input type="number" class="form-control col-lg-6 col-md-6 col-sm-6 col-xs-6" name="newcuencli" id="newcuencli" style="width: 100%;" required >   
                                </div>
                                <br>
                                 <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                        Clave Cliente:
                                    </div>
                                   <input type="number" class="form-control col-lg-6 col-md-6 col-sm-6 col-xs-6" name="cliclave" id="cliclave" style="width: 100%;" required >   
                                </div>
                                <br>
                                 <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                        Banco:
                                    </div>
                                 <select class="form-control" name="bancocli" id="bancocli">
                            <optgroup label="Seleccionar">
                                <option value="x">Seleccionar</option>
                                <option value="HSBC">HSBC</option>
                                <option value="Santander">Santander</option>
                                <option value="Banorte">Banorte</option>
                                <option value="Bancomer">Bancomer</option>  
                            </optgroup>
                        </select>
                                </div>
                                <br>
                                 <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                        Fecha Vencimiento:
                                    </div>
                                   <input type="date" class="form-control col-lg-6 col-md-6 col-sm-6 col-xs-6" name="fechvencli" id="fechvencli" style="width: 100%;" required >   
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                        CVC:
                                    </div>
                                   <input type="number" class="form-control col-lg-6 col-md-6 col-sm-6 col-xs-6" name="cvccli" id="cvccli" style="width: 100%;" required >   
                                </div>
                                <br>
                                <div class="row">                                
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                    
                                    <input class="btn btn-secondary form-control" id="filtro" name="filtro" type="submit" 
                                          style="background-color: #818B9F" value="Agregar">                                  
                                    </div>      
                                </div>                                
                        </div> 
                            </form>
                    </div>
                    </div>                  
                </div>
            </div> 
        </div>
    </body>
</html>
