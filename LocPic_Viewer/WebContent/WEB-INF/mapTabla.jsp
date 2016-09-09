<!DOCTYPE html>
<%@page import="com.brujula.locpic.core.enums.EvidenceDataValueTypeEnum"%>
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
<title>6tm - Seguimiento de Obras</title>
<style>

.pag_btn {
            -webkit-border-radius: 36;
            -moz-border-radius: 36;
            border-radius: 36px;
            font-family: Arial;
            color: #000000;
            font-size: 13px;
            background: #c9d1d6;
            padding: 5px 5px 5px 5px;
            text-decoration: none;
        }

        .pag_btn:hover  {
            background: #a3bbc9;
            background-image: -webkit-linear-gradient(top, #a3bbc9, #d9d2d9);
            background-image: -moz-linear-gradient(top, #a3bbc9, #d9d2d9);
            background-image: -ms-linear-gradient(top, #a3bbc9, #d9d2d9);
            background-image: -o-linear-gradient(top, #a3bbc9, #d9d2d9);
            background-image: linear-gradient(to bottom, #a3bbc9, #d9d2d9);
            text-decoration: none;
        }

        .pag_num {
            -webkit-border-radius: 46;
            -moz-border-radius: 46;
            border-radius: 46px;
            font-family: Arial;
            color: #000000;
            font-size: 10px;
            background: #c9d1d6;
            padding: 18px 5px 18px 5px;
            text-decoration: none;
        }

        .pag_num:hover {
            background: #a3bbc9;
            background-image: -webkit-linear-gradient(top, #a3bbc9, #d9d2d9);
            background-image: -moz-linear-gradient(top, #a3bbc9, #d9d2d9);
            background-image: -ms-linear-gradient(top, #a3bbc9, #d9d2d9);
            background-image: -o-linear-gradient(top, #a3bbc9, #d9d2d9);
            background-image: linear-gradient(to bottom, #a3bbc9, #d9d2d9);
            text-decoration: none;
        }
        .pag_btn_des {
            border: solid 1px;
            border-color: rgb(200, 200, 200);
            color: rgb(200, 200, 200);
            background-color: rgb(245, 245, 245);
        }

</style>
<script>

<!-- paginador -->

Paginador = function(divPaginador, tabla, tamPagina)
{
    this.miDiv = divPaginador; //un DIV donde irán controles de paginación
    this.tabla = tabla;           //la tabla a paginar
    this.tamPagina = 10; //el tamaño de la página (filas por página)
    this.pagActual = 1;         //asumiendo que se parte en página 1
    this.paginas = Math.floor((this.tabla.rows.length -1) / this.tamPagina); //¿?
 
    this.SetPagina = function(num)
    {
        if (num < 0 || num > this.paginas)
            return;
 
        this.pagActual = num;
        var min = 1 + (this.pagActual - 1) * this.tamPagina;
        var max = min + this.tamPagina - 1;
 
        for(var i = 1; i < this.tabla.rows.length; i++)
        {
            if (i < min || i > max)
                this.tabla.rows[i].style.display = 'none';
            else
                this.tabla.rows[i].style.display = '';
        }
        this.miDiv.firstChild.rows[0].cells[1].innerHTML = this.pagActual;
    }
 
    this.Mostrar = function()
    {
        //Crear la tabla
        var tblPaginador = document.createElement('table');
 
        //Agregar una fila a la tabla
        var fil = tblPaginador.insertRow(tblPaginador.rows.length);
 
        //Ahora, agregar las celdas que serán los controles
        var ant = fil.insertCell(fil.cells.length);
        ant.innerHTML = '< Anterior';
        ant.className = 'pag_btn'; //con eso le asigno un estilo
        var self = this;
        ant.onclick = function()
        {
            if (self.pagActual == 1)
                return;
            self.SetPagina(self.pagActual - 1);
        }
 
        var num = fil.insertCell(fil.cells.length);
        num.innerHTML = ''; //en rigor, aún no se el número de la página
        num.className = ' - pag_num - ';
 
        var sig = fil.insertCell(fil.cells.length);
        sig.innerHTML = 'Siguiente >';
        sig.className = 'pag_btn';
        sig.onclick = function()
        {
            if (self.pagActual == self.paginas)
                return;
            self.SetPagina(self.pagActual + 1);
        }
 
        //Como ya tengo mi tabla, puedo agregarla al DIV de los controles
        this.miDiv.appendChild(tblPaginador);
 
        //¿y esto por qué?
        if (this.tabla.rows.length - 1 > this.paginas * this.tamPagina)
            this.paginas = this.paginas + 1;
 
        this.SetPagina(this.pagActual);
    }
};


</script>
 <script>
        
      function setSelectedId(evidenceId){
    	  document.getElementById("evidenceId").value = evidenceId;
      }

      </script>

<body>
		 <%List<BOEvidence> evidences = (List<BOEvidence>) request.getAttribute("evidences");%>

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="javascript:history.back()"><span aria-hidden="true">&times;</span></button>
       	<% 
        BOInventario inventory = (BOInventario)request.getAttribute("inventario");
       	String nombre = inventory.getName(); 
       	%>
        <h4 class="modal-title" id="myModalLabel">Tabla <%=nombre%></h4>
      </div>
      <div class="modal-body">
        <table class="table table-striped" id="tblDatos">
  <thead class="thead-inverse">
    <tr>
      <th>#</th>
      <th>Usuario</th>
      <th>Fecha-hora</th>
      <th>Nro Formulario</th>
      <th>Descripción</th>
      <th></th>
      
    </tr>
  </thead>
  <tbody>
  
  	 <%
	try {
	 if (evidences != null){ %>
	
	 <%for (BOEvidence evidence : evidences) {%>
	 <form action="formulario.htm" method="post">
    <tr>

      <th scope="row"><%=evidence.getId()%></th>
      <td><%=evidence.getUser()%></td>
      <td><%=evidence.getCaptureDTimeInString()%></td>
      <td><%=inventory.getValue(evidence.getTitle(),EvidenceDataValueTypeEnum.TITLE)%></td>
      <td><%=inventory.getValue(evidence.getComment(),EvidenceDataValueTypeEnum.COMMENT)%></td>
      
		<td><input type="hidden" name="evidenceId" id="evidenceId" value=""></td>
      <td>
      	<button type="submit" onclick = "setSelectedId(<%=evidence.getId() %>)" class="btn btn-default dropdown-toggle" >Ver Formulario</button>
      
      </td>
     	<%}}
	 	} catch (Exception e) {%> alert(" <%=e.getMessage()%>");
	<%}%>
    
       
    </tr>
    </form>
	
   
  </tbody>
</table>

	<div align="center" id="paginador"></div>

	<script type="text/javascript">
var p = new Paginador(
    document.getElementById('paginador'),
    document.getElementById('tblDatos'),
    4
);
p.Mostrar();
</script>
   
      
  	
	
      </div>
      <div class="modal-footer">
     	
     
        <div align="center">
        <a onclick="javascript:history.back()"><button type="button" class="btn btn-success" data-dismiss="modal">
        <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>  Volver al Mapa</button></a> </div> 
       
        </div>
     
          <hr>


 		<footer>
      <p ALIGN=right>&copy; 2016 Louredo S.A.</p>
      </footer>
      
 
 
</body>
</html>