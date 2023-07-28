<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "util.*, java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String num = request.getParameter("board_num");
	String title = request.getParameter("board_title");
	String auth = request.getParameter("board_auth");
	String content = request.getParameter("board_content");
	int board_num = Integer.parseInt(num);
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	String sql = "UPDATE board_test SET "
					+ " board_title = ?,"
					+ " board_content = ?"
					+ " WHERE board_num = ? ";
	String msg = "";
	try{
		conn = DB.getConnection();
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setInt(3, board_num);
		
		int result = psmt.executeUpdate();
		msg = (result > 0) ? "수정 성공" : "수정 실패";
	}catch(Exception e){
		System.out.println(e.getMessage());
		msg = "수정도 못하냐?";
	}finally{
		DB.close(psmt, conn);
	}
%>

<script>
	alert('<%= msg %>');
	location.href='/Board_test/index.jsp';
</script>