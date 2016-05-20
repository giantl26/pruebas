<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.ClienteBean" %>
<%@ page import="beans.RegistrarPagoBean" %>
<%@ page import="beans.ServicioxClienteBean" %>
   <%
   		String apellido = "";
   		String direccion= "";
   		String distrito= "";
   		String mensaje = "";
   		String dni="";
   		int estado = 0;
   		String idcliente ="";
   		String nombres= "";
   		String sexo= "";
   		int telefono = 0;
	   	ClienteBean cliente = (ClienteBean)request.getAttribute("cliente");
   		if(cliente!=null){
   	   		 apellido =cliente.getApellidos();
   	   		 direccion= cliente.getDireccion();
   	   		 distrito= cliente.getDistrito();
   	   		 dni= ""+cliente.getDni();
   	   		 estado = cliente.getEstado();
   	   		 idcliente = ""+cliente.getIdcliente();
   	   		 nombres=cliente.getNombres();
   	   		 if(nombres == null){
   	   			mensaje = "<br><div class='col-xs-5'><div class='alert alert-danger' role='alert'>El cliente no esta registrado</div></div>";
   	   		 }
   	   		 sexo= cliente.getSexo();
   	   		 if(cliente.getSexo()==null){
   	   			 sexo="H";
   	   		 }

   	   		 if(cliente.getNombres()==null){
   	   			 nombres="";
   	   		 }

   	   		 if(cliente.getDireccion()==null){
   	   			 direccion="";
   	   		 }

   	   		 if(cliente.getApellidos()==null){
   	   			 apellido="";
   	   		 }
   	   		 telefono = cliente.getTelefono();
   		}
   		
   		ArrayList<RegistrarPagoBean> registros =(ArrayList<RegistrarPagoBean>)request.getAttribute("registros");
   %>
<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0"> 

<!-- ******************************* JAVA SCRIPT ******************************* -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/gym.js" charset="UTF-8"></script></head>

<!-- ******************************* JAVA SCRIPT ******************************* -->

<title>Registro de Pago</title>
    <!-- Estilos CSS vinculados -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet">
<script type="text/javascript" src="http://gc.kis.scr.kaspersky-labs.com/1B74BD89-2A22-4B93-B451-1C9E1052A0EC/main.js" charset="UTF-8"></script></head>
<script>

</script>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Gym</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="generarMatricula.jsp">Matrículas</a></li>
        <li  class="active" class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pagos <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="registrarPago.jsp">Registrar Pagos</a></li>
            <li><a href="generarPago.jsp">Generar Pagos</a></li>
          </ul>
        </li>
        <li><a href="#">Consultar</a></li>
        <li><a href="#">Reportes</a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li><a href="index.jsp">Cerrar Sesion</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
  <div class="container">

	<div class="page-header">
       <h1>Registrar Pagos de Matricula <small> Gym</small></h1>
    </div>

	<div class="page-header">
		<h3>Datos del Cliente</h3>
    </div>
<div class="form-horizontal">
	<form method="post" action="<%=request.getContextPath()%>/CargarInfoCliente2">
    <div class="form-group">
        <label class="control-label col-xs-3">DNI : </label>
        <div class="col-xs-5">
            <input type="text" class="form-control" name="dni" value="<%=dni%>" maxlength="8" onkeypress="return solonumeros(event)" >
            <%=mensaje%>
        </div>
        <input  type="submit" class="btn btn-primary" value="Consultar Pagos">
    </div>
    </form>
    <div class="form-group">
        <label class="control-label col-xs-3">Nombre :</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" id="inputPassword" disabled="disabled" value="<%=nombres%>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3">Apellidos :</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" disabled="disabled" value="<%=apellido%>">
        </div>
    </div>
    
    <!--
    <div class="form-group">
        <label class="control-label col-xs-3">Código de cliente :</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" disabled="disabled" value="<%=idcliente%>">
        </div>
    </div>
    -->

<hr>

</div>
		<br>
    <div class="table-responsive">          
	  <table class="table">
	    <thead>
	      <tr>
	        <th><center>Numero de Pago</center></th>
	        <th><center>Servicios</center></th>
	        <th><center>Costo</center></th>
            <th><center>Estado</center></th>
	      </tr>
	    </thead>
	    <tbody>
			<% if (registros==null){ %>
				<tr>
					        <td><center>no tiene registros</center></td>
				</tr>
			<%}else{ %>
				      <% for(RegistrarPagoBean registro : registros){ %>
					      <tr>
					        <td><center><%=registro.getIdregistropago() %></center></td>
					        <td><center><%=registro.getNombreservicio()%></center></td>
					        <td><center><%=registro.getCosto() %></center></td>
					        <td><center><%=registro.getEstado() %></center></td>
					      </tr>
					      <% } %>
			<% } %>
	    </tbody>
	  </table>
	  </div>
<br><br>
	  <center>

	  	  <input type="submit" class="btn btn-primary" value="Añadir Nuevo Pago de Matricula" data-toggle="modal" data-target="#myModal">

	  	   <a href="generarMatricula.jsp"> <input type="submit" class="btn btn-primary" value="Generar Nueva Matricula"></a>
	</center>
<br><br>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
  <form method="post"  action="<%=request.getContextPath()%>/GuardarRegistroPago">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Datos Del Cliente</h4>
      </div>
      <div class="modal-body">
      	<input type="hidden" name="idcliente" value=<%=idcliente%> />
      	
      	<div class="form-group">
      	<label>Codigo de Registro de Pago</label>
      	<input type="text" name="idregistro" class="form-control" />
      	</div>
           <div class="form-group">
            <label for="email">Tipo de Membresia : </label>
            <select class="form-control" name="mem">
              <option value="1">Mensual</option>
              <option value="2">3 Meses</option>
              <option value="3">6 Meses</option>
              <option value="4">1 Año</option>
            </select>
          </div>
          <div class="form-group">
            <label for="pwd">Costo de Membresia : </label>
            <label class="form-control">Mensual : S./ 100.00</label><br>
            <label class="form-control">3 Meses : S./ 270.00</label><br>
            <label class="form-control">6 Meses : S./ 500.00</label><br>
            <label class="form-control">1 Año : S./ 1000.00</label><br>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <input type="submit" class="btn btn-primary" value="Registrar Pago">
      </div>
    </div>
    </form>
  </div>
</div>

<!-- Js vinculados -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/responsive.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>