<%-- 
    Document   : merma1
    Created on : 28/05/2018, 02:13:13 AM
    Author     : montse
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="pw.sap.db.ConsultasGenerales"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="pw.sap.db.Conexion"%>
<%@page import="pw.sap.pojo.Inventarios.Merma"%>
<%@page import="java.util.ArrayList"%>
<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Inventarios")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../../archivos/errorSesion.jsp");
        }
    }
%>
<html>
    <head>
        <title>Merma conocida</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/estilosMax.css" rel="stylesheet" type="text/CSS">
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/tablacliente.css">
       
        
        <script>
function EspecificaMC(){
            var coba = document.getElementById('CoBa');
            var IDMerma = document.getElementById('IDMerma');
            if (coba.length===0 && IDMerma.length===0){
            alert("Consulta vacia");
            }else{
            alert("Consultando"); 
        }
            }
        </script>
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
                            <a href="principal.jsp" class="nav-link text-white"  aria-haspopup="true" aria-expanded="false"><h4>Modulo<br>Inventario</h4></a>
                        </li>
                        <li class="nav-item">
                            <a href="principal.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_inicio.png" /><p>Inicio</p></a>
                        </li>
                        <li class="nav-item">
                            <a href="inventario_g.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_productos.png" /><p>Inventario</p></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link text-white dropdown-toggle"  data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false"><img class="ic"  border="0" height="25" width="25" src="../../archivos/img/ic_problema.png" /><p>Problemas de Producto</p></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="merma.jsp" style="color: white;">Merma</a><span class="sr-only"></span>
                                <a class="dropdown-item" href="Producto_Re.jsp" style="color: white;">Devoluciones</a><span class="sr-only">(current)</span>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link text-white dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_recibe.png" /><p>Recepci&oacute;n de productos</p></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="entradas.jsp" style="color: white;">Historial de Entradas</a>
                                <a class="dropdown-item" href="salidas.jsp" style="color: white;">Historial de Salidas</a>
                            </div>
                        </li>
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
        <!-- CONTENIDO-->
         <div class="container-fluid contenido">
            <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion izquierda -->
                <div class="form-style-5">
                    <center>
                       <h2>Merma conocida</h2>  
                    </center>
                   
                </div>
                <div class="form-style-5">
                    <form action="../Inventario/merma_con.jsp" method="GET">  
                            <span id="titulo"><span class="number">1</span> Consulta</span><br><br>
                            <span class="idemp"><input type="text" name="id_merma" id="id_merma" placeholder="Id de Merma"  maxlength="7" title="El id debe ser de 7 digitos (n&uacute;meros )" required ></span> <input type="submit" name="BuscaMID"  style="background-color: #9F150D" class="btn btn-danger" value="Consultar" onclick="return fomCon()"/><br><br>
                            <span id="titulo"><span class="number">2</span> Consulta especifica</span><br><br>
                            <center>
                            <button type="button" name="ConMC" data-toggle="modal" data-target="#ConsultaMC" style="background-color: #9F150D" class="btn btn-danger">Consulta Especifica</button><br>
                            </center>
                    </form>
                            <form action="../Inventario/merma1.jsp" method="POST">
                            <span id="titulo"><span class="number">3</span> Consulta General</span><br><br>
                            <input type="submit" name="ConsultaInG" style="background-color: #9F150D" class="btn btn-danger" value="Consultar">
                           </form>
                            
                    
                </div>
                <div class="form-style-5">
                    
                          
                            
                             <form method="POST" action="../../reporte_mermaC">

                            <span id="titulo"><span class="number">4</span> Reporte</span><br><br>
                            
                                
                             <input type="submit" value="Generar PDF" name="GP" style="background-color: #9F150D; width: 180px;" class="btn btn-danger"><br><br>
                             
                            </form>
                            
                            
                            <span id="titulo"><span class="number">5</span>Regresar</span><br><br>
                            <button type="button" name="Regresa" style="background-color: #9F150D" class="btn btn-danger" onclick="location.href='merma.jsp'">Regresar</button><br><br>
                    
                    </form>
                </div>

            </div>
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12"> <!-- Seccion central TABLA -->
                   <div class="table-responsive">
                            <table class="table table-striped">
                                    <thead>
                                       <tr>
                                            <th scope="col">ID Producto</th>
                                            <th scope="col">ID de merma</th>
                                            <th scope="col">Fecha de registro</th>
                                            <th scope="col">Tipo</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Observaciones</th>
                                            
                                        </tr>
                                    </thead>
                                    <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Inventarios.QuerysInventarios"/>
                                    <%
                                      
                                        ResultSet rsTabla = interTabla.ConsultaGM();

                                    %> 
                                    <tbody>
                                        <%
                                            while (rsTabla.next()) {
                                        %>
                                         <tr id="modalInter">
                                            <td><%=rsTabla.getString(1)%></td>
                                            <td><%=rsTabla.getString(2)%></td>
                                            <td><%=rsTabla.getString(3)%></td>
                                            <td><%=rsTabla.getString(4)%></td>
                                            <td><%=rsTabla.getString(5)%></td>
                                            <td><%=rsTabla.getString(6)%></td>
                                            
                                      
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                       
                        </div> 
                </div>
            </div>
            
            </div>  
         <!-- Modal Consulta especifica-->
        <div class="modal fade" id="ConsultaMC" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                  <h4 class="modal-title" id="myModalLabel">Consulta Espec&iacute;fica</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
                     <form method="GET" action="../Inventarios/merma_con.jsp" onsubmit="return EspecificaMC()"> 
                            <span id="titulo"><span class="number">1</span>Ingrese los Datos a consultar</span>
                            
                            
                            <br><br><span>Id de producto:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text" name="CoBa" id="CoBa" maxlength="13" placeholder="#######" pattern="[0-9]{13}" title="El id de producto debe ser de 13 digitos (n&uacute;meros)" required/></span>
                            <br><span>Fecha de merma:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" placeholder="dd/mm/aaaa" name="fecha_mer"  id="fecha_mer"  title="El formato de fecha debe ser 'dd/mm/aaaa'" required/></span><br><br>
                                
                             <br><br><button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" style="background-color: #9F150D" class="btn btn-danger" value="Continuar" id="BuscaEs" onsubmit="return EspecificaMC()"><br>
                    </form>
                </div>
              </div>
            </div>
          </div>
        </div>
               
 <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
           <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
           <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
  
