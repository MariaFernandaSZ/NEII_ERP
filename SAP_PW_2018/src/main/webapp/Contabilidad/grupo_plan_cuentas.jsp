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
                        <div class="form-style-5">
                            <span id="titulo"><span class="number">1</span>Grupo plan de cuantas</span>
                            <div class="row">
                                <div class="col-lg-4 col-md-12 col-sm-4 col-xs-12">
                                    <button id="btn-gpc-add" type="button" class="btn btn-light" onclick="agregaGPCmodal()">Agregar</button>
                                </div>
                                <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                    <button id="btn-gpc-edit" type="button" class="btn btn-light" onclick="editaGPCmodal()">Editar</button>
                                </div>
                                <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                    <button id="btn-gpc-del" type="button" class="btn btn-light" onclick="eliminaGPCmodal()">Eliminar</button>
                                </div>
                            </div>
                        </div> 
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"><!-- Seccion central -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>                            
                                    <th>Clave</th>                            
                                    <th>Descripcion</th>                           
                                </tr>
                                <tr>                            
                                    <td>VTA</td>
                                    <td>Ventas</td>
                                </tr>                        
                                <tr>                            
                                    <td>COST</td>
                                    <td>Costos</td>
                                </tr>         
                                <tr>                            
                                    <td>Gtonom</td>
                                    <td>Gastos N&oacute;mina</td>
                                </tr>                   
                                <tr>                            
                                    <td>Gtoope</td>
                                    <td>Gastos operaciones</td>
                                </tr>
                            </table>    
                        </div>  
                    </div>
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><!-- Seccion derecha -->
                        <table style="width:100%;height:100%;">                                        
                            <tr><td colspan="2">Informaci&oacute;n de la empresa</td></tr>
                            <tr><td colspan="2"><img src="" alt="logo de la empresa"></td></tr>
                        </table>
                    </div>    
                </div>
            </div> 
        </div>

        <!-- Modal AGREGAR GRUPO CALENDARIO CONTABLE-->
        <div class="modal fade" id="agregagpc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Agregar Grupo Plan de Cunetas</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form action="grupo_plan_cuentas.jsp" method="post" onsubmit="return GrupoPlanCuentasAgregar();">

                                <span style="font-size: 18px">Clave: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001" id="claveg"/></span><br>

                                <span style="font-size: 18px">Descripci&oacute;n: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001" id="AgrGPDes"/></span><br>

                                <span style="font-size: 18px">Tipo: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001" id="AgrGPTipo"/></span><br>


                                <center><input id="guardar" type="submit" value="Agregar" style="background-color: #9F150D" class="btn btn-danger"><br>
                                    <br></center>                   
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal EDITAR GRUPO PLAN DE CUENTAS-->

        <div class="modal fade" id="editagpc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Editar Grupo Plan de Cuentas</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form action="grupo_plan_cuentas.jsp" method="post"  onsubmit="return GrupoPlanCuentasEditar();">

                                <span style="font-size: 18px">Clave: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001"  id="Edtclaveg"/></span><br>

                                <span style="font-size: 18px">Descripci&oacute;n: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001" id="EditGPDes"/></span><br>

                                <span style="font-size: 18px">Tipo: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001" id="EditGPTipo"/></span><br>


                                <center><input id="guardar" type="submit" value="Guardar" style="background-color: #9F150D" class="btn btn-danger"><br>
                                    <br></center>                   
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal ELIMINAR GRUPO PLAN ED CUENTAS-->

        <div class="modal fade" id="eliminagpc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Eliminar Grupo Plan de Cuentas</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form action="grupo_plan_cuentas.jsp" method="post" onsubmit="return GrupoPlanCuentasEliminar();">
                                <span style="font-size: 18px">Clave: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001" id="GpEliminar"/></span><br>
                                <center><input id="eliminar" type="submit" value="Eliminar" style="background-color: #9F150D" class="btn btn-danger" ><br>
                                    <br></center>                   
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
