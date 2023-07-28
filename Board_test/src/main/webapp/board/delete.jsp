<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.*" %>   
<%
	request.setCharacterEncoding("UTF-8");
	
	String num = request.getParameter("board_num");
	int board_num = Integer.parseInt(num);
	
	Connection conn = null;
	PreparedStatement psmt = null;
	String sql = "DELETE FROM board_test WHERE board_num = ?";
	String msg = "";
	
	try{
		conn = DB.getConnection();
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, board_num);
		
		int result = psmt.executeUpdate();
		msg = (result > 0)? "삭제 완료" : "삭제할 내용이 없습니다.";
		
	}catch(Exception e){
		System.out.println(e.getMessage());
		msg = "삭제도 못하는 찐따쉨";
	}finally{
		DB.close(psmt, conn);
	}
%>

<script>
	alert('<%= msg %>');
	location.href = "/Board_test/index.jsp";
</script>