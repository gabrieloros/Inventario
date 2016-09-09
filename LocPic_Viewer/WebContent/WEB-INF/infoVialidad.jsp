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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="../src/jquery.table2excel.js"></script>
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
      <th>Descripción</th>
      <th>Estado</th>
      <th><button type="button" class="btn btn-primary"  data-target=".bs-example-modal-lg" >
       <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>  Descargar Excel
		</button></th>
      
    </tr>
  </thead>
  <tbody>
  <!-- Large modal -->



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
        
     	<%}}
	 	} catch (Exception e) {%> alert(" <%=e.getMessage()%>");
	<%}%>
    
       
    </tr>
    </form>
	
    
  </tbody>
</table>

	<div align="center" id="paginador"></div>
	
	
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
		 <table class="table table-striped" id="idtabla">
  <thead class="thead-inverse">
    <tr>
      <th>Id</th>
      <th>Longitud</th>
      <th>Latitud</th>
      <th>Titulo</th>
      <th>Estado</th>
      <th></th>
      
    </tr>
  </thead>
  <tbody>
  
  	 <%
	try {
	 if (evidences != null){ %>
	
	 <%for (BOEvidence evidence : evidences) {%>
	
    <tr>

      <th scope="row"><%=evidence.getId()%></th>
      <td><%=evidence.getLongitude()%></td>
      <td><%=evidence.getLatitude()%></td>
      <td><%=inventory.getValue(evidence.getTitle(),EvidenceDataValueTypeEnum.TITLE)%></td>
      <td><%=inventory.getValue(evidence.getComment(),EvidenceDataValueTypeEnum.COMMENT)%></td>


     	<%}}
	 	} catch (Exception e) {%> alert(" <%=e.getMessage()%>");
	<%}%>
    
       
    </tr>
   
  </tbody>
</table>

    </div>
  </div>
</div>

	
	
	<script type="text/javascript">
var p = new Paginador(
    document.getElementById('paginador'),
    document.getElementById('tblDatos'),
    4
);
p.Mostrar();


$("button").click(function(){
	  $("#idtabla").table2excel({
	    filename: "tabla",
	    	fileext: ".xls"
	  }); 
	});

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
      
      
      
      
 <script>
 
//table2excel.js
 ;(function ( $, window, document, undefined ) {
     var pluginName = "table2excel",

     defaults = {
         exclude: ".noExl",
                 name: "Table2Excel"
     };

     // The actual plugin constructor
     function Plugin ( element, options ) {
             this.element = element;
             // jQuery has an extend method which merges the contents of two or
             // more objects, storing the result in the first object. The first object
             // is generally empty as we don't want to alter the default options for
             // future instances of the plugin
             //
             this.settings = $.extend( {}, defaults, options );
             this._defaults = defaults;
             this._name = pluginName;
             this.init();
     }

     Plugin.prototype = {
         init: function () {
             var e = this;

 			var utf8Heading = "<meta http-equiv=\"content-type\" content=\"application/vnd.ms-excel; charset=UTF-8\">";
             e.template = {
 				head: "<html xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:x=\"urn:schemas-microsoft-com:office:excel\" xmlns=\"http://www.w3.org/TR/REC-html40\">" + utf8Heading + "<head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets>",
                 sheet: {
                     head: "<x:ExcelWorksheet><x:Name>",
                     tail: "</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet>"
                 },
                 mid: "</x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body>",
                 table: {
                     head: "<table>",
                     tail: "</table>"
                 },
                 foot: "</body></html>"
             };

             e.tableRows = [];

             // get contents of table except for exclude
             $(e.element).each( function(i,o) {
                 var tempRows = "";
                 $(o).find("tr").not(e.settings.exclude).each(function (i,o) {
                     tempRows += "<tr>" + $(o).html() + "</tr>";
                 });
                 e.tableRows.push(tempRows);
             });

             e.tableToExcel(e.tableRows, e.settings.name, e.settings.sheetName);
         },

         tableToExcel: function (table, name, sheetName) {
             var e = this, fullTemplate="", i, link, a;

             e.uri = "data:application/vnd.ms-excel;base64,";
             e.base64 = function (s) {
                 return window.btoa(unescape(encodeURIComponent(s)));
             };
             e.format = function (s, c) {
                 return s.replace(/{(\w+)}/g, function (m, p) {
                     return c[p];
                 });
             };

             sheetName = typeof sheetName === "undefined" ? "Sheet" : sheetName;

             e.ctx = {
                 worksheet: name || "Worksheet",
                 table: table,
                 sheetName: sheetName,
             };

             fullTemplate= e.template.head;

             if ( $.isArray(table) ) {
                 for (i in table) {
                       //fullTemplate += e.template.sheet.head + "{worksheet" + i + "}" + e.template.sheet.tail;
                       fullTemplate += e.template.sheet.head + sheetName + i + e.template.sheet.tail;
                 }
             }

             fullTemplate += e.template.mid;

             if ( $.isArray(table) ) {
                 for (i in table) {
                     fullTemplate += e.template.table.head + "{table" + i + "}" + e.template.table.tail;
                 }
             }

             fullTemplate += e.template.foot;

             for (i in table) {
                 e.ctx["table" + i] = table[i];
             }
             delete e.ctx.table;

             if (typeof msie !== "undefined" && msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
             {
                 if (typeof Blob !== "undefined") {
                     //use blobs if we can
                     fullTemplate = [fullTemplate];
                     //convert to array
                     var blob1 = new Blob(fullTemplate, { type: "text/html" });
                     window.navigator.msSaveBlob(blob1, getFileName(e.settings) );
                 } else {
                     //otherwise use the iframe and save
                     //requires a blank iframe on page called txtArea1
                     txtArea1.document.open("text/html", "replace");
                     txtArea1.document.write(e.format(fullTemplate, e.ctx));
                     txtArea1.document.close();
                     txtArea1.focus();
                     sa = txtArea1.document.execCommand("SaveAs", true, getFileName(e.settings) );
                 }

             } else {
                 link = e.uri + e.base64(e.format(fullTemplate, e.ctx));
                 a = document.createElement("a");
                 a.download = getFileName(e.settings);
                 a.href = link;

                 document.body.appendChild(a);

                 a.click();

                 document.body.removeChild(a);
             }

             return true;
         }
     };

     function getFileName(settings) {
 		return ( settings.filename ? settings.filename : "table2excel" ) +
 			   ( settings.fileext ? settings.fileext : ".xlsx" );
     }

     $.fn[ pluginName ] = function ( options ) {
         var e = this;
             e.each(function() {
                 if ( !$.data( e, "plugin_" + pluginName ) ) {
                     $.data( e, "plugin_" + pluginName, new Plugin( this, options ) );
                 }
             });

         // chain jQuery functions
         return e;
     };

 })( jQuery, window, document );

 
 
 </script>
 
</body>
</html>