<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>3_AJAX</title>
</head>
<body>
	<h3>3. AJAX 실습</h3>
	
	<h4>JSON / XML 실습</h4>
	<a href="./data/json1.jsp">JSON1 데이터 생성</a>
	<br/>
	<a href="./data/json2.jsp">JSON2 gson 라이브러리</a>
	<br/>
	<hr/>
	
	<a href="./data/xml1.jsp">xml1 데이터 생성</a>
	<br/>
	<a href="./data/xml2.jsp">xml1 jdom 라이브러리</a>
	<br/>
	<hr/>
	
	<h4>AJAX 실습</h4>
	<button id="btn1">데이터 요청</button>
	<p>
		아이디 : <span></span> <br/>
		이름 : <span></span> <br/>
		휴대폰 : <span></span> <br/>
		나이 : <span></span> <br/>
	</p>
	<hr/>
	
	<button id="btn2">JSON 배열 데이터 요청</button>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
		</tr>
	</table>
	
</body>
	<script>
		window.onload = function(){
			console.log("test1");
			
			const btn1 = document.getElementById('btn1');
			
			// 문서 객체 생성
			const spans = document.getElementsByTagName('span');
			
			btn1.onclick = function(){
				console.log("onclick test");
				
				const xhr = new XMLHttpRequest();
				xhr.open("GET", "/Ch06/data/json1.jsp");
				xhr.send();
				
				xhr.onreadystatechange = function(){
					if(xhr.readyState == XMLHttpRequest.DONE){
						if(xhr.status == 200){
							// 객체가 아니라 문자열 data임
							// 객체가 아니기 때문에 참조 연산이 안됨
							// const data = xhr.response;
							
							// JSON 객체로 받기
							const data = JSON.parse(xhr.response);							
							// 이렇게 하면 앞에 있는 문자열도 같이 합쳐버려서
							// console에서는 object로 뜸
//							console.log("data : " + data);
							console.log(data);
							
							// 문서 객체 
							spans[0].innerText = data.uid;
							spans[1].innerText = data.name;
							spans[2].innerText = data.hp;
							spans[3].innerText = data.age;
							
						} // status end
					} // readState end
				} // onready end
			} // btn1 onclcik end
			
			const table = document.getElementsByTagName('table')[0];
			const btn2 = document.getElementById('btn2');
			btn2.addEventListener("click", function(){
				console.log("btn2 test");
				
				fetch("/Ch06/data/json2.jsp")
					.then((response) => {
//						console.log("response : " + response);
						console.log(response);
						return response.json();
					}) // fetch > then end
					.then((data) => {
						// console.log("data : " + data);
						console.log(data);
						
						for(let i = 0; i < data.length; i++){
	                        // console.log("data[i] : " + data[i]);
	                        console.log(data[i]);
							
	                        const user = document.createElement('tr');
	                        const uid = document.createElement('td');
	                        const name = document.createElement('td');
	                        const hp = document.createElement('td');
	                        const age = document.createElement('td');

	                        uid.innerText = data[i].uid;
	                        name.innerText = data[i].name;
	                        hp.innerText = data[i].hp;
	                        age.innerText = data[i].age;

	                        user.appendChild(uid);
	                        user.appendChild(name);
	                        user.appendChild(hp);
	                        user.appendChild(age);

	                        table.appendChild(user);  
						} // for end
					}); // then > then & fetch end				
			}); // btn2 click end
		} ;
	</script>

</html>