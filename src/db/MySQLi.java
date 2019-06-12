package db;

import java.sql.Connection;
//import com.mysql.jdbc.Connection;
//import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MySQLi extends Config {

    private static Connection cn = null;

    public MySQLi() {

    }
	
	/*public static Connection connect() throws SQLException, ClassNotFoundException {
	  if (cn == null || cn.isClosed()) {
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
	}*/

    public static java.sql.Connection connect() throws SQLException, ClassNotFoundException {
        InitialContext ctx;
        try {
            ctx = new InitialContext();
            DataSource ds = (DataSource)ctx.lookup("jdbc/pool");
            cn = ds.getConnection();
        } catch (NamingException e) {
            e.printStackTrace();
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
