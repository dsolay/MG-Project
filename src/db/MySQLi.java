package db;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class MySQLi extends Config {
	
	private static Connection cn = null;
	
	public MySQLi() {
		
	}
	
	public static Connection connect() throws SQLException, ClassNotFoundException {
	  if (cn == null) {
	     try {
	    	 Class.forName(driver);
	    	 cn = (Connection) DriverManager.getConnection(url, user, password);
	     } catch (SQLException ex) {
	    	 throw new SQLException(ex);
	     } catch (ClassNotFoundException ex) {
	    	 throw new ClassCastException(ex.getMessage());
	     }
	  }
	  
	  return cn;
	}

	public static void close() throws SQLException {
		try {
			if (cn != null) {
				if (! cn.isClosed()) {
					cn.close();
				}
			}
		} catch (Exception e) {
			System.out.println("Error al cerrar la conexion: " + e.getMessage());
		}
	}
}
