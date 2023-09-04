<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="view">
	<h3>글보기</h3>
	<table>
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title" value="" readonly />
			</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<a href="#">2020년 상반기 매출자료.xls</a> 
				<span>7회 다운로드</span>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea class="textarea" name="content" readonly></textarea>
			</td>
		</tr>
	</table>
	<!-- 게시판 삭제++ -->
	<div>
		<a href="#" class="btnDelete">삭제</a> 
		<a href="modify.jsp?group=&cate=&no=" class="btnModify">수정</a> 
		<a href="list.jsp?group=&cate=" class="btnList">목록</a>
	</div>

	<!-- 댓글리스트++(댓글 카운트 작업, 수정, 삭제++) -->
	<section class="commentList">
		<h3>댓글목록</h3>
		<article class="comment">
			<form action="#" method="post">
				<input type="hidden" name="no" value="" /> 
				<input type="hidden" name="parent" value="" /> 
				<span> 
					<span style="font-weight: bold;"></span> 
					<span style="font-weight: lighter;"></span>
				</span>
				<textarea class="textarea" name="comment" readonly></textarea>
				<div>
					<a href="#" class="del">삭제</a> 
					<a href="#" class="cancel">취소</a> 
					<a href="#" class="modify">수정</a>
				</div>
			</form>
		</article>
		<!-- for end -->

		<p class="empty">등록된 댓글이 없습니다.</p>
	</section>
	<!-- commentList end -->

	<!-- 댓글입력폼 -->
	<section class="commentForm">
		<h3>댓글쓰기</h3>
		<form action="/FarmStory1/board/proc/contentProc.jsp" method="post">
			<input type="hidden" name="parent" value="" /> 
			<input type="hidden" name="writer" value="" /> 
			<input type="hidden" name="cate" value="" />
			<input type="hidden" name="group" value="" />
			<textarea class="textarea" name="content"></textarea>
			<div>
				<input type="reset" class="btnReset" value="취소" /> 
				<input type="submit" class="btnWrite" value="작성완료" />
			</div>
		</form>
	</section>
	<!-- commentForm end -->

</section>
<!-- view end -->

		</article>
	</section>
</div>
<%@ include file="/inc/footer.jsp"%>
<script>
	$(function() {
		$(".cancel").click(function(e) {
			e.preventDefault();
			location.reload();
		});

	});
</script>