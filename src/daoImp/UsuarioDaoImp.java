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

import modelo.Usuario;

public class UsuarioDaoImp implements UsuarioDao{

private static  UsuarioDaoImp usuarioDaoImpl = null;
	
	public UsuarioDaoImp() {
		
	}
	
	
	
	@Override
	public long saveUsuario(Usuario usuario) throws Exception {
		
		String sql = "INSERT INTO USUARIOS (nombres, apellidos, email, username, password, id_tipo_usuario) values (?, ?, ?, ?, ?, ?) ";
		
		long retorno = 0 ;
		
		try {
			
			
			PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); 
			 //setear los datos a ?,?,?,?
			 statement.setString(1, usuario.getNombres());
			 statement.setString(2, usuario.getApellidos());
			 statement.setString(3, usuario.getEmail());
			 statement.setString(4, usuario.getUsername());
			 statement.setString(5, usuario.getPassword());
			 statement.setByte(6, usuario.getId_tipo_usuario());	
			 statement.executeUpdate();
			 
			 retorno = 1;
			
		}catch (ClassNotFoundException | SQLException e) {
			
			System.out.println("ERROR INESPERADO EN INSET:" +e);
				
			throw e;
			
		}finally {
			
			MySQLi.close();
		}
		
		return retorno;
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
			
			System.out.println("DATO ACTUALIZADO");
			
		}catch (ClassNotFoundException | SQLException e) {
			
			System.out.println("ERROR UPDATE");
			
			throw e;
			
		}finally {
			
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
			
			System.out.println("DATO ELIMINADO");
			
		}catch(ClassNotFoundException | SQLException e) {
			
			System.out.println("ERRROR AL ELIMINAR DATO");
			
			throw e;
			
		}finally {
			
			MySQLi.close();
			
		}
		
	}
/*
	@Override
	/*public List<Map<String,  String>> findAll () throws Exception {
		
		String sql = "SELECT us.id, us.nombres, us.apellidos, us.email, us.username, us.password,  tu.tipo FROM usuarios AS us \r\n" + 
				"INNER JOIN tipo_usuario tu ON us.id_tipo_usuario = tu.id;";
		
		List<Map<String, String>> actividad = null;
		Map<String, String> map;
		
ResultSet rs;
    	
    	try {
    		PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	        rs = statement.executeQuery();

	        actividad = new ArrayList<Map<String, String>>();
	        
	        while (rs.next()) {
				map = new HashMap<String, String>();

				map.put("id", rs.getString(1));
	        	map.put("nombre_proyecto", rs.getString(2));
	        	map.put("nombre_actividad", rs.getString(3));
				map.put("username", rs.getString(4));
				map.put("fecha_creacion", rs.getString(5));
				map.put("fecha_entrega", rs.getString(6));
				map.put("prioridad", String.valueOf(rs.getByte(7)));
				map.put("estado", String.valueOf(rs.getByte(8)));

				actividad.add(map);
			}
		} catch (SQLException e) {
			System.out.println("Method: findAll()\nError: \n" + e.getMessage());
            //throw  e;
		}
    	
        return actividad;
    }*/
		
		
		
		
    	
	
		
	public static UsuarioDao getInstance() {
		if (usuarioDaoImpl == null) {
			usuarioDaoImpl = new UsuarioDaoImp();
		}	
		return usuarioDaoImpl;
	}



	@Override
	public List<Map<String, String>> findAllUsuario() throws Exception {
		
		String sql = "SELECT us.id, us.nombres, us.apellidos, us.email, us.username, us.password, us.id_tipo_usuario, tu.tipo FROM usuarios AS us " + 
				"INNER JOIN tipo_usuario tu ON us.id_tipo_usuario = tu.id;";
		
		List<Map<String, String>> actividad = null;
		Map<String, String> map;
		
		ResultSet rs;
    	
    	try {
    		PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    		
	        rs = statement.executeQuery();

	        actividad = new ArrayList<Map<String, String>>();
	        
	        while (rs.next()) {
	        	
				map = new HashMap<String, String>();

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
			System.out.println("Method: findAll()\nError: \n" + e.getMessage());
            //throw  e;
		}
    	
        return actividad;
    }
}



	




