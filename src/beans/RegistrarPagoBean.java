package beans;

public class RegistrarPagoBean {
	
	private int idregistropago;
	private String servicio;
	private String costo;
	private String estado;
	private int idcliente;
	private String nombreservicio;
	
	
	
	
	public String getNombreservicio() {
		return nombreservicio;
	}
	public void setNombreservicio(String nombreservicio) {
		this.nombreservicio = nombreservicio;
	}
	public int getIdcliente() {
		return idcliente;
	}
	public void setIdcliente(int idcliente) {
		this.idcliente = idcliente;
	}
	public RegistrarPagoBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getIdregistropago() {
		return idregistropago;
	}
	public void setIdregistropago(int idregistropago) {
		this.idregistropago = idregistropago;
	}
	public String getServicio() {
		return servicio;
	}
	public void setServicio(String servicio) {
		this.servicio = servicio;
	}
	public String getCosto() {
		return costo;
	}
	public void setCosto(String costo) {
		this.costo = costo;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
	
	

}
