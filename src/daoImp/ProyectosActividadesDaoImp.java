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
    public void save(ProyectosActividades pa) throws Exception {
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
			statement.executeUpdate();
			System.out.println("Dato guardado");
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		} finally {
			MySQLi.close();
		}
    }

    @Override
    public void update(ProyectosActividades pa) throws Exception {
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
            statment.executeUpdate();
            System.out.println("Dato actualizado");
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		} finally {
			MySQLi.close();
		}
    }

    @Override
    public void delete(ProyectosActividades pa) throws Exception {
    	String sql = "DELETE FROM proyectos_actividades WHERE id = ?";
    	
    	try {
    		 PreparedStatement statment = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
             
    		 statment.setShort(1, pa.getId());
             
             //Actualiza los valores
             statment.executeUpdate();
             
               System.out.println("Dato Eliminado");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Error al eliminar la actividad\n" + e.getMessage());
        } finally {
			MySQLi.close();
		}
    }

    @Override
    public List<Map<String, String>> findAll() throws Exception {
    	String sql = "SELECT " +
				"pa.id, " +
				"po.nombre_proyecto, " +
				"pa.nombre_actividad, " +
				"us.username, " +
				"pa.fecha_creacion, " +
				"pa.fecha_entrega, " +
				"pa.prioridad, " +
				"pa.estado, " +
				"pa.id_usuario, " +
				"pa.id_proyecto " +
				"FROM proyectos_actividades AS pa " +
				"INNER JOIN proyectos po ON pa.id_proyecto = po.id " +
				"INNER JOIN usuarios us ON pa.id_usuario = us.id ";
    	
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
	        	map.put("proyecto", rs.getString(2));
	        	map.put("actividad", rs.getString(3));
				map.put("username", rs.getString(4));
				map.put("creado", rs.getString(5));
				map.put("entrega", rs.getString(6));
				map.put("prioridad", rs.getString(7));
				map.put("estado", rs.getString(8));
				map.put("id_usuario", rs.getString(9));
				map.put("id_proyecto", rs.getString(10));

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
