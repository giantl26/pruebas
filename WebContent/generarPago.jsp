<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.EmpleadoBean" %>
<%@ page import="beans.ComprobanteBean" %>
   <%
   		String apellido = "";
   		String mensaje = "";
   		int dni=0;
   		String nombres= "";

   		int idempleado= 0;
   		
   		EmpleadoBean empleado = (EmpleadoBean)request.getAttribute("empleado");
	   	
	   	
   		if(empleado!=null){
   	   		 apellido =empleado.getApellidos();
   	   		 dni= empleado.getDni();
   	   		 nombres=empleado.getNombre();
   	   		 idempleado = empleado.getIdempleado();
   	   		 if(nombres == null){
   	   			mensaje = "<br><div class='col-xs-5'><div class='alert alert-danger' role='alert'>El empleado no esta registrado</div></div>";
   	   		 }

   	   		 if(empleado.getApellidos()==null){
   	   			 apellido="";
   	   		 }
   	   		 if(empleado.getNombre()==null){
   	   			 nombres="";
   	   		 }
   	   		 
   		}
   		
   		ArrayList<ComprobanteBean> comprobantes =(ArrayList<ComprobanteBean>)request.getAttribute("comprobantes");
   		
   %>
<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0"> 
<title>Generar de Pago</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet">
<script type="text/javascript" src="http://gc.kis.scr.kaspersky-labs.com/1B74BD89-2A22-4B93-B451-1C9E1052A0EC/main.js" charset="UTF-8"></script>
<script type="text/javascript">
function mostrar(){
document.getElementById('oculto').style.display = 'block';}

</script>
</head>

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
        <li><a href="generarMatricula.jsp">Matriculas</a></li>
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
       <h1>Generar Pago de Trabajadores <small> Gym</small></h1>
    </div>

	<div class="page-header">
		<h3>Datos del trabajador</h3>
    </div>
<div class="form-horizontal">
   	  <form method="post" action="<%=request.getContextPath()%>/CargarInfoEmpleado">
    <div class="form-group">
        <label class="control-label col-xs-3">DNI: </label>
        <div class="col-xs-5">
            <input type="text" class="form-control" id="inputEmail" value="<%=dni%>" name="dni" required>
                   <%=mensaje%>
        </div>
        <input  type="submit" class="btn btn-primary" value="Buscar Trabajador">
    </div>
    </form>
    <div class="form-group">
        <label class="control-label col-xs-3">Nombre :</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" id="inputPassword" value="<%=nombres%>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3">Apellidos :</label>
        <div class="col-xs-5">
            <input type="text" class="form-control"  value="<%=apellido%>">
        </div>
    </div>
    <center> <input onclick="mostrar()" type="submit" class="btn btn-primary" value="Añadir Pago del Trabajador"></center>

 <div id='oculto' style='display:none;'>
 
 
    <div class="page-header">
      <h3>Datos del Servicio</h3>
    </div>

    <div class="form-group">
        <label class="control-label col-xs-3">Servicio :</label>
        <div class="col-xs-5">

	 <form method="post" action="<%=request.getContextPath()%>/GenerarPago">
	 
	 <input type="hidden" name="idempleado" value="<%=idempleado%>" />
  <label>
      <input name="check" type="checkbox"> Maquinas 
    </label>  <label>
      <input name="check" type="checkbox"> Spinning
    </label>  <label>
      <input name="check" type="checkbox"> Baile
    </label>
        </div>
    </div>


    <div class="form-group">
        <label class="control-label col-xs-3">Tipo de Pago :</label>
        <div class="col-xs-5">
           <select class="form-control" name="tipopago">
              <option>Al contado</option>
              <option>Con Tarjeta</option>
              <option>Cheque</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-xs-3">Monto por un servicio : </label>
        <div class="col-xs-5">
            <label class="form-control" id="costoServicio" name="costoServicio">S/. 100</label>
        </div>
    </div>
       
        <div class="form-group">
        <label class="control-label col-xs-3">Monto por dos servicios :</label>
        <div class="col-xs-5">
            <label class="form-control" id="costoServicio" name="costoServicio">S/. 200</label>
        </div>
    </div>
        
        <div class="form-group">
        <label class="control-label col-xs-3">Monto por tres servicio :</label>
        <div class="col-xs-5">
            <label class="form-control" id="costoServicio" name="costoServicio">S/. 300</label>
        </div>
    </div>
<br><br>
    <center>

        <input type="submit" class="btn btn-primary" value="Confirmar Pago">
         <a href="index.jsp"> 
         <input type="button" class="btn btn-primary" value="Salir"></a>
  </center>

	</form>
 </div>
<br>
</div>
		<br>
    <div class="table-responsive">          
	  <table class="table">
	    <thead>
	      <tr>
	        <th><center>Nro Comprobante</center></th>
	        <th><center>Mes</center></th>
	        <th><center>Tipo de Comp</center></th>
	      </tr>
	    </thead>
	    <tbody>
			<% if (comprobantes==null){ %>
				<tr>
					        <td><center>no tiene registros</center></td>
				</tr>
			<%}else{ %>
				      <% for(ComprobanteBean com : comprobantes){ %>
					      <tr>
					        <td><center><%=com.getIdcomprobante()%></center></td>
					        <td><center><%=com.getMes()%></center></td>
					        <td><center><%=com.getTipo()%></center></td>
					      </tr>
					      <% } %>
			<% } %>
	    </tbody>
	  </table>
	  </div>
<br><br>
</div>



<!-- Js vinculados -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/responsive.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>