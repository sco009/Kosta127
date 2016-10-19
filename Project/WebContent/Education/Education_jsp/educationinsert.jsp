<%@page import="cosmos.education.model.EducationService"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	EducationService service = EducationService.getInstance();
	String dataClassify = request.getParameter("dataClassify");

	String hl_contents = request.getParameter("hl_contents");
	
	String memberID = request.getParameter("memberID");
	String pages = request.getParameter("pages");
	int re = 0;
	int rt = 0;
	try {
			re = service.inserteducation(request);  // education_contents에 입력하기 위한 service 
		
		 

	} catch (Exception e) {
		e.printStackTrace();
	}
	System.out.println(re);
	if (re > 0) {
		try {
			rt = service.insertedumanager(request);  //edumanager에 입력하기 위한 service 
			System.out.println(rt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	if (rt > 0) {
		response.sendRedirect(dataClassify + ".jsp?memberID="
				+ memberID + "&dataClassify=" + dataClassify+"&reid=id&pages="+pages);
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