/**
 * 
 */

 $(function(){
	// 댓글 삭제 (동적 생성 이벤트 구현) 
	// - 기근쌤 spring rest_comment 파트 보기 
	$(document).on("click", ".remove", function(e){
		e.preventDefault();
		console.log("remove click");
		
		// 사용자 정의 속성을 사용(위에 설명 되어있음)
		const no = $(this).data('no');
		console.log("data-no : " + no);
		
		$.ajax({
			url : "/Jboard2/delete.do",
			type : "post",
			data : { "no" : no },
			dataType : "json",
			success: function(data){
				console.log(data);
				if(data.result >= 1){
					alert("댓글이 삭제 되었습니다.");
					article.remove();
				}else{
					alert("댓글 삭제 실패");
				}
			}
		}); // ajax end
	}); // delete end
		
	//댓글 입력 
	$('#btnContent').click(function(e){
		e.preventDefault();
		console.log("btnContent click");
		
		const parent 
			= $('#formContent > input[name=parent]').val();
		const content 
			= $('#formContent > textarea[name=content]').val();
		const writer 
			= $('#formContent > input[name=writer]').val();
		
		$.ajax({
			url : "/Jboard2/view.do",
			type : "post",
			data : { 
				"parent" : parent,
				"content" : content,
				"writer" : writer
			},
			dataType : "json",
			success : function(data){
				console.log(data);
				
				if(data.result >= 1){
					alert("댓글 등록 성공");
					// 동적 화면 생성
					/* -> 기근쌤 spring 참조하자.. 
					const dt = new Date();
					const year = dt.getFullYear().substring(2,4);
					const month = dt.getMonth()+1;
					const date = dt.getDate();
					const now = year + "-" + month + "-" + date;
					
					const article = `<article>
										<span class="nick">${sessUser.nick}</span>
										<span class="date">23-09-01</span>
					                  	<p class="content">`+content+`</p>
					                  	<div>
					                  		<a href="#" class="remove">삭제</a>
					                  		<a href="#" class="modify">수정</a>
					                  	</div>
									</article>`;
									
					$('.commentList').append(article);
					*/				
					location.reload();
				}else{
					alert("댓글 등록 실패");
				} // if end
			}
		}); // ajax end
	}); // btnContent click end
});