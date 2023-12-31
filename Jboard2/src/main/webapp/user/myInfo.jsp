<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/user/header.jsp" %>
<main id="user">
    <section class="myInfo">
        <form action="/Jboard2/user/myInfo.do" method="post">
        	<input type="hidden" name="kind" value="MODIFY" />
        	<input type="hidden" name="uid" value="${sessUser.uid }" />
            <table border="1">
                <caption>회원정보 설정</caption>
                <tr>
                    <td>아이디</td>
                    <td>${sessUser.uid}</td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
                        <input type="password" name="pass1" required placeholder="비밀번호 입력"/>
                        <span class="passResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td>
                        <input type="password" name="pass2" required placeholder="비밀번호 입력 확인"/>
                        <button type="button" id="btnUpdatePass" class="btnUpdatePass">비밀번호 수정</button>
                    </td>
                </tr>
                <tr>
                    <td>회원가입날짜</td>
                    <td>${sessUser.regDate}</td>
                </tr>
            </table>

            <table border="1">
                <caption>개인정보 수정</caption>
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="name" required value="${sessUser.name }"/>
                        <span class="nameResult"></span>                     
                    </td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>
                        <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                        <input type="text" name="nick" value="${sessUser.nick }" required placeholder="별명 입력"/>
                        <button type="button" class="btnCheckNick">
                        	<img src="/Jboard2/img/chk_id.gif" alt="중복확인"/>
                        </button>
                        <span class="nickResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="email" name="email" value="${sessUser.email }" required placeholder="이메일 입력"/>
                        <span class="emailResult"></span>
                        <button type="button" id="btnEmailCode">
                       		<img src="/Jboard2/img/chk_auth.gif" alt="인증번호 받기"/>
                        </button>
                        <div class="auth">
                            <input type="text" name="auth" required placeholder="인증번호 입력"/>
                            <button type="button" id="btnEmailAuth">
                            	<img src="/Jboard2/img/chk_confirm.gif" alt="확인"/>
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td>
                        <input type="text" name="hp" value="${sessUser.hp }" required placeholder="휴대폰 입력"/>
                        <span class="hpResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text" name="zip" id="zip" readonly required value="${sessUser.zip }" placeholder="우편번호"/>
                        <button type="button">
                        	<img src="/Jboard2/img/chk_post.gif" alt="우편번호찾기"/>
                        </button>
                        <input type="text" name="addr1" id="addr1" value="${sessUser.addr1 }" placeholder="주소 검색"/>
                        <input type="text" name="addr2" id="addr2" value="${sessUser.addr2 }" required placeholder="상세주소 입력"/>
                    </td>
                </tr>
                <tr>
                    <td>회원탈퇴</td>
                    <td>
                        <button type="button" id="btnWithdraw" class="btnWithdraw">탈퇴하기</button>
                    </td>
                </tr>
            </table>

            <div>
                <a href="/Jboard2/user/login.do" class="btn btnCancel">취소</a>
                <input type="submit" value="회원수정" class="btn btnRegister"/>
            </div>

        </form>

    </section>
</main>
<%@ include file="/inc/user/footer.jsp" %>
<script src="/Jboard2/js/validation.js"></script>
<script src="/Jboard2/js/dupCheck.js"></script>
<script src="/Jboard2/js/checkCode.js"></script>

<script src="/Jboard2/js/myInfo.js"></script>

<!-- kakao API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Jboard2/js/zipCode.js"></script>