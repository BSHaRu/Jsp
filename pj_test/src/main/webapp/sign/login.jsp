<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<section>
	<form action="${path }/sign/loginCheck.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="uId" value="" />
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="pw" value=""  />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">로그인</button>
				</td>
			</tr>
			<tr>
				<td>
					<a href="">아이디 찾기</a> |
					<a href="">비밀번호 찾기</a> |
					<a href="${path }/sign/loginform.jsp">회원 가입</a>
				</td>
			</tr>
		</table>
	</form>
</section>

<%@ include file="/inc/footer.jsp" %>