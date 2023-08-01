<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="vo.User1VO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>user3 :: list</title>
</head>
<body>
	<h3>User3 목록</h3>
	<a href="/Ch06/2_DBCP.jsp">처음으로</a>
	<a href="/Ch06/user3/register.jsp">User3 등록</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
	</table>

	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function(){
			$.ajax({
				url : "./listProc.jsp",
				type : "GET",
				dataType : "JSON",
				success : function(data){
					for(let user of data){
						/* 
							- for문에 있는 let tr에 있는 부분에서
							\${}앞에 \를 안붙이면 $가 jQuery인지
							template쓰기 위한 $인지 구분을 못하기 때문에
							\를 붙여줘야됨
							- 주석에 $가 있으면 주석의 $까지 인식해서
							에러가 날 수도 있기 때문에(100% 실행이 아님) 
							주석에도 강제로 \를 붙여줘야 된다.
							 -> 그 와중에 $만 쓰면 \안 붙여도 에러가 안나네
							 -> script 밖에서 \를 안 붙이고 주석을 달면
							 안에서 안 붙였을 때보다 에러가 덜 발생하기는 하지만
							 결국 에러가 발생 하기 때문에 그냥 안전하게 \를 붙여주자!
							- 에러 코드중에 ThreadPoll과 Thread, Socket..?
							이런게 있는거보면 아무래도 멀티스레드 환경에서
							이게 실행이 될 때도 있고 안 될때도 있지 않나 추측해봄
							 -> cf) js는 싱글 스레드 환경의 언어임
						*/
						let tr = `<tr>
								<td>\${user.uid}</td>
								<td>\${user.name}</td>
								<td>\${user.hp}</td>
								<td>\${user.age}</td>
								<td>
									<a href="./modify.jsp?uid=\${user.uid}">수정</a>
									<a href="./delete.jsp?uid=\${user.uid}">삭제</a>
								</td>
								</tr>`;
						$('table').append(tr);
					} // for end
				}// success end
			}); // ajax end			
		}); // onready end
	</script>
</body>
</html>