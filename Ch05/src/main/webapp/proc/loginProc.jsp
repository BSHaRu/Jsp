<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");

	// 회원 여부 확인 - 그냥 비번만 1234 회원취급
	if(pw.equals("1234")){
		// 회원일 경우 - 세션 기록
		
		// 자동 로그인 처리(checkbox 체크 했을 경우)
		if(auto != null){
			Cookie autoCookie = new Cookie("cid",id);
			autoCookie.setMaxAge(60*60*24);
			response.addCookie(autoCookie);
		}
		
		session.setAttribute("sessid", id);
		response.sendRedirect("./loginSuccess.jsp");
	}else{
		// 회원이 아닐 경우 form 이동
		response.sendRedirect("./loginFrom.jsp");
	}
%>