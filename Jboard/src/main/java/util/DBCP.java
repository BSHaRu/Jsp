package util;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCP {

	protected Connection conn = null;
	protected PreparedStatement psmt = null;
	protected Statement stmt = null;
	protected ResultSet rs = null;
	
	public Connection getConnection() {
		try {
			Context init = new InitialContext();
			DataSource ds 
				= (DataSource) init.lookup("java:comp/env/jdbc/Jboard");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public void close() throws SQLException {
		if(rs !=null) rs.close();
		if(stmt !=null) stmt.close();
    	if(psmt !=null) psmt.close();
    	if(conn !=null) conn.close();
	}
	
}
