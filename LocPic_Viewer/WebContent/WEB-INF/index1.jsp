<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
       
            <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
            <script src="../js/jquery.table2excel.js"></script>
        <title>Login </title>
    </head>
        
    
    <body BGCOLOR=slategray >
    


       <div class="container">
  
  <nav class="navbar navbar-inverse">
  
		<div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" form action="prepareUser.htm" method="post">
            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-user" 
            aria-hidden="true"></span> Crear Usuario</button>
          </form>
          
         </div>

</nav>
  
  
       
      <!-- Ejemplo de columnas-->
      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
         
          <br>
                   <form action="login.htm" method="post" class="form-signin">
                            <table>
                                <tr>
                                    <td><label for="user">Usuario</label></td>
                                    <td><input id="user" name="user" type="text" value="${user}"placeholder="User " 
                                    class="form-control"/></td>
                                    <td><span style="color: red">${errorUser}</span></td>
                                </tr>
                                <tr>
                               
                                    <td><br><label for="pass">Contraseña </label></td>
                                    <td><br><input id="pass" name="pass" type="password" value="${pass}"
                                    placeholder="****** "  class="form-control" /></td>
                                    <td><span style="color: red">${errorPass}</span></td>
                                </tr>
                                <tr>
                                   
                                   
                                </tr>
                                <tr>
                                    <td colspan="3" ALIGN=right>
                                     <br>
                                        <input  type="submit" value="Entrar" class="btn btn-success"/>
                                    </td>
                          
                            </table>
                            <br>
                           
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






