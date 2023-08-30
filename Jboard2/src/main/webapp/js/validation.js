/**
 * 유효성 검사
 */

// form data 검증 결과 상태 변수
let isUidOk = false;
let isPassOk = false;
let isNameOk = false;
let isNickOk = false;
let isEmailOk = false;
let isHpOk = false;
let isZipOk = false;

// 정규식
const regexID = /^[0-9a-zA-Z]{4,12}$/;
const regexPass = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
const regexName = /^[\uac00-\ud7a3]{2,6}$/;
const regexNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
const regexPhone = /^[0-9]{3,4}[0-9]{4}$/;	
const regexHp = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;	
const regexEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

$(function(){
	// pw 검사
	$('input[name=pass2]').focusout(function(){
		const pass1 = $('input[name=pass1]').val();
		const pass2 = $('input[name=pass2]').val();
		
		if(pass1 == pass2){
			if(pass1.match(regexPass)){
				$('.passResult').text("");
				isPassOk = true;
			}else{
				$('.passResult').css('color',"red").text("숫자, 영문 혼합하여 6자리 이상 입력해주세요.");
				isPassOk = false;
			}
		}else{
			$('.passResult').css('color',"red").text("비밀번호가 일치하지 않습니다.");	
			isPassOk = false;
		}
	});
	
	// name 검사
	$('input[name=name]').focusout(function(){
		const name = $(this).val();
		
		if(name.match(regexName)){
			$('.nameResult').text("");
			isNameOk = true;
		}else{
			$('.nameResult').css('color', 'red').text('공백없이 한글로 입력해주세요.');
			isNameOk = false;
		}
	});
	
	// email 검사
	$('input[name=email]').focusout(function(){
		const email = $(this).val();
		
		if(!email.match(regexEmail)){
			$('.emailResult').css('color', 'red').text('이메일 양식에 맞게 입력해 주세요');
			isEmailOk = false;
		}
	});
	
	// 최종 확인
	$('#formUser').submit(function(){
		console.log("submit");
		
		if(!isUidOk){
			alert("아이디 중복 체크를 확인해 주세요");
			$('input[name=uid]').focus();
			return false;
		}
		
		if(!isPassOk){
			alert("비밀번호를 확인해 주세요");
			$('input[name=pass1]').focus();
			return false;
		}
		
		if(!isNameOk){
			alert("이름을 확인해 주세요");
			$('input[name=name]').focus();
			return false;
		}
		
		if(!isNickOk){
			alert("닉네임을 확인해 주세요");
			$('input[name=nick]').focus();
			return false;
		}
		
		if(!isEmailOk){
			alert("이메일 인증코드를 확인해 주세요");
			$('input[name=email]').focus();
			return false; 
		}
		
		if(!isHpOk){
			alert("연락처를 확인해 주세요");
			$('input[name=hp]').focus();
			return false; 
		}
		if(!isZipOk){
			alert("주소를 입력해 주세요");
			return false; 
		}
		
		/*console.log("isEmailOk : " + isEmailOk);
		console.log("isZipOk : " + isZipOk);
		console.log("isAddr1Ok : " + isAddr1Ok);
		console.log("isAddr2Ok : " + isAddr2Ok);
		
		alert("회원가입 축하드립니다!");*/
		return true;
	});
});