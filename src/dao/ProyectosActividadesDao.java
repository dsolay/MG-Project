package dao;

import modelo.ProyectosActividades;
import modelo.Usuario;

import java.util.List;

public interface ProyectosActividadesDao {

    void save(ProyectosActividades pa) throws Exception;

    void update(ProyectosActividades pa) throws Exception;

    void delete(ProyectosActividades pa) throws Exception;

    List<ProyectosActividades> findAll() throws  Exception;
}
