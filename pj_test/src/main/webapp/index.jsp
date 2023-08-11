<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="path" value="/" /> --%>
<%@ include file="/inc/header.jsp" %>
<main>
	<section>
		<div>
			<a href="${path }/sign/login.jsp">로그인 페이지</a>
		</div>
		<a href="${path }/board/board_list.jsp">게시판</a>
	</section>
</main>
<%@ include file="/inc/footer.jsp" %>