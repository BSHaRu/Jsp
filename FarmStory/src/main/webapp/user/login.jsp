<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp"%>
<style>
	#user>img {
		display: block;
		margin: 20px auto;
	}
</style>

<div id="user">
	<section class="login">
		<form action="${path}/user/login.do" method="post">
			<table>
				<tr>
					<td>
						<img alt="id" src="${path}/images/login_ico_id.png" class="icon">
					</td>
					<td>
						<input type="text" name="uid" placeholder="아이디 입력" />
					</td>
				</tr>
				<tr>
					<td>
						<img alt="pw" src="${path}/images/login_ico_pw.png" class="icon">
					</td>
					<td>
						<input type="password" name="pass" placeholder="비밀번호 입력" />
					</td>
				</tr>
			</table>
			<input type="submit" value="로그인" class="btnLogin" />
		</form>
		
		<div>
			<h3>회원 로그인 안내</h3>
			<p>아직 회원이 아니시면 회원가입 ㄱㄱ</p>
			<a href="${path}/user/terms.do">회원가입</a>
		</div>
	</section>
</div>
<%@ include file="/inc/footer.jsp"%>
