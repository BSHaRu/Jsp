<%@page import="dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String[] chk = request.getParameterValues("chk");
	
	OrderDAO dao = new OrderDAO();
	
	// chk가 문자열 배열이지만 그걸 바로 파싱을 해버림
	for(String orderNo : chk){
		dao.deleteOrder(Integer.parseInt(orderNo));
	}
	
	response.sendRedirect("/FarmStory1/admin/orderList.jsp");
%>