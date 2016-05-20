package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ClienteBean;
import beans.ComprobanteBean;
import beans.EmpleadoBean;
import beans.ServicioxClienteBean;
import daofactories.DaoFactory;

/**
 * Servlet implementation class CargarInfoEmpleado
 */
@WebServlet("/CargarInfoEmpleado")
public class CargarInfoEmpleado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CargarInfoEmpleado() {
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
		
		
		String dni = request.getParameter("dni");
		EmpleadoBean empleado = null;
		List<ComprobanteBean> comprobantes = null;
		try {
			empleado = DaoFactory.getDAOFactory(DaoFactory.MYSQL).obtenerClienteDAO().BuscarXDniEmpleado(dni);
			comprobantes = DaoFactory.getDAOFactory(DaoFactory.MYSQL).obtenerClienteDAO().listarComprobantes(empleado.getIdempleado());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("empleado", empleado);
		request.setAttribute("comprobantes", comprobantes);
		request.getRequestDispatcher("generarPago.jsp").forward(request, response);
		
	}

}
