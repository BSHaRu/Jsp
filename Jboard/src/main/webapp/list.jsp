<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/inc/header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	// page를 get으로 넘길꺼니깐 그 때 
	// pg값을 가져와서 해당 값을 사용 하기위해 정의
	String pg = request.getParameter("pg");

	// DAO 객체 생성
	ArticleDAO dao = new ArticleDAO();
	
	// 페이지 관련 변수
	int currentPage = 1;
	int pageCount = 10; // 한 page에 보여줄 게시물 수
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
	total = dao.selectCountTotal();
	
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
	
	// 현재 페이지 게시물 조회
	List<ArticleVO> artList 
		= dao.selectArticles(start, pageCount); 
%>

<main>
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
                <% for(ArticleVO article : artList){ %>
                <tr>
                	<!-- PM을 설정했기 때문에 no가 아니라 num으로 변경 
                		이렇게 하면 중간에 번호가 삭제되면 no값은 그대로지만,
                		num값은 게시물 숫자대로 유지됨
                	-->
                    <td><%=pageStartNum-- %></td>
                    <td>
                    	<!-- 특정 글을 읽기 위해서는 pk값으로 조회를 해야함 -->
                        <a href="/Jboard/view.jsp?no=<%=article.getNo() %>"><%=article.getTitle() %></a>
                        &nbsp;[<%=article.getComment() %>]
                    </td>
                    <!-- Writer -> nick으로 변경(Join통해서 추가) -->
                    <td><%=article.getNick() %></td>
                    <td><%=article.getRegDate() %></td>
                    <td><%=article.getHit() %></td>
                </tr>
                <%} %>
            </table>
        </article>

        <!-- 페이지 네비게이션 -->
        <div class="paging">
        	<% if(pageGroupStart > 1){ %>
            	<a href="/Jboard/list.jsp?pg=1" class="prev">처음으로</a>
            	<a href="/Jboard/list.jsp?pg=<%= pageGroupStart - 1 %>" class="prev">이전</a>
            <%} %>
            <% for(int i = pageGroupStart; i<=pageGroupEnd; i++){ %>
           		<a href="/Jboard/list.jsp?pg=<%= i %>" 
           			class="num <%=(currentPage == i)? "current" : "" %>"><%= i %></a>                
            <%} %>               
            <% if(pageGroupEnd < lastPageNum){ %> 
            	<a href="/Jboard/list.jsp?pg=<%= pageGroupEnd + 1 %>" class="next">다음</a>
            	<a href="/Jboard/list.jsp?pg=<%= lastPageNum %>" class="next">마지막으로</a>
            <%} %>
        </div>

        <!-- 글쓰기 버튼 -->
        <a href="/Jboard/write.jsp" class="btnWrite">글쓰기</a>
    </section>
</main>
<%@ include file="/inc/footer.jsp" %>
