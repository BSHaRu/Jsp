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
	<section class="register">
		<form id="formUser" action="${path}/user/register.do" method="post">
			<table border="1">
				<caption>사이트 이용정보 입력</caption>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="uid" required placeholder="아이디 입력" />
						<button type="button" id="btnCheckUid">
							<img src="${path}/images/chk_id.gif" alt="아이디 체크">
						</button> 
						<span class="resultId"></span>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="pass" required placeholder="비밀번호 입력" />
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td>
						<input type="password" name="rePass" required placeholder="비밀번호 확인 입력" /> 
						<span class="resultPass"></span>
					</td>
				</tr>
			</table>
			<table border="1">
				<caption>개인정보 입력</caption>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="name" required placeholder="이름 입력" /> 
						<span class="resultName"></span>
					</td>
				</tr>
				<tr>
					<td>별명</td>
					<td>
						<p>공백없이 한글, 영문, 숫자만 입력가능</p> 
						<input type="text" name="nick" required placeholder="별명 입력" /> 
						<span class="resultNick"></span>
					</td>
				</tr>
				<tr>
					<td>E-Mail</td>
					<td>
						<input type="email" name="email" required placeholder="이메일 입력" /> 
						<span class="resultEmail"></span>
					</td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td>
						<input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13" required /> 
						<span class="resultHp"></span>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<div>
							<input type="text" name="zip" placeholder="우편번호" readonly required />
							<button type="button" class="btnZip" onclick="zipCode()">
								<img src="${path}/images/chk_post.gif" alt="우편번호 체크">
							</button>
						</div>
						<div>
							<input type="text" name="addr1" placeholder="주소를 검색하세요." readonly />
						</div>
						<div>
							<input type="text" name="addr2" placeholder="상세주소를 입력하세요." required />
						</div>
					</td>
				</tr>
			</table>

			<div>
				<a href="${path}/index.jsp" class="btnCancel">취소</a> 
				<input type="submit" class="btnSubmit" value="회원가입" />
			</div>
		</form>
	</section>
</div>
<%@ include file="/inc/footer.jsp"%>
<script src="${path }/js/zipCode.js"></script>