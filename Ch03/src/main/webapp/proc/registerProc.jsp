<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 폼에서 한글 입력을 정상적으로 처리하기 위해서
	// 해당 인코딩 설정을 해줘야 한글이 안깨지고 제대로 전달됨
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String addr = request.getParameter("addr");
	// 여러개의 전송을 받기 위해서 Values로 지정해 줘야하고,
	// 그렇기 때문에 배열로 받아야 된다.
	String hobbies[] = request.getParameterValues("hobby");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>registerProc</title>
</head>
<body>
	<h3>회원가입 수신 데이터</h3>
	<p>
		아이디 : <%= uid %><br/>
		비밀번호 : <%= pass %><br/>
		이름 : <%= name %><br/>
		생년월일 : <%= birth %><br/>
		성별 :<%= gender.equals("1") ? "남" : "여" %><br/>
		주소 : <%= addr %><br/>
		취미 : 
		<% 
			for(String hobby : hobbies){
				out.print(hobby + ", ");				
			}
		%>
		<br/>
	</p>
	
	<a href="../1_request.jsp">뒤로 가기</a>
</body>
</html>