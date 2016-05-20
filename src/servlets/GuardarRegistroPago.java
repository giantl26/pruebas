package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.RegistrarPagoBean;
import daofactories.DaoFactory;

/**
 * Servlet implementation class GuardarRegistroPago
 */
@WebServlet("/GuardarRegistroPago")
public class GuardarRegistroPago extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardarRegistroPago() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id = Integer.parseInt(request.getParameter("idcliente"));
		int combo = Integer.parseInt(request.getParameter("mem"));
		int idregistro = Integer.parseInt(request.getParameter("idregistro"));
		
		String costo = "";
		String estado = "Registrado";
		String servicio="";
		
		if(combo==1){
			costo ="S./ 100.00";
			servicio="Mensual";
		}
		if(combo==2){
			costo ="S./ 270.00";
			servicio="3 Meses";
			
		}
		if(combo==3){
			costo ="S./ 500.00";
			servicio="6 Meses";
			
		}	
		if(combo==4){
			costo ="S./ 1000.00";
			servicio="1 Año";
			
		}	
		
		RegistrarPagoBean registros= null;
		try {
			registros = DaoFactory.getDAOFactory(DaoFactory.MYSQL).obtenerClienteDAO().BuscarRegistroXid(idregistro);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		registros.setCosto(costo);
		registros.setEstado(estado);
		registros.setServicio(servicio);
		

		boolean grabar;
		try { 
			grabar = DaoFactory.getDAOFactory(DaoFactory.MYSQL).obtenerClienteDAO().actualizarRegistro(registros);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		response.sendRedirect("registrarPago.jsp");
		
	}

}
