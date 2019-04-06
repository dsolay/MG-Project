package daoImp;

import dao.TipodeusuarioDao;
import db.MySQLi;
import modelo.Tipodeusuario;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * @author wendy.medinafgkah
 *
 */
public class TipodeusuarioDaoImp extends MySQLi implements TipodeusuarioDao {

	private static TipodeusuarioDaoImp TipodeusuarioDaoImpl = null;
	
	public TipodeusuarioDaoImp() {
		
	}

	@SuppressWarnings("finally")
	@Override
	public long saveTipodeusuario(Tipodeusuario tipodeusuario) throws Exception {
	String sql ="INSERT INTO TIPODEUSUARIO(descripcion,id,tipo) values (?,?,?)";
	
	

	long bandera=0;
	
   try{
	   
	   
	   MySQLi.connect();
	   
	   PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); 
		 //setear los datos a ?,?,?,?
		 statement.setString(1, tipodeusuario.getDescripcion()); 
		 statement.setByte(2, tipodeusuario.getId()); 
		 statement.setString(3, tipodeusuario.getTipo()); 
		 
		 
		 
		 
		 statement.executeUpdate();
		 bandera = 1;
	} catch (ClassNotFoundException | SQLException e) {
		//Mostrar error
		System.out.println("Error inesperado en inset: "+ e);
		throw e;
	}finally {	
	   	//cerrar conexion con mysql
 	
		close();
 
	return bandera;
	
	}
   
}
 
	
	public void updateTipodeusuario(Tipodeusuario tipodeusuario) throws Exception {
		String sql="UPDATE tipodeusuario SET descripcion=?,tipo=? WHERE id=?";
		
		try {
			  MySQLi.connect();
			  PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	          
			     statement.setString(1, tipodeusuario.getDescripcion()); 
				 statement.setByte  (2,   tipodeusuario.getId()); 
				 statement.setString(3, tipodeusuario.getTipo()); 
				 
				 statement.executeUpdate();
				 System.out.println("Dato actualizado");
		}catch (ClassNotFoundException | SQLException e) {
			System.out.println("Error update");
			throw e;
			
		}finally {
			MySQLi.close();
			 
		}
	}
          
	@Override
	public void deleteTipodeusuario(Tipodeusuario tipodeusuario) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Tipodeusuario> findAllTipodeusuarios() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
