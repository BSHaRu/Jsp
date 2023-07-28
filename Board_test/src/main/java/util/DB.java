package util;

import java.sql.*;

public class DB {

	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/userdb";
	private static final String USER = "root";
	private static final String PASS = "1234";
	
	private DB() {}
	
	private static Connection conn = null;	
	public static Connection getConnection() {
		if(conn == null) {
			try {
				Class.forName(DRIVER);
//				conn = DriverManager.getConnection(URL, USER, PASS);
//				System.out.println("Driver 등록 완료");
				return DriverManager.getConnection(URL, USER, PASS);
			} catch (ClassNotFoundException e) {
				System.out.println("Driver 등록 실패");
			} catch (SQLException e) {
				System.out.println("DB 연결 실패");
			}
		}// if 종료
		return null;
	} // getConn 종료
	
	public static void close(AutoCloseable... closer) {
		for(AutoCloseable close : closer) {
			try {
				if(closer != null) close.close(); 
			} catch (Exception e) {}			
		} // for 종료
	} // close 종료
}
