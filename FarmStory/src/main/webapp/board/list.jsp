<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<c:import url="/inc/aside/${group }.jsp"/>
  			<!-- 게시판 목록 -->
			<section class="list">
				<h3>글목록</h3>
				<article>
					<table border="1">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th>조회</th>
						</tr>
						<c:choose>
							<c:when test="${!empty article }">
            					<c:forEach var="article" items="${article }">
								<tr>
									<td>${article.no }</td>
									<td>
										<a href="${path }/board/view.do?group=${group }&cate=${cate }&no=${article.no}">
										${article.title }
										</a>
										&nbsp;[${article.comment }]
									</td>
									<td>${article.nick }</td>
		                   			<td>${article.regDate }</td>
			               			<td>${article.hit }</td>
								</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
		           			<tr>
								<td colspan="5">등록된 게시물이 없습니다.</td>
							</tr>
		           			</c:otherwise>
						</c:choose>
					</table>
				</article>
			
				<!-- 페이지 네비게이션 -->
				<div class="paging">
				<c:if test="${pageGroupStart > 1}">
					<a href="list.do?group=${group }&cate=${cate }&pg=1" 
						class="prev">&laquo;</a> 
					<a href="list.do?group=${group }&cate=${cate }&pg=${pageGroupStart -1 }" 
						class="prev">이전</a>
				</c:if> 
				
				<c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
					<a href="list.do?group=${group }&cate=${cate }&pg=${i}"
						class="num ${currentPage == i? 'current' : 'off'}">${i }</a>
				</c:forEach> 
				
				<c:if test="${pageGroupEnd < lastPageNum}">
					<a href="list.do?group=${group }&cate=${cate }&pg=${pageGroupEnd +1 }" 
						class="next">다음</a> 
					<a href="list.do?group=${group }&cate=${cate }&pg=${lastPageNum }" 
						class="next">&raquo;</a>
				</c:if>
				</div>
			
				<!-- 글쓰기 버튼 -->
				<a href="${path }/board/write.do?group=${group }&cate=${cate} " class="btnWrite">글쓰기</a>
			</section>
			<!-- 목록 end -->
		</article>
	</section>
</div>
<%@ include file="/inc/footer.jsp"%>