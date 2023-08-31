<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/board/header.jsp" %>
<main id="board">
    <section class="list">                
        <form action="#">
            <input type="text" name="search" placeholder="제목 키워드, 글쓴이 검색">
            <input type="submit" value="검색">
        </form>
        
        <table>
            <caption>글목록</caption>
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
			                	<a href="./view.do?no=${article.no }">${article.title }
			                	[${article.comment }]</a>
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

        <div class="page">
            <a href="#" class="prev">이전</a>
            <a href="#" class="num current">1</a>
            <a href="#" class="next">다음</a>
        </div>

        <a href="./write.do" class="btn btnWrite">글쓰기</a>
        
    </section>
</main>
<%@ include file="/inc/board/footer.jsp" %>