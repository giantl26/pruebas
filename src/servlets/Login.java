package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UsuarioBean;
import daofactories.DaoFactory;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		HttpSession sesion = request.getSession();
		String usuario = request.getParameter("usuario");
		String clave = request.getParameter("clave");
		String mensaje = "";
		String pagina = "";
		System.out.println("========== Login ===========\n");
		System.out.println("Usuario : "+usuario);
		System.out.println("Clave : "+clave);
		
		try {
			UsuarioBean usu = DaoFactory.getDAOFactory(DaoFactory.MYSQL).obtenerUsuarioDAO().loginUsuario(usuario);
			if (usu.getUser() == null) {
				
				System.out.println("Usuario no existe !!");
				mensaje = "<div class='alert alert-danger' role='alert'>El usuario no existe, por favor verifique la informacion</div>";
				pagina = "/index.jsp";
				
			}else{
				
				System.out.println("Usuario si existe !!");
				
				if (usu.getPass().equals(clave)) {
					
						sesion.setAttribute("usuario", usu);
						System.out.println("El usuario es correcto");
						pagina = "/generarMatricula.jsp";		
						
				}else{
					System.out.println("Contraseña incorrecta");
					mensaje = "<div class='alert alert-danger' role='alert'>Contraseña incorrecta</div>";
					pagina = "/index.jsp";	
				}
				
		
			}		
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		request.setAttribute("mensaje", mensaje);
		request.getRequestDispatcher(pagina).forward(request, response);
		
	}

}
