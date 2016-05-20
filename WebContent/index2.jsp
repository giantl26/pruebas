<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<% String mensaje = (String)request.getAttribute("mensaje") ;	
	if(mensaje==null){
		mensaje="";
	}
	%>  
<!DOCTYPE html>
<html >
  <head>
    
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
   	<link href="<%=request.getContextPath()%>/css/signin.css" rel="stylesheet">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js" charset="UTF-8"></script>
    <script src="<%=request.getContextPath()%>/js/ie-emulation-modes-warning.js"></script>
    <script src="<%=request.getContextPath()%>/js/ie10-viewport-bug-workaround.js"></script>
    
    <meta charset="UTF-8">
    <title>Surco Gym</title>
    
    
    <link rel="stylesheet" href="css/reset.css">

    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900'>
	<link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Montserrat:400,700'>
	<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

        <link rel="stylesheet" href="css/style.css">
    
  </head>

  <body>

    
<div class="container">
  <div class="info">
    <h1><b>Surco Gym</b></h1><span>Creado con garra <i class="fa fa-trophy" style="color: #337ab7;"></i> por <a href="http://andytran.me">Surco Gym</a></span>
  </div>
</div>
<div class="form">
  <div class="thumbnail"><img src="<%=request.getContextPath()%>/images/pesas.png"/></div>
  
  <form class="register-form">
    <input type="text" placeholder="name"/>
    <input type="password" placeholder="password"/>
    <input type="text" placeholder="email address"/>
    <button>create</button>
    <p class="message">Already registered? <a href="#">Sign In</a></p>
  </form>
  
  <form class="login-form" method="post" action="<%=request.getContextPath()%>/Login">
    <input type="text" placeholder="usuario" name="usuario"/>
    <input type="password" placeholder="contrase&ntilde;a" name="clave"/>
    <button>Iniciar Sesi&oacute;n</button>
    <p class="message">Copyright @ BarTripzZ, <a href="#">2016 All rights reserved</a></p>
    <br>
    <%=mensaje%>
  </form>
  
  
</div>
<video id="video" autoplay="autoplay" loop="loop" poster="polina.jpg">
  <source src="http://andytran.me/A%20peaceful%20nature%20timelapse%20video.mp4" type="video/mp4"/>
</video>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>

    
    
    
  </body>
</html>
