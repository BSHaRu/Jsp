package util;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCP {

	protected Connection conn;
	protected PreparedStatement psmt;
	protected Statement stmt;
	protected ResultSet rs;
	
	public Connection getConnection() {
		try {
			Context init = new InitialContext();
			DataSource ds 
				= (DataSource) init.lookup("java:comp/env/jdbc/Jboard");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println("DBCP 에러" + e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB 연결 에러" + e.getMessage());
		}
		return conn;
	}
	
	public void close(AutoCloseable... closer) {
		for(AutoCloseable c : closer) {
			if(c != null) {
				try {
					c.close();
				} catch (Exception e) {
					System.out.println("close : " + e.getMessage());
				}
			}
		}
	}
}
