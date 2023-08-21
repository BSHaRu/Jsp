<%@page import="java.io.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="vo.FileVO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 파일 정보 수신
	request.setCharacterEncoding("UTF-8");	
	String fno = request.getParameter("fno");

	// 파일 번호 조회
	Context init = new InitialContext();
	DataSource ds 
		= (DataSource) init.lookup("java:comp/env/jdbc/Jboard");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	List<FileVO> files = new ArrayList<>(); 
	FileVO vo = new FileVO();
	String sql = "SELECT * FROM File_test "
			+ " WHERE fno =" + fno;
	try{
		conn = ds.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			vo.setFno(rs.getInt(1));
			vo.setoName(rs.getString(2));
			vo.setsName(rs.getString(3));
			vo.setRegDate(rs.getDate(4));
		}
	}catch(Exception e){
		System.out.println("db : " +e.getMessage());
	}finally{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	// response 파일 다운로드 헤더 수정
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(vo.getoName(), "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");
	
	
	// response 파일 stream 작업
	String path = application.getRealPath("/upload");
	File file = new File(path+"/"+vo.getsName());
	
	out.clear();
	
	BufferedInputStream bis 
		= new BufferedInputStream(
				new FileInputStream(file));
	BufferedOutputStream bos 
		= new BufferedOutputStream(
				response.getOutputStream());
	
	while(true){
		int data = bis.read();
		if(data == -1) break;
		bos.write(data);
	}
	bos.flush();

	bos.close();
	bis.close();
%>