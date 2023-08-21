<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.FileVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Context init = new InitialContext();
	DataSource ds 
		= (DataSource) init.lookup("java:comp/env/jdbc/Jboard");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	List<FileVO> files = new ArrayList<>(); 
	String sql = "SELECT * FROM File_test";
	try{
		conn = ds.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			FileVO vo = new FileVO();
			vo.setFno(rs.getInt(1));
			vo.setoName(rs.getString(2));
			vo.setsName(rs.getString(3));
			vo.setRegDate(rs.getDate(4));
			files.add(vo);
		}
	}catch(Exception e){
		System.out.println("db : " +e.getMessage());
	}finally{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>2_FileDownload.jsp</title>
</head>
<body>
	<h3>파일 다운로드</h3>
	
	<table border="1">
		<tr>
			<th>파일번호</th>
			<th>원본파일명</th>
			<th>저장파일명</th>
			<th>등록일</th>
			<th>다운로드</th>
		</tr>
		<% for(FileVO file : files){ %>
		<tr>
			<td><%= file.getFno() %></td>
			<td><%= file.getoName() %></td>
			<td><%= file.getsName() %></td>
			<td><%= file.getRegDate() %></td>
			<td>
				<a href="/Ch07/proc/fileDownload.jsp?fno=<%=file.getFno() %>">다운로드</a>
			</td>
		</tr>
		<% } %>
	</table>
	
</body>
</html>