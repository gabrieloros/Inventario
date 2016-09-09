<%@page import="com.brujula.locpic.service.service.InventaryService"%>
<%@page import="java.util.List"%>
<%@page import="com.brujula.locpic.core.boEntities.BOInventario"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">


    <title>Inventario</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script>

function enviar_formulario(){ 

	   document.salir.submit() 
	} 
function cambiarTipoInventario(){ 
  	document.crear.info.defaultValue = "infoVialidad"
  		document.crear.pagina.defaultValue = "/WEB-INF/mapviewerBase.jsp"
  		document.crear.option.defaultValue = "Inventario"
  			document.modificar.info.defaultValue = "infoVialidad"
  		  		document.modificar.pagina.defaultValue = "/WEB-INF/mapviewerBase.jsp"
  		  		document.modificar.option.defaultValue = "Inventario"
}
function cambiarTipoRelevamiento(){ 
  	document.crear.info.defaultValue = "infoVialidad"
  		document.crear.pagina.defaultValue = "/WEB-INF/mapviewerBase.jsp"
  		document.crear.option.defaultValue = "Relevamiento"
  			document.modificar.info.defaultValue = "infoVialidad"
  		  		document.modificar.pagina.defaultValue = "/WEB-INF/mapviewerBase.jsp"
  		  		document.modificar.option.defaultValue = "Relevamiento"
}

function cambiarTipoEncuesta(){ 
  	document.crear.info.defaultValue = "mapTabla"
  	document.crear.pagina.defaultValue = "/WEB-INF/mapviewer.jsp"
  	document.crear.option.defaultValue= "Encuesta"
  			document.modificar.info.defaultValue = "mapTabla"
  		  	document.modificar.pagina.defaultValue = "/WEB-INF/mapviewer.jsp"
  		  	document.modificar.option.defaultValue= "Encuesta"
} 

/* markers function */
function cambiarMarkerUno(){ 
  	document.crear.iconfunction.defaultValue = "getIconoFijo"
  	document.crear.pagina.defaultValue = "/WEB-INF/mapviewer.jsp"
  	document.crear.option_marker.defaultValue= "Opción 1"
  			document.modificar.marker.defaultValue = "getIconoFijo"
  		  	document.modificar.pagina.defaultValue = "/WEB-INF/mapviewer.jsp"
  		  	document.modificar.option_marker.defaultValue= "Opción 1"
} 
function cambiarMarkerDos(){ 
  	document.crear.iconfunction.defaultValue = "getIcono"
  	document.crear.pagina.defaultValue = "/WEB-INF/mapviewerBase.jsp"
  	document.crear.option_marker.defaultValue= "Opción 2"
  			document.modificar.marker.defaultValue = "mapTabla"
  		  	document.modificar.pagina.defaultValue = "/WEB-INF/mapviewerBase.jsp"
  		  	document.modificar.option_marker.defaultValue= "Opción 2"
} 
function cambiarMarkerTres(){ 
  	document.crear.iconfunction.defaultValue = "getIconPrensa"
  	document.crear.pagina.defaultValue = "/WEB-INF/mapviewerBase.jsp"
  	document.crear.option_marker.defaultValue= "Opción 3"
  			document.modificar.marker.defaultValue = "getIconPrensa"
  		  	document.modificar.pagina.defaultValue = "/WEB-INF/mapviewerBase.jsp"
  		  	document.modificar.option_marker.defaultValue= "Opción 3"
} 
function cambiarMarkerCuatro(){ 
  	document.crear.iconfunction.defaultValue = "getIcon"
  	document.crear.pagina.defaultValue = "/WEB-INF/mapviewerBase.jsp"
  	document.crear.option_marker.defaultValue= "Opción 4"
  			document.modificar.marker.defaultValue = "getIcon"
  		  	document.modificar.pagina.defaultValue = "/WEB-INF/mapviewerBase.jsp"
  		  	document.modificar.option_marker.defaultValue= "Opción 4"
} 

</script>

</head>

<body>

