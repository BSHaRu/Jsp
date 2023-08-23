<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");

	String pg = request.getParameter("pg");
	// null 이면 비교 연산이 안되기 때문에 강제로 0으로 만들어 줌
	// -> type 으로 카테고리 움직이는데, 
	// null이면 nullpoint가 떠서 강제로 0으로 만들어줌
	// => dao에서 null 처리를 안해도 됨
	if(type == null) type = "0";
	
	ProductDAO dao = new ProductDAO();
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
	total = dao.selectCountProdTotal(type);
	
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
	
	//int total = dao.selectCountProdTotal();
	List<ProductDTO> products 
		= dao.selectProducts(type, start, pageCount);
%>    

<div id="sub">
    <div>
    	<img src="/FarmStory1/images/sub_top_tit2.png" alt="MARKET">
    </div>
    <section class="market">
        <aside>
            <img src="/FarmStory1/images/sub_aside_cate2_tit.png" alt="장보기"/>

            <ul class="lnb">
                <li class="on"><a href="/FarmStory1/market.jsp">장보기</a></li>
            </ul>
        </aside>
        
        <article class="list">
            <nav>
                <img src="/FarmStory1/images/sub_nav_tit_cate2_tit1.png" alt="장보기"/>
                <p>
                    HOME > 장보기 > <em>장보기</em>
                </p>
            </nav>

            <!-- 내용 시작 -->
            <p class="sort">
                <a href="list.jsp?type=0" 
                	class=<%=type.equals("0") ? "on" : ""%> >
                	전체<%= type.equals("0")? "("+total+")" : "" %> |
               	</a>
                <a href="list.jsp?type=1" 
                	class=<%=type.equals("1") ? "on" : ""%> >
                	과일 <%= type.equals("1")? "("+total+")" : "" %> |
               	</a>
                <a href="list.jsp?type=2" 
                	class=<%=type.equals("2") ? "on" : ""%> >
                	야채 <%= type.equals("2")? "("+total+")" : "" %> |
               	</a>
                <a href="list.jsp?type=3" 
                	class=<%=type.equals("3") ? "on" : ""%> >
                	곡류 <%= type.equals("3")? "("+total+")" : "" %>
               	</a>
            </p>
            
            <table>
            <% for(ProductDTO product : products){ %>
                <tr>
                    <td>
                        <a href="/FarmStory1/market/view.jsp?pNo=<%=product.getpNo() %>">
                       		<img src="/FarmStory1/thumb/<%= product.getThumb1() %>" class="thumb" />
                        </a>
                    </td>
                    <td>
                    	<%
	                    	switch(product.getType()){
	               			case 1 :
	                			out.print("과일");
	               				break;
	          				case 2 :
	              				out.print("야채");
	               				break;
	               			case 3 :
	               				out.print("곡물");
	               				break;
	                		}
                    	%>
                    </td>
                    <td>
                    	<a href="#"><%=product.getpName() %></a>
                    </td>
                    <td>
                    	<!-- 3자리마다 , 찍어서 금액 표시 하기위해서 처리 -->
                    	<strong><%=product.getPriceWithComma() %></strong>원
                    </td>
                </tr>
                <% } %>
            </table>

			<!-- 페이징 처리 -->
            <p class="paging">
            <% if(pageGroupStart > 1){ %>
                <a href="/FarmStory1/market/list.jsp?type=<%=type %>&pg=<%= pageGroupStart -1 %>" 
                	class="prev">&lt;</a>
            <% } %>
            
            <% for(int i = pageGroupStart; i<=pageGroupEnd; i++){ %>
                <a href="/FarmStory1/market/list.jsp?type=<%=type %>&pg=<%=i %>" 
                	class="num <%=(currentPage == i)? "on" : ""%>"><%= i %></a>
            <% } %>	
            
            <% if(pageGroupEnd < lastPageNum){ %>
                <a href="/FarmStory1/market/list.jsp?type=<%=type %>&pg=<%= pageGroupEnd +1 %>" 
                	class="next">&gt;</a>
			<% } %>                	
            </p>
            <!-- 내용 끝 -->

        </article>
    </section>
</div>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>