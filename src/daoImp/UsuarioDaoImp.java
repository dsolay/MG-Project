package daoImp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dao.UsuarioDao;
import db.MySQLi;

import model.Usuario;

public class UsuarioDaoImp implements UsuarioDao{

	private static  UsuarioDaoImp usuarioDaoImpl = null;

	@Override
	public void saveUsuario(Usuario usuario) throws Exception {
		
		String sql = "INSERT INTO usuarios (nombres, apellidos, email, username, password, id_tipo_usuario) values (?, ?, ?, ?, ?, ?) ";
		
		try {
			PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			//setear los datos a ?,?,?,?
			statement.setString(1, usuario.getNombres());
			statement.setString(2, usuario.getApellidos());
			statement.setString(3, usuario.getEmail());
			statement.setString(4, usuario.getUsername());
			statement.setString(5, usuario.getPassword());
			statement.setByte(6, usuario.getId_tipo_usuario());

			System.out.println(statement);
			statement.executeUpdate();
			System.out.println("Dato insertado");
		} catch (ClassNotFoundException | SQLException e) {
			throw e;
		} finally {
			MySQLi.close();
		}
	}

	@Override
	public void updateUsuario(Usuario usuario) throws Exception {
		
		String sql = "UPDATE usuarios SET nombres = ? , apellidos = ? , email = ? , username = ? , password = ? , id_tipo_usuario = ? WHERE id = ?";
		
		try {
			PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); 

			statement.setString(1, usuario.getNombres());
			statement.setString(2, usuario.getApellidos());
			statement.setString(3, usuario.getEmail());
			statement.setString(4, usuario.getUsername());
			statement.setString(5, usuario.getPassword());
			statement.setByte(6, usuario.getId_tipo_usuario());
			statement.setShort(7, usuario.getId());

			statement.executeUpdate();
			System.out.println("Dato actualizado");
		} catch (ClassNotFoundException | SQLException e) {
			throw e;
		} finally {
			MySQLi.connect();
		}
	}

	@Override
	public void deleteUsuario(Usuario usuario) throws Exception {
		
		String sql = "DELETE FROM usuarios WHERE id = ?";
		
		try {
			PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			
			statement.setShort(1, usuario.getId());

			statement.executeUpdate();
			System.out.println("Dato eliminado");
		} catch(ClassNotFoundException | SQLException e) {
			throw e;
			
		} finally {
			MySQLi.close();
		}
		
	}

	@Override
	public List<Map<String, String>> findAllUsuario() throws Exception {
		
		String sql = "SELECT us.id, " +
					"us.nombres, " +
					"us.apellidos, " +
					"us.email, " +
					"us.username, " +
					"us.password, " +
					"us.id_tipo_usuario, " +
					"tu.tipo " +
				"FROM usuarios AS us " +
				"INNER JOIN tipo_usuario tu ON us.id_tipo_usuario = tu.id;";
		
		List<Map<String, String>> actividad = null;
		Map<String, String> map;
		
		ResultSet rs;
    	
    	try {
    		PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    		
	        rs = statement.executeQuery();

	        actividad = new ArrayList<>();
	        
	        while (rs.next()) {
	        	
				map = new HashMap<>();

				map.put("id", String.valueOf(rs.getInt(1)));
	        	map.put("nombres", rs.getString(2));
	        	map.put("apellidos", rs.getString(3));
				map.put("email", rs.getString(4));
				map.put("username", rs.getString(5));
				map.put("password", rs.getString(6));
				map.put("id_tipo_usuario", rs.getString(7));
				map.put("tipo_usuario", rs.getString(8));
				

				actividad.add(map);
			}
		} catch (SQLException e) {
			throw  e;
		} finally {
    		MySQLi.close();
		}
    	
        return actividad;
    }

	@Override
	public List<Usuario> find(String field, String value) throws Exception {
		List<Usuario> list = null;
		Usuario us;
		ResultSet rs;

		if (! value.isEmpty()) {
			String sql = "SELECT * FROM usuarios ";

			String sql_where_all = "WHERE id LIKE ? " +
					"OR nombres LIKE ? " +
					"OR apellidos LIKE ? " +
					"OR email LIKE ? " +
					"OR username LIKE ? ";

			String sql_where_field = "WHERE " + field + " LIKE ? ";

			sql += (field.equals("all")) ? sql_where_all : sql_where_field;

			try {
				PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				statement.setString(1, field);

				if (field.equals("all")) {
					statement.setString(1, "%" + value + "%");
					statement.setString(2, "%" + value + "%");
					statement.setString(3, "%" + value + "%");
					statement.setString(4, "%" + value + "%");
					statement.setString(5, "%" + value + "%");
				} else {
					statement.setString(1, "%" + value + "%");
				}

				rs = statement.executeQuery();
				list = new ArrayList<>();

				while (rs.next()) {
					us = new Usuario();

					us.setId(rs.getShort(1));
					us.setNombres(rs.getString(2));
					us.setApellidos(rs.getString(3));
					us.setEmail(rs.getString(4));
					us.setUsername(rs.getString(5));
					us.setPassword(rs.getString(6));
					us.setId_tipo_usuario(rs.getByte(7));

					list.add(us);
				}

			} catch (SQLException e) {
				throw e;
			} finally {
				MySQLi.close();
			}
		}

		return list;
	}

	public static UsuarioDao getInstance() {
		if (usuarioDaoImpl == null) {
			usuarioDaoImpl = new UsuarioDaoImp();
		}
		return usuarioDaoImpl;
	}
}



	




