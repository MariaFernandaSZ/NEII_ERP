<%-- 
    Document   : eligeImprimir
    Created on : 07-may-2018, 1:34:26
    Author     : ricardozaldivar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../css/VenEstilos.css" rel="stylesheet" type="text/CSS">
        <link href="../../css/VenLaterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/VenTabla.css">
    </head>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="formatoImprime" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                  <h4 class="modal-title" id="myModalLabel">Formato de impresi&oacute;n</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
                    <form onsubmit="descargarExcel()">
                        <span id="titulo"><span class="number">1</span>Imprimir</span><br>
                        <br>
                        
                        
                        <table id="tblReporte">
                            
                              <tr>
                                  <td>
                                      <h5>Eliga un formato de impresi&oacute;n:&nbsp;</h5>
                                      <select id="formatoImp" name="formatoImp">
                                        <optgroup label="Elige formato">
                                            <option value="select">Selecciona</option>
                                            <option value=”pdf">PDF</option>
                                            <option value="excel">Excel (.xlsx)</option>
                                            <option value="word">Word (.docx)</option>
                                        </optgroup>
                                        </select>     
                                  </td>
                              </tr>
                              
                        </table>    
                    </form>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" style="background-color: #9F150D" onclick="valmodalimprimir()" class="btn btn-danger">Imprimir</button>
              </div>
            </div>
          </div>
        </div>
        
    <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
    <script src="../../js/Ventas/VenGeneral.js"></script>
    <script src="../../js/Ventas/VenValidaciones.js"></script>
    
    </body>
</html>
