/**
 * 
 */
// 이메일 인증
let receiveCode = 0;

$(function(){
	$("#btnEmailCode").click(function(){
		alert("이메일을 확인 후 코드를 입력해 주세요.");
		const email = $('input[name=email]').val();
		
		console.log("btnEmailCode click");
		$("#btnEmailCode").attr('disabled', true);
		
		const jsonData = {
			"email" : email
		};
		
		$.ajax({
			url : "/Jboard2/user/EmailCode.do",
			type : "get",
			data : jsonData,
			dataType : "JSON",
			success : function(data){
				console.log(data.code);
				receiveCode = data.code;
				
				$('.auth').show();
			}
		}); // ajax end
	}); // btnEmailCode end

	// 인증코드 발송 후 email을 건들면 다시 인증 코드 버튼 활성화
	$('input[name=email]').keyup(function(){
		$("#btnEmailCode").attr('disabled', false);
		receiveCode = "";
		$('.auth').hide();
	});
	
	$("#btnEmailAuth").click(function(){
		const code = $('input[name=auth]').val();
		
		if(receiveCode == code){
			alert("이메일 인증 되었습니다.");
			$('.auth').hide();
			$('input[name=email]').attr('readonly', true);
		}else{
			alert("이메일 인증 실패하였습니다.");
			$('input[name=auth]').val("");
			$('input[name=auth]').focus();
		} // if end
		
		const jsonData ={
			"code" : code	
		};
		
		$.ajax({
			url : "/Jboard2/user/EmailCode.do",
			type : "post",
			data : jsonData,
			dataType : "JSON",
			success : function(data){
				console.log(data);
				if(data.result >= 1)
					$('.emailResult').css('color',"red").text("인증 코드가 다릅니다. 다시 확인해주세요");
			}
		}); // ajax end
	}); // btnEmailAuth click end
}); // onload end