<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 자동 로그인 체크 여부에 따라 로그인 처리
	Cookie[] cookies = request.getCookies();

	for(Cookie cookie : cookies){
		if(cookie.getName().equals("cid")){
			String id = cookie.getValue();
			session.setAttribute("sessid", id);
		}
	}
	
	// 로그인 여부
	String sessid = (String) session.getAttribute("sessid");
	if(sessid != null){
		response.sendRedirect("./loginSuccess.jsp");
		return;
	}
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>loginForm</title>
</head>
<body>
	<h3>로그인</h3>
	<form action="./loginProc.jsp" method="post">
		<input type="text" name="id" placeholder="아이디 입력" /> <br/>
		<input type="password" name="pw" placeholder="비밀번호 입력" /> <br/>
		<label>
			<!-- check박스 체크하면 1, 체크 안하면 null  -->
			<input type="checkbox" name="auto" value="1" />자동 로그인
		</label> <br/>
		<input type="submit" value="로그인" /> <br/>
	</form>
</body>
</html>