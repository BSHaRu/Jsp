/**
 * 
 */

$(function(){
	 const inputUid = document.getElementsByName('uid')[0];
	 const inputPass = document.getElementsByName('pass2')[0];
	 
	 // 비밀번호 변경
	 const btnUpdatePass = document.getElementById("btnUpdatePass");
	 btnUpdatePass.addEventListener("click", function(){
		 
		 if(isPassOk && confirm("비밀번호를 수정 하시겠습니까?")){
			 
			 /* formData 객체 전송 안되는 이유를 안 알려줌..
			 const formData = new FormData();
			 formData.append("kind", "PASSWORD");
			 formData.append("uid", inputUid.value);
			 formData.append("pass", inputPass.value);
			 */
			
			// fetch에서 post 데이터 전송을 위해 URLSearchParams 사용
			const params = new URLSearchParams();
			formData.append("kind", "PASSWORD");
			formData.append("uid", inputUid.value);
			formData.append("pass", inputPass.value);

			fetch("/Jboard2/user/myInfo.do",{
				 method : "POST",
				 body: params
				})
				.then((response) => response.json())
				.then((data) => {
					console.log(data);
					
				});
		 }else{
			 alert("비밀번호가 유효하지 않습니다.");
		 }
	 });
	 
	// 회원 탈퇴
	$('#btnWithdraw').click(function(){
		console.log("탈퇴 click");
		 
		if(confirm("정말 탈퇴 하시겠습니까?")){
			const jsonData = {
				 "kind" : "WITHDRAW",
				 "uid" : inputUid.value
			 };
			 console.log(jsonData);
			 
			 $.ajax({
				url : "/Jboard2/user/myInfo.do",
				type : "post",
				data : jsonData,
				dataType : "json",
				success : function(data){
					console.log("1234");
					console.log(data);
					if(data.result >= 1){
						console.log(data.result);
						alert("회원 탈퇴 처리가 완료 되었습니다.");
						// 회원탈퇴를 해도 세션이 남아 있기 때문에 로그아웃으로 보내는거임
						location.href = "/Jboard2/user/logout.do";
					}else{
						console.log("8888");
					}
				},
				error : function(e){
					console.log(e);
					console.log("이거 왜 찍히냐?");
				} 
			 }); // ajax end
		} // if end		 
	 });
});