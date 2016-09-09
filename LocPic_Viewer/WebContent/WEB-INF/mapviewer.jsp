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

<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>6tm - Seguimiento de Obras</title>
<style>
html, body {
	height: 100%;
}

#wrapper, #page-content-wrapper {
	height: 100%;
	/* width: 100%; */
}

.container-fluid, .row, .col-lg-12 {
	height: 100%;
	/*   width: 100%; */
}

}
/* hamburger menu pseudo element */
.box-shadow-menu {
	position: relative;
	padding-left: 1.25em;
}

.box-shadow-menu:before {
	content: "";
	position: absolute;
	left: 0;
	top: 0.25em;
	width: 1em;
	height: 0.15em;
	background: #788ce8;
	box-shadow: 0 0.25em 0 0 black, 0 0.5em 0 0 black;
}
/* hamburger menu pseudo element gradient */
.gradient-menu {
	padding-left: 1.25em;
	position: relative;
}

.gradient-menu:before {
	content: "";
	position: absolute;
	left: 0;
	top: 0.21em;
	bottom: 0.21em;
	width: 1em;
	background: linear-gradient(to bottom, black, black 20%, lightGray 20%, lightGray
		40%, black 40%, black 60%, lightGray 60%, lightGray 80%, black 80%,
		black 100%);
}
/* http://www.jqueryscript.net/demo/Bootstrap-Sidebar-Extension-With-jQuery-CSS-CSS3/ */

/*!
         * Start Bootstrap - Simple Sidebar HTML Template (http://startbootstrap.com)
         * Code licensed under the Apache License v2.0.
         * For details, see http://www.apache.org/licenses/LICENSE-2.0.
         */

/* Toggle Styles */
.nav-tabs>li {
	float: none;
}

.nav-tabs {
	border-bottom: 0;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	margin: 0;
	border-radius: 0;
}

#wrapper {
	padding-left: 0;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
}

#wrapper.toggled {
	padding-left: 250px;
}

#sidebar-wrapper {
	z-index: 1000;
	position: fixed;
	left: 250px;
	width: 0;
	height: 100%;
	margin-left: -250px;
	overflow-y: auto;
	background: #4b533c;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
}

#wrapper.toggled #sidebar-wrapper {
	width: 250px;
}

#page-content-wrapper {
	/*  width: 100%;
            position: absolute;
          */
	
}

#wrapper.toggled #page-content-wrapper {
	position: absolute;
	margin-right: -250px;
}
/* Sidebar Styles */
.sidebar-nav {
	position: absolute;
	top: 0;
	width: 250px;
	margin: 0;
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 20px;
	line-height: 40px;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #999999;
}

.sidebar-nav li a:hover {
	text-decoration: none;
	color: #fff;
	background: rgba(255, 255, 255, 0.2);
}

.sidebar-nav li a:active, .sidebar-nav li a:focus {
	text-decoration: none;
}

.sidebar-nav>.sidebar-brand {
	height: 65px;
	font-size: 18px;
	line-height: 60px;
}

.sidebar-nav>.sidebar-brand a {
	color: #999999;
}

.sidebar-nav>.sidebar-brand a:hover {
	color: #fff;
	background: none;
}

@media ( min-width :768px) {
	#wrapper {
		padding-left: 250px;
	}
	#wrapper.toggled {
		padding-left: 0;
	}
	#sidebar-wrapper {
		width: 250px;
	}
	#wrapper.toggled #sidebar-wrapper {
		width: 0;
	}
	#page-content-wrapper {
		/*  padding: 20px; */
		position: relative;
	}
	#wrapper.toggled #page-content-wrapper {
		position: relative;
		margin-right: 0;
	}
}
</style>
<style>
a:link {
	color: blue;
	background-color: transparent;
	font-weight: bold;
	text-decoration: underline
}

a:visited {
	color: purple;
	background-color: transparent;
	text-decoration: none
}

a:hover {
	color: blue;
	background-color: transparent;
	text-decoration: underline
}

a:active {
	color: green;
	background-color: transparent;
	text-decoration: underline
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 100%;
}
</style>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<!--  <link rel="stylesheet" href="/resources/demos/style.css">   -->
<style>
#draggable {
	padding: 0.5em;
}

#opener {<!--
	position: absolute;
	z-index: 10;
	top: 78%;
	right: 15%;
	height: 40px;
	background-color:;
	-->
}

#resume {
	position: absolute;
	z-index: 10;
	top: 4%; //
	/* right: 88%; */
	height: 40px;
	margin-left: 15px;
	background-color:;
}

#invantario {
	position: absolute;
}

#menu {
	position: relative;
	float: left; //
	margin-left: 42%;
}
</style>

<script>

