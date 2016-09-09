<!DOCTYPE html>
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
<title>6tm - Seguimiento de Obras</title>
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

#opener {
	position: absolute;
	z-index: 10;
	top: 2%;
	right: 50%;
	height: 30px;
	background-color: lightgoldenrodyellow;
}
</style>

<script>

	function verFoto(id){
		document.getElementById("picture_"+id).src = "http://localhost:8080/LocPic_Rest/rest/files/evidence/"+id+"/thumbnail";
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
  	      source: availableTypes
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
	padding-right: 5px;
}
</style>

</head>

<body>


	<div id="map"></div>
	<div id="resume" style="position: absolute; top: 80%;">
		<h1>Resumen</h1>
		<div>
			<h3>
				Cantidad Total:
				<spam id="totEvidence"></spam>
			</h3>
		</div>

		<div class="Table" style="position: absolute; top: 80%;">
			<div class="Title">
				<p>
			</div>

			<div class="Heading">

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p>OK</p>
				</div>

				<div class="Cell">
					<p>ROTA</p>
				</div>

				<div class="Cell">
					<p>FALTA</p>
				</div>

				<div class="Cell">
					<p>PODA</p>
				</div>

			</div>

			<div class="Row">

				<div class="Cell">
					<p>LUMINARIA</p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

			</div>


			<div class="Row">

				<div class="Cell">
					<p>BRAZO</p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

			</div>

			<div class="Row">
				<div class="Cell">
					<p>REFLECTOR</p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

			</div>

			<div class="Row">

				<div class="Cell">
					<p>FAROLA</p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

			</div>

			<div class="Row">
				<div class="Cell">
					<p>TORRE</p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>
			</div>

			<div class="Row">

				<div class="Cell">
					<p>COLGANTE</p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>

				<div class="Cell">
					<p></p>
				</div>
				<div class="Cell">
					<p></p>
				</div>
			</div>
		</div>
	</div>

	<div id="filter">
		<button class="btn_showFilter" id="opener">Aplicar Filtro</button>
	</div>

	<div id="filterPanel" title="Filtro de Imagenes" style="z-index: 0;">
		<form action="incident.htm" method="post">

			<div>
				<label for="user">Usuario:</label> <input id="userName"
					name="userName" type="text" value="${userName}" /> <span
					style="color: red">${errorUser}</span>
			</div>

			<div>
				<label for="user">Desde:</label> <input type="text" name="dTimeFrom"
					id="dTimeFrom" value="${dTimeFrom}" /> <span style="color: red">${errorFrom}</span>
			</div>

			<div>
				<label for="user">Hasta:</label> <input type="text" name="dTimeTo"
					id="dTimeTo" value="${dTimeTo}" /> <span style="color: red">${errorTo}</span>
			</div>

			<div>
				<label for="user">Tipo: </label> <input type="text" name="type"
					id="dTimeTo" value="${type}" /> <span style="color: red">${errorType}</span>
			</div>

			<div>
				<label for="user">Estado: </label> <input type="text" name="status"
					id="dTimeTo" value="${status}" /> <span style="color: red">${errorStatus}</span>
			</div>

			<div align="left" style="margin-top: 10px">
				<input type="submit" value="Filtrar" /> <span style="color: blue">${mensaje}</span>
			</div>

		</form>
	</div>
	<script>

// This example displays a marker at the center of Australia.
// When the user clicks the marker, an info window opens.

function getUserName(imei)
{
	return "-";
}

function addMarker(evidenceId, lat, lng, title, comment, dateTime, userName, icon){
	  var uluru = {lat: lat, lng: lng};
	  
	     var contentString = '<div>'+
	     '<div>'+
	      'Identificador: ' + evidenceId + ' usuario: ' + userName +
	      '</div>'+
	     '<div>'+
	      '<h1>Tipo: ' + title +
	      '</h1></div>'+
	      '<div><h2>'+
	      'Estado: '+ comment +
	      '</h2></div>'+
	      '<div> ' +
	        '<img id="picture_'+evidenceId+'" style="min-height: 314px; max-height: 314px; width: auto;" data-rotate="0" name="picture" src="" style="width:100%;transition: all 400ms;" /> '+
	      '</div>'+
	      '<div><form action="evidencePreview.htm" method="post"> ' +
	      '<input type="hidden" name="evidenceId" value="'+evidenceId+'" />' +
	'<h3>' +
	//'<a onclick="verFoto('+ evidenceId +')' + '"' + '>Ver Foto</a>'+
	'<button type="button" onclick="verFoto('+ evidenceId +')' + '">Ver Foto</button>' +
	'<button type="submit" >Modificar</button>' +
	          '</h3></form></div>' +
	''

	          
      var pathname = window.location.pathname; // Returns path only
      var url      = window.location.href;     // Returns full URL
	  var context = <%=request.getPathInfo()%>;   
	  <%
	  String[] uris=request.getRequestURI().split("/");
	  String uri="/"+uris[1]+"/"+uris[2];
	  %>
	 
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
		    icon: image,
		    title: title
		  });
		  marker.addListener('click', function() {
		    infowindow.open(map, marker);
		  });
      
}

var map ;
function initMap() {
  var centerMap = {lat: -32.895016, lng: -68.840514};
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: centerMap
  });
  
  <%List<BOEvidence> evidences = (List<BOEvidence>) request.getAttribute("evidences");
	try {
	%>
	 // agregar ventana resumen
	 document.getElementById("totEvidence").innerHTML = <%=evidences.size()%>; 
	 
	 <%for (BOEvidence evidence : evidences) {%>
 
	  addMarker(<%=evidence.getId()%> ,
	  			<%=evidence.getLatitude()%> ,
			  <%=evidence.getLongitude()%> , 
			  convert('<%=evidence.getType().trim()%>'),
			  convert('<%=evidence.getStatus().trim()%>'),
			  '<%=evidence.getCaptureDTimeInString()%>',
			  getUserName('<%=evidence.getImei().trim()%>'),
			  getIcon('<%=evidence.getTitle().trim()%>','<%=evidence.getComment().trim()%>')			  
 );
<%}
			} catch (Exception e) {%> alert(" <%=e.getMessage()%>
		");
	<%}%>
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