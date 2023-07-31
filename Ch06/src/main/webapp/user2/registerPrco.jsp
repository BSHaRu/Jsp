<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String strAge = request.getParameter("age");
	// String으로 값을 받기 때문에 여기서 int로 바꿔줘야 됨
	// 아니면 아싸리 setString으로 받거나
	// setString으로 받을 때 Integer를 통해서 타입변환 해줘야함
	int age = Integer.parseInt(strAge);
	
	try{
		// JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		// JNDI 기본 환경 이름
		// JNDI는 외부 서비스임
		// -> server에 있는 context.xml 파일에서 설정해줘야됨
		Context ctx = (Context)initCtx.lookup("java:comp/env");
		
		// 커넥션 풀에서 커넥션 가져오기
		// context.xml에 설정 한 이름을 쓰면 됨
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
		
		String sql = "INSERT INTO user1 VALUES(?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setInt(4, age);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	
	response.sendRedirect("/Ch06/user2/list.jsp");
%>