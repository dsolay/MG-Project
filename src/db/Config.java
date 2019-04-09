package db;

public class Config {

		protected static String driver="com.mysql.jdbc.Driver";
		
		protected static String host="127.0.0.1";
		protected static String port="3307";
		protected static String database="control_actividades";
		
		protected static String url="jdbc:mysql://" + host + ":" + port + "/" + database;
		
		protected static String user="root";
		protected static String password="";
}
