package daoImp;
import dao.ProyectosDao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ProyectosDao;
import db.MySQLi;
import model.Proyectos;

public class ProyectosDaoImp implements ProyectosDao{

	private static ProyectosDaoImp proyectosDaoImp = null;
	
	@Override
	public void save(Proyectos proyectos) throws Exception {
		String sql = "INSERT INTO proyectos(nombre_proyecto, descripcion, id_usuario) values (?,?,?)";
		
		try {
			PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			statement.setString(1, proyectos.getNombre_proyecto());
			statement.setString(2, proyectos.getDescripcion());
			statement.setShort(3, proyectos.getId_usuario());

			//Ejecutar las sentencias sql
			statement.executeUpdate();
			System.out.println("Dato insertado");

		} catch (ClassNotFoundException | SQLException e){
			throw e;
		} finally {
			MySQLi.close();
		}
	}

	@Override
	public void update(Proyectos proyectos) throws Exception {
		String sql = "UPDATE proyectos SET nombre_proyecto = ?, descripcion= ? ,  id_usuario = ? WHERE id = ?";
        
		try {
		PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

		statement.setString(1, proyectos.getNombre_proyecto());
		statement.setString(2, proyectos.getDescripcion());
		statement.setShort(3, proyectos.getId_usuario());
		statement.setShort(4, proyectos.getId());

		statement.executeUpdate();

		System.out.println("Dato actualizado");
		} catch (ClassNotFoundException | SQLException e) {
	 		throw e;
		} finally {
			MySQLi.close();
		}
	}

	@Override
	public void delete(Proyectos proyectos) throws Exception {
		String sql = "DELETE from proyectos WHERE id = ?";
		
		try {
			PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			
			statement.setShort(1, proyectos.getId());

			statement.executeUpdate();
			System.out.println("Dato Eliminado");

		} catch (ClassNotFoundException | SQLException e) {
			throw e;
		} finally {
			MySQLi.close();
		}
	}

	@Override
	public List<Map<String,String>> findAll() throws Exception {
		String sql = "SELECT " +
				"po.id, " +
				"po.nombre_proyecto, " +
				"po.descripcion, " +
				"us.username, " +
				"po.id_usuario " +
				"FROM proyectos AS po " +
				"INNER JOIN usuarios us ON po.id_usuario = us.id ";
    	
    	List<Map<String, String>> proyectos = null;
		Map<String, String> map;
    	
    	ResultSet rs;
    	
    	try {
    		PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	        rs = statement.executeQuery();

	        proyectos = new ArrayList<>();
	        
	        while (rs.next()) {
				map = new HashMap<>();

				map.put("id", String.valueOf(rs.getShort(1)));
	        	map.put("nombre_proyecto", rs.getString(2));
	        	map.put("descripcion", rs.getString(3));
	        	map.put("id_usuario", String.valueOf(rs.getShort(1)));
				

				proyectos.add(map);
			}
		} catch (SQLException e) {
    		throw  e;
		} finally {
			MySQLi.close();
		}
    	
        return proyectos;

	}

	@Override
	public List<Proyectos> find(String field, String value) throws Exception {
		String sql = "SELECT * FROM proyectos WHERE " + field + " = ?";

		List<Proyectos> list = null;
		Proyectos pro = null;
		ResultSet rs;

		try {
			PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, field);

			if (field.equals("id") || field.equals("id_usuario")) {
				statement.setShort(1, Short.parseShort(value));
			} else {
				statement.setString(1, value);
			}

			rs = statement.executeQuery();
			list = new ArrayList<>();

			while (rs.next()) {
				pro = new Proyectos();

				pro.setId(rs.getShort(1));
				pro.setNombre_proyecto(rs.getString(2));
				pro.setDescripcion(rs.getString(3));
				pro.setId_usuario(rs.getShort(4));

				list.add(pro);
			}

		} catch (SQLException e) {
			throw e;
		} finally {
			MySQLi.close();
		}

		return list;
	}

	public static ProyectosDao getInstance() {
		if (proyectosDaoImp == null) {
			proyectosDaoImp = new ProyectosDaoImp();
		}
		return proyectosDaoImp;
	}
}
			
		
	


