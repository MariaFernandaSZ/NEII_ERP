<%@page import="pw.sap.obj.Contabilidad.ObjPlanDeCuentas"%>
<%@page import="java.util.LinkedList"%>
<%@page import="pw.sap.pojo.Contabilidad.PlanCuentas"%>

<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Contabilidad")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../archivos/errorSesion.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Contabilidad</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilos.css" type="text/css">
        <link href="../css/laterales.css" rel="stylesheet" type="text/css"/>
        <link href="../Recursos/bootstrap/css/bootstrap.min.css"rel="stylesheet" type="text/css"/>
        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../js/Contabilidad/validacion.js" type="text/javascript"></script>
        <script src="../js/Contabilidad/modales.js"    type="text/javascript"></script>
    </head>
    <body>
         <header class="sticky-top">
            <!--barra de navegacion creada con bootstrap-->
            <nav class="navbar navbar-expand-lg navbar-light barra">
                <a class="navbar-brand text-white" href="ct_index.jsp">Contabilidad</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto">
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle text-white color" href="#" id="catalogos" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Cat&aacute;logos
                      </a>
                      <div class="dropdown-menu" id="submenu" >
                        <a class="nav-link text-white color" id="calenContable" href="calen_contable.jsp">Calendario contable</a>
                        <a class="nav-link text-white color" id="planCuentas" href="plan_cuentas.jsp">Plan de cuentas</a>                    
                        <a class="nav-link text-white color" id="grupoPlanCuentas" href="grupo_plan_cuentas.jsp">Grupo plan de cuentas</a>
                      </div>
                    </li>          
                    <li class="nav-item">
                      <a class="nav-link text-white color" id="impuestos" href="ct_impuestos.jsp">Impuestos</a>
                    </li>
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Libros
                      </a>
                      <div class="dropdown-menu" id="submenu">
                        <a class="nav-link text-white color" href="ct_libro_diario.jsp">Libro Diario<span class="sr-only">(current)</span></a>
                        <a class="nav-link text-white color" href="ct_libro_mayor.jsp">Libro Mayor</a>
                      </div>
                    </li>
                    
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Movimientos
                      </a>
                      <div class="dropdown-menu" id="submenu">
                        <a class="nav-link text-white color" href="asientos_conta.jsp">Asientos Contables<span class="sr-only">(current)</span></a>                        
                      </div>
                    </li>
                    
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Consultas
                      </a>
                      <div class="dropdown-menu" id="submenu">
                        <a class="nav-link text-white color" href="ct_con_plan_cuentas.jsp">Plan de cuentas<span class="sr-only">(current)</span></a>
                        <a class="nav-link text-white color" href="ct_resultados.jsp">Estado de resultados</a>
                      </div>
                    </li>
                    <li class="nav-item">
                        <a id="btn_gerencia" class="nav-link color" href="../Gerencia/IG/ig_inicio.jsp" style="color: white">Gerencia</a>                                
                        <script src="../js/gerencia.js"></script>
                    </li>
                  </ul>
                    
                  <form class="form-inline my-2 my-lg-0" action="../index.jsp">                
                    <button class="btn barra text-white my-2 my-sm-0" id="cerrarSesion" type="submit">Cerrar Sesi&oacute;n</button>
                  </form>
                </div>
            </nav>
        </header>
        <div id="principal">
            <div class="container-fluid">
                <div class="row">
                    <br>
                </div>
                <div class="row">
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-12 col-xs-12"> <!-- Seccion izquierda -->
                        <div class="form-style-5">
                            <form onsubmit="return busqueda(clave, desc);" action="../PlanDeCuentas" method="POST">
                                <span id="titulo"><span class="number">1</span>Buscar plan de cuenta</span>
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6">
                                        <input type="text" name="clave" id="clave" placeholder="Clave">    
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6">
                                        <input type="text" name="desc" id="desc" placeholder="Descripci&oacute;n">
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <input id="buscar" name="buscar" type="submit" value="Buscar">
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-12">
                                        <button id="btn-pc-add" type="button" class="btn btn-light" onclick="agregaPCmodal()">Agregar</button>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                        <button id="btn-pc-edit" type="button" class="btn btn-light" onclick="editaPCmodal()">Editar</button>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                        <button id="btn-pc-del" type="button" class="btn btn-light" onclick="eliminaPCmodal()">Eliminar</button>
                                    </div>
                                </div>
                            </form> 
                        </div> 
                    </div>
                    <div id="cont-central" class="col-lg-6 col-md-6 col-sm-12 col-xs-12"><!-- Seccion central -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Selecciona</th>
                                    <th>Cuenta</th>
                                    <th>Descripcion</th>
                                    <th>Tipo de cuenta</th>
                                    <th>Clase cuenta</th>
                                    <th>Clase SAT</th>
                                    <th>Tipo Naturaleza</th>
                                </tr>
                                <tr>
                                    <%
                                        LinkedList<ObjPlanDeCuentas> lista =PlanCuentas.consultaTodoPlan();
                                        for (int i=0;i<lista.size();i++)
                                        {
                                           out.println("<tr>");
                                           out.println("<td class='seleccion'><input type='checkbox'></td>");                                           
                                           out.println("<td>"+lista.get(i).getId_cuenta()+"</td>");
                                           out.println("<td>"+lista.get(i). getDescripcion()+"</td>");
                                           out.println("<td>"+lista.get(i).getTipo_cuenta()+"</td>");
                                           out.println("<td>"+lista.get(i).getClase_cuenta()+"</td>");
                                            out.println("<td>"+lista.get(i).getClase_sat()+"</td>");
                                           out.println("<td>"+lista.get(i).getNaturaleza()+"</td>");
                                            out.println("<tr>");
                                           }
                                    %>
                                </tr>
                            </table>    
                        </div>
                    </div>
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion derecha -->
                        <table style="width:100%;height:100%;">                                        
                            <tr><td colspan="2">Informaci&oacute;n de la empresa</td></tr>
                            <tr><td colspan="2"><img src="" alt="logo de la empresa"></td></tr>

                        </table>
                    </div>    
                </div>



                <!-- Modal AGREGAR CALENDARIO CONTABLE-->
                <div class="modal fade" id="agregapc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Agregar Plan de Cunetas</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form action="../PlanDeCuentasAdd" onsubmit="return seleccion();" method="post">
                                        <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <tr>
                                                <th>Selecciona</th>
                                                <th>Cuenta</th>
                                                <th>Cuenta Superior</th>
                                                <th>Descripcion</th>
                                                <th>Tipo de cuenta</th>
                                                <th>Clase cuenta</th>
                                                <th>Clase SAT</th>
                                                <th>Tipo Naturaleza</th>
                                            </tr>
                                            <tr>
                                                <td class="seleccion"><input type='checkbox' name='agregarcuenta[]' id='agregarcuenta' value='1'/></td>
                                                <td>100</td>
                                                <td>&nbsp;</td>
                                                <td>Activo</td>
                                                <td>titulo</td>
                                                <td>Sintetica</td>
                                                <td>100-Activo</td>
                                                <td>DEUDORA</td>
                                            </tr>                        
                                        </table>    
                                        </div>
                                        <div class="row">
                                            <input type="submit" value="AGREGAR"/>    
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal EDITAR PLAN DE CUENTAS-->

                <div class="modal fade" id="editapc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Editar Plan de Cuentas</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form action="../PlanDeCuentasEditar" onsubmit="return plancuentaseditar();" method="post">

                                        <span style="font-size: 18px">Cuenta superior: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" id="csup" name="csup" placeholder="001"/></span><br>
                                        <span style="font-size: 18px">Naturaleza: </span><span class="idemp">
                                            <select id="naturaleza" name="naturaleza">
                                                <optgroup>
                                                    <option value="x">Seleccione...</option>
                                                    <option value="deudora">Deudora</option>
                                                    <option value="Acreedora">Acreedora</option>
                                                    <option value="Binaturaleza">Binaturaleza</option>
                                                </optgroup>
                                            </select> 
                                        </span><br>

                                        <span style="font-size: 18px">Asociaci&oacute;n: </span><span class="idemp">
                                            <select name="asociacion" id="asociacion">
                                                <optgroup>
                                                    <option value="x">Seleccione...</option>
                                                    <option value="balance">Balance</option>
                                                    <option value="orden">De orden</option>
                                                    <option value="resultados">Resultados</option>

                                                </optgroup>
                                            </select> 
                                        </span><br>

                                        <span style="font-size: 18px">Clave: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="neditapcclave" id="nclave" placeholder="001"/></span><br>

                                        <span style="font-size: 18px">Descripci&oacute;n: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="descripcion" id="descripcion" placeholder="Descripci&oacute;n"/></span><br>

                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="reportVentas" id="report1" value="todasV" checked>
                                            <label style="font-size: 18px" class="form-check-label" for="report1">
                                                Activa
                                            </label>
                                        </div>

                                        <span style="font-size: 18px">Codigo SAT: </span><span class="idemp">
                                            <select id="codigosat" name="codigosat">
                                                <optgroup>
                                                    <option value="x">Selecciona...</option>                                                        
                                                    <option value="100">100-Activo</option>
                                                    <option value="100.01">100.01-Activo a corto plazo</option>
                                                    <option value="101">101- Caja</option>
                                                    <option value="100.01">101.01- Caja y efectivo</option>
                                                    <option value="102">102-Bancos</option>
                                                </optgroup>
                                            </select> 
                                        </span><br>

                                        <center><input id="guardar" type="submit" value="Aplicar" style="background-color: #9F150D" class="btn btn-danger"><br>
                                            <br></center>                   
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal ELIMINAR PLAN ED CUENTAS-->

                <div class="modal fade" id="eliminapc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Eliminar Plan de Cuentas</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form action="../PlanDeCuentasEliminar" onsubmit="return validanumero('neliminapcclave');" method="post">
                                        <span style="font-size: 18px">Clave: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nclave" id="neliminapcclave" placeholder="001"/></span><br>
                                        <center><input id="eliminar" type="submit" value="Eliminar" style="background-color: #9F150D" class="btn btn-danger"><br>
                                            <br></center>                   
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div> 
        </div>
    </body>
</html>