var restURL = "http://godoycruz.gestionyservicios.com.ar:8080/Inventario_Rest_PRE/rest";
function verFoto(id){
       document.getElementById("picture_"+id).src = restURL + "/files/evidence/"+id+"/thumbnail";
}

	$(function() {
	    $( "#filterPanel" ).dialog({
	      autoOpen: false,
	      show: {
	        effect: "blind",
	        duration: 1000
	      },
	      hide: {
	        effect: "explode",
	        duration: 1000
	      }
	    });
	 
	    $( "#opener" ).click(function() {
	      $( "#filterPanel" ).dialog( "open" );
	    });
	});
  
  	$(function(){
    	$("#dTimeTo").datepicker({ dateFormat: 'dd-mm-yy' });
    	$("#dTimeFrom").datepicker({ dateFormat: 'dd-mm-yy' }).bind("change",function(){
          var minValue = $(this).val();
          minValue = $.datepicker.parseDate("dd-mm-yy", minValue);
          minValue.setDate(minValue.getDate()+1);
          $("#dTimeTo").datepicker( "option", "minDate", minValue );
      	})
 	});
  
  	$(function() {
	  var availableUsers = <%=(String) request.getAttribute("users")%>;
	    $( "#userName" ).autocomplete({
	      source: availableUsers
	    });
	  });
  
  	$(function() {
  	  var availableTypes = <%=(String) request.getAttribute("types")%>;
  	    $( "#type" ).autocomplete({
  	      source: availableTypes,
  	    });
  	  });
    
  	$(function() {
  	  var availableStatus = <%=(String) request.getAttribute("status")%>;
  	    $( "#status" ).autocomplete({
  	      source: availableStatus
  	    });
  	  });
  	
	$(document).ready(function() {
	    $(document).on('click','#rotateLeft',function(){

	    	var deg = $("#ItemPreview").data('rotate') || 0;
	    	deg = deg + 90;
	    	var rotate = 'rotate(' + deg + 'deg)';
	    	$("#ItemPreview").data('rotate', deg);

	    	$("#ItemPreview").css({'transform': rotate});
	    });
	});
	
	  var demo2 = new autoComplete({
          selector: '#advanced-demo',
          minChars: 0,
          source: function(term, suggest){
              term = term.toLowerCase();
              var choices = [['Australia', 'au'], ['Austria', 'at'], ['Brasil', 'br'], ['Bulgaria', 'bg'], ['Canada', 'ca'], ['China', 'cn'], ['Czech Republic', 'cz'], ['Denmark', 'dk'], ['Finland', 'fi'], ['France', 'fr'], ['Germany', 'de'], ['Hungary', 'hu'], ['India', 'in'], ['Italy', 'it'], ['Japan', 'ja'], ['Netherlands', 'nl'], ['Norway', 'no'], ['Portugal', 'pt'], ['Romania', 'ro'], ['Russia', 'ru'], ['Spain', 'es'], ['Swiss', 'ch'], ['Turkey', 'tr'], ['USA', 'us']];
              var suggestions = [];
              for (i=0;i<choices.length;i++)
                  if (~(choices[i][0]+' '+choices[i][1]).toLowerCase().indexOf(term)) suggestions.push(choices[i]);
              suggest(suggestions);
          },
          renderItem: function (item, search){
              search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&amp;');
              var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
              return '<div class="autocomplete-suggestion" data-langname="'+item[0]+'" data-lang="'+item[1]+'" data-val="'+search+'">'+item[0].replace(re, "<b>$1</b>")+'</div>';
          },
          onSelect: function(e, term, item){
              console.log('Item "'+item.getAttribute('data-langname')+' ('+item.getAttribute('data-lang')+')" selected by '+(e.type == 'keydown' ? 'pressing enter' : 'mouse click')+'.');
              document.getElementById('advanced-demo').value = item.getAttribute('data-langname')+' ('+item.getAttribute('data-lang')+')';
          }
      });

	

</script>

<style>
.Table {
	display: table;
	width: 100%;
}

.Heading {
	display: table-row;
	text-align: center;
}

.Row {
	display: table-row;
}

.Cell {
	display: table-cell;
	border: solid;
	border-width: thin;
	padding-left: 5px;
	px: 5px;
}

<!--
estilo KML-->#content-window {
	float: left;
	font-family: 'Roboto', 'sans-serif';
	height: 100%;
	line-height: 30px;
	padding-left: 10px;
	width: 19%;
}
<!--
Fin



 



estilo



 



kml



 



-->
</style>

<script> 
function enviar_formulario(){ 

   document.formulario1.submit() 
} 

function cambiaDefecto(){ 
  	document.formulario1.campo.defaultValue = "" 
} 
</script>


</head>

