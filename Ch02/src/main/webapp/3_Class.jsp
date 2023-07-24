<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sub1.Account"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3.Class</title>
</head>
<body>
	<h3>3. 클래스</h3>
	
	<%
		Account kb = new Account("국민은행", "101-12-1234", "김유신" ,1000);
		kb.deposit(30000);
		kb.withdraw(5000);
		kb.show(out);
	%>
</body>
</html>