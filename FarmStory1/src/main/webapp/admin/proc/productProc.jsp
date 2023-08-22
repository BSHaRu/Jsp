<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.*, dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// uuid 저장할 폴더(경로) 지정
	String path = application.getRealPath("/thumb");
	int size = 1024 * 1024 * 10;
	MultipartRequest mr 
		= new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

	String pName = mr.getParameter("pName");
	String strType = mr.getParameter("type");
	String strPrice = mr.getParameter("price");
	String strDelivery = mr.getParameter("delivery");
	String strStock = mr.getParameter("stock");
	String thumb1 = mr.getOriginalFileName("thumb1");
	String thumb2 = mr.getOriginalFileName("thumb2");
	String thumb3 = mr.getOriginalFileName("thumb3");
	String seller = mr.getParameter("seller");
	String etc = mr.getParameter("etc");
	
	int type = Integer.parseInt(strType);
	int price = Integer.parseInt(strPrice);
	int delivery = Integer.parseInt(strDelivery);
	int stock = Integer.parseInt(strStock);
	
	// dto에 파일업로드 때문에 생성자 추가됨
	// -> path를 같이 넣어줘야됨
	ProductDTO dto = new ProductDTO(path);
	dto.setpName(pName);
	dto.setType(type);
	dto.setPrice(price);
	dto.setDelivery(delivery);
	dto.setStock(stock);
	dto.setThumb1ForReName(thumb1);
	dto.setThumb2ForReName(thumb2);
	dto.setThumb3ForReName(thumb3);
	dto.setSeller(seller);
	dto.setEtc(etc);
	
	ProductDAO dao = new ProductDAO();
	dao.insertProduct(dto);
	
	response.sendRedirect("/FarmStory1/admin/productRegister.jsp");
%>
