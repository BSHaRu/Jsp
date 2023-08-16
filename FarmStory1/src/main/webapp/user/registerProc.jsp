<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 이렇게 하고 insertUser에 userDTO를 넘기면 되긴함
다만, ip값을 못 가져 와서 ip값은 계속 null로 뜸
<% request.setCharacterEncoding("UTF-8"); %>    
<jsp:useBean id ="userDTO" class="dto.UserDTO" />
<jsp:setProperty name="userDTO" property="*" />
 --%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	String rePass = request.getParameter("rePass");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String role = request.getParameter("role");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");	
	String regIp = request.getRemoteAddr();
	
	UserDTO dto = new UserDTO();
	dto.setUid(uid);
	dto.setPass(pass);
	dto.setName(name);
	dto.setNick(nick);
	dto.setEmail(email);
	dto.setHp(hp);
	dto.setRole(role);
	dto.setZip(zip);
	dto.setAddr1(addr1);
	dto.setAddr2(addr2);
	dto.setRegIp(regIp);
	
	UserDAO.getInstansce().insertUser(dto);
	
	response.sendRedirect("/FarmStory1/user/login.jsp");
%>    