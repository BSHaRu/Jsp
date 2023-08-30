<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/user/header.jsp" %>
<main id="user">
    <section class="register">
        <form id="formUser" action="/Jboard2/user/register.do" method="post">
        	<input type="hidden" name="type" value="register">
            <table border="1">
                <caption>사이트 이용정보 입력</caption>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="uid" autofocus required placeholder="아이디 입력"/>
                        <button type="button" class="btnCheckId">
                        	<img src="/Jboard2/img/chk_id.gif" alt="중복확인"/>
                        </button>
                        <span class="uidResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
                   		<input type="password" name="pass1" required placeholder="비밀번호 입력"/>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td>
                    	<input type="password" name="pass2" required placeholder="비밀번호 입력 확인"/>
                    	<span class="passResult"></span>
                    </td>
                </tr>
            </table>

            <table border="1">
                <caption>개인정보 입력</caption>
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="name" required placeholder="이름 입력"/>
                        <span class="nameResult"></span>                        
                    </td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>
                        <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                        <input type="text" name="nick" required placeholder="별명 입력"/>
                        <button type="button" class="btnCheckNick">
                        	<img src="/Jboard2/img/chk_id.gif" alt="중복확인"/>
                        </button>
                        <span class="nickResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="email" name="email" required placeholder="이메일 입력"/>
                        <button type="button" id="btnEmailCode">
                        	<img src="/Jboard2/img/chk_auth.gif" alt="인증번호 받기"/>
                            <span class="emailResult"></span>
                        </button>
                        <div class="auth">
                            <input type="text" name="auth" placeholder="인증번호 입력"/>
                            <button type="button" id="btnEmailAuth">
                            	<img src="/Jboard2/img/chk_confirm.gif" alt="확인"/>
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td>
                    	<input type="text" name="hp" required placeholder="휴대폰 입력"/>
                    	<span class="hpResult"></span>
                   	</td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text" name="zip" required readonly placeholder="우편번호"/>
                        <button type="button" class="btnZip" onclick="zipCode()">
                        	<img src="/Jboard2/img/chk_post.gif" alt="우편번호찾기"/>
                        </button>
                        <input type="text" name="addr1" placeholder="주소 검색"/>
                        <input type="text" name="addr2" required placeholder="상세주소 입력"/>
                    </td>
                </tr>
            </table>

            <div>
                <a href="/Jboard2/user/login.do" class="btn btnCancel">취소</a>
                <input type="submit" value="회원가입" class="btn btnRegister"/>
            </div>
        </form>
    </section>
</main>
<%@ include file="/inc/user/footer.jsp" %>
<!-- 내부 JS -->
<script src="/Jboard2/js/validation.js"></script>
<script src="/Jboard2/js/dupCheck.js"></script>
<script src="/Jboard2/js/checkCode.js"></script>

<!-- kakao API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Jboard2/js/zipCode.js"></script>