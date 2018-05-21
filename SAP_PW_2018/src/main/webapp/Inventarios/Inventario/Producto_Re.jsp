<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Devoluciones</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/tablacliente.css">
        <script src="../js/general.js" type="text/javascript"></script>
        <script>
            function fecha(){
            var valor = document.getElementById('fechaDev');
            var fecha = new Date();
            var dia;
            var mes;
            if (fecha.getDate() < 10){dia = '0' + fecha.getDate(); } else{dia = fecha.getDate(); }
            if (fecha.getMonth() + 1 < 10){mes = '0' + (fecha.getMonth() + 1); } else{mes = fecha.getMonth() + 1; }
            valor.value = (dia + '/' + mes + '/' + fecha.getFullYear());
            document.getElementById('fechaDev').innerHTML = valor.value;
            }
            function InsertarDev(){
            alert("Se han insertado los datos correctamente");
            }
            function ModificarDev(){
            alert("Se han modificado los datos correctamente");    
            }
            function EliminarDev(){
            alert("Se han eliminado los datos correctamente");    
            }
            function EspecificaDev(){
            var coba = document.getElementById('CoBa');
            var IDDevolucion = document.getElementById('IDDevolucion');
            var IDOrdenCom = document.getElementById('IDOrdenCom');
            if (coba.length===0 && IDDevolucion.length===0 && IDOrdenCom.length===0){
            alert("Consulta vacia");
            }else{
            alert("Consultando"); 
        }
            }
        </script>

    </head>
    <body onload="fecha();">

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
                        <a class="nav-link" href="../../index.jsp" style="color: white">Salir</a>                                
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
                       <h4>Devoluciones</h4>  
                    </center>
                   
                </div>

                <div class="form-style-5">
                    <form action="../../Producto_Re.jsp" method="POST">
                        
                            <span id="titulo"><span class="number">1</span> Consultar registro</span><br><br>
                            <br><span class="idemp"><input type="text" name="CoBa" id="CoBa" placeholder="Id de producto" required="required" maxlength="13" pattern="[0-9]{13}"title="El ide de producto debe ser de 13 digitos numericos)"/></span> <input type="submit" name="BuscaM" id="BuscaM" style="background-color: #9F150D" class="btn btn-danger" value="Consultar"/><br><br>
                            <span id="titulo"><span class="number">2</span> Consulta especifica de registro</span><br><br>
                            <center>
                            <button type="button" name="ConEs" data-toggle="modal" data-target="#ConsultaEsp" style="background-color: #9F150D" class="btn btn-danger">Consulta Especifica</button><br>
                            </center>
                            </form>
                    </div>
                 <div class="form-style-5">
                       <form action="../../Eliminar_Devolucion" method="POST" onsubmit="return EliminarDev()">
                            <span id="titulo"><span class="number">3</span>Eliminar registro</span><br><br>
                            
                            <span class="idemp"><input type="text" name="IDDev" id="IDDevolucion" placeholder="ID de Devoluci&oacute;n" pattern="[0-9]{7}" maxlength="7" required="required" title="El id de devoluci&oacute;n debe ser de 7 digitos numericos)"/></span> <input type="submit" name="EliminaM" id="EliminaM" style="background-color: #9F150D" class="btn btn-danger" value="Eliminar" onsubmit="return EliminaDev()"/><br><br>
                            <span id="titulo"><span class="number">4</span>Registro de producto rechazado</span><br><br> 
                            <center>
                            <button type="button" name="agregaProd" data-toggle="modal" data-target="#agregaProductos" style="background-color: #9F150D" class="btn btn-danger">Agregar producto</button><br>
                            </center>
                    </form>
                     
                </div>
                <div class="form-style-5">
                    <form>

                            <span id="titulo"><span class="number">5</span>Imprimir</span><br><br>
                            
                           <button type="button" name="GP" style="background-color: #9F150D; width: 180px;" class="btn btn-danger" onclick="window.location='../imagenes/Pro_Re.pdf'">Generar PDF</button><br><br>
                           <button type="button" name="GE" style="background-color: #9F150D; width: 180px;" class="btn btn-danger" onclick="window.location='../imagenes/Pro_RE.ods'">Generar Excel</button><br><br>
                           

                    </form>
                </div>

            </div>

                

            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12"><!-- Seccion central TABLA -->
            <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Id orden de compra</th>
                                    <th>Id orden de producto</th>
                                    <th>Id de devoluci&oacute;n</th>
                                    <th>Cantidad devuelta</th>
                                    <th>Fecha de devoluci&oacute;n</th>
                                    <th>Motivo</th>
                                    
                                  
                                </tr>
                                <tr>
                                    
                                <td><%= request.getAttribute("id_ordencompra")%></td>
                                <td><%= request.getAttribute("id_producto")%></td>
                                <td><%= request.getAttribute("id_devolucion")%></td>
                                <td><%= request.getAttribute("canitidad_devuelta")%></td>
                                <td><%= request.getAttribute("fecha_devolucion")%></td>
                                <td><%= request.getAttribute("motivo")%></td>
                               
                                   </tr>
                            </table>    
                        </div>        
            </div>
            </div>  
            </div>
            
          
        
        
        
         <!-- Modal AGREGAR PRODUCTOS-->
        <div class="modal fade" id="agregaProductos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Agregar producto</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
                    <
                            <form method="POST" action="../../insertar_devolucion" onsubmit="return InsertarDev()">
                        <span id="titulo"><span class="number">1</span>Inserte el C&oacute;digo de Barras del producto a insertar (Nota: El id debe ser existente)</span><br>
                            
                        <span>Id de producto:&nbsp;&nbsp;</span><span><input  type="text" name="CoBa" id="CoBa" placeholder="##########" maxlength="13" pattern="[0-9]{13}" title="El id de producto debe ser de 13 digitos numericos" required="required"/></span>
                        <span id="titulo"><span class="number">2</span>Inserte Datos</span><br>
                        <span >Cantidad devuelta:&nbsp;&nbsp;</span><span><input type="number" name="cantidadDev" id="cantidadDev" placeholder="1" min="1" max="9999999" pattern="[0-9]{1,9999999}" title="La cantidad devuelta debe contener almenos 1 producto (campo n&uacute;merico)" required="required"/></span>
                        <span >Fecha de devoluci&oacute;n:&nbsp;&nbsp;</span><span><input type="text" id="fechaDev" name="fechaDev" disabled="disabled"/></span>
                        <span >Motivo:&nbsp;&nbsp;</span><span><input type="text" name="motivo" id="motivo" placeholder="Descripci&oacute;n" required="required" maxlength="250" pattern="[A-Za-z0-9]{1,250}" title="El motivo debe contener de 1 a 250 car&aacute;cteres (n&uacute;meros y letras))"/></span>
                        <br><br><button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="submit" value="Agregar" style="background-color: #9F150D" class="btn btn-danger" onsubmit="return InsertarDev() location.href='Producto_Re.jsp'"/>
                    </form>
                </div>
              </div>
            </div>
          </div>
        </div>
       
                <!-- Modal Busqueda Especifica-->
                <div class="modal fade" id="ConsultaEsp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                  <h4 class="modal-title" id="myModalLabel">Consulta Espec&iacute;fica</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
                    <form method="POST" action="../../DevolucionesConsulta_G" onsubmit="return EspecificaDev()">
                            <span id="titulo"><span class="number">1</span>Elige e ingresa los datos de los registros que desea consultar</span>
                            
                            
                            <br><br><span>ID de producto:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text" name="CoBa" id="CoBa" placeholder="##########" maxlength="13" pattern="[0-9]{13}" title="El id de producto debe ser de 13 digitos numericos" required/></span>
                            <br><br><span>ID de devoluci&oacute;n:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text" name="IDDevolucion" id="IDDevolucion" placeholder="##########" maxlength="7" pattern="[0-9]{7}" title="El id de devoluci&oacute;n debe ser de 7 digitos numericos" required/></span>
                            <br><br><span>ID de orden de compra:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text" name="IDOrdenCom" id="IDOrdenCom" placeholder="##########" maxlength="7" pattern="[0-9]{7}" title="El id de orden de compra debe ser de 7 digitos numericos" required/></span>
                            <br><br><button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="submit" style="background-color: #9F150D" class="btn btn-danger" value="Continuar" id="BuscaEs"><br>
                    </form>
                </div>
              </div></div>
          </div>
        </div>
            

         <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
           <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
           <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
