<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Inventario</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    
    	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    


    <!-- font-awesome -->
    <style>
        input[type="text"],
        input[type="password"],
        textarea,
        textarea.form-control {
            height: 50px;
            margin: 0;
            padding: 0 20px;
            vertical-align: middle;
            background: #f8f8f8;
            border: 3px solid #ddd;
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            font-weight: 300;
            line-height: 50px;
            color: #888;
            -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
            -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
            -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s; -ms-transition: all .3s; transition: all .3s;
        }

        textarea,
        textarea.form-control {
            padding-top: 10px;
            padding-bottom: 10px;
            line-height: 30px;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        textarea:focus,
        textarea.form-control:focus {
            outline: 0;
            background: #fff;
            border: 3px solid #ccc;
            -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
        }

        input[type="text"]:-moz-placeholder, input[type="password"]:-moz-placeholder,
        textarea:-moz-placeholder, textarea.form-control:-moz-placeholder { color: #888; }

        input[type="text"]:-ms-input-placeholder, input[type="password"]:-ms-input-placeholder,
        textarea:-ms-input-placeholder, textarea.form-control:-ms-input-placeholder { color: #888; }

        input[type="text"]::-webkit-input-placeholder, input[type="password"]::-webkit-input-placeholder,
        textarea::-webkit-input-placeholder, textarea.form-control::-webkit-input-placeholder { color: #888; }



        button.btn {
            height: 50px;
            margin: 0;
            padding: 0 20px;
            vertical-align: middle;
            background: #4aaf51;
            border: 0;
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            font-weight: 300;
            line-height: 50px;
            color: #fff;
            -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
            text-shadow: none;
            -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
            -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s; -ms-transition: all .3s; transition: all .3s;
        }

        button.btn:hover { opacity: 0.6; color: #fff; }

        button.btn:active { outline: 0; opacity: 0.6; color: #fff; -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none; }

        button.btn:focus { outline: 0; opacity: 0.6; background: #4aaf51; color: #fff; }

        button.btn:active:focus, button.btn.active:focus { outline: 0; opacity: 0.6; background: #4aaf51; color: #fff; }


    </style>

    <!-- style -->
    <style>

        body {
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            font-weight: 300;
            color: #888;
            line-height: 30px;
            text-align: center;
        }

        strong { font-weight: 500; }

        a, a:hover, a:focus {
            color: #4aaf51;
            text-decoration: none;
            -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s; -ms-transition: all .3s; transition: all .3s;
        }

        h1, h2 {
            margin-top: 10px;
            font-size: 38px;
            font-weight: 100;
            color: #555;
            line-height: 50px;
        }

        h3 {
            font-size: 22px;
            font-weight: 300;
            color: #555;
            line-height: 30px;
        }

        img { max-width: 100%; }

        ::-moz-selection { background: #4aaf51; color: #fff; text-shadow: none; }
        ::selection { background: #4aaf51; color: #fff; text-shadow: none; }


        .btn-link-1 {
            display: inline-block;
            height: 50px;
            margin: 5px;
            padding: 16px 20px 0 20px;
            background: #4aaf51;
            font-size: 16px;
            font-weight: 300;
            line-height: 16px;
            color: #fff;
            -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
        }
        .btn-link-1:hover, .btn-link-1:focus, .btn-link-1:active { outline: 0; opacity: 0.6; color: #fff; }

        .btn-link-1.btn-link-1-facebook { background: #4862a3; }
        .btn-link-1.btn-link-1-twitter { background: #55acee; }
        .btn-link-1.btn-link-1-google-plus { background: #dd4b39; }

        .btn-link-1 i {
            padding-right: 5px;
            vertical-align: middle;
            font-size: 20px;
            line-height: 20px;
        }

        .btn-link-2 {
            display: inline-block;
            height: 50px;
            margin: 5px;
            padding: 15px 20px 0 20px;
            background: rgba(0, 0, 0, 0.3);
            border: 1px solid #fff;
            font-size: 16px;
            font-weight: 300;
            line-height: 16px;
            color: #fff;
            -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
        }
        .btn-link-2:hover, .btn-link-2:focus,
        .btn-link-2:active, .btn-link-2:active:focus { outline: 0; opacity: 0.6; background: rgba(0, 0, 0, 0.3); color: #fff; }


        /***** Top content *****/

        .inner-bg {
            padding: 100px 0 170px 0;
        }

        .top-content .text {
            color: #fff;
        }

        .top-content .text h1 { color: #fff; }

        .top-content .description {
            margin: 20px 0 10px 0;
        }

        .top-content .description p { opacity: 0.8; }

        .top-content .description a {
            color: #fff;
        }
        .top-content .description a:hover,
        .top-content .description a:focus { border-bottom: 1px dotted #fff; }

        .form-box {
            margin-top: 35px;
        }

        .form-top {
            overflow: hidden;
            padding: 0 25px 15px 25px;
            background: #fff;
            -moz-border-radius: 4px 4px 0 0; -webkit-border-radius: 4px 4px 0 0; border-radius: 4px 4px 0 0;
            text-align: left;
        }

        .form-top-left {
            float: left;
            width: 75%;
            padding-top: 25px;
        }

        .form-top-left h3 { margin-top: 0; }

        .form-top-right {
            float: left;
            width: 25%;
            padding-top: 5px;
            font-size: 66px;
            color: #ddd;
            line-height: 100px;
            text-align: right;
        }

        .form-bottom {
            padding: 25px 25px 30px 25px;
            background: #eee;
            -moz-border-radius: 0 0 4px 4px; -webkit-border-radius: 0 0 4px 4px; border-radius: 0 0 4px 4px;
            text-align: left;
        }

        .form-bottom form textarea {
            height: 100px;
        }

        .form-bottom form button.btn {
            width: 100%;
        }

        .form-bottom form .input-error {
            border-color: #4aaf51;
        }

        .social-login {
            margin-top: 35px;
        }

        .social-login h3 {
            color: #fff;
        }

        .social-login-buttons {
            margin-top: 25px;
        }


        /***** Media queries *****/

        @media (min-width: 992px) and (max-width: 1199px) {}

        @media (min-width: 768px) and (max-width: 991px) {}

        @media (max-width: 767px) {

            .inner-bg { padding: 60px 0 110px 0; }

        }

        @media (max-width: 415px) {

            h1, h2 { font-size: 32px; }

        }


    </style>
    
     <script> 


    function cambiaDefectoAdmin(){ 
      	document.registro.rol.defaultValue = "admin" 
    } 
    
function cambiaDefectoWeb(){ 
  	document.registro.rol.defaultValue = "userWeb" 
} 
function cambiaDefectoApp(){ 
  	document.registro.rol.defaultValue = "userMovil" 
} 
</script>
    
</head>

<body>

<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>Inventario</strong> Login</h1>
                    <div class="description">
                        <p>
                           Registrate gratis en Inventario y probalo ya!!. Conoce mas de nosotros  <a href="http://godoycruz.gestionyservicios.com.ar:8080/WebGyS/"><strong>Louredo S.A.</strong></a>.
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>Ingresar:</h3>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-key"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                           <form action="login.htm" method="post" class="form-signin">
                            <div class="form-group">
                                <label class="sr-only" for="user">Usuario</label>
                                <input type="text" name="user" placeholder="Usuario..." class="form-username form-control" id="user" value="${user}">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="pass">Contraseña</label>
                                <input type="password" name="pass" placeholder="Contraseña..." class="form-password form-control" id="pass" value="${pass}">
                            </div>
                              <div class="alert alert-danger alert-dismissible" role="alert">
  					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  					<strong>Error al Entrar !</strong> Verifique Usuario y Contraseña, y intentelo nuevamente.
						</div>
                             <button type="submit" class="btn" data-loading-text="Entrando...">Entrar</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 social-login">
                    <h3>...Empeza a formar parte de nosotros aqui! </h3>
                    
                    <!-- <form class="navbar-form navbar-right" action="prepareUser.htm" method="post">
                    <div class="social-login-buttons">
                        <button type="submit"class="btn btn-link-1 btn-link-1-facebook"> Registrar </button>
                    </div>
                       </form> -->
                       <br>
                       
					  <button class="btn btn-link-1 btn-link-1-facebook" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
						  Registrar aqui!
						</button>
						<div class="collapse" id="collapseExample">
						  <div class="well">
						     <div class="row">
       
         
          <br>
                 <form action="prepareUser.htm" method="post" name="registro">
             
             
             					<div class="btn-group" data-toggle="buttons-radio">
								  <input type="button" value="Administrador" onclick="cambiaDefectoAdmin()" class="btn btn-primary">
								  <input  type="button" value="Usuario Web" onclick="cambiaDefectoWeb()" class="btn btn-primary">
								  <input  type="button" value="Usuario Movil" onclick="cambiaDefectoApp()" class="btn btn-primary">
								</div>
                                           
                                <hr>                            	
                       
                            <table>
                    	
                            	<tr>
                            		<td><label for="imei">Imei</label></td>
                            		<td><input id="imei" name="imei" type="text" value="${imei}" placeholder= "Ej: 43256629740"
                            		class="form-control"></td>
                            		<td><span style="color: red">${errorPass}</span></td>
                            		<td> <span class="help-block">*Si no sabes tu imei, ingresa en el telefono *#06#</span>                        		                           		
                            		</td>
                            	
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
                               	<td><input type="hidden" name="rol" id="rol" class="form-control" value="" /></td>
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
						</div>
                </div>
              
            </div>
        </div>
    </div>
             <footer>
      			<p ALIGN=right>&copy; 2016 Louredo S.A.</p>
     				 </footer>

</div>


<!-- Javascript -->

<script src="http://marconiband.com/wp-content/themes/marconi/js/jquery.backstretch.min.js"></script>



<script >

    jQuery(document).ready(function() {

        /*
         Fullscreen background
         */
        $.backstretch("file/imgIndex.png");

       /*  
         Form validation
         
        $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
            $(this).removeClass('input-error');
        });

        $('.login-form').on('submit', function(e) {

            $(this).find('input[type="text"], input[type="password"], textarea').each(function(){
                if( $(this).val() == "" ) {
                    e.preventDefault();
                    $(this).addClass('input-error');
                }
                else {
                    $(this).removeClass('input-error');
                }
            });

        }); */


    });


    $(document).ready(function(){

    $(".user").val("Usuario...");
    $(".pass").val("Contraseña...");

});
</script>


</body>

</html>
