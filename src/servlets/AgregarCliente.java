package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ClienteBean;
import daofactories.DaoFactory;

/**
 * Servlet implementation class AgregarCliente
 */
@WebServlet("/AgregarCliente")
public class AgregarCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarCliente() {
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
		
		
		String nombre = request.getParameter("nombre");
		int dni = Integer.parseInt(request.getParameter("dni"));
		String apellidos = request.getParameter("apellidos");
		int telefono = Integer.parseInt(request.getParameter("telefono"));
		int celular = Integer.parseInt(request.getParameter("celular"));
		String email = request.getParameter("email");
		String direccion = request.getParameter("direccion");
		String distrito = request.getParameter("distrito");
		String sexo = request.getParameter("sexo");
		ClienteBean cli = new ClienteBean();
		
		
		cli.setApellidos(apellidos);
		cli.setDni(dni);
		cli.setEstado(1);
		cli.setTelefono(telefono);
		cli.setCelular(celular);
		cli.setNombres(nombre);
		cli.setDistrito(distrito);
		cli.setDireccion(direccion);
		cli.setSexo(sexo);

		try {
			int grabar = DaoFactory.getDAOFactory(DaoFactory.MYSQL).obtenerClienteDAO().agregarCliente(cli);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		response.sendRedirect("generarMatricula.jsp");
		
		
		
		
	}

}
