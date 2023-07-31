<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// XML 생성
	String xmlData = "<user>";
			xmlData += "<uid>a101</uid>";
			xmlData += "<name>갑질</name>";
			xmlData += "<hp>010-6666-4444</hp>";
			xmlData += "<age>44</age>";
			xmlData += "</user>";
			
	// XML 출력
	out.print(xmlData);
%>