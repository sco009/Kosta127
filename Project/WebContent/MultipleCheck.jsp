<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	session.removeAttribute("successCheck");
    	session.removeAttribute("failCheck");
    	String multipleChoiceSelect = request.getParameter("multipleChoiceSelect");
    	String mulquestAnswer = request.getParameter("mulquestAnswer");

    	if(multipleChoiceSelect.equals(mulquestAnswer)){
    		String successAnswer = "정답입니다.";
    		session.setAttribute("successCheck", successAnswer);
    		response.sendRedirect("MultipleMain.jsp");
    	}else if(!multipleChoiceSelect.equals(mulquestAnswer)){
    		response.sendRedirect("MultipleMain.jsp");
    		session.setAttribute("failCheck", mulquestAnswer);
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