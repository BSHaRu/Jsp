<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 아래 nav list 별로 보여주기 위해서 cate를 가져옴
	String cate = request.getParameter("cate");
%>      
<div id="sub">
	<div>
		<img src="/FarmStory1/images/sub_top_tit4.png" alt="EVENT">
	</div>
	<section class="event">
		<aside>
			<img src="/FarmStory1/images/sub_aside_cate4_tit.png" alt="이벤트" />
			<ul class="lnb">
				<li class="on">
					<a href="/FarmStory1/board/list.jsp?group=event&cate=event">이벤트</a>
				</li>
			</ul>
		</aside>
		
		<article>
			<nav>
				<img src="/FarmStory1/images/sub_nav_tit_cate4_tit1.png" alt="이벤트" />
				<p>
					HOME > 이벤트 > <em>이벤트</em>
				</p>
			</nav>