<body>
	<%
		List<BOEvidence> evidences = (List<BOEvidence>) request.getAttribute("evidences");
		BOInventario inventNombre = (BOInventario) request.getAttribute("inventario");
		String nombre = inventNombre.getName();
	%>


	<div id="wrapper">
		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav" id="side_bar">
				<li class="sidebar-brand" style="font-weight: bold; color: #fff9f2;">
					<h1>Menú</h1>
				</li>
				<li><a href="inventario.htm"><span
						class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
						Listado Inventario.</a></li>
				<li><a href="javascript:enviar_formulario()" id="tabla"
					name="tabla"> <!-- onclick="window.open('mapTabla.htm')" --> <span
						class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
						Lista Detallada
				</a></li>
				<li role="separator" class="divider"></li>
				<li id="filter"><a href="#" id="opener"><span
						class="glyphicon glyphicon-search" aria-hidden="true"></span>
						Aplicar Filtro</a></li>
				<li><a class="alert-link" style="color: white"><span
						class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
						Cantidad Total <span class="badge"><spam id="totEvidence"></spam></span></a></li>
				<hr>

			</ul>
		</div>
		<!-- /#sidebar-wrapper -->
		<!-- Contenido de Pagina -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12"
						style="padding-left: 0px; padding-right: 0px;">

						<table>
							<thead class="thead-inverse" id="resume">
								<tr>

									<th><h3>
											<a href="#menu-toggle" class="gradient-menu" id="menu-toggle"></a>
											&nbsp;Mapa&nbsp;
										</h3></th>

									<th><h3><%=nombre%></h3></th>


								</tr>
							</thead>
						</table>


						<div id="map"></div>

					</div>
				</div>
			</div>
		</div>
		<!-- Fin de Pagina -->
	</div>




	<div id="filterPanel" title="Filtro de Imágenes" style="z-index: 0;">

		<form action="mapviewer.htm" method="post" name="formulario1">


			<table>
				<thead class="thead-inverse">
					<tr>

						<th><div align="left">

								<input id="mapa" name="mapa" type="submit" value="Filtrar"
									onclick="cambiaDefecto()"
									class="btn btn-primary dropdown-toggle" /> <span
									style="color: blue">${mensaje}</span>
							</div></th>

						<th><div id="savePosition" align="right">
								<button id="savePosition" onclick="relocate();"
									class="btn btn-default dropdown-toggle">Guardar
									Posiciones</button>
							</div></th>

					</tr>
				</thead>
			</table>
			<div>
				<label for="user">Usuario:</label> <input id="userName"
					class="form-control" name="userName" type="text"
					value="${userName}" /> <span style="color: red">${errorUser}</span>
			</div>

			<div>
				<label for="user">Desde:</label> <input type="text" name="dTimeFrom"
					class="form-control" id="dTimeFrom" value="${dTimeFrom}" /> <span
					style="color: red">${errorFrom}</span>
			</div>

			<div>
				<label for="user">Hasta:</label> <input type="text" name="dTimeTo"
					class="form-control" id="dTimeTo" value="${dTimeTo}" /> <span
					style="color: red">${errorTo}</span>
			</div>

			<div>
				<label for="user">Tipo: </label> <input type="text" name="type"
					class="form-control" id="type" value="${filterType}" /> <span
					style="color: red">${errorType}</span>
			</div>

			<div>
				<label for="user">Estado: </label> <input type="text" name="status"
					class="form-control" id="status" value="${filterStatus}" /> <span
					style="color: red">${errorStatus}</span>
			</div>


			<div>
				<input type="hidden" name="id_inventario" id="id_inventario"
					class="form-control" id="id_inventario"
					value="<%=request.getAttribute("id_inventario")%>" /></input> <span
					style="color: red">${errorStatus}</span>
			</div>

			<div>
				<input type="hidden" name="campo" id="campo" class="form-control"
					id="campo" value="1" />
			</div>

			<br> <br>

		</form>

	</div>

	<script>

// This example displays a marker at the center of Australia.
// When the user clicks the marker, an info window opens.

// contact
function Evidence(id, lat, lon) {
    this.id = id;
    this.lat = lat;
    this.lon = lon;
    this.toJsonString = function () { return JSON.stringify(this); };

};

function relocate()
{
	var eviRelocate = new Array();
	for (var key in evidenceMoved){
		eviRelocate.push(evidenceMoved[key]);
	    //key will be -> 'id'
	    //dictionary[key] -> 'value'
	}
	
	var myJsonString = JSON.stringify(eviRelocate);
	
	//myJsonString = {"id":1,"lat":"10","lon":"20"}
	
	$.ajax({
		url: restURL + '/files/relocate',
	    type: "PUT",
	    contentType: "application/json; charset=utf-8",
        data: myJsonString,
        dataType: "jsonp",
        success: function (data, status, jqXHR) {
            alert(" Guardado con exitos");
        },
    
        error: function (jqXHR, status) {
           alert(" Guardado con exitos");
  
        }     
	});
}

function getUserName(name)
{
	return name;
}

