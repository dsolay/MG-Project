package daoImp;

import dao.TipodeusuarioDao;
import db.MySQLi;
import model.Tipodeusuario;

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

	@Override
	public long saveTipodeusuario(Tipodeusuario tipodeusuario) throws Exception {
	String sql ="INSERT INTO tipo_usuario(descripcion,id,tipo) values (?,?,?)";

	long bandera=0;
	
   try{
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
		MySQLi.close();
	}
   return bandera;
   
}
 
	@Override
	public void updateTipodeusuario(Tipodeusuario tipodeusuario) throws Exception {
		String sql="UPDATE tipo_usuario SET descripcion=?,tipo=? WHERE id=?";
		
		try {
			  MySQLi.connect();
			  PreparedStatement statement = MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	          
			     statement.setString(1, tipodeusuario.getDescripcion()); 
				 statement.setByte  (3, tipodeusuario.getId()); 
				 statement.setString(2, tipodeusuario.getTipo()); 
				 
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
		
	String sql ="DELETE FROM tipo_usuario WHERE id =? " ;
		
		try {
				
			PreparedStatement statement = MySQLi.connect().prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		
			statement.setInt(1, tipodeusuario.getId());
			
			statement.execute();
			
			System.out.println("dato eliminado");
			
		} catch (ClassNotFoundException | SQLException e) {
		
			System.out.println("ERROR al eliminar ");	
			
			throw e;
		}finally{
			MySQLi.close();
		}
	}
	@Override
	public List<Tipodeusuario> findAllTipodeusuarios() throws Exception {
		String sql="SELECT* FROM tipo_usuario";
		
		List<Tipodeusuario> tipodeusuario =null;
		
		ResultSet rs;
		
		try {
			
			
			PreparedStatement statment =MySQLi.connect().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			rs = statment.executeQuery();//Devuelve un resulset
			
			tipodeusuario = new ArrayList();
			
			
			while(rs.next()) {
				
				Tipodeusuario tipousuario =new Tipodeusuario();
				
				tipousuario.setId(rs.getByte(1));
				tipousuario.setDescripcion(rs.getString(2));
				tipousuario.setTipo(rs.getString(3));
				
				tipodeusuario.add(tipousuario);
			}
			
		} catch (SQLException e) {
				System.out.println("ERROR al listar datos");
				throw e ;
			
		}finally{
			MySQLi.close();
		}
				
		
		
	return tipodeusuario;	
	}
	
	public static TipodeusuarioDao getInstance() {
		if (TipodeusuarioDaoImpl == null) {
			TipodeusuarioDaoImpl = new TipodeusuarioDaoImp();
		}	
		return TipodeusuarioDaoImpl;
    }

}
	
	
