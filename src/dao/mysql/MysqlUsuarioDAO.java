package dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import beans.UsuarioBean;
import dao.interfaces.UsuarioDao;
import daofactories.MySqlDaoFactory;

public class MysqlUsuarioDAO  extends  MySqlDaoFactory implements UsuarioDao {

	@Override
	public UsuarioBean loginUsuario(String user) throws Exception {
		UsuarioBean usuario = new UsuarioBean();	
		try{
			Connection con = MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String sql="SELECT * FROM usuario WHERE user='"+user+"' and estado = 1";
			System.out.println(" == Metodo login ==");
			System.out.println(sql);
			System.out.println(" == Fin del metodo login ==");
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				usuario.setIdusuario(rs.getInt("idusuario"));
				usuario.setUser(rs.getString("user"));
				usuario.setPass(rs.getString("pass"));
				usuario.setEstado(rs.getInt("estado"));
			}
			con.close();
		}catch(Exception ex){
			System.out.print(ex.getMessage());
		}	
		return usuario;	
	}

}
