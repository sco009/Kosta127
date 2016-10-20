<%@page import="cosmos.login.model.Member"%>
<%@page import="cosmos.login.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="cosmos.login.model.Member"/>
<jsp:setProperty property="*" name="member"/>
<% 
	
	MemberService service = MemberService.getInstance();
	int re = -1;
	
	try{
		re = service.updateInfoService(member);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	if(re>0){
		response.sendRedirect("log_main.jsp");
	}else{
		response.sendRedirect("updateInfo.jsp");
	}
	
 
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
