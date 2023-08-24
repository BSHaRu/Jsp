/**
 * 사용자 중복 체크  
 */
$(function(){

	// 아이디 중복 체크
	$("#btnCheckUid").click(function(){

		console.log("click test");
		const uid = $("input[name=uid]").val();
		
		// 정규식 체크
		if(!uid.match(regexID)){
			$('.resultId').css('color',"red").text("유효한 아이디가 아닙니다.");
			isUidOk = false;
			return; // click event end	
		}
		
		const jsonData ={
				"uid" : uid
		};
		console.log(jsonData);
		
		$.ajax({
			url : "/Jboard/user/checkUid.jsp",
			type : "GET",
			data : jsonData,
			dataType : "JSON",
			success : function(data){
				// 중복 : 1 / 사용가능하면 : 0
				console.log(data);
				console.log(data.result);
				if(data.result >= 1){
					$('.resultId').css('color',"red").text("이미 사용중인 아이디 입니다.");
					isUidOk = false;
				}else{
					$('.resultId').css('color',"green").text("사용 가능한 아이디 입니다.");
					isUidOk = true;
				}
			} // scuccess end
		}); // ajax end
	}); // id 중복체크 end
	
	// 닉네임 중복 체크
	$('input[name=nick]').keyup(function(){
		console.log("keyup test");
		
		// 입력 데이터 가져 오기
		const nick = $(this).val();
		
		if(!nick.match(regexNick)){
			$('.resultNick').css("color","red").text("유효한 닉네임 아닙니다.");
			isNickOk = false;
			return;
		}
		
		const jsonData = {
			"nick" : nick	
		};
		console.log(jsonData);
		
		// 어짜피 get으로 ajax 날릴꺼면 이렇게 데이터 전송이 가능하다
		$.get("/Jboard/user/checkNick.jsp", jsonData, function(data){
			// data는 어짜피 result로 받을 꺼고
			// data.result는 1 or 0의 값이 return됨
			console.log(data);
			console.log(data.result);
			
			if(data.result >= 1){
				$('.resultNick').css("color","red").text("이미 사용중인 별명");
				isNickOk = false;
			}else{
				$('.resultNick').css("color","green").text("사용 가능한 별명");
				isNickOk = true;
			}
		}); // get end
	}); // nick 중복 체크 end 
	
	// 이메일 중복체크
	const email = document.getElementsByName('email')[0];
	email.onkeyup = function(){
		console.log("email test");
		
		// 입력 데이터 가져오기
		const email = this.value;
		console.log("email : " + email);
		
		// 정규식 검사
		if(!email.match(regexEmail)){
			resultEmail.innerText = "이메일 형식에 맞춰 입력해주세요.";
			resultEmail.style.color = "red";
			isEmailOk = false;
			return;
		}
		
		// 데이터 전송
		const xhr = new XMLHttpRequest();
		xhr.open("GET","/Jboard/user/checkEmail.jsp?eamil="+email);
		xhr.send();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200){
					const data = JSON.parse(xhr.response);
					console.log(data);
					
					const resultEmail = document.getElementsByClassName("resultEmail")[0];
					if(data.result >= 1){
						resultEmail.innerText = "이미 사용중인 이메일";
						resultEmail.style.color = "red";
						isEmailOk = false;
						// $('.resultEmail').css("color","red").text("이미 사용중인 이메일");
					}else{
						resultEmail.innerText = "사용 가능한 이메일";
						resultEmail.style.color = "green";
						isEmailOk = true; 
						// $('.resultEmail').css("color","green").text("사용 가능 이메일");
					}
				} // if status end
			} // if readyStatus end
		} // onready end
	} // onkeyup end
	
	// 휴대폰 중복 체크
	document.getElementsByName('hp')[0]
		.addEventListener("keyup", function(){
			console.log("hp test");
			
			// 둘중에 꼴리는거 아무거나 쓰면 됨
			// -> this : document.hp 이친구를 의미
			// const hp = this.value;
			const hp = $(this).val();			
			
			const resultHp = document.getElementsByClassName("resultHp")[0];
			if(!hp.match(regexHp)){
				resultHp.innerText = "'-'를 포함해서 13자 입력해주세요.";
				resultHp.style.color = "red";
				isHpOk = false;
				return;
			}
			
			const url = "/Jboard/user/checkHp.jsp?hp="+this.value;
			fetch(url)
				.then(response => response.json())
				.then(data => {
					console.log(data);
					
					if(data.result >= 1){
						resultHp.innerText = "이미 사용중인 번호";
						resultHp.style.color = "red";
						isHpOk = false;
						// $('.resultHp').css("color","red").text("이미 사용중인 번호");
					}else{
						resultHp.innerText = "사용 가능한 번호";
						resultHp.style.color = "green";
						isHpOk = true;
						// $('.resultHp').css("color","green").text("사용 가능 번호");
					} // if end
				}); // then end
		}); // keyup end
});