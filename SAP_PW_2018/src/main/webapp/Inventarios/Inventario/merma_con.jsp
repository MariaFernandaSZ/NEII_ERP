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
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        
        
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
        <header style="z-index: 2">
            <nav class="navbar navbar-expand-lg navbar-light menu" style="background-color: #9F150D;">
                <a class="navbar-brand" style="color: white;" href="#">Inventario</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="principal.jsp" style="color: white"> Principal</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="inventario_g.jsp" style="color: white"> Inventario</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Problemas de Producto
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                                <a class="dropdown-item" href="merma.jsp">Merma</a><span class="sr-only"></span>
                                <a class="dropdown-item" href="Producto_Re.jsp">Devoluciones</a><span class="sr-only">(current)</span>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Recepci&oacute;n de productos
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="entradas.jsp" >Historial de Entradas</a>
                                <a class="dropdown-item" href="salidas.jsp" >Historial de Salidas</a>
                                </di>
                                <li class="nav-item">
                                    <a class="nav-link" href="ayuda.jsp" style="color: white">Ayuda(?)</a>
                                </li>
                    </ul>
                    <li class="nav-item">
                        <a id="btn_gerencia" class="nav-link" href="../../Gerencia/IG/ig_inicio.jsp" style="color: white">Gerencia</a>                                
                        <script src="../../js/gerencia.js"></script>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../../CerrarSesion" style="color: white">Salir</a>                                
                    </li>
                </div>
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
                    <form action="../../Consulta_Merma" method="POST">  
                            <span id="titulo"><span class="number">1</span> Consulta</span><br><br>
                            <span class="idemp"><input type="text" name="id_merma" id="id_merma" placeholder="Id de Merma"  maxlength="7" title="El id debe ser de 7 digitos (n&uacute;meros )" required ></span>
                            <input type="submit" name="BuscaMID"  style="background-color: #9F150D" class="btn btn-danger" value="Consultar" onclick="return fomCon()"/><br><br>
                    </form>
                    <form action="merma_con.jsp" method="POST">
                            <span id="titulo"><span class="number">2</span> Consulta General</span><br><br>
                            <center>
                           <input type="submit" name="General"  style="background-color: #9F150D" class="btn btn-danger" value="Consulta General"/><br><br></center>
                    </form>
                </div>
                <div class="form-style-5">
                    <form>
                            <span id="titulo"><span class="number">3</span>Reporte</span><br><br>
                            
                            <button type="button" name="GP" style="background-color: #9F150D; width: 180px;" class="btn btn-danger" onclick="window.location='../imagenes/Merma Conocida.pdf'">Generar PDF</button><br><br>
                            <button type="button" name="GE" style="background-color: #9F150D; width: 180px;" class="btn btn-danger" onclick="window.location='../imagenes/Merma Conocida.ods'">Generar Excel</button><br><br>
                            <span id="titulo"><span class="number">4</span>Regresar</span><br><br>
                            <button type="button" name="Regresa" style="background-color: #9F150D" class="btn btn-danger" onclick="location.href='merma.jsp'">Regresar</button><br><br>
                    
                    </form>
                </div>

            </div>
                

            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12"> <!-- Seccion central TABLA -->
                   <div class="table-responsive">
                            <table class="table table-bordered table-responsive">
                                <tr>
                                    <th>ID de producto</th>
                                    <th>ID de merma</th>
                                    <th>Fecha de registro</th>
                                    <th>Tipo</th>
                                    <th>Cantidad</th> 
                                    <th>Observaciones</th>
                                </tr>
                                <%
                                  //      LinkedList <Merma> lista =ConsultasGenerales.consultaGMermac();
                                    //    for (int i=0;i<lista.size();i++)
                                      //  {
                                        //   out.println("<tr>");                               
                                          // out.println("<td>"+lista.get(i).getId_producto()+"</td>");
                                           //out.println("<td>"+lista.get(i).getIDMerma()+"</td>");
                                           //out.println("<td>"+lista.get(i).getFechaRe()+"</td>");
                                           //out.println("<td>"+lista.get(i).getTipo()+"</td>");
                                           //out.println("<td>"+lista.get(i).getCantidad()+"</td>"); 
                                           //out.println("<td>"+lista.get(i).getObs()+"</td>");
                                           //out.println("</tr>");
                                        //}
                                    %>
                              
                            </table>    
                        </div>          
                
            </div>
                </div>
               
 <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
           <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
           <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
