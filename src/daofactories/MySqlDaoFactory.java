package daofactories;
import java.sql.Connection;
import java.sql.DriverManager;
import dao.interfaces.*;
import dao.mysql.*;

public class MySqlDaoFactory extends DaoFactory {

	public static Connection obtenerConexion(){
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			//String url = "jdbc:oracle:thin:@localhost:1521:TEST";
			String url = "jdbc:mysql://localhost:3306/gym";
			String user = "root";
			String password ="root";
			//String url = "jdbc:mysql://mysql166099-proyecto-2.jelastic.servint.net/sigav";
			//String user = "root";
			//String password ="XZKxuwtWuF";
			con = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		}
		
		return con;
	}
	
	public UsuarioDao obtenerUsuarioDAO() {
		return new MysqlUsuarioDAO();
	}

	@Override
	public ClienteDao obtenerClienteDAO() {
		// TODO Auto-generated method stub
		return new MysqlClienteDAO();
	}

	
}