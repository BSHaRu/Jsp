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
	
	
	// PM
	ArticleDAO dao = new ArticleDAO();
	//페이지 관련 변수
	int currentPage = 1;
	int pageCount = 5; // 한 page에 보여줄 게시물 수
	int start = 0;	// pageCount만큼 검색할 시작 index번호
	
	int total = 0;
	int lastPageNum = 0; // maxPage
	
	int pageGroupCurrent = 1; 
	int pageGroupStart = 1;
	int pageGroupEnd = 0; // endPage
	
	int pageStartNum = 0;
		
	// 현재 페이지 계산
	if(pg != null){
		currentPage = Integer.parseInt(pg);
	}
	// Limit 시작값 계산
	start = (currentPage - 1) * pageCount; 
	
	// 전체 게시물 갯수 조회
	total = dao.selectCountTotal(cate);
	
	// 페이지 번호 계산
	if(total % pageCount == 0){
		lastPageNum = (total / pageCount);
	}else{
		lastPageNum = (total / pageCount) + 1;
	}
	
	// 페이지 그룹 계산
	pageGroupCurrent 
		= (int) Math.ceil(currentPage / (double)pageCount);
	pageGroupStart 
		= (pageGroupCurrent - 1) * pageCount + 1;
	pageGroupEnd
		= pageGroupCurrent * pageCount;
	// 마지막 페이지 보여주는거
	if(pageGroupEnd > lastPageNum){
		pageGroupEnd = lastPageNum;
	}
	
	// 시작 번호 계산
	pageStartNum = total - start;

	List<ArticleDTO> artList 
		= dao.selectPM(cate, start, pageCount);
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
							<td><%=pageStartNum-- %></td>
							<td>
								<!-- 특정 글을 읽기 위해서는 pk값으로 조회를 해야함 --> 
								<a href="view.jsp?group=<%= group %>&cate=<%= cate %>&no=<%= article.getNo() %>">
									<%=article.getTitle() %>
								</a>
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
				<% if(pageGroupStart > 1){ %>
					<a href="list.jsp?group=<%= group %>&cate=<%= cate %>&pg=1" 
						class="prev">&lt;&lt;</a> 
					<a href="list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= pageGroupStart - 1 %>" 
						class="prev">이전</a> 
				<% } %>
				
				<% for(int i = pageGroupStart; i<=pageGroupEnd; i++){ %>	
					<a href="list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= i %>"
						class="num <%=(currentPage == i)? "current" : ""%>"><%= i %></a> 
				<% } %>
				
				<% if(pageGroupEnd < lastPageNum){ %>
					<a href="list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= pageGroupEnd + 1 %>" 
						class="next">다음</a> 
					<a href="list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= lastPageNum %>" 
						class="next">&gt;&gt;</a>
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