function addMarker(evidenceId, lat, lng, title, comment, dateTime, userName, icon, address){
	  var uluru = {lat: lat, lng: lng};
	  
	     var contentString = '<div>'+
	     '<div>'+
	      'Identificador: ' + evidenceId + ' usuario: ' + userName +
	      '</div>'+
	     '<div>'+
	      '<h2><label>Identificador: ' + title +
	      '</label></h2></div>'+
	      '<div><h3></label>'+
	      'Observación: '+ comment +
	      '</label></h3></div>'+
	      '<div> ' +
	        '<img id="picture_'+evidenceId+'" style="min-height: 314px; max-height: 314px; width: auto;" data-rotate="0" name="picture" src="" style="width:100%;transition: all 400ms;" /> '+
	      '</div>'+
	      '<div><form action="evidencePreview.htm" method="post"> ' +
	      '<input type="hidden" name="evidenceId" value="'+evidenceId+'" />' +
	'<h3>' +
	//'<a onclick="verFoto('+ evidenceId +')' + '"' + '>Ver Foto</a>'+
	'<button type="button"  class="btn btn-success dropdown-toggle" onclick="verFoto('+ evidenceId +')' + '">Ver Foto</button>' +
	'<button type="submit"  class="btn btn-default dropdown-toggle" >Modificar</button>' +
	          '</h3></form></div>' +
	''

	          
      var pathname = window.location.pathname; // Returns path only
      var url      = window.location.href;     // Returns full URL
	  var context = <%=request.getPathInfo()%>;   
	  <%String[] uris = request.getRequestURI().split("/");
			String uri = "/" + uris[1] + "/" + uris[2];%>
	 
      var image = {
    		    url: 'file/'+icon,
    		    // This marker is 20 pixels wide by 32 pixels high.
    		    size: new google.maps.Size(20, 32),
    		    // The origin for this image is (0, 0).
    		    origin: new google.maps.Point(0, 0),
    		    // The anchor for this image is the base of the flagpole at (0, 32).
    		    anchor: new google.maps.Point(0, 32)
    		  };
      
	  var infowindow = new google.maps.InfoWindow({
		    content: contentString
		  });

		  var marker = new google.maps.Marker({
		    position: uluru,
		    map: map,
		    draggable:true,
		    icon: image,
		    title: title
		  });
		  
		  marker.addListener("dragend", function() {
			  marker.title = "Ajustado";
			  var evidence = new Evidence(evidenceId,marker.getPosition().lat(),marker.getPosition().lng());
			  evidenceMoved[evidenceId] = evidence;
		  });		  

		  marker.addListener('click', function() {
		    infowindow.open(map, marker);
		  });
      
}

var evidenceMoved = {};

//var key1 = dictionary["key1"];//get key1

var evidenceMoved = []

var map;
function initMap() {
  var centerMap = {lat: -33.08924043396471, lng: -68.90419006347656};
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 11,
    center: centerMap
  });

  var myWrapper = $("#wrapper");
  $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
      myWrapper.one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function(e) {
          // code to execute after transition ends
          google.maps.event.trigger(map, 'resize');
      });
  });
  
  
  <%try {%>
	 // agregar ventana resumen
	 <%if (evidences != null) {%>
	 document.getElementById("totEvidence").innerHTML = <%=evidences.size()%>; 
	 <%BOInventario invent = (BOInventario) request.getAttribute("inventario");
					String functionIcon = invent.getIconfunction();%>
	 <%for (BOEvidence evidence : evidences) {%>
 
	  addMarker(<%=evidence.getId()%> ,
	  			<%=evidence.getLatitude()%> ,
			    <%=evidence.getLongitude()%> , 
			    convert('<%=evidence.getTitle().trim()%>'),
			    convert('<%=evidence.getComment().trim()%>'),
			    '<%=evidence.getCaptureDTimeInString()%>',
			    getUserName('<%=evidence.getImei().trim()%>'),
		        //getIcon('<%=evidence.getTitle().trim()%>','<%=evidence.getComment().trim()%>'),
				//<%=functionIcon%>('<%=evidence.getTitle().trim()%>','<%=evidence.getComment().trim()%>'),
				<%=functionIcon%>(<%=evidence.getHaspic()%>),
				'<%=(evidence.getAddress() == null ? "" : evidence.getAddress().trim())%>'
			    );
		<%}
				}
			} catch (Exception e) {%> alert(" <%=e.getMessage()%>");
	<%}%>
		
	// cordenadas lujan.
	<%%>

	
	  var lujan = [

{lng: -68.8847494, lat: -33.0237773},
{lng: -68.8921738, lat: -33.0297501},
{lng: -68.9017868, lat: -33.0352908},
{lng: -68.9094257, lat: -33.0428458},
{lng: -68.9137173, lat: -33.043907},
{lng: -68.9237595, lat: -33.0462992},
{lng: -68.9300251, lat: -33.046659},
{lng: -68.9314842, lat: -33.0474503},
{lng: -68.9361191, lat: -33.0483137},
{lng: -68.9380074, lat: -33.0506159},
{lng: -68.9383507, lat: -33.0536374},
{lng: -68.8816166, lat: -33.0462273},
{lng: -68.864193, lat: -33.0470906},
{lng: -68.8593435, lat: -33.0378812},
{lng: -68.8523912, lat: -33.024353},
{lng: -68.8595152, lat: -33.0237053},
{lng: -68.8638925, lat: -33.0300199},
{lng: -68.8706625, lat: -33.0289047},
{lng: -68.8713814, lat: -33.0302899},
{lng: -68.8760376, lat: -33.0291744},
{lng: -68.8771963, lat: -33.0286347},
{lng: -68.8788271, lat: -33.0266558},
{lng: -68.8795996, lat: -33.0246409},
{lng: -68.8847494, lat: -33.0237773}
	  ];

	  // Contruccion del poligono de lujan.
	  var lujanKml = new google.maps.Polygon({
	    paths: lujan,
	    strokeColor: '#837F7F',
	    strokeOpacity: 0.8, 
	    strokeWeight: 2,
	    fillColor: '#D0C8C8',
	    fillOpacity: 0.35
	  });
	  lujanKml.setMap(map);
	  
	// agregar un evento al click.
	  lujanKml.addListener('click', showArrays);

	  infoWindow = new google.maps.InfoWindow;
	  
		//-------------------------------------------------------------
		
