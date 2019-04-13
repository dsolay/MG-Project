package dao;
import java.util.List;
import java.util.Map;

import model.Proyectos;;

public interface ProyectosDao {

	void save(Proyectos proyectos) throws Exception;

	void update(Proyectos proyectos) throws Exception;

	void delete(Proyectos proyectos) throws Exception;

	List<Map<String,String>> findAll() throws Exception;

	List<Proyectos> find(String field, String value) throws Exception;
}

