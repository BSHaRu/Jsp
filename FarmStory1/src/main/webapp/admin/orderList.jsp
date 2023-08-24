<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/admin/header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");	

	OrderDAO dao = new OrderDAO();
	
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
	total = dao.selectOrderCount();
	
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
	
	List<OrderDTO> orders 
		= dao.selectOrders(start, pageCount);
%>
        <main>
            <%@ include file="/inc/admin/aside/admin_aside.jsp" %>
            <section id="orderList">
                <nav>
                    <h3>주문목록</h3>
                </nav>
					
                <article>
					<form id="formCheck" action="/FarmStory1/admin/proc/deleteOrders.jsp" method="get">
	                    <table>
	                        <tr>
	                            <th>
	                            	<input type="checkbox" name="all"/>
	                           	</th>
	                            <th>주문번호</th>
	                            <th>상품명</th>
	                            <th>판매가격</th>
	                            <th>수량</th>
	                            <th>배송비</th>
	                            <th>합계</th>
	                            <th>주문자</th>
	                            <th>주문일</th>
	                            <th>확인</th>
	                        </tr>
	                        <% for(OrderDTO order : orders) { %>
	                        <tr>
	                            <td class="chk">
	                            	<input type="checkbox" name="chk" value="<%= order.getOrderNo() %>" />
	                           	</td>
	                            <td class="orderNo"><%= order.getOrderNo() %></td>
	                            <td class="pName"><%= order.getpName() %></td>                            
	                            <td class="price"><%= order.getOrderPrice() %>원</td>
	                            <td class="count"><%= order.getOrderCount() %></td>
	                            <td class="deli"><%= order.getOrderDelivery() %>원</td>
	                            <td class="total"><%= order.getOrderTotal() %>원</td>
	                            <td class="orderUser"><%= order.getOrderUser() %></td>
	                            <td class="date"><%= order.getOrderDate() %></td>
	                            <td>
	                            	<a href="#" class="showPopup">[상세확인]</a>
	                           	</td>
	                        </tr>
	                        <% } %>
	                    </table>
                    </form>
                    <p>
                        <a href="#" class="orderDelete">선택삭제</a>                        
                    </p>
                    
                    <!-- 페이징 처리 -->
                    <p class="paging">
                    <% if(pageGroupStart > 1){ %>
                        <a href="/FarmStory1/admin/orderList.jsp?pg=<%= pageGroupStart -1 %>" 
                        	class="prev">&lt;</a>
                    <% } %>
                    
                    <% for(int i = pageGroupStart; i<=pageGroupEnd; i++){ %>
                        <a href="/FarmStory1/admin/orderList.jsp?pg=<%= i %>" 
                        	class="num <%=(currentPage == i)? "on" : ""%>"><%= i %></a>
                    <% } %>    
                    
                    <% if(pageGroupEnd < lastPageNum){ %>    
                        <a href="/FarmStory1/admin/orderList.jsp?pg=<%= pageGroupEnd + 1 %>"
                        	class="next">&gt;</a>
                    <% } %>     
                    </p>
                </article>
            </section>
        </main>
        
<%@ include file="/inc/admin/footer.jsp" %>
		<!-- 상세 보기 눌렀을 때 팝업창 화면 구현 해야 됨 -->
       <div id="orderPopup">
           <section>
               <nav>
                   <h1>상세주문내역</h1>
                   <button class="btnClose">닫기</button>
               </nav>

               <article>  
                   <h3>기본정보</h3>
                   <table>
                       <tr>
                          <td rowspan="7" class="thumb">
                          	<img src="./images//sample_item1.jpg" alt="사과 500g">
                          </td>
                          <td>상품번호</td>
                          <td class="pNo">1011</td>
                       </tr>
                       <tr>
                          <td>상품명</td>
                          <td>사과 500g</td>
                       </tr>
                       <tr>
                          <td>판매가격</td>
                          <td>4,000원</td>
                       </tr>
                       <tr>
                          <td>수량</td>
                          <td>2개</td>
                       </tr>
                       <tr>
                          <td>배송비</td>
                          <td>3,000원</td>
                       </tr>
                       <tr>
                          <td>합계</td>
                          <td>11,000원</td>
                       </tr>
                       <tr>
                          <td>주문자</td>
                          <td>홍길동</td>
                       </tr>                        
                   </table>

                   <h3>배송지 정보</h3>
                   <table>
                       <tr>
                           <td>받는분</td>
                           <td>홍길동</td>
                       </tr>
                       <tr>
                           <td>배송지</td>
                           <td>부산광역시 부산진구 대연동 120 루미너스 10층</td>
                       </tr>
                   </table>
               </article>
           </section>
       </div>
	<script>
		$(function(){
			// 체크박스 클릭 이벤트
			$('input[name=all]').change(function(){
				const isChecked = $(this).is(":checked");
				
				if(isChecked){
					console.log("체크 됨");
					$('input[name=chk]').prop("checked", true);
					
				}else{
					console.log("체크 안됨");
					$('input[name=chk]').prop("checked", false);
				}
			}); // input end
		}); 
		
		// 삭제 버튼 이벤트
		$('.orderDelete').click(function(e){
			e.preventDefault();
			console.log("삭제 버튼");
			
			$("#formCheck").submit();
		});
	</script>
</body>
</html>