<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.brujula.locpic.core.boEntities.BOInventario"%>
<%@page import="com.brujula.locpic.persistence.entities.Inventario"%>
<%@page import="com.brujula.locpic.core.boEntities.BOUser"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="org.apache.commons.codec.binary.StringUtils"%>
<%@page import="com.brujula.locpic.core.boEntities.BOEvidence"%>
<%@page import="com.brujula.locpic.core.boEntities.BOUser"%>
<%@page import="java.util.List"%>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<title>6tm - Seguimiento de Obras</title>

 
</head>

<body>

	<div align="right">
        <a onclick="javascript:history.back()"><button type="button" class="btn btn-success" data-dismiss="modal">
       <span class="glyphicon glyphicon-arrow-left"  aria-hidden="true"></span>Volver</button></a> </div> 
        </div>
    	

<div class="container">
			

	<%BOEvidence evidence = (BOEvidence) request.getAttribute("evidence");%>
	


    <div class="page-header">
    
        <h2>Formulario de Encuestas Lújan</h2>
            <div class="row">
        <div class="col-md-3"><p class="lead">N° Formulario:</p></div>
        <div class="col-md-3"> <input id="numFormulario" name="numFormulario" type="text" value="<%= evidence.getFieldValue("nroformulario") %>" class="form-control"></div>
        <div class="col-md-6"></div>
    </div>
  
       
        
    </div>
  
  


    <h3>DATOS DEL ENCUESTADO</h3><br>
    <div class="row">
        <div class="col-md-4">Nombre del Encuestado: <input id="nombre" name="nombre" type="text" value="<%= evidence.getFieldValue("nombre") %>" 
                                                            class="form-control"></div>
        <div class="col-md-4">Dirección exacta: <input id="direccion" name="direccion" type="text" value="<%= evidence.getFieldValue("direccion") %>" 
                                                       class="form-control"></div>
        <div class="col-md-4">Télefono: <input id="telefono" name="telefono" type="text" value="<%= evidence.getFieldValue("telefono") %>" 
                                               class="form-control"></div>
    </div>

    <hr>

    <h3>Encuesta</h3>
    <div class="row">
        <table class="table" >
            <thead class="thead-inverse">
            <tr>
                <th></th>
                <th></th>
                <th></th>

            </tr>
            </thead>
            <tbody>


            <tr>
                <th scope="row">1</th>
                <td> Cómo evalua la situación actual de Lujan?</td>
                <td><input id="1" name="1" type="text" value="<%= evidence.getFieldValue("campo1") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Podría decirme por favor el motivo por el cual Ud. cree que la situación de lujan. El motivo es: </td>
                <td> <input id="2" name="2" type="text" value="<%= evidence.getFieldValue("campo2") %>"
                            class="form-control"></td>
            </tr>
           
            <tr>
                <th scope="row">3</th>
                <td>Que opina de:</td>
            </tr>
            <tr>
                <th scope="row">3.1</th>
                <td>Limpieza (recolección de residuos, barrido, limpieza de calles)</td>
                <td><input id="3.1" name="3.1" type="text" value="<%= evidence.getFieldValue("campo3_1") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">3.2</th>
                <td>Alumbrado (iluminación de calles)</td>
                <td>
                    <input id="3.2" name="3.2" type="text" value="<%= evidence.getFieldValue("campo3_2") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">3.3</th>
                <td>Agua / Cloacas</td>
                <td><input id="3.3" name="3.3" type="text" value="<%= evidence.getFieldValue("campo3_3") %>"
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">3.4</th>
                <td>Estado de las calles (Pozos y baches)</td>
                <td><input id="3.4" name="3.4" type="text" value="<%= evidence.getFieldValue("campo3_4") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">3.5</th>
                <td>Tránsito (ordenamiento / cuerpo de preventores)</td>
                <td><input id="3.5" name="3.5" type="text" value="<%= evidence.getFieldValue("campo3_5") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">3.6</th>
                <td>Plazas y paseos</td>
                <td><input id="3.6" name="3.6" type="text" value="<%= evidence.getFieldValue("campo3_6") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">3.7</th>
                <td>Seguridad</td>
                <td><input id="3.7" name="3.7" type="text" value="<%= evidence.getFieldValue("campo3_7") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">3.8</th>
                <td>Otro</td>
                <td><input id="3.8" name="3.8" type="text" value="<%= evidence.getFieldValue("campo3_8_1") %>" 
                           class="form-control"><br>
                           <input id="3.8" name="3.8" type="text" value="<%= evidence.getFieldValue("campo3_8_2") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td>¿Cual cree que es el principal tema que a abordar por el municipio en los proximos 3 meses?</td>
                <td><input id="4" name="4" type="text" value="<%= evidence.getFieldValue("campo4_1") %>" 
                           class="form-control"><br>
                           <input id="4" name="4" type="text" value="<%= evidence.getFieldValue("campo4_2") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td>¿Cuál es el principal tema a abordar en su barrio?</td>
                <td>	<input id="5" name="5" type="text" value="<%= evidence.getFieldValue("campo5_1") %>" 
                               class="form-control"><br>
                               <input id="4" name="4" type="text" value="<%= evidence.getFieldValue("campo5_2") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">6</th>
                <td>¿Con respecto a los siguientes tema, me gustaria que me diga si son competencia municipal, provincial o nacional?</td>
                <td></td>
            </tr>
            <tr>
                <th scope="row">6.1</th>
                <td>Seguridad</td>
                <td><input id="6.1" name="6.1" type="text" value="<%= evidence.getFieldValue("campo6_1") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">6.2</th>
                <td>La Panamericana</td>
                <td><input id="6.2" name="6.2" type="text" value="<%= evidence.getFieldValue("campo6_2") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">6.3</th>
                <td>Calle Guardia Vieja</td>
                <td><input id="6.3" name="6.3" type="text" value="<%= evidence.getFieldValue("campo6_3") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">6.4</th>
                <td>Calle Terrada</td>
                <td><input id="6.4" name="6.4" type="text" value="<%= evidence.getFieldValue("campo6_4") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">6.5</th>
                <td>Calle Boedo</td>
                <td><input id="6.5" name="6.5" type="text" value="<%= evidence.getFieldValue("campo6_5") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">6.6</th>
                <td>Calle Araoz</td>
                <td><input id="6.6" name="6.6" type="text" value="<%= evidence.getFieldValue("campo6_6") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">7</th>
                <td>¿Como evalua la gestion de Omar de Marchi?:</td>
                <td><input id="7" name="7" type="text" value="<%= evidence.getFieldValue("campo7") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">8</th>
                <td>¿En que medida Omar de Marchi ha cumplido con sus espectativas como intendente?</td>
                <td><input id="8" name="8" type="text" value="<%= evidence.getFieldValue("campo8") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">9</th>
                <td>¿Cree ud que cambio algo desde que comenzó la gestión de Omar de Marchi?</td>
                <td><input id="9" name="9" type="text" value="<%= evidence.getFieldValue("campo9") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">10</th>
                <td>¿Confia ud que el intendente Omar de Marchi es capaz de resolver los problemas de Lujan?</td>
                <td><input id="10" name="10" type="text" value="<%= evidence.getFieldValue("campo10") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">11</th>
                <td>Le voy a pedir por favor que defina al intendente Omar de Marchi en una palabra:</td>
                <td><input id="11" name="11" type="text" value="<%= evidence.getFieldValue("campo11") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">12</th>
                <td>¿Podria decirme a travez de que medios se informa sobre las actividades / novedades del municipio?</td>
                <td><input id="12" name="12" type="text" value="<%= evidence.getFieldValue("campo12_1") %>"
                           class="form-control"><br>
                           <input id="12_2" name="12_2" type="text" value="<%= evidence.getFieldValue("campo12_2") %>"
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">13</th>
                <td>¿Podria decirme que vía utiliza para realizar un reclamo al municipio?</td>
                <td><input id="13" name="13" type="text" value="<%= evidence.getFieldValue("campo13_1") %>" 
                           class="form-control"><br>
                           <input id="13_2" name="13_2" type="text" value="<%= evidence.getFieldValue("campo13_2") %>"
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">14</th>
                <td>¿sabia ud que la municipalidad tiene un número de teléfono especial para reclamos?</td>
                <td><input id="14" name="14" type="text" value="<%= evidence.getFieldValue("campo14") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">15</th>
                <td> Como evaluaria la atención y resolucion del problema por que el que llamo?</td>
                <td><input id="15" name="15" type="text" value="<%= evidence.getFieldValue("campo15") %>" 
                           class="form-control"></td>
            </tr>

            </tbody>
        </table>



      
            


            <h3>EVALUACION GESTION NACIONAL Y PROVINCIAL</h3>
              <table class="table" >
            <thead class="thead-inverse">
            <tr>
                <th></th>
                <th></th>
                <th></th>

            </tr>

         	</thead>
            <tbody>
            <tr>
                <th scope="row">16</th>
                <td>¿cómo evaluá la gestión del presidente Mauricio Macri?</td>
                <td><input id="16" name="16" type="text" value="<%= evidence.getFieldValue("campo16") %>" 
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">17</th>
                <td>¿cómo evaluá la gestión del presidente Alfredo Cornejo?</td>
                <td><input id="17" name="17" type="text" value="<%= evidence.getFieldValue("campo17") %>"
                           class="form-control"></td>
            </tr>
            <tr>
                <th scope="row">18</th>
                <td> Le voy a mencionar algunos nombres para que usted me diga si los conoce y su opinión:</td>
                
          
            </tr>
            <tr>
                <th scope="row"></th>
                <td> ¿Conoce a Mauricio Macri? Opinión:</td>
                <td><input id="18.1" name="18.1" type="text" value="<%= evidence.getFieldValue("campo18_1_1") %>" 
                           class="form-control"><br>
                           <input id="18.1.2" name="18.1.2" type="text" value="<%= evidence.getFieldValue("campo18_1_2") %>" 
                           class="form-control"></td>
            </tr>
           <tr>
                <th scope="row"></th>
                <td> ¿Conoce a Alfredo Cornejo? Opinión:</td>
                <td><input id="18.2.1" name="18.2.1" type="text" value="<%= evidence.getFieldValue("campo18_2_1") %>" 
                           class="form-control"><br>
                           <input id="18.2.2" name="18.2.2" type="text" value="<%= evidence.getFieldValue("campo18_2_2") %>" 
                           class="form-control"></td>
            </tr>
          
            <tr>
                <th scope="row"></th>
                <td> ¿Conoce a Omar de Marchi? Opinión:</td>
                <td><input id="18.3.1" name="18.3.1" type="text" value="<%= evidence.getFieldValue("campo18_3_1") %>" 
                           class="form-control"><br>
                           <input id="18.3.2" name="18.3.2" type="text" value="<%= evidence.getFieldValue("campo18_3_2") %>" 
                           class="form-control"></td>
            </tr>

            </tbody>
        </table>
     
		
	</div>
		  <div align="center">
        <a onclick="javascript:history.back()"><button type="button" class="btn btn-success" data-dismiss="modal">
         Volver a la Tabla</button></a> </div> 


    </div> <!-- /container -->


    <hr>

    <footer>
        <p ALIGN=right>&copy; 2016 Louredo S.A.</p>
    </footer>




</body>
</html>
