<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.*, java.sql.*" %>

<%
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM board_test ORDER BY board_num DESC";
	try{
		conn = DB.getConnection();
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
	}catch(SQLException e){
		out.println("질의 실행 실패 <br/>");
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>board_test</title>
</head>
<body>
	<section>
		<a href="/Board_test/board/writeForm.jsp">글 작성</a>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성시간</th>
				<th>기타</th>
			</tr>
			<% while(rs.next()){ %>
			<tr>
				<td><%= rs.getInt("board_num") %></td>
				<td><%= rs.getString("board_title") %></td>
				<td><%= rs.getString("board_auth") %></td>
				<!-- JDBC에서는 getDateTime메서드 x
				-> DateTime을 쓸꺼면 String 으로 받고
				그 String을 DateTime으로 처리 할 수 있음
				ex) String boardDateStr = rs.getString("board_date");
				    DateTimeFormatter formatter 
				    	= DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				    LocalDateTime boardDate 
				    	= LocalDateTime.parse(boardDateStr, formatter);
				-->
				<td><%= rs.getTimestamp("board_date") %></td>
				<td>
					<a href="/Board_test/board/updateForm.jsp?board_num=<%= rs.getInt("board_num") %>">수정</a>
					<a href="/Board_test/board/delete.jsp?board_num=<%= rs.getInt("board_num") %>">삭제</a>
				</td>
			</tr>
			<%} %> <!-- while end -->
		</table>
	</section>
	<%
		DB.close(rs, psmt, conn);
	%>	
</body>
</html>