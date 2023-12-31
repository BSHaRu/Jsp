<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp"%>	
<section class="view">
	<h3>글보기</h3>
	<table>
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title" value="${article.title }" readonly />
			</td>
		</tr>
		<c:if test="${article.file >= 1 }">
			<tr>
				<td>첨부파일</td>
				<td>
					<a href="${path }/board/fileDownLoad.do?fno=${article.fileDto.fno}">${article.fileDto.oriName }</a> 
					<span>${article.fileDto.download }회 다운로드</span>
				</td>
			</tr>
		</c:if>
		<tr>
			<td>내용</td>
			<td>
				<textarea class="textarea" name="content" readonly>${article.content }</textarea>
			</td>
		</tr>
	</table>
	
	<!-- 게시판 삭제++ -->
	<div>
		<c:if test="${sessUser.uid eq article.writer }">
			<a href="${path }/board/delete.do?group=${group }&cate=${cate }&no=${article.no}" class="btnDelete">삭제</a> 
			<a href="${path }/board/modify.do?group=${group }&cate=${cate }&no=${article.no}" class="btnModify">수정</a> 
		</c:if>
		<a href="${path }/board/list.do?group=${group }&cate=${cate }" class="btnList">목록</a>
	</div>

	<!-- 댓글리스트++(댓글 카운트 작업, 수정, 삭제++) -->
	<section class="commentList">
		<h3>댓글목록</h3>
		<c:choose>
			<c:when test="${!empty content }">
				<c:forEach var="content" items="${contents }">
					<article class="comment">
						<form action="#" method="post">
							<span style="font-weight: bold;" class="nick">${content.nick }</span> 
							<span style="font-weight: lighter;" class="date">${content.regDate }</span>
							<textarea class="textarea" name="comment" readonly></textarea>
							<c:if test="${sessUser.uid eq article.writer }">
								<div>
									<a href="#" class="del" data-no="${comment.no}">삭제</a> 
									<a href="#" class="cancel" data-no="${comment.no}">취소</a> 
									<a href="#" class="modify" data-no="${comment.no}">수정</a>
								</div>
							</c:if>
						</form>
					</article>
				</c:forEach>
				<!-- for end -->
			</c:when>
			<c:otherwise>
				<p class="empty">등록된 댓글이 없습니다.</p>
			</c:otherwise>
		</c:choose>
	</section>
	<!-- commentList end -->

	<!-- 댓글입력폼 -->
	<section class="commentForm">
		<h3>댓글쓰기</h3>
		<form id="formComment" action="#" method="post">
			<input id="articleParent" type="hidden" name="parent" value="${article.no }" /> 
			<input id="articleWriter" type="hidden" name="writer" value="${sessUser.uid }" /> 
			<input id="articleCate" type="hidden" name="cate" value="${cate }" />
			<input id="articleGroup" type="hidden" name="group" value="${group }" />
			<textarea id="commentContent" class="textarea" name="content"></textarea>
			<div>
				<input type="reset" class="btnReset" value="취소" /> 
				<input type="submit" class="btnWrite" value="작성완료" />
			</div>
		</form>
	</section>
	<!-- commentForm end -->

</section>
<!-- view end -->

<%@ include file="/inc/footer.jsp"%>
<script src="/FarmStory/js/comment.js"></script>
<script>
	$(function() {
		$(".cancel").click(function(e) {
			e.preventDefault();
			location.reload();
		});
	});
</script>