<%@page import="dao.*"%>
<%@page import="dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 기본 String 값
	String receiver = request.getParameter("receiver");
	String hp = request.getParameter("hp");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String etc= request.getParameter("etc");

	// int 값으로 변환 해줘야 되는 값
	String pNo = request.getParameter("orderProduct");
	String orderCount = request.getParameter("orderCount");
	String orderDelivery = request.getParameter("orderDelivery");
	String orderPrice = request.getParameter("orderPrice");
	String orderTotal = request.getParameter("orderTotal");
	
	int product = Integer.parseInt(pNo);
	int count = Integer.parseInt(orderCount);
	int delivery = Integer.parseInt(orderDelivery);
	
	// 그 중 replace를 해서 파싱 해야되는 값
	// 가격이 ,를 통해서 String으로 받아오다보니
	// 그냥 파싱은 안되고 ,를 replace로 빼주고 파싱을해야됨
	int price = Integer.parseInt(orderPrice.replace(",", ""));
	int total = Integer.parseInt(orderTotal.replace(",", ""));
	
	// 주문자는 로그인 한사람이니깐 session을 여기서 그냥 가져옴
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