<%@page import="cosmos.multiple.model.MultipleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="multiple" class="cosmos.multiple.model.Multiple"></jsp:useBean>
<jsp:setProperty property="*" name="multiple"/>

<%
	MultipleService service = MultipleService.getInstance();
	
	String content = service.selectMultiple(multiple);
	session.setAttribute("multipleSelect", multiple);	//선택한 카테고리,난이도를 추출하기 위해.
	session.setAttribute("content", content);	// 카테고리,난이도에 해당하는 문제 추출
	response.sendRedirect("MultipleMain.jsp");
	
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