package dao;

import model.TipoUsuario;

import java.util.List;
import java.util.Map;

public interface TipoUsuarioDao {
    void save(TipoUsuario tipoUsuario)throws Exception;

    void update(TipoUsuario tipoUsuario)throws Exception;

    void delete(TipoUsuario tipoUsuario)throws Exception;

    List<Map<String, String>> findAll()throws Exception;
}
