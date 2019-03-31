package db;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class MySQLConnection extends Config {
	private static Connection cn = null;
	
	public MySQLConnection() {
		
	}
	
	public static Connection connect() throws SQLException, ClassNotFoundException {
	  if (cn == null) {
	     try {
	    	 Class.forName(driver);
	    	 cn = (Connection) DriverManager.getConnection(url, user, password);
	    	 // System.out.println("Conexion exitosa");
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
					// System.out.println("Conexion cerrada");
				}
			}
		} catch (Exception e) {
			System.out.println("Error al cerrar la conexion: " + e.getMessage());
		}
	}

}
