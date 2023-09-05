<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<section class="write">
	<h3>글쓰기</h3>
	<article>
		<form action="${path }/board/write.do" method="post" 
				enctype="multipart/form-data">
			<input type="hidden" name="writer" value="${sessUser.uid }" />
			<input type="hidden" name="group" value="${group }" />
			<input type="hidden" name="cate" value="${cate }" />
			<table>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="title" value="${article.title }" required placeholder="제목을 입력하세요." />
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea class="textarea" required name="content">${article.content }</textarea>
					</td>
				</tr>
				<tr>
					<td>첨부</td>
					<td>
						<input type="file" name="file" value="${article.file }" />
					</td>
				</tr>
			</table>
			<div>
				<a href="#" class="btnCancel">취소</a> 
				<input type="submit" class="btnWrite" value="작성완료">
			</div>
		</form>
	</article>
</section>
<!-- write end -->
<%@ include file="/inc/footer.jsp"%>
