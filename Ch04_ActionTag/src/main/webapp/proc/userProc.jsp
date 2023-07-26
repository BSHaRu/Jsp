<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 여기에 지정한 id 값이 key값이자, name 값임 -->
<jsp:useBean id="userBean" class="sub1.UserBean" />
	<jsp:setProperty property="*" name="userBean" />
<%-- 
	property : value값, name : key값
	<jsp:setProperty property="uid" name="userBean" />
	<jsp:setProperty property="name" name="userBean" />
	<jsp:setProperty property="phone" name="userBean" />
	<jsp:setProperty property="age" name="userBean" />
--%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>userProc</title>
</head>
<body>
	<h3>전송 데이터 출력</h3>
	<p>
		아이디 : <%= userBean.getUid() %> <br />
		이름 : <%= userBean.getName() %> <br />
		연락처 : <%= userBean.getPhone() %> <br />
		나이 : <%= userBean.getAge() %> <br />
	</p>	
</body>
</html>