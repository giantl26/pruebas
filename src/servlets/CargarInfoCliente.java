package servlets;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ClienteBean;
import beans.ServicioxClienteBean;
import daofactories.DaoFactory;

/**
 * Servlet implementation class CargarInfoCliente
 */
@WebServlet("/CargarInfoCliente")
public class CargarInfoCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargarInfoCliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("generarMatricula.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String dni = request.getParameter("dni");
		
		
		ClienteBean cliente = null;
		List<ServicioxClienteBean> servicios = null;
		try {
			cliente = DaoFactory.getDAOFactory(DaoFactory.MYSQL).obtenerClienteDAO().BuscarXDni(dni);
			servicios = DaoFactory.getDAOFactory(DaoFactory.MYSQL).obtenerClienteDAO().listarServiciosxCliente(cliente.getIdcliente());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (cliente.getDni()==0)
		{
			ClienteBean cliente2 = new ClienteBean(); 
				cliente2.setDni(Integer.parseInt(dni));
			request.setAttribute("cliente", cliente2);	
		}
		else{
		request.setAttribute("cliente", cliente);
		}
		request.setAttribute("servicios", servicios);
		request.getRequestDispatcher("generarMatricula.jsp").forward(request, response);
	}

}
