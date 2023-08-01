<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="vo.User1VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>user3::modify</title>
</head>
<body>
	<h3>User3 수정</h3>
	<a href="/Ch06/2_DBCP.jsp">처음으로</a>
	<a href="/Ch06/user3/register.jsp">User3 등록</a>
	
	<form action="/Ch06/user3/modifyPrco.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="uid" value="" readonly />
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" value=""/>
				</td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td>
					<input type="text" name="hp" value=""/>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>
					<input type="number" name="age" value=""/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정" />
				</td>
			</tr>
		</table>
	</form>
	
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function(){
			const url = "./user.jsp?uid=<%= uid %>";
			// 수정 데이터 요청
			$.get(url, function(data){
				console.log(data);
				$('input[name=uid]').val(data.uid);
				$('input[name=name]').val(data.name);
				$('input[name=hp]').val(data.hp);
				$('input[name=age]').val(data.age);
			}); // get end
			
			// 수정 데이터 전송
			$('input[type=submit]').click(function(e){
				e.preventDefault();
				
				// 수정 데이터 가져오기
				const uid = $("input[name=uid]").val();
				const name = $("input[name=name]").val();
				const hp = $("input[name=hp]").val();
				const age = $("input[name=age]").val();
				
				// JSON 생성
				const jsonData = {
					"uid" : uid,
					"name" : name,
					"hp" : hp,
					"age" : age
				};
				console.log(jsonData);
				
				$.post("./modifyPrco.jsp", jsonData, function(data){
					console.log(data);
					console.log(data.result);
					if(data.result >= 1){
						alert("데이터가 수정 되었습니다.");
						location.href="./list.jsp";
					}else{
						alert("데이터 수정이 실패했습니다.");
					}
					/* JSON으로 데이터 형식을 명시해줌
						안해주면 data.result가 undefined가 뜰 수 있음
						-> 애초에 data는 json 타입임
						근데 우리가 json 파싱을 안해준 상태에서
						그 값을 사용하려고 하니깐 undefined가 뜬거였음
						
						고로 if전에 data = JSON.parse(data)를 해줬어야했거나
						아니면 post뒤에 이렇게 json임을 알려줘야함
						
						혹은 modifyProc에서 data를 넘길때 
						contentType으로 json임을 알려줬어야함
					*/
				}, "json");
			}); // click event
		}); 
	</script>
</body>
</html>