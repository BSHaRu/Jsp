<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("sessUser");
%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.href="/FarmStory1/index.jsp";
			return true;
		}else{
			return false;
		}
	});
</script>