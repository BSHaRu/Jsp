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
								<td colspan="4">등록된 게시물이 없습니다.</td>
							</tr>
		           			</c:otherwise>
						</c:choose>
					</table>
				</article>
			
				<!-- 페이지 네비게이션 -->
				<div class="paging">
					<a href="list.do?group=&cate=&pg=1" 
						class="prev">&laquo;</a> 
					<a href="list.do?group=&cate=&pg=" 
						class="prev">이전</a> 
				
					<a href="list.do?group=&cate=&pg="
						class="num ">1</a> 
				
					<a href="list.do?group=&cate=&pg=" 
						class="next">다음</a> 
					<a href="list.do?group=&cate=>&pg=" 
						class="next">&raquo;</a>
				</div>
			
				<!-- 글쓰기 버튼 -->
				<a href="${path }/board/write.do?group=${group }&cate=${cate} " class="btnWrite">글쓰기</a>
			</section>
			<!-- 목록 end -->
		</article>
	</section>
</div>
<%@ include file="/inc/footer.jsp"%>