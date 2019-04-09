package dao;
import java.util.List;
import java.util.Map;

import model.Proyectos;;

public interface ProyectosDao {
	


	
		
		void saveProyectos(Proyectos proyectos) throws Exception;

		void updateProyectos(Proyectos proyectos) throws Exception;

		void deleteProyectos(Proyectos proyectos) throws Exception;

		List<Map<String,String>> findAll() throws Exception;


	}

