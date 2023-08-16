<%@page import="dao.UserDAO"%>
<%@page import="dto.TermsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp"%>
<%
	TermsDTO dto 
		= UserDAO.getInstansce().selectTerms();
%>
<div id="user">
	<section class="terms">
		<table border="1">
			<caption>사이트 이용약관</caption>
			<tr>
				<td><textarea class="textarea" readonly><%= dto.getTerms() %></textarea>
					<p>
						<label> <input type="checkbox" name="chk1" />동의합니다.</label>
					</p>
				</td>
			</tr>
		</table>
		<table border="1">
			<caption>개인정보 취급 방침</caption>
			<tr>
				<td><textarea class="textarea" readonly><%= dto.getPrivacy() %></textarea>
					<p>
						<label> <input type="checkbox" name="chk2" />동의합니다.</label>
					</p>
				</td>
			</tr>
		</table>
		<div>
			<a href="/FarmStory1/user/login.jsp" class="btnCancel">취소</a> 
			<a href="#" class="btnNext">다음</a>
		</div>
	</section>
</div>
<%@ include file="/inc/footer.jsp"%>
<script>
	$(function(){
		const chk1 = document.getElementsByName('chk1')[0];
		const chk2 = document.getElementsByName('chk2')[0];
		
		const btnNext = document.querySelector('.btnNext');
		btnNext.addEventListener("click", function(e){
			console.log("click test");			
			e.preventDefault();
			
			if(!chk1.checked){
				alert("이용 약관 동의 체크 하셈");
				return;
			}else if(!chk2.checked){
				alert("개인 정보 동의 체크 하셈");
				return;
			}else{
				location.href = "/FarmStory1/user/register.jsp";
			}
		});
	});
</script>
</body>
</html>