package dao.interfaces;

import java.util.List;

import beans.ClienteBean;
import beans.ComprobanteBean;
import beans.EmpleadoBean;
import beans.RegistrarPagoBean;
import beans.ServicioxClienteBean;

public interface ClienteDao {
	
	public abstract ClienteBean BuscarXDni(String dni) throws Exception;

	public abstract ClienteBean BuscarXIdcliente(String idcliente) throws Exception;
	
	public abstract List<ServicioxClienteBean> listarServiciosxCliente(int idcliente) throws Exception;

	public abstract int agregarServicioxCliente(ServicioxClienteBean servicio) throws Exception;

	public abstract int agregarCliente(ClienteBean cliente) throws Exception;
	
	public abstract int agregarRegistroPago(RegistrarPagoBean pago) throws Exception;
	
	public abstract boolean actualizarRegistro(RegistrarPagoBean registro) throws Exception;
	
	public abstract List<RegistrarPagoBean> listarRegistrarPagoBean(int idcliente) throws Exception;

	public abstract RegistrarPagoBean BuscarRegistroXid(int id) throws Exception;
	
	// Empleado...
	
	public abstract EmpleadoBean BuscarXDniEmpleado(String dni) throws Exception;

	public abstract int agregarPago(ComprobanteBean comprobante) throws Exception;
	
	public abstract List<ComprobanteBean> listarComprobantes(int idcomprobante) throws Exception;
	
	
}
