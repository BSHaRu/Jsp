<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/board/header.jsp" %>
<main id="board">
    <section class="view">
        <table>
            <caption>글보기</caption>
            <tr>
                <th>제목</th>
                <td>
                	<input type="text" name="title" value="${article.title }" readonly/>
                </td>
            </tr>
            <c:if test="${article.file >= 1 }">
            <tr>
                <th>파일</th>
                <td>
                	<a href="/Jboard2/fileDownLoad.do?fno=${article.fileDto.fno }">${article.fileDto.oriName }</a>
                	&nbsp;<span>${article.fileDto.download }</span>회 다운로드
                </td>
            </tr>
            </c:if> 
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" readonly>${article.content }</textarea>
                </td>
            </tr>                    
        </table>
        
        <div>
        	<c:if test="${sessUser.uid eq article.writer}">
	            <a href="/Jboard2/delete.do?no=${article.no}" class="btn btnRemove">삭제</a>
	            <a href="./modify.do?no=${article.no}" class="btn btnModify">수정</a>
            </c:if>
            <a href="./list.do" class="btn btnList">목록</a>
        </div>

        <!-- 댓글목록 -->
        <section class="commentList">
            <h3>댓글목록</h3>
            <c:choose>
    			<c:when test="${!empty contents }">                   
					<c:forEach var="content" items="${contents }">
		              <article>
		                  <span class="nick">${content.nick }</span>
		                  <span class="date">${content.regDate }</span>
		                  <p class="content">${content.content }</p> 
		                  <c:if test="${sessUser.uid eq content.writer}">
			                  <div>
			                  	<!-- data-value 속성 
			                  		- 사용자 정의 속성으로 사용자가 임의로 속성을 추가해서 사용 
		                  		-->
			                      <a href="#" class="remove" data-no="${content.no }">삭제</a>
			                      <a href="#" class="modify">수정</a>
			                  </div>
		                  </c:if>
		              </article>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p class="empty">등록된 댓글이 없습니다.</p>
				</c:otherwise>
			</c:choose>
        </section>

        <!-- 댓글쓰기 -->
        <section class="commentForm">
            <h3>댓글쓰기</h3>
            <form id="formContent" action="#" method="post">
            	<input type="hidden" name="parent" value="${article.no }" />
            	<input type="hidden" name="writer" value="${sessUser.uid}" />
                <textarea name="content"></textarea>
                <div>
                    <input type="reset" class="btn btnCancel" value="취소" />
                    <input type="submit" id="btnContent" value="작성완료" class="btn btnComplete"/>
                </div>
            </form>
        </section>

    </section>
</main>
<%@ include file="/inc/board/footer.jsp" %>
<!-- <script src="/Jboard2/js/comment.js"></script> -->
<script>
	$(function(){
		
	});
</script>