<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.*, java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("board_title");
	String auth = request.getParameter("board_auth");
	String content = request.getParameter("board_content");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	String message = "";
	String sql = "INSERT INTO board_test VALUES(null,?,?,?,now())";
	try{
		conn = DB.getConnection();
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, title);
		psmt.setString(2, auth);
		psmt.setString(3, content);
		
		int result = psmt.executeUpdate();
		message = (result > 0) ? "글 작성 성공" : "글도 못쓰는 찐따쉨";
	}catch(Exception e){
		System.out.println(e.getMessage());
		message = "글 작성 실패!!!";
	}finally{
		DB.close(psmt, conn);
	}
%>
<script>
	alert('<%= message %>');
	location.href='/Board_test/index.jsp';
</script>
