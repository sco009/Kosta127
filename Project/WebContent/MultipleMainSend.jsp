<%@page import="java.util.List"%>
<%@page import="cosmos.multiple.model.Multiple"%>
<%@page import="cosmos.multiple.model.MultipleChoice"%>
<%@page import="cosmos.multiple.model.MultipleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="multiple" class="cosmos.multiple.model.Multiple"></jsp:useBean>
<jsp:setProperty property="*" name="multiple"/>

<%
	MultipleService service = MultipleService.getInstance();
	
	List<Multiple> multipleSelect = service.selectMultiple(multiple); //multiple 객체리스트 생성 
	
	session.setAttribute("multipleSelect", multipleSelect);	//multiple 객체리스트 넘겨주기
 	response.sendRedirect("MultipleMain.jsp?count=0");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>