package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ClienteBean;
import beans.RegistrarPagoBean;
import beans.ServicioxClienteBean;
import daofactories.DaoFactory;

/**
 * Servlet implementation class CargarInfoCliente2
 */
@WebServlet("/CargarInfoCliente2")
public class CargarInfoCliente2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargarInfoCliente2() {
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
		
		
		String id = request.getParameter("dni");
		ClienteBean cliente = null;
		List<RegistrarPagoBean> registros = null;
		try {
			cliente = DaoFactory.getDAOFactory(DaoFactory.MYSQL).obtenerClienteDAO().BuscarXIdcliente(id);
			registros = DaoFactory.getDAOFactory(DaoFactory.MYSQL).obtenerClienteDAO().listarRegistrarPagoBean(cliente.getIdcliente());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("cliente", cliente);
		request.setAttribute("registros", registros);
		request.getRequestDispatcher("registrarPago.jsp").forward(request, response);
		
		
	}

}