//cordenadas Agrelo.
var agrelo = [

{lng: -69.00581360000001,lat: -33.0843504},
{lng: -69.0099335,lat: -33.2088185},
{lng: -68.9440155,lat: -33.193305499999994},
{lng: -68.9199829,lat: -33.1944547},
{lng: -68.8911438,lat: -33.202211500000004},
{lng: -68.8808441,lat: -33.2073822},
{lng: -68.87638090000002,lat: -33.1935929},
{lng: -68.8580122,lat: -33.1954628},
{lng: -68.8162994,lat: -33.2036478},
{lng: -68.8142395,lat: -33.1769278},
{lng: -68.8166428,lat: -33.143013200000006},
{lng: -68.820076,lat: -33.1073601},
{lng: -68.884964,lat: -33.10160820000001},
{lng: -68.915863,lat: -33.0981569},
{lng: -68.9453888,lat: -33.0892404},
{lng: -68.9683914,lat: -33.0909663},
{lng: -69.00581360000001,lat: -33.0843504}
];

// Contruccion del poligono de Agrelo.
var agreloKml = new google.maps.Polygon({
  paths: agrelo,
  strokeColor: '#837F7F',
  strokeOpacity: 0.8, 
  strokeWeight: 2,
  fillColor: '#D0C8C8',
  fillOpacity: 0.35
});
agreloKml.setMap(map);

// agregar un evento al click.
agreloKml.addListener('click', showArrays);

infoWindow = new google.maps.InfoWindow;

//---------------------------------------------------------------------

//cordenadas Pedriel.
var pedriel = [

{lng: -68.820076,lat: -33.1073601},
 {lng: -68.7998199,lat: -33.1085104},
 {lng: -68.7960434,lat: -33.0590327},
 {lng: -68.82453920000002,lat: -33.0636365},
 {lng: -68.8475418,lat: -33.0570185},
 {lng: -68.864193,lat: -33.047090600000004},
 {lng: -68.8816166,lat: -33.0462273},
 {lng: -68.9383507,lat: -33.0536374},
 {lng: -68.9453888,lat: -33.0892404},
 {lng: -68.915863,lat: -33.0981569},
 {lng: -68.820076,lat: -33.1073601}
];

// Contruccion del poligono de Pedriel.
var pedrielKml = new google.maps.Polygon({
  paths: pedriel,
  strokeColor: '#837F7F',
  strokeOpacity: 0.8, 
  strokeWeight: 2,
  fillColor: '#D0C8C8',
  fillOpacity: 0.35
});
pedrielKml.setMap(map);

// agregar un evento al click.
pedrielKml.addListener('click', showArrays);

infoWindow = new google.maps.InfoWindow;

//---------------------------------------------------------------------


//cordenadas Drumon.
var drumon = [

{lng: -68.8660812,lat: -32.9970025},
 {lng: -68.8693428,lat: -33.0099591},
 {lng: -68.8847494,lat: -33.023777300000006},
 {lng: -68.8795996,lat: -33.0246409},
 {lng: -68.8788271,lat: -33.0266558},
 {lng: -68.8771963,lat: -33.0286347},
 {lng: -68.8760376,lat: -33.0291744},
 {lng: -68.8713814,lat: -33.0302899},
 {lng: -68.8706625,lat: -33.0289047},
 {lng: -68.8638925,lat: -33.0300199},
 {lng: -68.8595152,lat: -33.023705299999996},
 {lng: -68.8523912,lat: -33.024353},
 {lng: -68.8465118,lat: -32.9978663},
 {lng: -68.845396,lat: -32.9923953},
 {lng: -68.863163,lat: -32.9890117},
 {lng: -68.8660812,lat: -32.9970025}
];

// Contruccion del poligono de drumon.
var drumonKml = new google.maps.Polygon({
  paths: drumon,
  strokeColor: '#837F7F',
  strokeOpacity: 0.8, 
  strokeWeight: 2,
  fillColor: '#D0C8C8',
  fillOpacity: 0.35
});
drumonKml.setMap(map);

// agregar un evento al click.
drumonKml.addListener('click', showArrays);

infoWindow = new google.maps.InfoWindow;

//---------------------------------------------------------------------

