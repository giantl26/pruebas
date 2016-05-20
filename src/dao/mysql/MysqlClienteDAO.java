package dao.mysql;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.ClienteBean;
import beans.ComprobanteBean;
import beans.EmpleadoBean;
import beans.RegistrarPagoBean;
import beans.ServicioxClienteBean;
import dao.interfaces.ClienteDao;
import daofactories.MySqlDaoFactory;

public class MysqlClienteDAO  extends  MySqlDaoFactory implements ClienteDao {

	@Override
	public ClienteBean BuscarXDni(String dni) throws Exception {
		ClienteBean cliente = new ClienteBean();	
		try{
			Connection con = MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String sql="SELECT idcliente, nombres, apellidos, sexo, telefono, celular, direccion, distrito, dni, estado  FROM cliente WHERE dni="+dni+" and estado = 1";
			System.out.println(" == Metodo buscar x dni ==");
			System.out.println(sql);
			System.out.println(" == Fin del metodo buscar x dni ==");
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				cliente.setIdcliente(rs.getInt("idcliente"));
				cliente.setNombres(rs.getString("nombres"));
				cliente.setApellidos(rs.getString("apellidos"));
				cliente.setSexo(rs.getString("sexo"));
				cliente.setTelefono(rs.getInt("telefono"));
				cliente.setCelular(rs.getInt("celular"));
				cliente.setDireccion(rs.getString("direccion"));
				cliente.setDistrito(rs.getString("distrito"));
				cliente.setDni(rs.getInt("dni"));
				cliente.setEstado(rs.getInt("estado"));
			}
			con.close();
		}catch(Exception ex){
			System.out.print(ex.getMessage());
		}	
		return cliente;	
	}

	@Override
	public List<ServicioxClienteBean> listarServiciosxCliente(int idcliente) throws Exception {
		// TODO Auto-generated method stub
		List<ServicioxClienteBean> servicios = new ArrayList<ServicioxClienteBean>();

		try {
			Connection con = MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT idservicioxcliente, idcliente, servicio, horario FROM servicioxcliente where idcliente = "+idcliente);
			
			ServicioxClienteBean servicio = null;
			
			while (rs.next()) {
				servicio = new ServicioxClienteBean();
				servicio.setIdservicioxcliente(rs.getInt("idservicioxcliente"));
				servicio.setIdcliente(rs.getInt("idcliente"));
				servicio.setServicio(rs.getString("servicio"));
				servicio.setHorario(rs.getString("horario"));
				servicios.add(servicio);
			}
			con.close();

		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return servicios;	
	}

	@Override
	public int agregarServicioxCliente(ServicioxClienteBean servicio) throws Exception {
		// TODO Auto-generated method stub
		int rows=-1;
		int id=0;
		Connection con=null;
		try{
			con = MySqlDaoFactory.obtenerConexion();
			String sql="INSERT INTO servicioxcliente (idcliente,servicio,horario) VALUES (?,?,?)";
			
			PreparedStatement ps=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			ps.setInt(1, servicio.getIdcliente() );
			System.out.println(servicio.getIdcliente());
			
			ps.setString(2, servicio.getServicio());
			System.out.println( servicio.getServicio());
			
			ps.setString(3, servicio.getHorario() );
			System.out.println(servicio.getHorario());
			
			rows=ps.executeUpdate();
			ResultSet rs=ps.getGeneratedKeys();
			if(rs.next()){
				id=rs.getInt(1);
			} 
			servicio.setIdservicioxcliente(id);
			
		}catch(Exception ex){
			con.close();
		}
		return rows;
	}

	@Override
	public int agregarCliente(ClienteBean cliente) throws Exception {
		// TODO Auto-generated method stub
		int rows=-1;
		int id=0;
		Connection con=null;
		try{
			con = MySqlDaoFactory.obtenerConexion();
			String sql="INSERT INTO cliente (nombres, apellidos, sexo, telefono, celular, direccion, distrito, dni, estado) VALUES (?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement ps=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			ps.setString(1, cliente.getNombres() );
			System.out.println(cliente.getNombres());
			
			ps.setString(2, cliente.getApellidos());
			System.out.println( cliente.getApellidos());
			
			ps.setString(3, cliente.getSexo());
			System.out.println(cliente.getEstado());
			
			ps.setInt(4, cliente.getTelefono());
			System.out.println(cliente.getTelefono());
			
			ps.setInt(5, cliente.getCelular());
			System.out.println(cliente.getCelular());
			
			ps.setString(6, cliente.getDireccion());
			System.out.println( cliente.getApellidos());
	
			ps.setString(7, cliente.getDistrito());
			System.out.println( cliente.getApellidos());
			
			ps.setInt(8, cliente.getDni());
			System.out.println(cliente.getDni());
			
			ps.setInt(9, cliente.getEstado());
			System.out.println(cliente.getEstado());
			
			rows=ps.executeUpdate();
			ResultSet rs=ps.getGeneratedKeys();
			if(rs.next()){
				id=rs.getInt(1);
			} 
			cliente.setIdcliente(id);
			
		}catch(Exception ex){
			con.close();
		}
		return rows;
	}

	@Override
	public ClienteBean BuscarXIdcliente(String idcliente) throws Exception {
		ClienteBean cliente = new ClienteBean();	
		try{
			Connection con = MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String sql="SELECT idcliente, nombres, apellidos, sexo, telefono, direccion, distrito, dni, estado  FROM cliente WHERE dni="+idcliente+" and estado = 1";
			System.out.println(" == Metodo buscar x dni ==");
			System.out.println(sql);
			System.out.println(" == Fin del metodo buscar x dni ==");
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				cliente.setIdcliente(rs.getInt("idcliente"));
				cliente.setNombres(rs.getString("nombres"));
				cliente.setApellidos(rs.getString("apellidos"));
				cliente.setSexo(rs.getString("sexo"));
				cliente.setTelefono(rs.getInt("telefono"));
				cliente.setDireccion(rs.getString("direccion"));
				cliente.setDistrito(rs.getString("distrito"));
				cliente.setDni(rs.getInt("dni"));
				cliente.setEstado(rs.getInt("estado"));
			}
			con.close();
		}catch(Exception ex){
			System.out.print(ex.getMessage());
		}	
		return cliente;	
	}

	@Override
	public int agregarRegistroPago(RegistrarPagoBean pago) throws Exception {
		// TODO Auto-generated method stub
		int rows=-1;
		int id=0;
		Connection con=null;
		try{
			con = MySqlDaoFactory.obtenerConexion();
			String sql="INSERT INTO registropago (servicio,costo,estado,idcliente, nombreservicio) VALUES (?,?,?,?,?)";
			
			PreparedStatement ps=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			ps.setString(1, pago.getServicio() );
			System.out.println(pago.getServicio());
			
			ps.setString(2, pago.getCosto());
			System.out.println( pago.getCosto());
			
			ps.setString(3, pago.getEstado() );
			System.out.println(pago.getEstado());

			ps.setInt(4, pago.getIdcliente() );
			System.out.println(pago.getIdcliente());
			
			ps.setString(5, pago.getNombreservicio() );
			System.out.println(pago.getNombreservicio());
			
			rows=ps.executeUpdate();
			ResultSet rs=ps.getGeneratedKeys();
			if(rs.next()){
				id=rs.getInt(1);
			} 
			pago.setIdregistropago(id);
			
		}catch(Exception ex){
			con.close();
		}
		return rows;
	}

	@Override
	public List<RegistrarPagoBean> listarRegistrarPagoBean(int idcliente) throws Exception {
		// TODO Auto-generated method stub
		List<RegistrarPagoBean> registros = new ArrayList<RegistrarPagoBean>();

		try {
			Connection con = MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT idregistropago, servicio, costo, estado, idcliente, nombreservicio FROM registropago where idcliente ="+idcliente);
			
			RegistrarPagoBean registro = null;
			
			while (rs.next()) {
				registro = new RegistrarPagoBean();
				registro.setIdregistropago(rs.getInt("idregistropago"));
				registro.setServicio(rs.getString("servicio"));
				registro.setCosto(rs.getString("costo"));
				registro.setEstado(rs.getString("estado"));
				registro.setNombreservicio(rs.getString("nombreservicio"));
				registros.add(registro);
			}
			con.close();

		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return registros;	
	}

	@Override
	public boolean actualizarRegistro(RegistrarPagoBean registro) throws Exception {
		boolean flag = false;
		try {
			Connection con = MySqlDaoFactory.obtenerConexion();
			String sql = "UPDATE registropago SET servicio = '"+registro.getServicio()+"', " +
				      " costo = '"+registro.getCosto()+"', estado = 'Registrado' " +
				      " WHERE idregistropago ="+registro.getIdregistropago();
			
			PreparedStatement ps = con.prepareStatement(sql);
		 
			System.out.println(sql);
		    // call executeUpdate to execute our sql update statement
		    int filas=ps.executeUpdate();
			
			if(filas == 1){
				flag = true;
			}
			con.close();
			
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		
		return flag;
	}

	@Override
	public RegistrarPagoBean BuscarRegistroXid(int id) throws Exception {
		// TODO Auto-generated method stub

		RegistrarPagoBean registro = null;
		
		try {
			Connection con = MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT idregistropago, servicio, costo, estado, idcliente, nombreservicio FROM registropago where idregistropago ="+id);
		
			while (rs.next()) {
				registro = new RegistrarPagoBean();
				registro.setIdregistropago(rs.getInt("idregistropago"));
				registro.setServicio(rs.getString("servicio"));
				registro.setCosto(rs.getString("costo"));
				registro.setEstado(rs.getString("estado"));
				registro.setNombreservicio(rs.getString("nombreservicio"));
			}
			con.close();

		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return registro;
	}

	@Override
	public EmpleadoBean BuscarXDniEmpleado(String dni) throws Exception {
		EmpleadoBean empleado = new EmpleadoBean();
		try{
			Connection con = MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String sql="SELECT idempleado, nombre, apellidos, servicios, dni  FROM empleado WHERE dni="+dni+"";
			System.out.println(" == Metodo buscar x dni empleado ==");
			System.out.println(sql);
			System.out.println(" == Fin del metodo buscar x dni empleado ==");
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				empleado.setIdempleado(rs.getInt("idempleado"));
				empleado.setNombre(rs.getString("nombre"));
				empleado.setApellidos(rs.getString("apellidos"));
				empleado.setServicios(rs.getInt("servicios"));
				empleado.setDni(rs.getInt("dni"));
			}
			con.close();
		}catch(Exception ex){
			System.out.print(ex.getMessage());
		}	
		return empleado;	
	}

	@Override
	public int agregarPago(ComprobanteBean comprobante) throws Exception {
		// TODO Auto-generated method stub
		int rows=-1;
		int id=0;
		Connection con=null;
		try{
			con = MySqlDaoFactory.obtenerConexion();
			String sql="INSERT INTO comprobante (mes, tipo, idempleado) VALUES (?,?,?)";
			
			PreparedStatement ps=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			ps.setString(1, comprobante.getMes() );
			System.out.println(comprobante.getMes());
			
			ps.setString(2, comprobante.getTipo());
			System.out.println( comprobante.getTipo());
			
			ps.setInt(3, comprobante.getIdempleado() );
			System.out.println(comprobante.getIdempleado());
			
			rows=ps.executeUpdate();
			ResultSet rs=ps.getGeneratedKeys();
			if(rs.next()){
				id=rs.getInt(1);
			} 
			comprobante.setIdcomprobante(id);
			
		}catch(Exception ex){
			con.close();
		}
		return rows;
	}

	@Override
	public List<ComprobanteBean> listarComprobantes(int idcomprobante) throws Exception {
		// TODO Auto-generated method stub
		List<ComprobanteBean> comprobantes = new ArrayList<ComprobanteBean>();

		try {
			Connection con = MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT idcomprobante, mes, tipo, idempleado FROM comprobante where idempleado ="+idcomprobante);
			
			ComprobanteBean comprobante = null;
			
			while (rs.next()) {
				comprobante = new ComprobanteBean();
				comprobante.setIdcomprobante(rs.getInt("idcomprobante"));
				comprobante.setMes(rs.getString("mes"));
				comprobante.setTipo(rs.getString("tipo"));
				comprobante.setIdempleado(rs.getInt("idempleado"));
				comprobantes.add(comprobante);
			}
			con.close();

		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return comprobantes;	
	}

}
