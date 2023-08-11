<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>

<form action="${path }/sign/login.jsp" method="post">
	<table>
		<tr>
			<td colspan="2">
				<h1>회원가입</h1>
			</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="uId" autofocus required placeholder="아이디를 입력해주세요" />
				<button type="button" class="idCheck">중복 체크</button>
				<span class="result"></span>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="pw" required placeholder="비밀번호를 입력해주세요" />
				<span class="result"></span>
			</td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td>
				<input type="password" name="rePw" required placeholder="비밀번호를 입력해주세요" />
				<span class="result"></span>
			</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>
				<input type="text" name="uNick" required placeholder="닉네임을 입력해주세요" />
				<button type="button" class="nickCheck">중복 체크</button>
				<span class="result"></span>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="uName" required placeholder="이름을 입력해주세요" />
				<span class="result"></span>
			</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>
				<input type="text" name="uPhone" required placeholder="01012345678" />
				<!-- 인증코드 -> 중복 체크로 그냥 변경 하는게 편할 듯.. -->
				<button type="button" class="phoneCode">인증 코드 발송</button>
				<span class="result"></span>
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" name="uEmail" required placeholder="a@a.com" />
				<button type="button" class="emailCode">인증 코드 발송</button>
				<span class="result"></span>
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<input type="date" name="uDate" required />
				<span class="result"></span>
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<label>
					<input type="radio" name="gender" id="male" value="male" />남성
				</label>
				<label>
					<input type="radio" name="gender" id="female" value="female" />여성
				</label>
				<span class="result"></span>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="uAdder1" value="" placeholder="주소를 입력해주세요" />
				<input type="text" name="uAdder2" value="" />
				<input type="text" name="uAdder3" value="" placeholder="상세 주소를 입력해주세요" />
				<span class="result"></span>
			</td>
		</tr>
		<tr>
			<td>
				<button type="submit">회원 가입</button>
				<button type="button" class="btnCancel">취소</button>
			</td>
		</tr>
	</table>
</form>
<%@ include file="/inc/footer.jsp" %>
<script>
	$('.btnCancel').click(function(){
		console.log("btnCancel");
		history.go(-1);
	});
</script>