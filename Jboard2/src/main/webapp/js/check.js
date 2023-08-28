/**
 * 중복 체크
 */
$(function(){
	// id 중복 체크
	$(".btnCheckId").click(function(){
		console.log("check");
		const uid = $("input[name=uid]").val();
		
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
				}else{
					$('.uidResult').css('color',"green").text("사용 가능한 아이디 입니다.");
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
				}else{
					$('.nickResult').css('color',"green").text("사용 가능한 닉네임 입니다.");
				}
			}
		}); // ajax end
	}); // nick click end 
	
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
			if(data.result >= 1)
				$('.hpResult').css('color',"red").text("이미 등록된 번호입니다.");
		}); // ajax end
	}); // hp keyup end
});