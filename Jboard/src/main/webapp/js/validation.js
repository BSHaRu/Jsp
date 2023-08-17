/**
 *  유효성 검사
 */

// form data 검증 결과 상태 변수
let isUidOk = false;
let isPassOk = false;
let isNameOk = false;
let isNickOk = false;
let isEmailOk = false;
let isHpOk = false;

// 정규식
var regexID = /^[0-9a-zA-Z]{4,12}$/;
var regexPass = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
var regexName = /^[\uac00-\ud7a3]{2,6}$/;
var regexNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
var regexPhone = /^[0-9]{3,4}[0-9]{4}$/;	
var regexHp = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;	
var regexEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

// 유효성 검사(Validation)
$(function(){
	// pw
	$("input[name=pass2]").focusout(function(){
		
		const pass1 = $('input[name=pass1]').val();
		const pass2 = $('input[name=pass2]').val();
		
		if(pass1 === pass2){
			if(pass1.match(regexPass)){
				$('.resultPass').css('color',"green").text("사용 가능한 비밀번호입니다.");
				isPassOk = true;
			}else{
				$('.resultPass').css('color',"red").text("숫자, 영문 혼합하여 6자리 이상 입니다.");
				isPassOk = false;
			}
			
		}else{
			$('.resultPass').css('color',"red").text("비밀번호가 일치하지 않습니다.");	
			isPassOk = false;
		}
	});
	
	// name
	$('input[name=name]').keyup(function(){
		const name = $(this).val();
		console.log(name);
		
		if(!name.match(regexName)){
			$('.resultName').css('color',"red").text("한글로 2~6글자 이내로 작성하세요.");
			isNameOk = false;
		}else{
			$('.resultName').text("");
			isNameOk = true;
		}
	});
	
	// 최종 전송
	$('#formUser').submit(function(e){
		// id x
		if(!isUidOk) return false;
		// pw x
		if(!isPassOk) return false;
		// name x
		if(!isNameOk) return false;
		// nick x
		if(!isNickOk) return false;
		// email x
		if(!isEmailOk) return false;
		// hp x
		if(!isHpOk) return false;
		
		/*console.log(!isUidOk);
		console.log(!isPassOk);
		console.log(!isNameOk);
		console.log(!isNickOk);
		console.log(!isEmailOk);
		console.log(!isHpOk);*/
		true;			
		alert("회원가입 축하드립니다!");
	});
});