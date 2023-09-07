/**
 * 
 */
$(function(){
	
	let parent = $('#articleParent').val();
	let writer = $('#articleWriter').val();
/*	let cate = $('#articleCate').val();
	let group = $('#articleGroup').val();*/

	const url = "/FarmStory/comment/write.do";
	// let realPath = url+"?group="+group+"&cate="+cate+"no="+no; 
	const formComment = document.getElementById('formComment');
	const commentList = document.getElementsByClassName('commentList')[0];
	
	/* async - await로 비동기 처리
		- async : 함수 앞에 async를 붙여서 해당 함수는 비동기라고 알려줌
		- await : 비동기니깐 기다렸다가 나중에 실행
					그 나중이 언젠데????????????????????
	*/
	formComment.onsubmit = async (e) => {
		e.preventDefault();
		console.log("formComment start");

		let content = $('#commentContent').val();
		
		const paramData = new URLSearchParams({
			"parent" : parent,	
			"writer" : writer,
			"content" : content
		});
		console.log("paramData start");
		
		const response = await fetch(url, {
				method : "POST",
				body : paramData
		});
		console.log("데이터 서버 전송");
		
		const data = await response.json();
		console.log("서버 응답 data 수신");
		console.log(data);
		
		if(data != null){
			let article = "<article>";
			    article += "<span style='font-weight: bold;' class='nick'>"+data.nick+"</span>";
				article += "<span style='font-weight: lighter;' class='date'>"+data.regDate+"</span>";
				article += "<textarea readonly class='content' data-value='"+data.content+"'>"+data.content+"</textarea>";
				article += "<div>";
				article += "<a href='#' class='del' data-no='"+data.no+"'>삭제</a>";
				article += "<a href='#' class='cancel' data-no='"+data.no+"'>취소</a>";
				article += "<a href='#' class='modify' data-no='"+data.no+"'>수정</a>";
				article += "</div>";
				article += "</article>";
				
			/* insertAdjacentHTML : (position, text);
				- position :  삽입할 위치를 정함(4가지가 있음)
					* beforebegin : 선택한 요소의 이전 형제 요소에 삽입
					* afterbegin : 선택한 요소의 첫 번째 자식 요소에 삽입
					* beforeend : 선택한 요소의 마지막 자식에 삽입
					* afterend : 선택한 요소의 다음 형제 요소에 삽입
			*/
			commentList.insertAdjacentHTML('beforeend', article);
			alert("댓글 등록 성공");
		}else{
			alert("댓글 등록 실패");
		}
	};
	
	
	/*$('.btnWrite').click(function(e){
		e.preventDefault();
		console.log("댓글 쓰기");
		
		$.ajax({
			url : path + "/board/write.do",
			type : "post",
			data : {
				"content" : content,
				"parent" : parent,	
				"writer" : writer,	
				"cate" : cate,	
				"group" : group	
			},
			dataType : "",
			success : function(data){
				console.log(data);
				
				$('#commentContent').val("");
			}
		}); // ajax end
	}); // btnWrite click end*/

});