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
import beans.UsuarioBean;
import daofactories.DaoFactory;

/**
 * Servlet implementation class GrabarServicio
 */
@WebServlet("/GrabarServicio")
public class GrabarServicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GrabarServicio() {
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
		String dni=request.getParameter("dni");
		
		
		
		int idcliente = Integer.parseInt(request.getParameter("idcliente"));
		String  servicio = request.getParameter("servicio");
		String horario = request.getParameter("horario");
		ServicioxClienteBean obj = new  ServicioxClienteBean();
		System.out.println("1id "+idcliente);
		System.out.println(" ser "+servicio);
		System.out.println("hor "+horario);
		
		ClienteBean cliente = null;
		List<ServicioxClienteBean> servicios = null;
		
		
		obj.setHorario(horario);
		obj.setServicio(servicio);
		obj.setIdcliente(idcliente);
		
		try {
			int grabar = DaoFactory.getDAOFactory(DaoFactory.MYSQL).obtenerClienteDAO().agregarServicioxCliente(obj);
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
		request.getRequestDispatcher("generarMatricula.jsp").forward(request, response);;
		
		
	}
}
		
	
