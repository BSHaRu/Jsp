<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>user3::register</title>
</head>
<body>
	<h3>User3 등록</h3>
	<a href="/Ch06/2_DBCP.jsp">처음으로</a>
	<a href="/Ch06/user3/register.jsp">User3 등록</a>
	<a href="/Ch06/user3/list.jsp">User3 list</a>
	
	<form action="/Ch06/user3/registerPrco.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="uid" />
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" />
				</td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td>
					<input type="text" name="hp" />
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>
					<input type="number" name="age" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록" />
				</td>
			</tr>
		</table>
	</form>
	
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(function(){
			$("input[type=submit]").click(function(e){
				e.preventDefault();
				console.log("test1");

				// 입력 데이터 가져오기
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
				
				$.ajax({
					url : "./registerPrco.jsp",
					type : "POST",
					data : jsonData,
					dataType : "JSON",
					success : function(data){
						console.log(data);
						
						if(data.result >= 1){
							alert("데이터가 추가 되었습니다.");
							
							// 데이터 저장 후 입력값 초기화
							$('form')[0].reset();
						}else{
							alert("데이터가 추가 실패했습니다.");	
						}
					} // success end
				}); // ajax end
			}); // click event end
		});
	</script>
	
</body>
</html>