//cordenadas carrodilla.
var carrodilla = [

{lng: -68.8283586,lat: -32.9959227},
 {lng: -68.8208485,lat: -32.9797242}, 
 {lng: -68.8156986,lat: -32.9725958},
 {lng: -68.8262558,lat: -32.9705797},
 {lng: -68.8259983,lat: -32.960858},
 {lng: -68.8381004,lat: -32.9592738},
 {lng: -68.8428638,lat: -32.9595981},
 {lng: -68.8522625,lat: -32.9585536},
 {lng: -68.8668105,lat: -32.9588059},
 {lng: -68.9914799,lat: -32.9494069},
 {lng: -68.9889483,lat: -32.9598497}, 
 {lng: -68.8665325,lat: -32.9646026},
 {lng: -68.855707,lat: -32.9638464},
 {lng: -68.8587053,lat: -32.9716053}, 
 {lng: -68.8601589,lat: -32.9780681},
 {lng: -68.8643646,lat: -32.9891557},
 {lng: -68.862648,lat: -32.9890837}, 
 {lng: -68.8283586,lat: -32.9959227}
];

// Contruccion del poligono de carrodilla.
var carrodillaKml = new google.maps.Polygon({
  paths: carrodilla,
  strokeColor: '#837F7F',
  strokeOpacity: 0.8, 
  strokeWeight: 2,
  fillColor: '#D0C8C8',
  fillOpacity: 0.35
});
carrodillaKml.setMap(map);

// agregar un evento al click.
carrodillaKml.addListener('click', showArrays);

infoWindow = new google.maps.InfoWindow;

//---------------------------------------------------------------------

//cordenadas chacras.
var chacras= [

{lng: -68.9041042,lat: -32.9980463},
{lng: -68.9029241,lat: -32.998005799999994},
{lng: -68.9027739,lat: -32.9999808},
{lng: -68.9036751,lat: -33.0014834},
{lng: -68.9034176,lat: -33.0062162}, 
{lng: -68.8870239,lat: -33.0054245}, 
{lng: -68.885994,lat: -33.0093833}, 
{lng: -68.885994,lat: -33.0159328}, 
{lng: -68.8850498,lat: -33.0211146},
{lng: -68.8827324,lat: -33.0221941},
{lng: -68.8693428,lat: -33.0099591}, 
{lng: -68.863163,lat: -32.9890117}, 
{lng: -68.8643646,lat: -32.9891557}, 
{lng: -68.8601589,lat: -32.9780681},
{lng: -68.85870530000001,lat: -32.9716053},
{lng: -68.855707,lat: -32.963846399999994},
{lng: -68.8665325,lat: -32.9646026}, 
{lng: -68.9910082,lat: -32.95970570000001},
{lng: -68.9890766,lat: -32.9914594}, 
{lng: -68.9041042,lat: -32.9980463}
];

// Contruccion del poligono de chacras.
var chacrasKml = new google.maps.Polygon({
  paths: chacras,
  strokeColor: '#837F7F',
  strokeOpacity: 0.8, 
  strokeWeight: 2,
  fillColor: '#D0C8C8',
  fillOpacity: 0.35
});
chacrasKml.setMap(map);

// agregar un evento al click.
chacrasKml.addListener('click', showArrays);

infoWindow = new google.maps.InfoWindow;

//---------------------------------------------------------------------
//cordenadas compuertas.
var compuertas= [

{lng: -68.9890766,lat: -32.9914594},
{lng: -68.9917374,lat: -33.0463712}, 
{lng: -68.9622116,lat: -33.0512634},
{lng: -68.9546145,lat: -33.03719649999999}, 
{lng: -68.9434131,lat: -33.0383831},
{lng: -68.9344025,lat: -33.01701239999999},
{lng: -68.9144897,lat: -33.0043448}, 
{lng: -68.9027739,lat: -32.9999808}, 
{lng: -68.9029241,lat: -32.998005799999994},
{lng: -68.9068632,lat: -32.99769150000001},
{lng: -68.9890766,lat: -32.9914594}
];

// Contruccion del poligono de compuertas.
var compuertasKml = new google.maps.Polygon({
  paths: compuertas,
  strokeColor: '#837F7F',
  strokeOpacity: 0.8, 
  strokeWeight: 2,
  fillColor: '#D0C8C8',
  fillOpacity: 0.35
});
compuertasKml.setMap(map);

// agregar un evento al click.
compuertasKml.addListener('click', showArrays);

infoWindow = new google.maps.InfoWindow;

//-------------------------------------------------------------------

//cordenadas vegas.
var vegas= [

{lng: -69.2328358,lat: -32.9646748},
 {lng: -69.2466972,lat: -32.9626226},
 {lng: -69.2865855,lat: -32.94380550000001},
 {lng: -69.3012981,lat: -32.9562938}, 
 {lng: -69.2500877,lat: -32.9684914},
 {lng: -69.2748928,lat: -33.0103909}, 
 {lng: -69.29677960000001,lat: -33.01802}, 
 {lng: -69.3079376,lat: -33.0165086},
 {lng: -69.3213272,lat: -33.02672780000001},
 {lng: -69.3082809,lat: -33.0286707}, 
 {lng: -69.3025303,lat: -33.03579450000001},
 {lng: -69.2796135,lat: -33.0217623},
 {lng: -69.2651939,lat: -33.0185237}, 
 {lng: -69.250946,lat: -33.00492059999999},
 {lng: -69.247427,lat: -32.9914594},
 {lng: -69.2328358,lat: -32.9646748}
];

