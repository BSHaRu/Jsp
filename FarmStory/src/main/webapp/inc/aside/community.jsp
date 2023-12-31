<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}" />
    
 <div id="sub">
	<div>
		<img src="${path}/images/sub_top_tit5.png" alt="COMMUNITY">
	</div>
	<section class="community">
		<aside>
			<img src="${path}/images/sub_aside_cate5_tit.png" alt="커뮤니티" />

			<ul class="lnb">
				<li class="${cate eq 'notice' ? 'on' : '' }">
					<a href="${path}/board/list.do?group=community&cate=notice">공지사항</a>
				</li>
				<li class="${cate eq 'menu' ? 'on' : '' }">
					<a href="${path}/board/list.do?group=community&cate=menu">오늘의식단</a>
				</li>
				<li class="${cate eq 'chef' ? 'on' : '' }">
					<a href="${path}/board/list.do?group=community&cate=chef">나도요리사</a>
				</li>
				<li class="${cate eq 'qna' ? 'on' : '' }">
					<a href="${path}/board/list.do?group=community&cate=qna">1:1고객문의</a>
				</li>
				<li class="${cate eq 'faq' ? 'on' : '' }">
					<a href="${path}/board/list.do?group=community&cate=faq">자주묻는질문</a>
				</li>
			</ul>

		</aside>
		<article>
			<nav>
				<img src="${path}/images/sub_nav_tit_cate5_${cate }.png" alt="나도요리사" />
				<p>
					HOME > 커뮤니티 > 
					<c:choose>
						<c:when test="${cate eq 'notice' }">
							<em>공지사항</em>
						</c:when>
						<c:when test="${cate eq 'menu' }">
							<em>오늘의식단</em>
						</c:when>
						<c:when test="${cate eq 'chef' }">
							<em>나도요리사</em>
						</c:when>
						<c:when test="${cate eq 'qna' }">
							<em>1:1고객문의</em>
						</c:when>
						<c:when test="${cate eq 'faq' }">
							<em>자주묻는질문</em>
						</c:when>
						<c:when test="${cate eq 'story' }">
							<em>나도요리사</em>
						</c:when>
						<c:otherwise>
							<em>...</em>
						</c:otherwise>
					</c:choose>
				</p>
			</nav>