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


<script>

function enviar_formulario(){ 

	   document.salir.submit() 
	} 

</script>

</head>

<body>

<div class="container">
    <br>
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
                <li role="presentation" class="active"><a ><span class="glyphicon glyphicon-user" aria-hidden="true"></span> ${sessionScope.user}</a></li>
                <li role="presentation"><a href="#">Opciones</a></li>
                <li role="presentation"><a href="javascript:enviar_formulario()">Salir</a></li>
            </ul>
        </nav>
        <form class="navbar-form navbar-right" name="salir" action="out.htm"
			method="post">
			
		</form>
        <h3 class="text-muted">Inventario</h3>
    </div>
    <%
    List<BOInventario> listInventario = (List<BOInventario>) request.getAttribute("inventarios");
    %>

    <table class="table table-striped" >
        <thead class="thead-inverse">
        <tr>
        	<th></th>
            <th>Listado de Inventarios</th>
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
                    <button  onclick="setIdInventario(<%=inventario.getId()%>)" class="btn btn-warning dropdown-toggle" >Modificar</button>

                </td>
                <%}}
                } catch (Exception e) {%> alert(" <%=e.getMessage()%>");
                <%}%>


            </tr>
        </form>


        </tbody>
    </table>

  

    <!-- Example row of columns -->
    <div class="row">
        <div class="col-lg-4">
            <h2>Crear Inventario</h2>
            <p class="text-info">Crea tu nuevo Inventario, dale un nombre,personaliza tus markers, zonas, tipo de inventario y mucho mas.</p>
            <p>Dale click al boton Crear y empeza personalizar tu Inventario.</p>
            <p><a class="btn btn-primary" href="#" role="button">Crear &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <h2>Modificar Inventario</h2>
            <p>Dale al botón Modificar de color naranja al lado de cada Inventario, para una nueva personalización. </p>
            <!-- <p><a class="btn btn-primary" href="#" role="button">Modificar &raquo;</a></p> -->
        </div>
        <div class="col-lg-4">
            <h2>Eliminar Inventario</h2>
            <p>Da de baja un Inventario que ya no utilices, o desees eliminar.</p>
            <p><a class="btn btn-primary" href="#" role="button">Eliminar &raquo;</a></p>
        </div>
    </div>

    <!-- Site footer -->
    <footer class="footer">
        <p>&copy; 2016 Louredo S.A., Inventario.</p>
    </footer>

</div> <!-- /container -->

<script>
    function setIdInventario(id)
    {
        document.getElementById("id_inventario").value = id;
    }
</script>
</body>
</html>