<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.ClienteBean" %>
<%@ page import="beans.ServicioxClienteBean" %>
   <%
   		String apellido = "";
   		String direccion= "";
   		String distrito= "";
   		String mensaje = "";
   		String dni="";
   		int estado = 0;
   		int idcliente =0;
   		String nombres= "";
   		String sexo= "";
   		String telefono="";
   		String celular ="";
	   	ClienteBean cliente = (ClienteBean)request.getAttribute("cliente");

   		if(cliente!=null){
   	   		 apellido =cliente.getApellidos();
   	   		 direccion= cliente.getDireccion();
   	   		 distrito= cliente.getDistrito();
   	   		 dni= ""+cliente.getDni();
   	   		 estado = cliente.getEstado();
   	   		 telefono = ""+cliente.getTelefono();
   	   		 idcliente = cliente.getIdcliente();
   	   		 nombres=cliente.getNombres();
   	   		 if(nombres == null){
   	   			mensaje = "<br><div class='col-xs-5'><div class='alert alert-danger' role='alert'>El cliente no esta registrado</div></div>";
   	   		 }
   	   		 sexo= cliente.getSexo();
   	   		 if(cliente.getSexo()==null){
   	   			 sexo="H";
   	   		 }
   	   		 if(cliente.getApellidos()==null){
   	   			 apellido="";
   	   		 }
   	   		 if(cliente.getNombres()==null){
   	   			 nombres="";
   	   		 }
   	   		 if(cliente.getDireccion()==null){
   	   			 direccion="";
   	   		 }
   	   		 if(cliente.getDistrito()==null){
   	   			 distrito="";
   	   		 }
   	   		 
   	   		 celular = ""+cliente.getCelular();
   		}
 
   			
   		
   		ArrayList<ServicioxClienteBean> servicios =(ArrayList<ServicioxClienteBean>)request.getAttribute("servicios");
   		
   %>
<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0"> 

<!-- ******************************* JAVA SCRIPT ******************************* -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/gym.js" charset="UTF-8"></script></head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js" charset="UTF-8"></script>
<!-- ******************************* JAVA SCRIPT ******************************* -->

 
<script>
    $(document).on("ready", function() {
       $('#myform').submit(function(event) {
            event.preventDefault();
            var url = $(this).attr('action');
            var datosform = $(this).serialize()
          	var datosdni = $("#dni").serialize();
            var datos=datosform +'&' +datosdni;
          	
            
           $.post(url, datos, function(responseText) {
             $('#tabla').html($("<div/>").html(responseText).find('#tabla').html());
        		});          
        });
         
              
    });
</script>
<script>
    $(document).on("ready", function() {


        $('#formdni').submit(function(event) {
               event.preventDefault();
               var url = $(this).attr('action');
               var datos= $(this).serialize()
              	
                $.post(url, datos, function(responseText) {
                $('#datos').html($("<div/>").html(responseText).find('#datos').html());
                $('#tabla').html($("<div/>").html(responseText).find('#tabla').html());
                $('#idcliente').html($("<div/>").html(responseText).find('#idcliente').html());
                });          
           });
        
         $('#limpiar').click(function(){
        	 $('#html').load('generarMatricula.jsp');
                 
         })
              
    });
</script>


<title>Generar Matricula</title>
    <!-- Estilos CSS vinculados -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    <body id='html'>
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
        <li  class="active"><a href="generarMatricula.jsp">Matriculas</a></li>
        <li class="dropdown">
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

       <button style="float:right"  type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Registrar Cliente</button>
       <h1>Generar Matricula del Cliente <small>Surco Gym</small></h1>
    </div>

	<div class="page-header">
		<h3>Datos del Cliente</h3>
    </div>
