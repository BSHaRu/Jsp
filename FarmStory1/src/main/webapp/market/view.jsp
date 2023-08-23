<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp" %>    
<%
	request.setCharacterEncoding("UTF-8");
	String strpNo = request.getParameter("pNo");
	int pNo = Integer.parseInt(strpNo);
	
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = dao.selectProduct(pNo);
%>
        <div id="sub">
            <div><img src="/FarmStory1/images/sub_top_tit2.png" alt="MARKET"></div>
            <section class="market">
                <aside>
                    <img src="/FarmStory1/images/sub_aside_cate2_tit.png" alt="장보기"/>

                    <ul class="lnb">
                        <li class="on"><a href="/FarmStory1/marketmarket.jsp">장보기</a></li>
                    </ul>
                </aside>
                <article class="view">
                    <nav>
                        <img src="/FarmStory1/images/sub_nav_tit_cate2_tit1.png" alt="장보기"/>
                        <p>
                            HOME > 장보기 > <em>장보기</em>
                        </p>
                    </nav>

                    <!-- 내용 시작 -->
                    <h3>기본정보</h3>
                    <div class="basic">
                        <img src="/FarmStory1/thumb/<%=dto.getThumb2() %>" alt="<%=dto.getpName() %>">

                        <table>                            
                            <tr>
                                <td>상품명</td>
                                <td><%= dto.getpName() %></td>
                            </tr>
                            <tr>
                                <td>상품코드</td>
                                <td><%= dto.getpNo() %></td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td>
                                	<!-- 이거 스타일 왜 안먹지? -->
                                    <em style="text-align: left">3만원 이상 무료배송</em>
                                	<% if(dto.getDelivery() > 0){ %>
                                    <span class="delivery"></span>원
                                    <% } %>
                                </td>
                            </tr>
                            <tr>
                                <td>판매가격</td>
                                <td><%= dto.getPriceWithComma() %>원</td>
                            </tr>
                            <tr>
                                <td>구매수량</td>
                                <td>
                                    <input type="number" style="text-align: right"
                                    	name="count" min="1" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>합계</td>
                                <td class="total"></td>
                            </tr>
                        </table>
                        <form id="formOrder" action="/FarmStory1/market/order.jsp" method="post">
                        	<input type="hidden" name="thumb2" value="<%=dto.getThumb2() %>" />
                        	<input type="hidden" name="pName" value="<%=dto.getpName() %>" />
                        	<input type="hidden" name="pNo" value="<%=dto.getpNo() %>" />
                        	<input type="hidden" name="delivery" value="<%=dto.getDelivery() %>" />
                        	<input type="hidden" name="price" value="<%=dto.getPrice() %>" />
                        	<input type="hidden" name="count" value="1" />
                        	<input type="hidden" name="total" />
                        </form>
                        <a href="#" class="btnOrder">
                            <img src="/FarmStory1/images/market_btn_order.gif" alt="바로 구매하기"/>
                        </a>
                        
                    </div>
                    <h3>상품설명</h3>
                    <div class="detail">
                        <img src="/FarmStory1/thumb/<%=dto.getThumb3() %>" alt="상세 이미지">

                    </div>

                    <h3>배송정보</h3>
                    <div class="delivery">
                        <p>
                            입금하신 이후 택배송장번호는 SMS(문자서비스)를 통해 고객님께 안내해드립니다.
                        </p>
                    </div>

                    <h3>교환/반품</h3>                  
                    <div class="exchange">
                        <table>
                            <tr>
                                <td>교환 반품이 가능한 경우</td>
                                <td>
                                    <ul>
                                        <li>팜스토리 상품에 하자가 있거나 불량인 경우</li>
                                        <li>채소, 과일, 양곡등의 식품은 만1일 이내</li>
                                        <li>기타 상품은 수령일로부터 영업일 기준 일주일 이내</li>
                                        <li>받으신 상품이 표시사항과 다른 경우에는 받으신 날로부터 일주일 이내</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>교환 반품이 불가능한 경우</td>
                                <td>
                                    <ul>
                                        <li>신선 식품의 경우 단순히 마음에 들지 않는 경우</li>
                                        <li>단순 변심으로 상품이 가치가 훼손돼서 판매가 어려운 경우</li>
                                    </ul>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- 내용 끝 -->
                </article>
            </section>

        </div>
<%@ include file="/inc/footer.jsp" %>
<script>
	const price = <%= dto.getPrice() %>;
	let delivery = <%=dto.getDelivery() %>;
	
	$(function(){
		// 3만원 이상 배송비 무료
		if(price >= 30000) delivery = 0;
		
		// 여기에 이렇게 선언 해줘야 처음 로딩 할 경우 배송비 포함된 가격을 보여줌
		$('.total').text((price + delivery).toLocaleString()+"원");
		$('.delivery').text(delivery);
		
		// 수량 조절 안했을 때 hidden으로 total 넘기기
		$('input[name=total]').val((price+delivery).toLocaleString());
		
		$('input[name=count]').change(function(){
			console.log("input count change");
			
			let count = $(this).val();
			
			if(price * count >= 30000){
				delivery = 0;
				$('.delivery').text(delivery);
			}else{
				delivery = <%=dto.getDelivery() %>;
				$('.delivery').text(delivery);
			}
			$('input[name=delivery]').val(delivery);
			
			let total = price * count + delivery;
			
			// hidden으로 count 넘길 때 필요한 로직
			$('input[name=count]').val(count);
			// hidden으로 total (판매가격 * 수량) + 배송비 가격 넘기는 로직
			$('input[name=total]').val(total.toLocaleString());
			
			// toLocaleString() : js에서 3자리 숫자 , 해주는 함수
			$('.total').text(total.toLocaleString()+"원");
		});
		
		// 주문하기
		$('.btnOrder').click(function(e){
			e.preventDefault();
			console.log("btnOrder click");
			
			$("#formOrder").submit();
		});
	});
</script>
</body>
</html>