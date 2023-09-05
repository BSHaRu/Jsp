<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp"%>
<style>
	#user>img {
		display: block;
		margin: 20px auto;
	}
</style>
<!-- https://www.privacy.go.kr 여기서 약관 가져 오면 됨 -->
<div id="user">
	<section class="terms">
		<table border="1">
			<caption>사이트 이용약관</caption>
			<tr>
				<td><textarea class="textarea" readonly>${terms.terms }</textarea>
					<p>
						<label>
							<input type="checkbox" name="chk1" />동의합니다.
						</label>
					</p>
				</td>
			</tr>
		</table>
		<table border="1">
			<caption>개인정보 취급 방침</caption>
			<tr>
				<td><textarea class="textarea" readonly>${terms.privacy }</textarea>
					<p>
						<label>
							<input type="checkbox" name="chk2" />동의합니다.
						</label>
					</p>
				</td>
			</tr>
		</table>
		<div>
			<a href="${path }/user/login.do" class="btnCancel">취소</a> 
			<a href="#" class="btnNext">다음</a>
		</div>
	</section>
</div>
<%@ include file="/inc/footer.jsp"%>
<script>
	$(function(){
		$('.btnNext').click(function(e){
			e.preventDefault();
			console.log("click test");	
			
			const chk1 = $('input[name=chk1]').prop("checked");
			const chk2 = $('input[name=chk2]').prop("checked");
			
			if(!chk1){
				alert("이용 약관 동의 체크 하셈");
				return;
			}else if(!chk2){
				alert("개인 정보 동의 체크 하셈");
				return;
			}else{
				location.href = "/FarmStory/user/register.do";
			}
		});
	});
</script>