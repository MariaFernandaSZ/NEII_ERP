<%
    if (request.getSession().getAttribute("usuario") == null) {
        response.sendRedirect("../../archivos/sesion/errorSesion.jsp");
    } else {
        if (!request.getSession().getAttribute("area").equals("Gerencia")) {
            response.sendRedirect("../../archivos/errorSesion.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Informacion Gerencial</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script>
            function habilitar(value)
            {
                if (value == true)
                {
                    // habilitamos
                   $("#hora").css("display", "block");
                } else if (value == false) {
                    // deshabilitamos
                     $("#hora").css("display", "none");
                    
                }
            }
        </script>
    </head>

    <body> 
        <header class="sticky-top">
            <!--barra de navegacion creada con bootstrap-->
            <nav class="navbar navbar-expand-lg navbar-light barra">
                <a class="navbar-brand text-white" href="ig_inicio.jsp">Informaci&oacute;n Gerencial</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                </div>
                <li class="nav-item dropdown">
                    <a href="#" id="menu" data-toggle="dropdown" class="nav-link dropdown-toggle" style="color: white">Historia</a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item dropdown-submenu">
                            <p href="#" >Fecha</p>
                            <form action="" name="formulario">
                                <input type="date" name="bday" max="3000-12-31"  min="1000-01-01" class="form-control">
                                <br>
                                <label><input type="checkbox" id="check" onchange="habilitar(this.checked);" checked> Hora</label>
                                <div id="hora">
                                    <br>
                                    <label>De: <input id="horaInicio" type="time" name="hora" value="11:45:00" max="22:30:00" min="10:00:00" step="1"></label>
                                    <br>
                                    <label>A:   <input id="horaFin" type="time" name="hora" value="11:45:00" max="22:30:00" min="10:00:00" step="1"></label>  
                                </div>
                                 <br>
                                <input type="submit" value="Generar">
                            </form>
                        </li>
                    </ul>
                </li>
                <li class="nav-item" style="list-style:none">
                    <a class="nav-link" href="../../Consultalog" style="color: white">Historial</a>
                </li>
                <li class="nav-item" style="list-style:none">
                    <a class="nav-link" href="../../CerrarSesion" style="color: white">Salir</a>
                </li>
            </nav>
        </header>
        <div id="principal">
            <div class="container-fluid" style="background-color: #EDEDED;"><!-- Seccion central (Visualizar tarea) -->

                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div style="background-color: #fff; margin: 20px 2px;">
                            <a  href="../../Inventarios/Inventario/principal.jsp">
                                <h1 style="color: black; margin-left: 20px;">Inventarios</h1>
                                <div class="row justify-content-center">
                                    <br>
                                    <div class="row justify-content-center">
                                        <canvas id="inventarioGrafico">
                                            <p>L&aacute;stima, este navegador no acepta graficas</p>
                                        </canvas>
                                        <br>
                                        <div id="leyendaINV" class="leyenda leyendaH" style="color: black;"></div>
                                        <script type="text/javascript" src="../../Gerencia/IG/js/graficos.js"></script>
                                    </div>
                                </div>
                            </a>    
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                        <div style="background-color: #fff; margin: 20px 2px;">
                            <a  href="../../Contabilidad/ct_index.jsp">
                                <h1 style="color: black; margin-left: 20px;">Contabilidad</h1>
                                <div class="row justify-content-center">
                                    <br>
                                    <div class="row justify-content-center">
                                        <canvas id="contabilidadGrafico">
                                            <p>L&aacute;stima, este navegador no acepta graficas</p>
                                        </canvas>
                                        <br>
                                        <div id="leyendaCONT" class="leyenda leyendaH" style="color: black;"></div>
                                        <script type="text/javascript" src="../../Gerencia/IG/js/graficos.js"></script>
                                    </div>
                                </div>
                            </a>     
                        </div>                          
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                        <div style="background-color: #fff; margin: 20px 2px;">
                            <a href="../../RH/RH/rh_index.jsp">
                                <h1 style="color: black; margin-left: 20px;">Recursos Humanos</h1>
                                <div class="row justify-content-center">
                                    <br>
                                    <div class="row justify-content-center">
                                        <canvas id="rhGrafico">
                                            <p>L&aacute;stima, este navegador no acepta graficas</p>
                                        </canvas>
                                        <br>
                                        <div id="leyendaRH" class="leyenda leyendaH" style="color: black;"></div>
                                        <script type="text/javascript" src="../../Gerencia/IG/js/graficos.js"></script>
                                    </div>
                                </div>
                            </a>     
                        </div>
                    </div>
                </div>

                <div class="row">
                    <br>
                </div>


                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div style="background-color: #fff; margin: 20px 2px;">
                            <a href="../../Compras/html/com_index.jsp">
                                <h1 style="color: black; margin-left: 20px;">Compras</h1>
                                <div class="row justify-content-center">                               
                                    <br>
                                    <div class="row justify-content-center">
                                        <div style="background-image: url('../../Gerencia/IG/imagenes/grafica.png'); width: 100%;background-repeat: no-repeat;">
                                            <canvas id="comprasGrafico" width="451" height="274">
                                                <p>L&aacute;stima, este navegador no acepta graficas</p>
                                            </canvas>    
                                        </div>
                                        <br>
                                        <div id="leyendaCOMP" class="leyenda leyendaH" style="color: black;"></div>
                                        <script type="text/javascript" src="../../Gerencia/IG/js/grafico_compras.js"></script>
                                    </div>
                                </div>
                            </a>    
                        </div>     
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div style="background-color: #fff; margin: 20px 2px;">
                            <a href="../../Ventas/clientes.jsp">
                                <h1 style="color: black; margin-left: 20px;">Ventas</h1>
                                <div class="row justify-content-center">                               
                                    <br>
                                    <div class="row justify-content-center">
                                        <div style="background-image: url('../../Gerencia/IG/imagenes/grafica.png'); width: 100%;background-repeat: no-repeat;">
                                            <canvas id="ventasGrafico" width="451" height="274">
                                                <p>L&aacute;stima, este navegador no acepta graficas</p>
                                            </canvas>    
                                        </div>
                                        <br>
                                        <div id="leyendaVENT" class="leyenda leyendaH" style="color: black;"></div> 
                                        <script type="text/javascript" src="../../Gerencia/IG/js/grafico_ventas.js"></script>
                                    </div>
                                </div>        
                            </a>     
                        </div>                                                 
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div style="background-color: #fff; margin: 0px 10px 10px 10px;">
                            <br>
                            <form action="../../ig_reporte" method="post">
                                <center>
                                    <input class="btn btn-danger text-white" style="background-color: #9F150D" type="submit" value="GENERAR REPORTE" />
                                </center>
                            </form>
                        </div>
                    </div>
                </div>

            </div> 
        </div>

    </body>
</html>
