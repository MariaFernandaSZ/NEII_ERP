
<!DOCTYPE html>

<html>
    <head>
        <title>RRHH</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../css/VenEstilos.css" rel="stylesheet" type="text/CSS">
        <link href="../../css/VenLaterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../../css/VenTablacliente.css">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" integrity="sha256-CfcERD4Ov4+lKbWbYqXD6aFM9M51gN4GUEtDhkWABMo=" crossorigin="anonymous"></script>
        <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../../js/Ventas/VenGeneral.js"></script>
        <script src="../../js/Ventas/VenValidaciones.js"></script>
        <script src="../../js/Ventas/muestraModales.js"></script>
        <link href="../../css/estilosMax.css" rel="stylesheet" type="text/css"/>
        
    </head>
    
    <body style="width:100%; height:100%;">

        <!-- BARRA NAV -->
        <header class="sticky-top"> 
            <nav id="barraNavegadora" class="navbar navbar-expand-lg colorPrincipal" >
                <a class="navbar-brand" style="color: white;" href="modificarNomina.jsp"><h4>M�dulo<br>RRHH</h4><span class="sr-only">(current)</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span></button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a href="verCalendario.jsp" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../imagen/marzo.jpg" /><p>Vercalendario</p></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" aria-haspopup="true" aria-expanded="false" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"><img class="ic" border="dropdown-toggle0" height="25" width="25" src="../imagen/persona.png"/>Nominas</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="nomina.jsp" style="color: white">Nomina</a>
                                <a class="dropdown-item" href="agregarNomina.jsp" style="color: white">agregar nomina</a>
                                 <a class="dropdown-item" href="modificarNomina.jsp" style="color: white">modificar nomina</a>
                                 <a class="dropdown-item" href="consultar_nomina.jsp" style="color: white">consultar nomina</a>
                                 <a class="dropdown-item" href="enviarNomina.jsp" style="color: white">enviar nomina</a>
                                 
                                 <a class="dropdown-item" href="consultasNomina.jsp" style="color: white">consultas de nomina</a>
                            </div>
                            
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../imagen/persona.png" />Tareas</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="agregarTarea.jsp" style="color: white">Agregar tarea</a>
                                <a class="dropdown-item" href="consultar_tareas.jsp" style="color: white">Consutar tareas</a>
                                <a class="dropdown-item" href="eliminarTarea.jsp" style="color: white">eliminar tareas</a>
                                <a class="dropdown-item" href="modificarTarea.jsp" style="color: white">modificar tareas</a>
                                 <a class="dropdown-item" href="consultasTareas.jsp" style="color: white">consutas de tareas</a>
                            </div>
                        </li>
                        
                         <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../imagen/persona.png" />Empleados</a>
                             <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="contratar.jsp" style="color: white">contratar empleado</a>
                                <a class="dropdown-item" href="despedir.jsp" style="color: white">despedir empleado</a>
                                <a class="dropdown-item" href="consultar_empleado.jsp" style="color: white">consultar empleado</a>
                                 <a class="dropdown-item" href="modificar.jsp" style="color: white">modifica empleado</a>
                             
                            </div>
                        </li>
                        
                        
                       
                    </ul>
                 
                    
                    <li class="nav-item">
                        <a href="ayuda_calen.jsp" class="nav-link text-white" target="_blank" style="color: white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_ayuda.png" /><p>Ayuda</p></a>
                    </li>
                  
                    
                    
                    <li class="nav-item">
                        <a href="../../CerrarSesion" class="nav-link text-white" aria-haspopup="true" aria-expanded="false"><img class="ic" border="0" height="25" width="25" src="../../archivos/img/ic_salir.png" /><p>Salir</p></a>
                    </li>
                </div>
            </nav>
        </header>
        
         <!-- CONTENIDO-->
        <div class="container-fluid contenido">
            <div class="row">
                
         



<style>
    #calendar {
        font-family:Arial;
        font-size:12px;
        width: 100%;
        height: 200px;
        
    }
    #calendar caption {
        text-align:left;
        padding:5px 10px;
        background-color:#9F150D;
        color:#fff;
        font-weight:bold;
        font-size:medium;
    }
    #calendar caption div:nth-child(1) {float:left;}
    #calendar caption div:nth-child(2) {float:right;}
    #calendar caption div:nth-child(2) a {cursor:pointer;}
    #calendar th {
        background-color:#9F150D;
        color:#fff;
        width:40px;
    }
    #calendar td {
        text-align:right;
        padding:2px 5px;
        background-color:silver;
    }
    #calendar .hoy {
        background-color:red;
    }
</style>


<!-- Seccion izquierda -->
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                   
                    
                    
                    </div>


<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
<div id="calendario" >
    <center><h1>Calendario</h1></center>
    <br>
    <table id="calendar"  border="1">
        <caption></caption>
        <thead>
            <tr>
                <th>Lun</th><th>Mar</th><th>Mie</th><th>Jue</th><th>Vie</th><th>Sab</th><th>Dom</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>

</div>


 
                      <!-- Seccion derecha -->
                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                 
                </div>
                      
                      
                      
                      
                      
                      
          </div>

        </div>
         
         </body>
         
<script>
    var actual = new Date();
    function mostrarCalendario(year, month)
    {
        var now = new Date(year, month - 1, 1);
        var last = new Date(year, month, 0);
        var primerDiaSemana = (now.getDay() == 0) ? 7 : now.getDay();
        var ultimoDiaMes = last.getDate();
        var dia = 0;
        var resultado = "<tr bgcolor='silver'>";
        var diaActual = 0;
        console.log(ultimoDiaMes);

        var last_cell = primerDiaSemana + ultimoDiaMes;

        // hacemos un bucle hasta 42, que es el m�ximo de valores que puede
        // haber... 6 columnas de 7 dias
        for (var i = 1; i <= 42; i++)
        {
            if (i == primerDiaSemana)
            {
                // determinamos en que dia empieza
                dia = 1;
            }
            if (i < primerDiaSemana || i >= last_cell)
            {
                // celda vacia
                resultado += "<td>&nbsp;</td>";
            } else {
                // mostramos el dia
                if (dia == actual.getDate() && month == actual.getMonth() + 1 && year == actual.getFullYear())
                    resultado += "<td class='hoy'>" + dia + "</td>";
                else
                    resultado += "<td>" + dia + "</td>";
                dia++;
            }
            if (i % 7 == 0)
            {
                if (dia > ultimoDiaMes)
                    break;
                resultado += "</tr><tr>\n";
            }
        }
        resultado += "</tr>";

        var meses = Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");

        // Calculamos el siguiente mes y a�o
        nextMonth = month + 1;
        nextYear = year;
        if (month + 1 > 12)
        {
            nextMonth = 1;
            nextYear = year + 1;
        }

        // Calculamos el anterior mes y a�o
        prevMonth = month - 1;
        prevYear = year;
        if (month - 1 < 1)
        {
            prevMonth = 12;
            prevYear = year - 1;
        }

        document.getElementById("calendar").getElementsByTagName("caption")[0].innerHTML = "<div>" + meses[month - 1] + " / " + year + "</div><div><a onclick='mostrarCalendario(" + prevYear + "," + prevMonth + ")'>&lt;</a> <a onclick='mostrarCalendario(" + nextYear + "," + nextMonth + ")'>&gt;</a></div>";
        document.getElementById("calendar").getElementsByTagName("tbody")[0].innerHTML = resultado;
    }

    mostrarCalendario(actual.getFullYear(), actual.getMonth() + 1);
</script





         
 
</html>