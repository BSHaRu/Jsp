<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String receiver = request.getParameter("receiver");
	String hp = request.getParameter("hp");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String etc= request.getParameter("etc");

	String pNo = request.getParameter("orderProduct");
	String orderCount = request.getParameter("orderCount");
	String orderDelivery = request.getParameter("orderDelivery");
	String orderPrice = request.getParameter("orderPrice");
	String orderTotal = request.getParameter("orderTotal");
	
	int product = Integer.parseInt(pNo);
	int count = Integer.parseInt(orderCount);
	int delivery = Integer.parseInt(orderDelivery);
	
	// 가격이 ,를 통해서 String으로 받아오다보니
	// 그냥 파싱은 안되고 ,를 replace로 빼주고 파싱을해야됨
	int price = Integer.parseInt(orderPrice.replace(",", ""));
	int total = Integer.parseInt(orderTotal.replace(",", ""));
	
	
	UserDTO sessUser 
		= (UserDTO) session.getAttribute("sessUser");
	
	OrderDTO dto = new OrderDTO();
	dto.setOrderProduct(product);
	dto.setOrderCount(count);
	dto.setOrderDelivery(delivery);
	dto.setOrderPrice(price);
	dto.setOrderTotal(total);
	dto.setReceiver(receiver);
	dto.setHp(hp);
	dto.setZip(zip);
	dto.setAddr1(addr1);
	dto.setAddr2(addr2);
	dto.setOrderEtc(etc);
	dto.setOrderUser(sessUser.getUid());
	
	
	OrderDAO dao = new OrderDAO();
	dao.insertOrder(dto);
	
	response.sendRedirect("/FarmStory1/market/list.jsp");
%>