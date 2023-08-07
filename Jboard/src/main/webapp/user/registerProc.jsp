<%@page import="dao.UserDAO"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*, java.util.*, java.sql.*" %>
  
<%
	request.setCharacterEncoding("UTF-8");
	
	String uid = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String pass2 = request.getParameter("pass2");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String role = request.getParameter("role");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");	
	String regIp = request.getRemoteAddr();
	
	UserVO vo = new UserVO();
	vo.setUid(uid);
	vo.setPass(pass1);
	vo.setName(name);
	vo.setNick(nick);
	vo.setEmail(email);
	vo.setHp(hp);
	vo.setRole(role);
	vo.setZip(zip);
	vo.setAddr1(addr1);
	vo.setAddr2(addr2);
	vo.setRegIp(regIp);
	
	UserDAO.getInstance().insertUser(vo);
	
	
	response.sendRedirect("/Jboard/user/login.jsp");
%>