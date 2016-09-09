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
        html,
        body {
            height: 100%;
        }
        
        #wrapper,
        #page-content-wrapper {
            height: 100%;
            /* width: 100%; */
        }
        .container-fluid,
        .row,
        .col-lg-12 {
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
            background: linear-gradient(to bottom, black, black 20%, lightGray 20%, lightGray 40%, black 40%, black 60%, lightGray 60%, lightGray 80%, black 80%, black 100%);
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
        .nav-tabs>li.active>a,
        .nav-tabs>li.active>a:focus,
        .nav-tabs>li.active>a:hover {
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
        .sidebar-nav li a:active,
        .sidebar-nav li a:focus {
            text-decoration: none;
        }
        .sidebar-nav > .sidebar-brand {
            height: 65px;
            font-size: 18px;
            line-height: 60px;
        }
        .sidebar-nav > .sidebar-brand a {
            color: #999999;
        }
        .sidebar-nav > .sidebar-brand a:hover {
            color: #fff;
            background: none;
        }
        @media(min-width:768px) {
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

<!--estilo KML-->#content-window {
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
    BOInventario inventNombre = (BOInventario)request.getAttribute("inventario");
   	String nombre = inventNombre.getName(); 
   	%>


	<div id="wrapper">
    <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <ul class="sidebar-nav" id="side_bar">
            <li class="sidebar-brand" style="font-weight: bold; color: #fff9f2;">
                <h1>Men�</h1>
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
						class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>  Cantidad Total <span class="badge"><spam
						id="totEvidence"></spam></span></a></li>
            <hr>
           
        </ul>
    </div>
    <!-- /#sidebar-wrapper -->
    <!-- Contenido de Pagina -->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12" style="padding-left: 0px; padding-right: 0px;">
                   
                    	  <table>
                    	  <thead class="thead-inverse" id="resume">
		   					 <tr>
		   				
						      <th ><h3><a href="#menu-toggle" class="gradient-menu" id="menu-toggle" ></a>
                        &nbsp;Mapa&nbsp;</h3> </th>
						  	
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
		   				
						      <th><div align="left" >

				<input id="mapa" name="mapa" type="submit" value="Filtrar"
					onclick="cambiaDefecto()" class="btn btn-primary dropdown-toggle" />
				<span style="color: blue">${mensaje}</span>
			</div> </th>
						  	
						  	<th><div id="savePosition" align="right">
				<button id="savePosition" onclick="relocate();"
					class="btn btn-default dropdown-toggle">Guardar Posiciones</button>	</div></th>

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

			<br><br>

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
	      'Observaci�n: '+ comment +
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
      
	

		  var marker = new google.maps.Marker({
		    position: uluru,
		    map: map,
		    draggable:true,
		    icon: image,
		    title: title
		  });
		  
		  var infowindow = new google.maps.InfoWindow({
			    content: contentString
			  });
		  marker.addListener("dragend", function() {
			  marker.title = "Ajustado";
			  var evidence = new Evidence(evidenceId,marker.getPosition().lat(),marker.getPosition().lng());
			  evidenceMoved[evidenceId] = evidence;
		  });		  

		  marker.addListener('click', function() {
		    infowindow.open(map, marker);
		  });
		  var gmarkers = [];
		  function myclick(evidenceId) {
		        google.maps.event.trigger(gmarkers[evidenceId], "click");
		    }

		  google.maps.event.addListener(marker, 'click', function() {
	            infowindow.setContent(contentString);
	            infowindow.open(map, marker);
	        });
		  // save the info we need to use later for the side_bar
	     gmarkers.push(marker);
		  
	        // add a line to the side_bar html
	        var sidebar = $('#side_bar');
	        var sidebar_entry = $('<li/>', {
	            'html': name,
	            'click': function() {
	                google.maps.event.trigger(marker, 'click');
	            },
	            'mouseenter': function() {
	                $(this).css('color', 'red');
	            },
	            'mouseleave': function() {
	                $(this).css('color', '#999999');
	            }
	        }).appendTo(sidebar);
      
}

var evidenceMoved = {};

//var key1 = dictionary["key1"];//get key1

var evidenceMoved = []

var map;
function initMap() {
  var centerMap = {lat: -32.9167, lng: -68.8333};
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
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
  

  	<%
			try {%>
	 // agregar ventana resumen
	 <%if (evidences != null) {%>
	 document.getElementById("totEvidence").innerHTML = <%=evidences.size()%>; 
	 
	 <%BOInventario invent = (BOInventario) request.getAttribute("inventario");
					String functionIcon = invent.getIconfunction();%>
	 <%for (BOEvidence evidence : evidences) {%>
 
	  addMarker(<%=evidence.getId()%> ,
	  			<%=evidence.getLatitude()%> ,
			    <%=evidence.getLongitude()%> , 
			    convert('<%=evidence.getTypePrensa().trim()%>'),
			    convert('<%=evidence.getStatusPrensa().trim()%>'),
			    '<%=evidence.getCaptureDTimeInString()%>',
			    getUserName('<%=evidence.getImei().trim()%>'),
		        //getIcon('<%=evidence.getTitle().trim()%>','<%=evidence.getComment().trim()%>'),
				<%=functionIcon%>('<%=evidence.getTitle().trim()%>','<%=evidence.getComment().trim()%>'),
				//<%=functionIcon%>(<%=evidence.getHaspic()%>),
				'<%=(evidence.getAddress() == null ? "" : evidence.getAddress().trim())%>'
			    );
		<%}
				}
			} catch (Exception e) {%> alert(" <%=e.getMessage()%>");
	<%}%>
		
 
}

function getIcono(){
	var response = "3_falta.png"; 
	
	

	return response;
}

/* function getIconPrensa(eviType, eviStatus){
	var type = "noType";
	var status = "noStatus";
	
	
	
	
	if (eviType == "1" || eviType == "2" || eviType == "3" || eviType == "4" || eviType == "5" || eviType == "6"|| eviType == "7" || eviType == "8"  )
	{
		type = eviType;
	}
	
	if (eviStatus == "0")
	{
		status = "ok";
	}else if (eviStatus == "1")
	{
		status = "rota";
	}else if (eviStatus == "2")
	{
		status = "falta";
	}else if (eviStatus == "4")
	{
		status = "sinclasificar";
	}
	
	return eviType + "_" + status + ".png";
}
 */

function getIconPrensa(eviType, eviStatus){
    var response = null;

    if (eviStatus != null){
            if(eviStatus == 0)
                    {
                            response = "5_ok.png";
                    }else if(eviStatus == 1)
            {
                            response = "5_rota.png";
            }else{
                    response = "5_falta.png";
            }
    } else {
            response = "4_rota.png";
    }


    return response;
}


	function getIconVialidad(eviType, eviStatus){
	    var response = null;
	
	if (eviStatus != null){
	    if(eviStatus == "operativo")
	            {
	                    response = "0_ok.png";
	            }else if(eviStatus == "no operativo")
	    {
	                    response = "0_rota.png";
	    }else{
	            response = "3_ok.png";
	    }
	} else {
	    response = "3_ok.png";
	}
	
	
	return response;
	}
		
	

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



<script type="text/javascript">

/*
JavaScript autoComplete v1.0.4
Copyright (c) 2014 Simon Steinberger / Pixabay
GitHub: https://github.com/Pixabay/JavaScript-autoComplete
License: http://www.opensource.org/licenses/mit-license.php
*/

var autoComplete = (function(){
// "use strict";
function autoComplete(options){
    if (!document.querySelector) return;

    // helpers
    function hasClass(el, className){ return el.classList ? el.classList.contains(className) : new RegExp('\\b'+ className+'\\b').test(el.className); }

    function addEvent(el, type, handler){
        if (el.attachEvent) el.attachEvent('on'+type, handler); else el.addEventListener(type, handler);
    }
    function removeEvent(el, type, handler){
        // if (el.removeEventListener) not working in IE11
        if (el.detachEvent) el.detachEvent('on'+type, handler); else el.removeEventListener(type, handler);
    }
    function live(elClass, event, cb, context){
        addEvent(context || document, event, function(e){
            var found, el = e.target || e.srcElement;
            while (el && !(found = hasClass(el, elClass))) el = el.parentElement;
            if (found) cb.call(el, e);
        });
    }

    var o = {
        selector: 0,
        source: 0,
        minChars: 3,
        delay: 150,
        offsetLeft: 0,
        offsetTop: 1,
        cache: 1,
        menuClass: '',
        renderItem: function (item, search){
            // escape special characters
            search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
            var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
            return '<div class="autocomplete-suggestion" data-val="' + item + '">' + item.replace(re, "<b>$1</b>") + '</div>';
        },
        onSelect: function(e, term, item){}
    };
    for (var k in options) { if (options.hasOwnProperty(k)) o[k] = options[k]; }

    // init
    var elems = typeof o.selector == 'object' ? [o.selector] : document.querySelectorAll(o.selector);
    for (var i=0; i<elems.length; i++) {
        var that = elems[i];

        // create suggestions container "sc"
        that.sc = document.createElement('div');
        that.sc.className = 'autocomplete-suggestions '+o.menuClass;

        that.autocompleteAttr = that.getAttribute('autocomplete');
        that.setAttribute('autocomplete', 'off');
        that.cache = {};
        that.last_val = '';

        that.updateSC = function(resize, next){
            var rect = that.getBoundingClientRect();
            that.sc.style.left = Math.round(rect.left + (window.pageXOffset || document.documentElement.scrollLeft) + o.offsetLeft) + 'px';
            that.sc.style.top = Math.round(rect.bottom + (window.pageYOffset || document.documentElement.scrollTop) + o.offsetTop) + 'px';
            that.sc.style.width = Math.round(rect.right - rect.left) + 'px'; // outerWidth
            if (!resize) {
                that.sc.style.display = 'block';
                if (!that.sc.maxHeight) { that.sc.maxHeight = parseInt((window.getComputedStyle ? getComputedStyle(that.sc, null) : that.sc.currentStyle).maxHeight); }
                if (!that.sc.suggestionHeight) that.sc.suggestionHeight = that.sc.querySelector('.autocomplete-suggestion').offsetHeight;
                if (that.sc.suggestionHeight)
                    if (!next) that.sc.scrollTop = 0;
                    else {
                        var scrTop = that.sc.scrollTop, selTop = next.getBoundingClientRect().top - that.sc.getBoundingClientRect().top;
                        if (selTop + that.sc.suggestionHeight - that.sc.maxHeight > 0)
                            that.sc.scrollTop = selTop + that.sc.suggestionHeight + scrTop - that.sc.maxHeight;
                        else if (selTop < 0)
                            that.sc.scrollTop = selTop + scrTop;
                    }
            }
        }
        addEvent(window, 'resize', that.updateSC);
        document.body.appendChild(that.sc);

        live('autocomplete-suggestion', 'mouseleave', function(e){
            var sel = that.sc.querySelector('.autocomplete-suggestion.selected');
            if (sel) setTimeout(function(){ sel.className = sel.className.replace('selected', ''); }, 20);
        }, that.sc);

        live('autocomplete-suggestion', 'mouseover', function(e){
            var sel = that.sc.querySelector('.autocomplete-suggestion.selected');
            if (sel) sel.className = sel.className.replace('selected', '');
            this.className += ' selected';
        }, that.sc);

        live('autocomplete-suggestion', 'mousedown', function(e){
            if (hasClass(this, 'autocomplete-suggestion')) { // else outside click
                var v = this.getAttribute('data-val');
                that.value = v;
                o.onSelect(e, v, this);
                that.sc.style.display = 'none';
            }
        }, that.sc);

        that.blurHandler = function(){
            try { var over_sb = document.querySelector('.autocomplete-suggestions:hover'); } catch(e){ var over_sb = 0; }
            if (!over_sb) {
                that.last_val = that.value;
                that.sc.style.display = 'none';
                setTimeout(function(){ that.sc.style.display = 'none'; }, 350); // hide suggestions on fast input
            } else if (that !== document.activeElement) setTimeout(function(){ that.focus(); }, 20);
        };
        addEvent(that, 'blur', that.blurHandler);

        var suggest = function(data){
            var val = that.value;
            that.cache[val] = data;
            if (data.length && val.length >= o.minChars) {
                var s = '';
                for (var i=0;i<data.length;i++) s += o.renderItem(data[i], val);
                that.sc.innerHTML = s;
                that.updateSC(0);
            }
            else
                that.sc.style.display = 'none';
        }

        that.keydownHandler = function(e){
            var key = window.event ? e.keyCode : e.which;
            // down (40), up (38)
            if ((key == 40 || key == 38) && that.sc.innerHTML) {
                var next, sel = that.sc.querySelector('.autocomplete-suggestion.selected');
                if (!sel) {
                    next = (key == 40) ? that.sc.querySelector('.autocomplete-suggestion') : that.sc.childNodes[that.sc.childNodes.length - 1]; // first : last
                    next.className += ' selected';
                    that.value = next.getAttribute('data-val');
                } else {
                    next = (key == 40) ? sel.nextSibling : sel.previousSibling;
                    if (next) {
                        sel.className = sel.className.replace('selected', '');
                        next.className += ' selected';
                        that.value = next.getAttribute('data-val');
                    }
                    else { sel.className = sel.className.replace('selected', ''); that.value = that.last_val; next = 0; }
                }
                that.updateSC(0, next);
                return false;
            }
            // esc
            else if (key == 27) { that.value = that.last_val; that.sc.style.display = 'none'; }
            // enter
            else if (key == 13 || key == 9) {
                var sel = that.sc.querySelector('.autocomplete-suggestion.selected');
                if (sel && that.sc.style.display != 'none') { o.onSelect(e, sel.getAttribute('data-val'), sel); setTimeout(function(){ that.sc.style.display = 'none'; }, 20); }
            }
        };
        addEvent(that, 'keydown', that.keydownHandler);

        that.keyupHandler = function(e){
            var key = window.event ? e.keyCode : e.which;
            if (!key || (key < 35 || key > 40) && key != 13 && key != 27) {
                var val = that.value;
                if (val.length >= o.minChars) {
                    if (val != that.last_val) {
                        that.last_val = val;
                        clearTimeout(that.timer);
                        if (o.cache) {
                            if (val in that.cache) { suggest(that.cache[val]); return; }
                            // no requests if previous suggestions were empty
                            for (var i=1; i<val.length-o.minChars; i++) {
                                var part = val.slice(0, val.length-i);
                                if (part in that.cache && !that.cache[part].length) { suggest([]); return; }
                            }
                        }
                        that.timer = setTimeout(function(){ o.source(val, suggest) }, o.delay);
                    }
                } else {
                    that.last_val = val;
                    that.sc.style.display = 'none';
                }
            }
        };
        addEvent(that, 'keyup', that.keyupHandler);

        that.focusHandler = function(e){
            that.last_val = '\n';
            that.keyupHandler(e)
        };
        if (!o.minChars) addEvent(that, 'focus', that.focusHandler);
    }

    // public destroy method
    this.destroy = function(){
        for (var i=0; i<elems.length; i++) {
            var that = elems[i];
            removeEvent(window, 'resize', that.updateSC);
            removeEvent(that, 'blur', that.blurHandler);
            removeEvent(that, 'focus', that.focusHandler);
            removeEvent(that, 'keydown', that.keydownHandler);
            removeEvent(that, 'keyup', that.keyupHandler);
            if (that.autocompleteAttr)
                that.setAttribute('autocomplete', that.autocompleteAttr);
            else
                that.removeAttribute('autocomplete');
            document.body.removeChild(that.sc);
            that = null;
        }
    };
}
return autoComplete;
})();

(function(){
if (typeof define === 'function' && define.amd)
    define('autoComplete', function () { return autoComplete; });
else if (typeof module !== 'undefined' && module.exports)
    module.exports = autoComplete;
else
    window.autoComplete = autoComplete;
})();


</script>





</body>
</html>