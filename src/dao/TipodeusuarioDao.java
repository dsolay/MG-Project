package dao;

import java.util.List;

import modelo.Tipodeusuario;
public interface TipodeusuarioDao {

	long saveTipodeusuario(Tipodeusuario tipodeusuario)throws Exception;
	

	void updateTipodeusuario(Tipodeusuario tipodeusuario)throws Exception;

    void deleteTipodeusuario(Tipodeusuario tipodeusuario)throws Exception;
    
    List<Tipodeusuario> findAllTipodeusuarios()throws Exception;


}