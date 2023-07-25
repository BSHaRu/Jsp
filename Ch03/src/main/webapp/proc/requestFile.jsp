<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>requestFile</title>
</head>
<body>
	<h3>requestFile</h3>
	<%	// appplication/octet-stream : 파일 다운로드로 받는거임
		// -> 브라우저에 출력하는게 아님
		// 해당 페이지를 파일로 다운로드 함
		response.setHeader("Content-type", "appplication/octet-stream");
	%>
	
</body>
</html>