<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<% String mensaje = (String)request.getAttribute("mensaje") ;	
	if(mensaje==null){
		mensaje="";
	}
	%>  

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Surco Gym</title>

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
	<form class="login-form" method="post" action="<%=request.getContextPath()%>/Login">
		<div class="container">
			<div class="top">
				<h1 id="title" class="hidden"><span id="logo">Surco <span>Gym</span></span></h1>
			</div>
			<div class="login-box animated fadeInUp">
				<div class="box-header">
					<h2>Inicio de Sesión</h2>
				</div>
				<label for="username">Usuario</label>
				<br/>
				<input type="text" name="usuario">
				<br/>
				<label for="password">Contraseña</label>
				<br/>
				<input type="password" name="clave">
				<br/>
				<button type="submit">Iniciar Sesión</button>
				<br/>
				<a href="#"><p class="small">Copyright @ BarTripzZ</p></a>
				<br>
    			<%=mensaje%>
			</div>
		</div>
	</form>	
</body>

<script>
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>

</html>