<div class="container">
    <br>
    <h3 class="text-muted">Inventario</h3>
    <div class="header clearfix" align="right">
        
        <div class="btn-group" align="right">
  		<a class="btn btn-primary" href="#"><i class="icon-user icon-white"></i> Usuario: ${sessionScope.user}</a>
  		<a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
  		<ul class="dropdown-menu pull-right">
   		<li><a href="#"><i class="icon-pencil"></i> Editar Perfil</a></li>
    	<li><a  href="javascript:enviar_formulario()"><i class="icon-off"></i> Salir</a></li>
    	<li class="divider"></li>
    	<li><a href="#"><i class="i"></i>Comunicarse con Asesoría</a></li>
  		</ul>
		</div>
		<%-- <nav>
            <ul class="nav nav-pills pull-right">
                <li role="presentation" class="active"><a ><span class="glyphicon glyphicon-user" aria-hidden="true"></span> ${sessionScope.user}</a></li>
                <li role="presentation"><a href="#">Opciones</a></li>
                <li role="presentation"><a href="javascript:enviar_formulario()">Salir</a></li>
            </ul>
        </nav> --%>
        <form class="navbar-form navbar-right" name="salir" action="out.htm"
			method="post">
		</form>
        
    </div>
    <%
    List<BOInventario> listInventario = (List<BOInventario>) request.getAttribute("inventarios");
    %>
    

    <table class="table table-striped" >
        <thead class="thead-inverse">
        <tr>
        	<th></th>
            <th>Listado de Inventarios Disponibles</th>
            <th></th>
            <th></th>

        </tr>
        </thead>
        <tbody>

        <%
        try {
        if (listInventario!=null){
        for (BOInventario inventario : listInventario) {
        	
        
        %>
        <form method="post" action = "mapviewer.htm">
            <tr>

                <th scope="row"><input name="id_inventario" id="id_inventario" type="hidden"></th>
                <td><%=inventario.getName()%></td>


                <td><input type="hidden" name="evidenceId" id="evidenceId" value=""></td>
                <td>
                	
                 <button type="submit" onclick="setIdInventario(<%=inventario.getId()%>)" class="btn btn-default dropdown-toggle" >Entrar</button>

                </td>
                <td>
                   <a data-toggle="modal" data-target=".modificar"  onclick="setIdInventario(<%=inventario.getId()%>)" class="btn btn-warning dropdown-toggle" >Modificar</a>

                </td>
                <%}}
                } catch (Exception e) {%> alert(" <%=e.getMessage()%>");
                <%}%>


            </tr>
        </form>


        </tbody>
    </table>

  

    <!-- Eliminar -->
    <div class="row">
        <div class="col-lg-4">
            <h2>Crear Inventario</h2>
            <p class="text-info">Crea tu nuevo Inventario, dale un nombre,personaliza tus markers, zonas, tipo de inventario y mucho mas.</p>
            <p>Dale click al boton Crear y empeza personalizar tu Inventario.</p>
            <p><a class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg" role="button">Crear &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <h2>Modificar Inventario</h2>
            <p>Dale al botón Modificar de color naranja al lado de cada Inventario, para una nueva personalización. </p>
            <!-- <p><a class="btn btn-primary" href="#" role="button">Modificar &raquo;</a></p> -->
        </div>
        <div class="col-lg-4">
            <h2>Eliminar Inventario</h2>
            <p>Da de baja un Inventario que ya no utilices, o desees eliminar.</p>
            <p><a class="btn btn-primary"  data-toggle="collapse" data-target="#eliminar" aria-expanded="false" aria-controls="eliminar" role="button">Eliminar &raquo;</a></p>
        	
  <!-- modal eliminar -->

<div class="collapse" id="eliminar">
  <div class="well">
         <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Colocar Nombre de Inventario</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" name="eliminar" method="post" action = "eliminarInventario.htm" >



<!-- Text input-->
<div class="form-group">

  <input id="name" name="name" type="text" placeholder="Ej:Inventario" class="form-control input-md">
    

</div>


      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-danger">Eliminar</button>
      </div>
      </form>
  </div>
</div>



