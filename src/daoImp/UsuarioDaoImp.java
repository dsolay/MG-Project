package daoImp;

import java.sql.PreparedStatement;
import java.util.List;

import dao.UsuarioDao;
import db.MySQLi;
import modelo.Usuario;

public class UsuarioDaoImp extends MySQLi implements UsuarioDao{

private static  UsuarioDaoImp usuarioDaoImpl = null;
	
	public UsuarioDaoImp() {
		
	}
	
	
	
	@Override
	public long saveUsuario(Usuario usuario) throws Exception {
		
		String sql = "INSERT INTO USUARIO (nombres , apellidos , email , nombre_usuario , tipo_usuario , pass ) values () ";
		
		return 0;
	}

	@Override
	public void updateUsuario(Usuario usuario) throws Exception {
		
		
		
	}

	@Override
	public void deleteUsuario(Usuario usuario) throws Exception {
		
		
		
	}

	@Override
	public List<Usuario> findAllUsuario() throws Exception {
		
		
		return null;
	}

}
