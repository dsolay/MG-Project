package daoImp;

import dao.ProyectosActividadesDao;
import db.MySQLi;
import model.ProyectosActividades;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class ProyectosActividadesDaoImp implements ProyectosActividadesDao {
	private static ProyectosActividadesDaoImp pado = null;
	
    @Override
    public int save(ProyectosActividades pa) throws Exception {
    	String sql = "INSERT INTO proyectos_actividades(nombre_actividad, prioridad, estado, fecha_entrega, id_usuario, id_proyecto) VALUES(?,?,?,?,?,?)";
    	
    	try {
    		PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    		
			//setear los datos a ?,?,?,?
			statement.setString(1, pa.getNombre()); 
			statement.setByte(2, pa.getPrioridad()); 
			statement.setByte(3, pa.getEstado()); 
			statement.setString(4, pa.getFecha_entrega());
			statement.setShort(5, pa.getId_usuario());
			statement.setShort(6, pa.getId_proyecto());
						 
			//Ejecutar las sentencias sql
			return statement.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			MySQLi.close();
		}
    }

    @Override
    public int update(ProyectosActividades pa) throws Exception {
    	String sql = "UPDATE proyectos_actividades SET nombre_actividad = ?, prioridad = ?, estado= ?, fecha_entrega = ?, id_usuario = ? WHERE id = ?";
    	
    	try {
            PreparedStatement statment = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            statment.setString(1, pa.getNombre());
	        statment.setByte(2, pa.getPrioridad());
            statment.setByte(3, pa.getEstado());
	        statment.setString(4, pa.getFecha_entrega());
			statment.setShort(5, pa.getId_usuario());
	        
	        statment.setShort(6, pa.getId());
	        
            //Actualiza los valores
            return statment.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			MySQLi.close();
		}
    }

    @Override
    public int delete(short id) throws Exception {
    	String sql = "DELETE FROM proyectos_actividades WHERE id = ?";
    	
    	try {
    		 PreparedStatement statment = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
             
    		 statment.setShort(1, id);
             
             //Actualiza los valores
             return statment.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			throw e;
        } finally {
			MySQLi.close();
		}
    }

	@Override
	public int getNumRecords(String value, String project) throws Exception {
    	String sql = "SELECT " +
				"COUNT(pa.id) AS regitros " +
				"FROM proyectos_actividades AS pa " +
				"INNER JOIN proyectos po ON pa.id_proyecto = po.id " +
				"INNER JOIN usuarios us ON pa.id_usuario = us.id ";

		String sql_where_all = "WHERE (pa.id " + " LIKE ? " +
				"OR pa.nombre_actividad LIKE ? " +
				"OR us.username LIKE ? " +
				"OR pa.fecha_entrega LIKE ? " +
				"OR pa.prioridad LIKE ? " +
				"OR pa.estado LIKE ? )";
		
		String sql_where_project = " AND po.nombre_proyecto = ? ";

		sql += (!value.isEmpty()) ? sql_where_all : "";
		sql += (!project.isEmpty()) ? sql_where_project : "";

    	ResultSet rs;

    	try {
			PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			if (!value.isEmpty()) {
				statement.setString(1, "%" + value + "%");
				statement.setString(2, "%" + value + "%");
				statement.setString(3, "%" + value + "%");
				statement.setString(4, "%" + value + "%");
				statement.setString(5, "%" + value + "%");
				statement.setString(6, "%" + value + "%");
				
				if (! project.isEmpty()) {
					statement.setString(7, project);
				}
			} else if (! project.isEmpty()) {
				statement.setString(1, project);
			}
			
			rs = statement.executeQuery();
			rs.first();

			return rs.getInt(1);
		} catch(SQLException e) {
			throw e;
		} finally {
    		MySQLi.close();
		}
	}

	@Override
	public List<Map<String, String>> find(Map<String, String> params, boolean filter) throws Exception {
		String sql = "SELECT " +
				"pa.id, " +
				"po.nombre_proyecto, " +
				"pa.nombre_actividad, " +
				"pa.fecha_entrega, " +
				"concat_ws(', ', us.nombres, us.apellidos) as usuario_actividad, " +
				"(SELECT concat_ws(', ', nombres, apellidos) FROM usuarios WHERE id = po.id_usuario) as usuario_proyecto," +
				"pa.prioridad, " +
				"pa.estado, " +
				"pa.id_usuario, " +
				"pa.id_proyecto, " +
				"po.descripcion " +
				"FROM proyectos_actividades AS pa " +
				"INNER JOIN proyectos po ON pa.id_proyecto = po.id " +
				"INNER JOIN usuarios us ON pa.id_usuario = us.id ";

		String sql_where_all = "WHERE ( pa.id " + " LIKE ? " +
				"OR pa.nombre_actividad LIKE ? " +
				"OR concat_ws(' ', us.nombres, us.apellidos) LIKE ? " +
				"OR pa.fecha_entrega LIKE ? " +
				"OR pa.prioridad LIKE ? " +
				"OR pa.estado LIKE ? ) ";

		String sql_where_field = "WHERE ( pa." + params.get("field") + " like ? ) ";

		String sql_where_project = "AND pa.id_proyecto = ? ";

		String sql_order = "ORDER BY pa.id " + params.get("order");

		String sql_limit = " LIMIT " + params.get("limit");

		String sql_offset = " OFFSET " + params.get("offset");

		if (filter) {
			sql += (params.containsKey("field")) ? sql_where_field : sql_where_all;
			sql += (params.containsKey("project")) ? sql_where_project : "";
		}

		sql += (params.containsKey("order")) ? sql_order : "";

		if (params.containsKey("limit")) {
			sql += sql_limit;
			sql += (params.containsKey("offset")) ? sql_offset : "";
		}

		List<Map<String, String>> actividad = null;
		Map<String, String> map;

		ResultSet rs;

		try {
			PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			if (filter) {
				if (params.containsKey("field")) {
					statement.setString(1, "%" + params.get("value") + "%");

					if (params.containsKey("project")) {
						statement.setString(2, params.get("project"));
					}
				} else {
					statement.setString(1, "%" + params.get("value") + "%");
					statement.setString(2, "%" + params.get("value") + "%");
					statement.setString(3, "%" + params.get("value") + "%");
					statement.setString(4, "%" + params.get("value") + "%");
					statement.setString(5, "%" + params.get("value") + "%");
					statement.setString(6, "%" + params.get("value") + "%");

					if (params.containsKey("project")) {
						statement.setString(7, params.get("project"));
					}
				}
			}

			rs = statement.executeQuery();

			actividad = new ArrayList<>();

			while (rs.next()) {
				map = new HashMap<>();

				map.put("id", rs.getString(1));
				map.put("proyecto", rs.getString(2));
				map.put("actividad", rs.getString(3));
				map.put("entrega", rs.getString(4));
				map.put("usuario_actividad", rs.getString(5));
				map.put("usuario_proyecto", rs.getString(6));
				map.put("prioridad", rs.getString(7));
				map.put("estado", rs.getString(8));
				map.put("id_usuario", rs.getString(9));
				map.put("id_proyecto", rs.getString(10));
				map.put("descripcion_proyecto", rs.getString(11));

				actividad.add(map);
			}
		} catch (SQLException e) {
			throw  e;
		} finally {
			MySQLi.close();
		}

		return actividad;
	}

	public static ProyectosActividadesDao getInstance() {
		if (pado == null) {
			pado = new ProyectosActividadesDaoImp();
		}	
		return pado;
    }
}
