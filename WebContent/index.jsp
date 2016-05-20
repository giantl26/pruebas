<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<% String mensaje = (String)request.getAttribute("mensaje") ;	
	if(mensaje==null){
		mensaje="";
	}
	%>  
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Iniciar Sesion</title>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/css/signin.css" rel="stylesheet">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js" charset="UTF-8"></script>
    <script src="<%=request.getContextPath()%>/js/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container">
      <br><br><br>
      <form class="form-signin" method="post" action="<%=request.getContextPath()%>/Login">
        <h2 class="form-signin-heading">Iniciar Sesion</h2>
        <label for="inputEmail" class="sr-only">Usuario : </label>
        <input type="text" name="usuario"  class="form-control" placeholder="Ingrese su usuario" required autofocus>
        <label for="inputPassword" class="sr-only">Contraseña : </label>
        <input type="password" name="clave" class="form-control" placeholder="Ingrese su contraseña" required>
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="Entrar">
        <br>
        <%=mensaje%>
      </form>
      
    </div> <!-- /container -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<%=request.getContextPath()%>/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>