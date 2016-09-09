<!DOCTYPE html>
<%@page import="com.brujula.locpic.core.boEntities.BOUser"%>
<%@page import="com.brujula.locpic.core.boEntities.BOEvidence"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="org.apache.commons.codec.binary.StringUtils"%>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Evidencia</title>
    </head>
    <body style="background-color: gray;">
        <script>
        	<% BOEvidence evidence = (BOEvidence)request.getAttribute("evidence");  
        	StringBuilder sb = new StringBuilder();
      	  sb.append("data:image/png;base64,");
      	  sb.append(StringUtils.newStringUtf8(Base64.encodeBase64(evidence.getFile(), false)));
      	
      	  String contourChart = sb.toString();%>
      	  
      	  </script>
        
       <div style="margin: 50px;">
       
      		<div>
	      		<div style="float: left">
	      			<h3>Identificador: <%=evidence.getId()%></h3> 
	      		</div>
	      		<div style="float: right">
	      			<h3>Usuario: <%=evidence.getUser().getName()%> </h3>
	      		</div>
      		</div>
      		<div style="clear: both"/>
      		<div>
      			<h3>Tipo de Artefacto: <%=evidence.getType()%> 
      		</div>
      		<div style="clear: both"/>
      		<div>
      			<h3>Estado: <%=evidence.getStatus()%> 
      		</div>
      		<div style="clear: both"/>
      		<div><form action="evidencePreviewSave.htm" method="post">
      			<span><h3>Cantidad: </span>
      			<input id="eviCount" name="eviCount" type="number" min="1" max="10" step="1" value ="<%=evidence.getCount()%>"/>
      			<input style="float: right;height: 30px; width: 94px;" type="submit" value="Guardar">
      			<input type="hidden" name="evidenceId" value="<%= evidence.getId() %>" />
      			</input>
      			</form>
      		</div>
      		
      		<div>
      			<img id="ItemPreview" data-rotate="0" name="ItemPreview" src="<%=contourChart %>" style="width:100%;transition: all 400ms;" />
      		</div>
      		
      		
      		
		</div>      
     
    </body>
</html>
