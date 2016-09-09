<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/estilos.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <title>Alta de Usuario </title>
    </head>
        
    
    <body BGCOLOR=slategray >
    


       <div class="container">
       
       <nav class="navbar navbar-inverse">
  
		<div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" form action="index.htm" method="post">
            <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-arrow-left" 
            aria-hidden="true"></span> Login </button>
          </form>
         
        </div>

</nav>
  
       
   
      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
         
          <br>
             <form action="prepareUser.htm" method="post">
                            <table>
                            
                            	<tr>
                            		<td><label for="imei">Imei</label></td>
                            		<td><input id="imei" name="imei" type="text" value="${imei}" placeholder= "Ej: 43256629740"
                            		class="form-control"></td>
                            		<td><span style="color: red">${errorPass}</span></td>
                            	
                            	</tr>
                          	
                            	 <tr>
                                    <td><br><label for="user">Nombre</label></td>
                                    <td><br><input id="name" name="name" type="text" value="${name}"placeholder=" Ejemplo: Juan " 
                                    class="form-control"/></td>
                                    <td><br><span style="color: red">${errorName}</span></td>
                                </tr>
                                <tr>
                                    <td><br><label for="username">Usuario</label></td>
                                    <td><br><input id="username" name="username" type="text" value="${username}"placeholder="User " 
                                    class="form-control"/></td>
                                    <td><br><span style="color: red">${errorUserName}</span></td>
                                </tr>
                                <tr>
                               
                                    <td><br><label for="pass">Contraseña</label></td>
                                    <td><br><input id="pass" name="pass" type="password" value="${pass}"
                                    placeholder="****** "  class="form-control" /></td>
                                    <td><br><span style="color: red">${errorPass}</span></td>
                                </tr>
                                <tr>
                                   
                                   
                                </tr>
                                <tr>
                                    <td colspan="3" ALIGN=right>
                                     <br>
                                        <input  type="submit" value="Registrar" class="btn btn-success"/>
                                       
                                    </td>
                                </tr>
                
                            </table>
                            <br />
                            
                
                        </form>
       </div>
       <div class="col-md-4"></div>

    

    </div>
    
    
    
      <hr>
      
      <footer>
      <p ALIGN=right>&copy; 2016 Louredo S.A.</p>
      </footer>
        
    </body>
</html>

