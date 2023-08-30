<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/user/header.jsp" %>
<main id="user">
    <section class="find findPassChange">
        <form action="/Jboard2/user/findPassChange.do" method="post">
            <table>
                <caption>비밀번호 변경</caption>                        
                <tr>
                    <td>아이디</td>
                    <td>${uid }</td>
                </tr>
                <tr>
                    <td>새 비밀번호</td>
                    <td>
                        <input type="email" name="pass1" placeholder="새 비밀번호 입력"/>
                    </td>
                </tr>
                <tr>
                    <td>새 비밀번호 확인</td>
                    <td>
                        <input type="email" name="pass2" placeholder="새 비밀번호 입력 확인"/>
                        <span class="passResult"></span>
                    </td>
                </tr>
            </table>                                        
        </form>
        
        <p>
            비밀번호를 변경해 주세요.<br>
            숫자, 영문 혼합하여 6자리 이상 입력해주세요.                   
        </p>

        <div>
            <a href="/Jboard2/user/login.do" class="btn btnCancel">취소</a>
            <a href="#" class="btn btnNext">다음</a>
        </div>
    </section>
</main>
<%@ include file="/inc/user/footer.jsp" %>
<script src="/Jboard2/js/validation.js"></script>