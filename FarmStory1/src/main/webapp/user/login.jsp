<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>    

<div id="user">
	<section class="login">
		<form action="/FarmStory1/user/loginProc.jsp" method="post">
			<table>
				<tr>
					<td><img alt="id" src="/FarmStory1/images/login_ico_id.png" class="icon">
					</td>
					<td><input type="text" name="uid" placeholder="아이디 입력" /></td>
				</tr>
				<tr>
					<td><img alt="pw" src="/FarmStory1/images/login_ico_pw.png" class="icon">
					</td>
					<td><input type="password" name="pass" placeholder="비밀번호 입력" />
					</td>
				</tr>
			</table>
			<input type="submit" value="로그인" class="btnLogin" />
		</form>
		
		<div>
			<h3>회원 로그인 안내</h3>
			<p>아직 회원이 아니시면 회원가입 ㄱㄱ</p>
			<a href="/FarmStory1/user/terms.jsp">회원가입</a>
		</div>
	</section>
</div>
<%@ include file="/inc/footer.jsp" %>         
</body>
</html>