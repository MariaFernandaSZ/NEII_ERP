<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Historial de Entradas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/tablacliente.css">
        <script src="../js/validaciones.js"></script>
        <script>
            function fecha(){
            var valor = document.getElementById('fechaEnt');
            var fecha = new Date();
            var dia;
            var mes;
            if (fecha.getDate() < 10){dia = '0' + fecha.getDate(); } else{dia = fecha.getDate(); }
            if (fecha.getMonth() + 1 < 10){mes = '0' + (fecha.getMonth() + 1); } else{mes = fecha.getMonth() + 1; }
            valor.value = (dia + '/' + mes + '/' + fecha.getFullYear());
            document.getElementById('fechaEnt').innerHTML = valor.value;
            }
            function InsertarEnt(){
            var fechaEnt = document.getElementById('fechaEnt');
            var fechaCad = document.getElementById('fechaCad');
            if (fechaEnt<fechaCad){
             alert("Fecha de caducidad debe ser mayor que la de entrada");   
            }else{
            alert("Se han insertado los datos correctamente");
            }
        }
           
            function EspecificaEnt(){
            var coba = document.getElementById('CoBa');
            var IDEnt = document.getElementById('IDEnt');
            var IDOrdenCom = document.getElementById('IDOrdenCom');
            var TipoPro = document.getElementById('TipoPro');
            if (coba.length===0 && IDEnt.length===0 && IDOrdenCom.length===0 && TipoPro.length===0){
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
                                </div>
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
                            <h4>Entradas</h4>  
                        </center>

                    </div>

                    <div class="form-style-5">
                        <form action="../../Consulta_Entradas" method="POST">

                            <span id="titulo"><span class="number">1</span> Consultar registro</span><br><br>
                            <br><span class="idemp"><input type="text" name="IDEntrada" id="IDEntrada" placeholder="Id_Entrada" required="required" pattern="[0-9]{7}" maxlength="7" title="El id_entrada debe ser de 7 digitos (n&uacute;meros))"/></span> <input type="submit" name="BuscaM" id="BuscaM" style="background-color: #9F150D" class="btn btn-danger" value="Consultar"/><br><br>
                            <span id="titulo"><span class="number">2</span> Consulta especifica de registro</span><br><br>
                            <center>
                                <button type="button" name="ConEs" data-toggle="modal" data-target="#ConsultaEsp" style="background-color: #9F150D" class="btn btn-danger">Consulta Especifica</button><br>
                            </center>
                        </form>
                    </div>
                    <div class="form-style-5">
                        <form action="Entradas.jsp" method="POST">
                            <span id="titulo"><span class="number">3</span> Acciones:</span><br><br>
                            <button type="button" name="Insertar" data-toggle="modal" data-target="#Insertar" style="background-color: #9F150D; width:185px;" class="btn btn-danger" >Ingresa un nuevo producto</button><br><br>
                            <button type="button" name="Imprimir" data-toggle="modal" data-target="#Imprimir" style="background-color: #9F150D;  width:185px;" class="btn btn-danger" onclick="window.location = '../imagenes/Salidas.pdf'">Imprimir</button><br><br>


                        </form>
                    </div>

                </div>

                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12"><!-- Seccion central TABLA -->
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <tr>
                                <th>id de entrada</th>
                                <th>id orden de compra</th>
                                <th>C&oacute;digo de barras</th>
                                <th>id de lote</th>
                                <th>Tipo de producto</th>
                                <th>Cantidad recibida</th>
                                <th>Fecha de registro</th>
                                <th>Fecha de caducidad</th>

                            </tr>
                            <tr>
                                <td><%= request.getAttribute("id_entrada")%></td>
                                <td><%= request.getAttribute("id_compra")%></td>
                                <td><%= request.getAttribute("id_producto")%></td>
                                <td><%= request.getAttribute("id_lote")%></td>
                                <td><%= request.getAttribute("tipo_producto")%></td>
                                <td><%= request.getAttribute("cantidad_recibido")%></td>
                                <td><%= request.getAttribute("fecha_registro")%></td>
                                <td><%= request.getAttribute("fecha_caducidad")%></td>

                            </tr>
                        </table>    
                    </div> 
                </div>

            </div>
        </div>


        <!-- Insertar Datos-->
        <div class="modal fade" id="Insertar"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Insertar datos</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form method="POST" action="entradas.jsp" onsubmit="return InsertarEnt()">
                                <span id="titulo"><span class="number">1</span>Ingresa el n&uacute;mero de compra</span><br>

                                <span>Id orden de compra</span><span><input type="text" name="IDOrdenCom" id="IDOrdenCom" placeholder="##########" maxlength="7" pattern="[A-Za-z0-9]{7}" title="El id de orden de compra debe ser de 7 digitos (n&uacute;meros y letras))" required="required"/></span>
                                <span>C&oacute;digo de barras</span><span><input type="text" name="CoBa" id="CoBa" placeholder="##########" required="required" maxlength="13" pattern="[A-Za-z0-9]{13}" title="El c&oacute;digo de barras debe ser de 13 digitos (n&uacute;meros y letras))"/></span>
                                <span>Id de lote</span><span><input type="text" name="IDEntrada" id="IDEntrada" placeholder="##########" maxlength="7" pattern="[A-Za-z0-9]{7}" title="El id de entrada debe ser de 7 digitos (n&uacute;meros y letras))" required="required"/></span>
                                <span>Tipo de producto</span><span><input type="text" name="TipoPro" id="TipoPro" placeholder="Botana" maxlength="100" pattern="[A-Za-z0-9]{1,100}" title="El tipo de producto debe contener de 1 a 100 car&aacute;cteres (n&uacute;meros y letras))" required="required"/></span>
                                <span>Cantidad recibida</span><span><input type="number" name="cantidadDev" id="cantidadRec" placeholder="1" min="1" max="9999999" pattern="[0-9]{1,9999999}" title="La cantidad recibida debe contener almenos 1 producto (campo n&uacute;merico)" required="required"/></span>
                                <span>Fecha de registro</span><span><input type="text" id="fechaEnt" name="fechaEnt" disabled="disabled"/></span>
                                <span>Fecha de caducidad</span><span><input type="date" name="fechaCad" id="fechaCad" placeholder="dd/mm/aaaa" required="required"/></span>
                                <br><br><button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                <input type="submit" style="background-color: #9F150D" value="Insertar" class="btn btn-danger" onsubmit="return InsertarEnt() location.href = 'entradas.jsp'"/>

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
                        <form method="POST" action="../../EntradasConsulta_E" onsubmit="return EspecificaEnt()">
                            <span id="titulo"><span class="number">1</span>Elige e ingresa los datos de los registros que desea consultar</span>

                            <br><br><span>ID de producto:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text" name="CoBa" id="CoBa" placeholder="##########" maxlength="13" pattern="[0-9]{13}" title="El id de producto debe ser de 13 digitos (n&uacute;meros)" required/></span>
                            <br><br><span>ID de entrada:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text" name="IDEntrada" id="IDEntrada" placeholder="##########" maxlength="7" pattern="[0-9]{7}" title="El id de entrada debe ser de 7 digitos (n&uacute;meros)" required/></span>
                            <br><br><span>ID de orden de compra:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text" name="IDOrdenCom" id="IDOrdenCom" placeholder="##########" maxlength="7" pattern="[0-9]{7}" title="El id de orden de compra debe ser de 7 digitos (n&uacute;meros)" required/></span>
                            <br><br><span>Tipo de Producto:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text" name="TipoPro" id="TipoPro" placeholder="Botana" maxlength="100" pattern="[A-Za-z0-9]{1,100}" title="El tipo de producto debe contener de 1 a 100 car&aacute;cteres (n&uacute;meros y letras)" required/></span>
                            <br><br>
                            <br><br><button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="submit" style="background-color: #9F150D" class="btn btn-danger" value="Continuar" id="BuscaEs" onsubmit="return EspecificaEnt()"><br>
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
