<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*, java.util.*, java.sql.*" %>
<%-- 
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="u" class="vo.UserVO" /> 
<jsp:setProperty property="*" name ="u" /> 
--%>
  
<%
	request.setCharacterEncoding("UTF-8");
	
	String uid = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String role = request.getParameter("role");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");	
	String regIp = request.getRemoteAddr();
	
	Context init = new InitialContext();
	DataSource ds 
		= (DataSource) init.lookup("java:comp/env/jdbc/Jboard");
	Connection conn = ds.getConnection();
	
	PreparedStatement psmt = null;
	String sql ="";
	try{
		sql = "INSERT INTO User SET "
				+ " uid = ?,"
				+ " pass = ?,"
				+ " name = ?,"
				+ " nick = ?,"
				+ " email = ?,"
				+ " hp = ?,"
				+ " zip = ?,"
				+ " addr1 = ?,"
				+ " addr2 = ?,"
				+ " regIp = ?,"
				+ " regDate = NOW()";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, pass1);
		psmt.setString(3, name);
		psmt.setString(4, nick);
		psmt.setString(5, email);
		psmt.setString(6, hp);
		psmt.setString(7, zip);
		psmt.setString(8, addr1);
		psmt.setString(9, addr2);
		psmt.setString(10, regIp);
		
		psmt.executeUpdate();

		psmt.close();
		conn.close();
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	response.sendRedirect("/Jboard/user/login.jsp");
%>