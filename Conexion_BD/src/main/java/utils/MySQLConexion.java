package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConexion {
	
	public static Connection getConnection() {
		Connection con = null;
		try {
			System.out.println("entre a getconection");
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/" + "struts2" +"?useUnicode=true&use" +
			"JDBCCompilantTimeZoneShift=true&useLegacyDatetimeCode=false&" +
			"serverTimezone=UTC"; //la Bd se llama struts2
			String usr = "root";
			String pws="";
			System.out.println("sigo en  a getconection");
			con= DriverManager.getConnection(url, usr, pws);
			System.out.println("sigo 2 en  a getconection");
		} catch (ClassNotFoundException e) {
			System.out.println("error: Driver no instalado");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("error en la conexión con la BD");
		}
		System.out.println("todoooo OK");
		return con;
	}
	
}
