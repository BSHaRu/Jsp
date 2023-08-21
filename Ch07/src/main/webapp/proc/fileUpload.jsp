<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 그냥 전송하면 모두 null 값이 뜸
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String file1 = request.getParameter("file1");
	*/
	
	// 파일 폼 데이터 수신
	// 서버 내의 절대 경로로 잡아줌
	String path1 = application.getRealPath("/upload");
	// 이건 서버가 사용하는 절대 경로가 아니기 때문에 경로를 못찾아서 오류 발생 
	// String path2 = "/Ch07/upload";
	
	// 최대 용량 10MB 설정
	int maxSize = 1024 * 1024 * 10;
	
	// request, "경로", 사이즈, "인코딩값", new DefaultFileRenamePolicy()
	MultipartRequest mr 
		= new MultipartRequest(request, path1, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	String uid = mr.getParameter("uid");
	String name = mr.getParameter("name");
	String fname = mr.getFilesystemName("fname");
	
	System.out.println("uid : " + uid);
	System.out.println("name : " + name);
	System.out.println("fname : " + fname);
	
	// 파일 명 수정
	// 파일 확장자 기준으로 이름 짜름
	int i = fname.lastIndexOf(".");
	String ext = fname.substring(i);
	
	// uuid(universally unique identifie) : 중복 안되는 id값
	String uuid = UUID.randomUUID().toString();
	String sName = uuid+ext;
	
	File f1 = new File(path1+"/"+fname); // 원본 파일 명
	File f2 = new File(path1+"/"+sName); // uuid 파일 명
	
	// 원본 파일명 -> uuid명으로 바꿔 줌
	f1.renameTo(f2);
	
	// 원본 파일명 INSERT
	Context init = new InitialContext();
	DataSource ds 
		= (DataSource) init.lookup("java:comp/env/jdbc/Jboard");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	String sql = "INSERT INTO File_test SET "
				+ " oName =?, "
				+ " sName =?, "
				+ " regDate = NOW()";
	try{
		conn = ds.getConnection();
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, fname);
		psmt.setString(2, sName);
		psmt.executeUpdate();		
	}catch(Exception e){
		System.out.println("db : " +e.getMessage());
	}finally{
		if(psmt != null) psmt.close();
		if(conn != null) conn.close();
	}
	
	// 파일 다운로드 이동
	response.sendRedirect("/Ch07/2_FileDownload.jsp");
	
%>