// Contruccion del poligono de vegas.
var vegasKml = new google.maps.Polygon({
  paths: vegas,
  strokeColor: '#837F7F',
  strokeOpacity: 0.8, 
  strokeWeight: 2,
  fillColor: '#D0C8C8',
  fillOpacity: 0.35
});
vegasKml.setMap(map);

// agregar un evento al click.
vegasKml.addListener('click', showArrays);

infoWindow = new google.maps.InfoWindow;

//-------------------------------------------------------------------
//cordenadas potrerillos.
var potrerillos= [

{lng: -69.122715,lat: -32.99354710000001},
{lng: -69.1319847,lat: -32.9821721},
{lng: -69.1592789,lat: -32.9591297},
{lng: -69.1906929,lat: -32.9388186},
{lng: -69.2145538,lat: -32.923402},
{lng: -69.2263985,lat: -32.9287333}, 
{lng: -69.2197037,lat: -32.9293096},
{lng: -69.2164421,lat: -32.9363694}, 
{lng: -69.2097473,lat: -32.9445811}, 
{lng: -69.2136955,lat: -32.9561049}, 
{lng: -69.208889,lat: -32.9637387}, 
{lng: -69.1864014,lat: -32.9726679}, 
{lng: -69.17799,lat: -32.9795802}
];

// Contruccion del poligono de potrerillos.
var potrerillosKml = new google.maps.Polygon({
  paths: potrerillos,
  strokeColor: '#837F7F',
  strokeOpacity: 0.8, 
  strokeWeight: 2,
  fillColor: '#D0C8C8',
  fillOpacity: 0.35
});
potrerillosKml.setMap(map);

// agregar un evento al click.
potrerillosKml.addListener('click', showArrays);

infoWindow = new google.maps.InfoWindow;

//-------------------------------------------------------------------
//cordenadas UGARTECHE.
var ugarteche= [

{lng: -68.8808441,lat: -33.2073822},
{lng: -68.8883972,lat: -33.20163689999999},
{lng: -68.9199829,lat: -33.1944547},
{lng: -68.9440155,lat: -33.193305499999994}, 
{lng: -69.0099335,lat: -33.2088185},
{lng: -69.0006638,lat: -33.2926557}, 
{lng: -68.9917374,lat: -33.2955254}, 
{lng: -68.9848709,lat: -33.2966732}, 
{lng: -68.96495820000001,lat: -33.2926557},
{lng: -68.9577484,lat: -33.2935166}, 
{lng: -68.94504550000002,lat: -33.29093379999999},
{lng: -68.9364624,lat: -33.288637900000005},
{lng: -68.9268494,lat: -33.2915078},
{lng: -68.9192963,lat: -33.2938036}, 
{lng: -68.9107132,lat: -33.2932296},
{lng: -68.9038467,lat: -33.28634199999999},
{lng: -68.8990402,lat: -33.2717039}, 
{lng: -68.8962936,lat: -33.236390300000004},
{lng: -68.8835907,lat: -33.2148506}, 
{lng: -68.8808441,lat: -33.2073822}
];

// Contruccion del poligono de UGARTECHE.
var ugartecheKml = new google.maps.Polygon({
  paths: ugarteche,
  strokeColor: '#837F7F',
  strokeOpacity: 0.8, 
  strokeWeight: 2,
  fillColor: '#D0C8C8',
  fillOpacity: 0.35
});
ugartecheKml.setMap(map);

// agregar un evento al click.
ugartecheKml.addListener('click', showArrays);

infoWindow = new google.maps.InfoWindow;

//-------------------------------------------------------------------
//cordenadas Lulunta.
var lulunta= [
{lng: -68.7970305,lat: -33.0576389},
{lng: -68.7976742,lat: -33.0561553},
{lng: -68.7919235,lat: -33.0510475},
{lng: -68.7989616,lat: -33.05155109999999},
{lng: -68.8010216,lat: -33.0436372},
{lng: -68.7983608,lat: -33.0302538},
{lng: -68.819561,lat: -33.030038000000005},
{lng: -68.8169861,lat: -33.02226600000001},
{lng: -68.8503742,lat: -33.0156449},
{lng: -68.8523912,lat: -33.024353},
{lng: -68.864193,lat: -33.047090600000004},
{lng: -68.8475418,lat: -33.0570185},
{lng: -68.82453920000002,lat: -33.0636365},
{lng: -68.7960434,lat: -33.0590327},
{lng: -68.7970305,lat: -33.0576389}
 

];

