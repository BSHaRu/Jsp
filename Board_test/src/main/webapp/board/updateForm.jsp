<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "util.*, java.sql.*" %>    
<%
	request.setCharacterEncoding("UTF-8");
	
	String num = request.getParameter("board_num");
	int board_num = Integer.parseInt(num);
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM board_test WHERE board_num = ?";
	
	/* 여기서 null 값을 준 이유
		- rquest로 값을 안받왔기 때문에
		그냥 해당 값을 null로 초기화한 후
		rs으로 기존 값을 넣어 주기 위해서.
	*/
	String title = null;
	String auth = null;
	String content = null;
	try{
		conn = DB.getConnection();
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, board_num);
		
		rs = psmt.executeQuery();
		if(rs.next()){
			title = rs.getString("board_title");
			auth = rs.getString("board_auth");
			content = rs.getString("board_content");
		}
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		DB.close(rs, psmt, conn);
	}
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>updateForm</title>
</head>
<body>
	<form action="updateSubmit.jsp" method="post">
		<!-- hidden 사용 하는 이유
			- 해당 값은 필요하지만, 클라이언트한테는 굳이 알려줄 필요없는 정보
			- 수정 하기 위해서는 보통 해당 id(작성자)값을 확인하지만
				여기서는 그 정보를 확인 하는 방법이 없기 때문에
				PK값인 num을 넘겨서 확인 하는거임
		-->
		<input type="hidden" name="board_num" value="<%= board_num %>" />
		<table>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="board_title" autofocus required value="<%= title %>" />
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="board_auth" readonly disabled value="<%= auth %>" />
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<!-- textarea는 해당 태그 사이가 value 값임 -->
					<textarea name="board_content" rows="20" cols="50"><%= content %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="작성완료" />
					<input type="reset" value="다시쓰기" />
					<input type="button" onclick="/Board_test/index.jsp" value="home" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>