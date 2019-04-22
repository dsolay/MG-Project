package daoImp;

import dao.TipoUsuarioDao;
import db.MySQLi;
import model.TipoUsuario;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TipoUsuarioDaoImp extends MySQLi implements TipoUsuarioDao {

	private static TipoUsuarioDaoImp tipoUsuarioDaoImpl = null;

	@Override
	public void save(TipoUsuario tipodeusuario) throws Exception {
		String sql ="INSERT INTO tipo_usuario(tipo, descripcion) values (?,?)";
	
		try{
		   PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			//setear los datos a ?,?,?,?
			statement.setString(1, tipodeusuario.getTipo());
			statement.setString(2, tipodeusuario.getDescripcion());

			statement.executeUpdate();
			System.out.println("Dato insertado");
		} catch (ClassNotFoundException | SQLException e) {
			throw e;
		} finally {
			MySQLi.close();
		}
	}
 
	@Override
	public void update(TipoUsuario tipodeusuario) throws Exception {
		String sql="UPDATE tipo_usuario SET tipo = ?, descripcion = ? WHERE id = ?";
		
		try {
			  MySQLi.connect();
			  PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

				statement.setString(1, tipodeusuario.getTipo());
				statement.setString(2, tipodeusuario.getDescripcion());
				statement.setByte  (3, tipodeusuario.getId());
				 
				System.out.println(statement);
				 statement.executeUpdate();
				 System.out.println("Dato actualizado");
		}catch (ClassNotFoundException | SQLException e) {
			throw e;
		}finally {
			MySQLi.close();
		}
	}

	@Override
	public void delete(TipoUsuario tipodeusuario) throws Exception {
		
	String sql ="DELETE FROM tipo_usuario WHERE id = ?" ;
		
		try {
				
			PreparedStatement statement = MySQLi.connect().prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		
			statement.setInt(1, tipodeusuario.getId());
			
			statement.execute();
			
			System.out.println("dato eliminado");
			
		} catch (ClassNotFoundException | SQLException e) {
			throw e;
		} finally{
			MySQLi.close();
		}
	}

	@Override
	public List<Map<String, String>> findAll() throws Exception {
		String sql="SELECT * FROM tipo_usuario";

		List<Map<String, String>> tipo_usuario = null;
		Map<String, String> map;

		ResultSet rs;
		
		try {
			PreparedStatement statment =MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			rs = statment.executeQuery();//Devuelve un resulset

			tipo_usuario = new ArrayList<>();
			
			
			while(rs.next()) {
				map = new HashMap<>();

				map.put("id", rs.getString(1));
				map.put("tipo", rs.getString(2));
				map.put("descripcion", rs.getString(3));
				
				tipo_usuario.add(map);
			}
			
		} catch (SQLException e) {
			throw e ;
		} finally{
			MySQLi.close();
		}

		return tipo_usuario;
	}
	
	public static TipoUsuarioDao getInstance() {
		if (tipoUsuarioDaoImpl == null) {
			tipoUsuarioDaoImpl = new TipoUsuarioDaoImp();
		}

		return tipoUsuarioDaoImpl;
    }
}
	
	
