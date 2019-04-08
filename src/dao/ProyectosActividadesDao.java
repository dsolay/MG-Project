package dao;

import model.ProyectosActividades;

import java.util.List;
import java.util.Map;

public interface ProyectosActividadesDao {

    void save(ProyectosActividades pa) throws Exception;

    void update(ProyectosActividades pa) throws Exception;

    void delete(ProyectosActividades pa) throws Exception;

    List<Map<String, String>> findAll() throws  Exception;
}