<!-- final modal eliminar -->
        
        </div>
    </div>
    

    <!-- Site footer -->
    <footer class="footer">
        <p>&copy; 2016 Louredo S.A., Inventario.</p>
    </footer>


<!-- modal Crear Inventario -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
        
    <form class="form-horizontal" method="post" action="crearInventario.htm" name="crear">
       <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Alta de un Inventario</h4>
      </div>
      <div class="modal-body">
      
  
			<fieldset>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="nameInventory">Nombre Inventario</label>  
  <div class="col-md-5">
  <input id="name" name="name" type="text" placeholder="" class="form-control input-md">
    
  </div>
</div>

<!-- Button Drop Down -->
<div class="form-group">
  <label class="col-md-4 control-label" for="buttondropdown">Tipo de Inventario</label>
  <div class="col-md-4">
  
    <div class="input-group">
   
      <input id="option" name="option" class="form-control" placeholder="" type="text" readonly="readonly">
      <div class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
          Opciones
          <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right">
          <li><a onclick="cambiarTipoInventario()">Inventario</a></li>
          <li><a onclick="cambiarTipoEncuesta()">Encuesta</a></li>
          <li><a onclick="cambiarTipoRelevamiento()">Relevamiento</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>

<!-- Button Drop Down -->
<div class="form-group">
  <label class="col-md-4 control-label" for="buttondropdown">Tipo de Inventario</label>
  <div class="col-md-4">
 
    <div class="input-group">
      <input id="option_marker" name="option_marker" class="form-control" placeholder="" type="text" readonly="readonly">
      <div class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
          Opciones de Markers
          <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right">
          <li><a onclick="cambiarMarkerUno()">Opción 1</a></li>
          <li><a onclick="cambiarMarkerDos()">Opción 2</a></li>
          <li><a onclick="cambiarMarkerTres()">Opción 3</a></li>
          <li><a onclick="cambiarMarkerCuatro()">Opción 4</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>


<div class="media">
 <div class="col-md-3">
  <div class="media-left media-middle">
 
    <a href="#">
      <img class="media-object" src="file/dos.png" alt="...">
    </a>
  </div>
  <div class="media-body">
    <h4 class="media-heading">Iconos Marker (Opción 1)</h4>
    Opción de dos marker para diferenciar cuales contienen fotos.
  </div>
  
  
  </div>
  <div class="col-md-3">
  <div class="media-left media-middle">
 
    <a href="#">
      <img class="media-object" src="file/uno.png" alt="...">
    </a>
  </div>
  <div class="media-body">
    <h4 class="media-heading">Iconos Marker (Opción 2)</h4>
    Opción un marker solo ver nuestro inventario.
  </div>
  </div>
  
  <div class="col-md-3">
  <div class="media-left media-middle">
 
    <a href="#">
      <img class="media-object" src="file/tres.png" alt="...">
    </a>
  </div>
  <div class="media-body">
    <h4 class="media-heading">Iconos Marker (Opción 3)</h4>
    Opción de tres marker para una amplia diferenciar entre lo que esta bien , mal o falta.
  </div>
  </div>
  
  <div class="col-md-3">
  <div class="media-left media-middle">
 
    <a href="#">
      <img class="media-object" src="file/muchos.png" alt="...">
    </a>
  </div>
  <div class="media-body">
    <h4 class="media-heading">Iconos Marker (Opción 4)</h4>
    Opción de varios marker que nos permite una amplia distinción de nuestro Inventario.
  </div>
  </div>
  
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput"></label>  
  <div class="col-md-4">
  <input id="pagina" name="pagina" type="hidden" value="/WEB-INF/mapviewerBase.jsp" class="form-control input-md">
    <input id="info" name="info" class="form-control" placeholder="" type="hidden"> 
     <input id="iconfuction" name="iconfunction" class="form-control" placeholder="" type="hidden"> 
  </div>
</div>

</fieldset>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary">Guardar</button>
      </div>
      
      </form>
    </div>
  </div>
</div>
<!--  final crear inventario -->



<!-- modal Modificar -->