<div  class="form-horizontal">

    <form id="formdni" method="post" action="<%=request.getContextPath()%>/CargarInfoCliente">
    <div class="form-group">        
        <label class="control-label col-xs-3">DNI:</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" name="dni" id="dni" value="<%=dni%>" maxlength="8" onkeypress="return solonumeros(event)" onpaste="return false">
            <%=mensaje%>
        </div>
        <input  type="submit" class="btn btn-primary" value="Buscar Cliente">
               
    </div></form>
   
  <div  id="datos">  
    <div class="form-group">
        <label class="control-label col-xs-3">Apellidos :</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" disabled="disabled" value="<%=apellido%>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3">Nombre :</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" disabled="disabled" value=<%=nombres%>>
        </div>
    </div>
    
    
    <div class="form-group">
        <label class="control-label col-xs-3">Sexo :</label>
        <div class="col-xs-2">
            <label class="radio-inline">
            <% if(sexo.equals("M")){ %>
            	<input type="radio" name="genderRadios" value="male" checked > Maculino
            <% }else{ %>
          		  <input type="radio" name="genderRadios" disabled="disabled" value="male"> Maculino
            <% } %>
            </label>
        </div>
        <div class="col-xs-2">
            <label class="radio-inline">
            <% if(sexo.equals("F")){ %>
            	<input type="radio" name="genderRadios" value="female" checked> Femenino
            <% }else{ %>
          		  <input type="radio" name="genderRadios" disabled="disabled" value="female"> Femenino
            <% } %>
                
            </label>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3">Telefono :</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" disabled="disabled" maxlength="7"  value="<%=telefono%>" onkeypress="return solonumeros(event)">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3">Celular:</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" disabled="disabled" value="<%=celular%>"  maxlength="9" onkeypress="return solonumeros(event)" onpaste="return false">
        </div>
    </div>   
    <div class="form-group">
        <label class="control-label col-xs-3">Direccion :</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" disabled="disabled" value="<%=direccion%>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3">Distrito :</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" disabled="disabled" value="<%=distrito%>">
        </div>
    </div>
 </div>  

    <br>	

    <div class="page-header">
		<h3>Datos del Servicio</h3>
    </div>
	<form id="myform" method="post"action="<%=request.getContextPath()%>/GrabarServicio"  >
	<div id="idcliente"> <input type="hidden" name="idcliente" value="<%=idcliente%>"/></div>
    <div class="form-group">
        <label class="control-label col-xs-3">Servicio :</label>
        <div class="col-xs-3">
            <select class="form-control" name="servicio">
                <option>Maquinas</option>
                <option>Spinning</option>
                <option>Baile</option>
            </select>
        </div>
        <div class="col-xs-3">
			<button  onclick="alert('Disponible !! ')"  type="button" class="btn btn-primary">Buscar Servicio</button>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3">Horario :</label>
        <div class="col-xs-3">
            <select class="form-control" name="horario">
                <option>8:00 am - 10:15 am</option>
                <option>10:15 am - 1:30 pm</option>
                <option>1:30 am - 3:15 am</option>
                <option>3:15 am - 6:30 am</option>
            </select>
        </div>
        <div class="col-xs-3">
			<button onclick="alert('Disponible !! ')"  type="button" class="btn btn-primary">Buscar Horario</button>
        </div>
    </div>
    
    <br>
   <div class="form-group">
        <div class="col-xs-offset-3 col-xs-9">
            <input type="submit" class="btn btn-primary" value="Agregar">
        </div>
    </div>
    </form>

		<br>
    <div class="table-responsive">          
	  <table id="tabla" class="table">
	    <thead>
	      <tr>
	        <th><center>Nro#</center></th>
	        <th><center>Servicio</center></th>
	        <th><center>Horario</center></th>
	      </tr>
	    </thead>
	    <tbody>
			<% if (servicios==null){ %>
				<tr>
					        <td><center>no tiene registros</center></td>
				</tr>
			<%}else{ %>
				      <% for(ServicioxClienteBean servicio : servicios){ %>
					      <tr>
					        <td><center><%=servicio.getIdservicioxcliente()%></center></td>
					        <td><center><%=servicio.getServicio()%></center></td>
					        <td><center><%=servicio.getHorario()%></center></td>
					      </tr>
					      <% } %>
			<% } %>
	    </tbody>
	  </table>
	  </div>
<br><br>

 
	  <center>
	  	    <input id="limpiar" type="submit" class="btn btn-primary" value="Terminar">
	</center>
<br><br>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form method="post" action="<%=request.getContextPath()%>/AgregarCliente">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Datos Del Cliente</h4>
      </div>
      <div class="modal-body">
	       <div class="form-group">
		    <label for="email">DNI : </label>
		    <input type="text" class="form-control" maxlength="8" onkeypress="return solonumeros(event)" name="dni"  required>
		  </div>
		  <div class="form-group">
		    <label for="pwd">Nombres : </label>
		    <input type="text" class="form-control" onkeypress="return sololetras(event)" name="nombre" required>
		  </div>
		  <div class="form-group">
		    <label for="pwd">Apellidos : </label>
		    <input type="text" class="form-control" onkeypress="return sololetras(event)" name="apellidos" required>
		  </div>
		  
		  <div class="form-group">
		    <label for="pwd">Direccion : </label>
		    <input type="text" class="form-control" name="direccion" required>
		  </div>
		  
		  <div class="form-group">
		    <label for="pwd">Distrito : </label>
		    <input type="text" class="form-control" onkeypress="return sololetras(event)" name="distrito" required>
		  </div>
		 
		  <div class="form-group">
		    <label for="pwd">Telefono : </label>
		    <input type="text" class="form-control" maxlength="7" onkeypress="return solonumeros(event)"name="telefono" required>
		  </div>
		  
		  <div class="form-group">
        	<label for="pwd">Celular : </label>
        	<input type="text" class="form-control" name="celular"  maxlength="9" onkeypress="return solonumeros(event)" required>
     	  </div>
     	  
		  <div class="form-group">
		    <label for="pwd">Email : </label>
		    <input type="text" class="form-control" name="email" required>
		  </div>
      	  </div>
	
      
         <div class="form-group">
        	<label class="control-label col-xs-3">Sexo :</label>
        		<div class="col-xs-2">
            		<label class="radio-inline">
			  
			            
			          		  <input type="radio" name="sexo" value="M" required> Maculino
			          
			         </label>
				</div>
				<div class="col-xs-2">
					  <label class="radio-inline">
					    
					       <input type="radio" name="sexo" value="F" required> Femenino
					    
		        </label>
		     </div>
		  </div>
		  
		  	<br/>
			<br/>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <input type="submit" class="btn btn-primary" value="Registrar Cliente">
      </div>
      

      
      </form>
    </div>
  </div>
</div>
<!-- Js vinculados -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/responsive.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>