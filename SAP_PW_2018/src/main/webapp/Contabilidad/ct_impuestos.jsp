<%@page import="java.sql.ResultSet"%>
<%
   /* if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Contabilidad")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../archivos/errorSesion.jsp");
        }
    }
*/
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
            <div class="row">
                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 container-fluid" style="background-color: #f8f8f8;" ><!-- Seccion central (Visualizar tarea) -->

                    <div  class="row" style="height: 200px;">    
                        <img class="imagen" border="0" height="auto" width="50%" src="../archivos/img/img_logo_2.png" />
                    </div>                    
                    <br>
                </div>
               <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 container-fluid"><!-- Seccion derecha (Visualizar tarea) -->
                    <div class="row">
                        <br><br>
                    </div>
                     
                    <div class="row justify-content-center" style="background-color: #f8f8f8; margin-left: 10%; margin-right: 10%;" >
                        <h2 class="titulos text-center" style="width: 100%;">Impuestos a aplicar</h2>  
                        <br> 
                        <form action="ct_impuestos2.jsp" method="POST">
                          <div  class="row" style="margin-left: 5%; margin-right: 5%;"> 
                              <jsp:useBean id="tabla" scope="page" class="pw.sap.pojo.Contabilidad.Impuestos"/>
                                <%
                                                                       
                                    ResultSet rsTabla = tabla.Consulta();

                                %> 
                              <br> <br>
                              <%                                           
                                  while (rsTabla.next()) {                                      
                                      
                              %>
                        <div class="row">
                            <label class="form-check-label col-lg-4 col-md-4 col-sm-4 col-xs-4">IVA:</label> 
                            <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text" disabled="disable" placeholder="<%=rsTabla.getString(2)%>" name="iva2" id="PorcenMerm" style="width: 100%;">
                        </div>
                        <div class="row"> 
                            <br>
                        </div>
                        <div class="row">
                             <label class="form-check-label col-lg-4 col-md-4 col-sm-4 col-xs-4"> IEPS:</label>
                             <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text" disabled="disable" placeholder="<%=rsTabla.getString(3)%>" name="ieps2" id="PorcenDevo" style="width: 100%;"> 
                        </div>
                        <div class="row"> 
                            <br>
                        </div>
                              <div class="row">
                            <label class="form-check-label col-lg-4 col-md-4 col-sm-4 col-xs-4">ISR:</label> 
                            <input class="form-control col-lg-4 col-md-4 col-sm-4 col-xs-4" type="text" disabled="disable" placeholder="<%=rsTabla.getString(4)%>" name="isr2" id="PorcenMerm" style="width: 100%;">
                        </div>
                        <%
                                        }
                        %>
                        <div class="row"> 
                            <br>
                        </div>
                              
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-4"><br></div>
                        
                                                    
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-4">
                            
                                    <input class="btn btn-secondary form-control" id="buscar" name="modi_imp" type="submit" value="Modificar">
                                                            
                        </div>                        
                        <div class="row"> 
                            <br>
                        </div>
                    </div> </form>
                    </div> 
                </div>
            </div>
        </div>

    </body>
</html>
