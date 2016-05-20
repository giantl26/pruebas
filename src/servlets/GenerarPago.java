package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ComprobanteBean;
import daofactories.DaoFactory;

/**
 * Servlet implementation class GenerarPago
 */
@WebServlet("/GenerarPago")
public class GenerarPago extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerarPago() {
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
		
		String servicios[] = request.getParameterValues("check");
		
		String tipo = request.getParameter("tipopago");

		int idempleado = Integer.parseInt(request.getParameter("idempleado"));
		
		ComprobanteBean com = new ComprobanteBean();
		
		com.setIdempleado(idempleado);
		com.setTipo(tipo);
		com.setMes("Octubre");
		
		try {
			int grabar = DaoFactory.getDAOFactory(DaoFactory.MYSQL).obtenerClienteDAO().agregarPago(com);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		response.sendRedirect("generarPago.jsp");
		
	}

}
