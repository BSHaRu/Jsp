<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}" />

<div id="sub">
	<div>
		<img src="${path }/images/sub_top_tit3.png" alt="CROP TALK">
	</div>
	<section class="croptalk">
		<aside>
			<img src="${path }/images/sub_aside_cate3_tit.png" alt="농작물이야기" />

			<ul class="lnb">
				<li class="${cate eq 'story' ? 'on' : '' }">
					<a href="${path }/board/list.do?group=croptalk&cate=story">농작물이야기</a>
				</li>
				<li class="${cate eq 'grow' ? 'on' : '' }">
					<a href="${path }/board/list.do?group=croptalk&cate=grow">텃밭가꾸기</a>
				</li>
				<li class="${cate eq 'school' ? 'on' : '' }">
					<a href="${path }/board/list.do?group=croptalk&cate=school">귀농학교</a>
				</li>
			</ul>

		</aside>
		<article>
			<nav>
				<img src="${path }/images/sub_nav_tit_cate3_${cate }.png" alt="게시판" />
				<p>
					HOME > 농작물이야기 > 
					<c:choose>
						<c:when test="${cate eq 'story' }">
							<em>농작물이야기</em>
						</c:when>
						<c:when test="${cate eq 'grow' }">
							<em>텃밭가꾸기</em>
						</c:when>
						<c:when test="${cate eq 'school' }">
							<em>귀농학교</em>
						</c:when>
						<c:otherwise>
							<em>...</em>
						</c:otherwise>
					</c:choose>
				</p>
			</nav>