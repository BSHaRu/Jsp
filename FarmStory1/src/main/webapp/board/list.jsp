<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String group = request.getParameter("group");
	// 이건 따로 할 필요없었지만(aside에서 이미 날리고 있기때문에)
	// 글쓰기 할 때 cate가 필요해서 추가된거임
	String cate = request.getParameter("cate");
	String pg = request.getParameter("pg");
	
	//pageContext.include("/inc/aside/event.jsp");
	// 여기서 어떻게 group을 가져 온다고 이걸 인식하고 바꿔주지?
	// -> header에서 우리는 이렇게 파라미터값으로 같이 날려주니깐
	// 여기서 group을 파라미터로 가져오면 알아서 해당 값을 인식함
	pageContext.include("/inc/aside/"+group+".jsp");
	
	ArticleDTO dto = new ArticleDTO();
	ArticleDAO dao = new ArticleDAO();

	PageMaker pm = new PageMaker();
	
	List<ArticleDTO> artList 
		= dao.selectPM(cate);
	
%>  

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
						<% for(ArticleDTO article : artList){ %>
						<tr>
							<td><%=pm.getCri() %></td>
							<td>
								<!-- 특정 글을 읽기 위해서는 pk값으로 조회를 해야함 --> 
								<a href="view.jsp?group=<%= group %>&cate=<%= cate %>"><%=article.getTitle() %></a>
								&nbsp;[<%=article.getComment() %>]
							</td>
							<!-- Writer -> nick으로 변경(Join통해서 추가) -->
							<td><%=article.getNick() %></td>
                   			<td><%=article.getRegDate() %></td>
                    		<td><%=article.getHit() %></td>
						</tr>
						<% } %>
					</table>
				</article>
			
				<!-- 페이지 네비게이션 -->
				<div class="paging">
				<% if(pm.getStartPage() != 1){ %>
					<a href="#" class="prev">&lt;&lt;</a> 
					<a href="#" class="prev">이전</a> 
				<% } %>
				
				<% for(int i =pm.getStartPage(); i <= pm.getEndPage(); i++){ %>	
					<a href="#" class="num">1</a> 
				<% } %>
				
				<% if(pm.getEndPage() < pm.getMaxPage()){ %>
					<a href="#" class="next">다음</a> 
					<a href="#" class="next">&gt;&gt;</a>
				<% } %>
				</div>
			
				<!-- 글쓰기 버튼 -->
				<a href="write.jsp?group=<%= group %>&cate=<%= cate %>" class="btnWrite">글쓰기</a>
			</section>
			<!-- 목록 end -->
		</article>
	</section>
</div>
<%@ include file="/inc/footer.jsp"%>