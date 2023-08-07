<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/inc/header.jsp" %>
<%
	ArticleDAO ado = new ArticleDAO();
	List<ArticleVO> artList = ado.selectArticles(); 
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
                    <td><%=article.getNo() %></td>
                    <td>
                        <a href="#"><%=article.getTitle() %></a>&nbsp;[<%=article.getComment() %>]
                    </td>
                    <td><%=article.getWriter() %></td>
                    <td><%=article.getRegDate() %></td>
                    <td><%=article.getHit() %></td>
                </tr>
                <%} %>
            </table>
        </article>

        <!-- 페이지 네비게이션 -->
        <div class="paging">
            <a href="#" class="prev">이전</a>
            <a href="#" class="num current">1</a>                
            <a href="#" class="num">2</a>                
            <a href="#" class="num">3</a>                
            <a href="#" class="next">다음</a>
        </div>

        <!-- 글쓰기 버튼 -->
        <a href="/Jboard/write.jsp" class="btnWrite">글쓰기</a>
    </section>
</main>
<%@ include file="/inc/footer.jsp" %>
