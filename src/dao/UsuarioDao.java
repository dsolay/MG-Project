package dao;

import java.util.List;

import modelo.Usuario;

public interface UsuarioDao {

    long saveUsuario(Usuario usuario) throws Exception;

    void updateUsuario(Usuario usuario) throws Exception;

    void deleteUsuario(Usuario usuario) throws Exception;
  
    List<Usuario> findAllUsuario() throws Exception;
}
