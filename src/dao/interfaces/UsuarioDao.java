package dao.interfaces;

import beans.UsuarioBean;

public interface UsuarioDao {
	
	public abstract UsuarioBean loginUsuario(String user) throws Exception;

}