<div class="modal fade modificar" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modificar Inventario</h4>
      </div>
      <div class="modal-body">
    

         <form class="form-horizontal" method="post" action = "modificarInventario.htm" name="modificar">
         
         
			<fieldset>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="nameInventory">Nombre Inventario</label>  
  <div class="col-md-5">
  <input id="nameInventoryModificar" name="nameInventoryModificar" type="text" value="<%  %>" class="form-control input-md">
    
  </div>
</div>

<!-- Button Drop Down -->
<div class="form-group">
  <label class="col-md-4 control-label" for="buttondropdown">Tipo de Inventario</label>
  <div class="col-md-4">
 
    <div class="input-group">
      <input id="option" name="option" class="form-control" placeholder="" type="text" readonly="readonly">
      <div class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
          Opciones
          <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right">
          <li><a onclick="cambiarTipoInventario()">Inventario</a></li>
          <li><a onclick="cambiarTipoEncuesta()">Encuesta</a></li>
          <li><a onclick="cambiarTipoRelevamiento()">Relevamiento</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>

<!-- Button Drop Down -->
<div class="form-group">
  <label class="col-md-4 control-label" for="buttondropdown">Tipo de Inventario</label>
  <div class="col-md-4">
 
    <div class="input-group">
      <input id="option_marker" name="option_marker" class="form-control" placeholder="" type="text" readonly="readonly">
      <div class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
          Opciones de Markers
          <span class="caret"></span>
        </button>
        <ul class="dropdown-menu pull-right">
          <li><a onclick="cambiarMarkerUno()">Opción 1</a></li>
          <li><a onclick="cambiarMarkerDos()">Opción 2</a></li>
          <li><a onclick="cambiarMarkerTres()">Opción 3</a></li>
          <li><a onclick="cambiarMarkerCuatro()">Opción 4</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>


<div class="media">
 <div class="col-md-3">
  <div class="media-left media-middle">
 
    <a href="#">
      <img class="media-object" src="file/dos.png" alt="...">
    </a>
  </div>
  <div class="media-body">
    <h4 class="media-heading">Iconos Marker (Opción 1)</h4>
    Opción de dos marker para diferenciar cuales contienen fotos.
  </div>
  
  
  </div>
  <div class="col-md-3">
  <div class="media-left media-middle">
 
    <a href="#">
      <img class="media-object" src="file/uno.png" alt="...">
    </a>
  </div>
  <div class="media-body">
    <h4 class="media-heading">Iconos Marker (Opción 2)</h4>
    Opción un marker solo ver nuestro inventario.
  </div>
  </div>
  
  <div class="col-md-3">
  <div class="media-left media-middle">
 
    <a href="#">
      <img class="media-object" src="file/tres.png" alt="...">
    </a>
  </div>
  <div class="media-body">
    <h4 class="media-heading">Iconos Marker (Opción 3)</h4>
    Opción de tres marker para una amplia diferenciar entre lo que esta bien , mal o falta.
  </div>
  </div>
  
  <div class="col-md-3">
  <div class="media-left media-middle">
 
    <a href="#">
      <img class="media-object" src="file/muchos.png" alt="...">
    </a>
  </div>
  <div class="media-body">
    <h4 class="media-heading">Iconos Marker (Opción 4)</h4>
    Opción de varios marker que nos permite una amplia distinción de nuestro Inventario.
  </div>
  </div>
  
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput"></label>  
  <div class="col-md-4">
  <input id="pagina" name="pagina" type="text" value="/WEB-INF/mapviewerBase.jsp" class="form-control input-md">
    <input id="info" name="info" class="form-control" placeholder="" type="text"> 
     <input id="marker" name="marker" class="form-control" placeholder="" type="text"> 
  </div>
</div>

</fieldset>
</form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary">Modificar</button>
      </div>
    </div>
  </div>
</div>
<!-- final modal modificar -->




</div> <!-- /container -->













<script>
    function setIdInventario(id)
    {
        document.getElementById("id_inventario").value = id;
    }
</script>
</body>
</html>