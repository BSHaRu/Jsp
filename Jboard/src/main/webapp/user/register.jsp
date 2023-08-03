<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>Jboard :: register</title>
    
    <link rel="stylesheet" href="/Jboard/css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <h3>Board System ver 1.0</h3>
        </header>

        <main>
            <section class="register">
                <form id="formUser" action="/Jboard/user/registerProc.jsp" method="post">
                    <table border="1">
                        <caption>사이트 이용정보 입력</caption>
                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" name="uid" placeholder="아이디 입력"/>
                                <button type="button" id ="btnCheckUid">
                                    <img src="/Jboard/img/id_check.png" alt="아이디 체크" class="icon">
                                </button>
                                <span class="resultId"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type="password" name="pass1" placeholder="비밀번호 입력"/>                            
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td>
                                <input type="password" name="pass2" placeholder="비밀번호 확인 입력"/>
                                <span class="resultPass"></span>
                            </td>
                        </tr>
                    </table>
                    <table border="1">
                        <caption>개인정보 입력</caption>
                        <tr>
                            <td>이름</td>
                            <td>
                                <input type="text" name="name" placeholder="이름 입력"/>                            
                                <span class="resultName"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>별명</td>
                            <td>
                                <p>공백없이 한글, 영문, 숫자만 입력가능</p>
                                <input type="text" name="nick" placeholder="별명 입력"/>
                                <span class="resultNick"></span>                            
                            </td>
                        </tr>
                        <tr>
                            <td>E-Mail</td>
                            <td>
                                <input type="email" name="email" placeholder="이메일 입력"/>
                                <span class="resultEmail"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td>
                                <input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13" />
                                <span class="resultHp"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <div>
                                    <input type="text" name="zip" placeholder="우편번호" readonly/>                                
                                    <button type="button" class="btnZip" onclick="zipCode()">
                                        <img src="/Jboard/img/addr_check.png" alt="우편번호 체크" class="icon">
                                    </button>
                                </div>                            
                                <div>
                                    <input type="text" name="addr1" placeholder="주소를 검색하세요." readonly/>
                                </div>
                                <div>
                                    <input type="text" name="addr2" placeholder="상세주소를 입력하세요."/>
                                </div>
                            </td>
                        </tr>
                    </table>
    
                    <div>
                        <a href="#" class="btnCancel">취소</a>
                        <input type="submit" class="btnSubmit" value="회원가입"/>
                    </div>    
                </form>
            </section>
        </main>

        <footer>
            <p>ⓒcopyright Haru.com</p>
        </footer>
    </div>
    
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script src="/Jboard/js/zipCode.js"></script>
	<script>
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
							
				alert("회원가입 축하드립니다!");
			});
		});
	</script>
	<script src ="/Jboard/js/checkUser.js"></script>
</body>
</html>

