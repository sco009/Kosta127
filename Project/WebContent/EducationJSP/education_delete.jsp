<%@page import="cosmos.education.model.EducationService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
    String hl_contents = request.getParameter("hl_contents");
    String dataClassify = request.getParameter("dataClassify");
    String memberID = request.getParameter("memberID");
    String pages = request.getParameter("pages");
    EducationService service = EducationService.getInstance();
   try{
	   service.deletehl_contents(hl_contents);
   }catch(Exception e){
	   e.printStackTrace();
   }
   
	response.sendRedirect(dataClassify + ".jsp?memberID="
			+ memberID + "&dataClassify=" + dataClassify+"&reid=id&pages="+pages);
   
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