// Contruccion del poligono de lulunta.
var luluntaKml = new google.maps.Polygon({
  paths: lulunta,
  strokeColor: '#837F7F',
  strokeOpacity: 0.8, 
  strokeWeight: 2,
  fillColor: '#D0C8C8',
  fillOpacity: 0.35
});
luluntaKml.setMap(map);

// agregar un evento al click.
luluntaKml.addListener('click', showArrays);

infoWindow = new google.maps.InfoWindow;

//-------------------------------------------------------------------
//cordenadas VISTALVA.
var vistalva= [
{lng: -68.9622116,lat: -33.0512634},
{lng: -68.9380074,lat: -33.0506159},
{lng: -68.9361191,lat: -33.0483137}, 
{lng: -68.9314842,lat: -33.0474503}, 
{lng: -68.9300251,lat: -33.046659}, 
{lng: -68.9237595,lat: -33.0462992},
{lng: -68.9094257,lat: -33.0428458}, 
{lng: -68.9017868,lat: -33.0352908}, 
{lng: -68.8921738,lat: -33.0297501}, 
{lng: -68.8847494,lat: -33.0237773}, 
{lng: -68.8828611,lat: -33.0220817}, 
{lng: -68.8850498,lat: -33.0211146}, 
{lng: -68.8860369,lat: -33.015501}, 
{lng: -68.885994,lat: -33.0093833}, 
{lng: -68.8870239,lat: -33.0054245},
{lng: -68.9034176,lat: -33.0062162}, 
{lng: -68.9036322,lat: -33.0010336}, 
{lng: -68.9027739,lat: -32.9999808}, 
{lng: -68.9144897,lat: -33.0043448},
{lng: -68.9344025,lat: -33.0170124}, 
{lng: -68.9434131,lat: -33.0383831}, 
{lng: -68.9546145,lat: -33.0371965}, 
{lng: -68.9622116,lat: -33.0512634}
];

// Contruccion del poligono de vistalva.
var vistalvaKml = new google.maps.Polygon({
  paths: vistalva,
  value: 'hola',
  strokeColor: '#837F7F',
  strokeOpacity: 0.8, 
  strokeWeight: 2,
  fillColor: '#D0C8C8',
  fillOpacity: 0.35
});
vistalvaKml.setMap(map);

// agregar un evento al click.
vistalvaKml.addListener('click', showArrays);

infoWindow = new google.maps.InfoWindow;

//-------------------------------------------------------------------

}
	
		

function showArrays(event) {
 
  var nombre = this.getPath();

  var contentString = '<b>Zona</b><br>' + event.lagtLng.paths()
      'Clicked location: <br>' + event.latLng.lat() + ',' + event.latLng.lng() +
      '<br>';

      //imagen
      
      
  // Iterate over the vertices.
  for (var i =0; i < vertices.getLength(); i++) {
    var xy = vertices.getAt(i);
    contentString += '<br>' + 'Coordinate ' + i + ':<br>' + xy.lat() + ',' +
        xy.lng();
  }

  // Replace the info window's content and position.
  infoWindow.setContent(contentString);
  infoWindow.setPosition(event.latLng);

  infoWindow.open(map);
}
	// fin kml dinamico
	

		function getIconoFijo(haspic){

		if(haspic == 1){
			
			return "1_ok.png";
		}else
			{
			
			return "1_rota.png";
			
			}
			
		
		}

		function getIcon(eviType, eviStatus){
			var type = "noType";
			var status = "noStatus";
			
			
			
			
			if (eviType == "0" || eviType == "1" || eviType == "2" || eviType == "3" || eviType == "4" || eviType == "5" )
			{
				type = eviType;
			}
			
			if (eviStatus == "1")
			{
				status = "ok";
			}else if (eviStatus == "2")
			{
				status = "rota";
			}else if (eviStatus == "3")
			{
				status = "falta";
			}else if (eviStatus == "4")
			{
				status = "poda";
			}
			
			return eviType + "_" + status + ".png";
		}

		function convert(tx) {
			var rp = String(tx);
			//
			rp = rp.replace(/á/g, '&aacute;');
			rp = rp.replace(/é/g, '&eacute;');
			rp = rp.replace(/í/g, '&iacute;');
			rp = rp.replace(/ó/g, '&oacute;');
			rp = rp.replace(/ú/g, '&uacute;');
			rp = rp.replace(/ñ/g, '&ntilde;');
			rp = rp.replace(/ü/g, '&uuml;');
			//
			rp = rp.replace(/Á/g, '&Aacute;');
			rp = rp.replace(/É/g, '&Eacute;');
			rp = rp.replace(/Í/g, '&Iacute;');
			rp = rp.replace(/Ó/g, '&Oacute;');
			rp = rp.replace(/Ú/g, '&Uacute;');
			rp = rp.replace(/Ñ/g, '&Ntilde;');
			rp = rp.replace(/Ü/g, '&Uuml;');
			//
			return rp;
		};
	</script>

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA4D2xWaA33ogWHgvXlTMFzwVj-G7TV1bI&signed_in=true&callback=initMap">
		
	</script>









</body>
</html>