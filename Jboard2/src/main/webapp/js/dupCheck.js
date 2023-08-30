/**
 * 중복 체크
 */
$(function(){
	// id 중복 체크
	$(".btnCheckId").click(function(){
		console.log("check");
		const uid = $("input[name=uid]").val();
		
		// uid가 정규식에 해당 되지 않으면 돌려보냄
		if(!uid.match(regexID)){
			$('.uidResult').css('color',"red").text("영어와 숫자를 조합하여 공백을 제외한 4글자~12글자 사이로 입력해주세요");
			isUidOk = false;
			return;
		}		
		
		const jsonData = {
				"uid" : uid
		};
		console.log(jsonData);
		
		$.ajax({
			url : "/Jboard2/user/checkUid.do",
			type : "GET",
			data : jsonData,
			dataType : "JSON",
			success : function(data){
				console.log("id check");
				if(data.result >= 1){
					$('.uidResult').css('color',"red").text("이미 사용중인 아이디 입니다.");
					isUidOk = false;
				}else{								
					$('.uidResult').css('color',"green").text("사용 가능한 아이디 입니다.");
					isUidOk = true;
				}
			}
		}); // ajax end
	}); // check click end
	
	// nick 중복 체크
	$('.btnCheckNick').click(function(){
		console.log("Nick click");
		const nick = $("input[name=nick]").val();
		
		const jsonData = {
				"nick" : nick
		};
		console.log(jsonData);
		
		$.ajax({
			url : "/Jboard2/user/checkNick.do",
			type : "get",
			data : jsonData,
			dataType : "JSON",
			success : function(data){
				console.log(data);
				if(data.result >= 1){
					$('.nickResult').css('color',"red").text("이미 사용중인 닉네임 입니다.");
					isNickOk = false;
				}else{
					$('.nickResult').css('color',"green").text("사용 가능한 닉네임 입니다.");
					isNickOk = true;
				}
			}
		}); // ajax end
	}); // nick click end 
	
	// email 중복 체크
	$('#btnEmailCode').click(function(){
		console.log("email click");
		const email = $('input[name=email]').val();
		
		const jsonData = {
			"email" : email
		};
		console.log(jsonData);
		
		$.ajax({
			url : "/Jboard2/user/checkEmail.do",
			type : "get",
			data : jsonData,
			dataType : "json",
			success : function(data){
				console.log(data);
				if(data.result >= 1){
					$('.emailResult').css('color',"red").text("이미 등록된 이메일입니다.");
					$("#btnEmailCode").attr('disabled', false);
					isHpOk = false;
				}else{
					$('.emailResult').text("");
					$("#btnEmailCode").attr('disabled', true);
				}
			}
		}); // ajax end
	}); // email check end
	
	// hp 중복 체크
	$('input[name=hp]').keyup(function(){
		console.log("hp keyup");
		const hp = $(this).val();
		
		const jsonData = {
			"hp" : hp
		};
		console.log(jsonData);
		
		$.get("/Jboard2/user/checkHp.do", jsonData, function(result){
			// 여기서는 JSON 타입임을 명시 해줘야 됨
			// -> 따로 명시 안해주면 result값은 문자열상태.
			const data = JSON.parse(result);
			console.log(data);
			if(data.result >= 1){
				$('.hpResult').css('color',"red").text("이미 등록된 번호입니다.");
				isHpOk = false;
			}else{
				$('.hpResult').text("");
				isHpOk = true;
			}
		}); // ajax end
	}); // hp keyup end
});