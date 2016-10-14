<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! int successCount; %>
<%! int failCount; %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <%
    ArrayList<String> failList = (ArrayList<String>)session.getAttribute("failList");
    ArrayList<String> successList = (ArrayList<String>)session.getAttribute("successList");
	
    
    failList.add(request.getParameter("solveFailId"));
    successList.add(request.getParameter("solveSuccessId"));
    
    request.setAttribute("failList", failList);
    request.setAttribute("successList", successList);
    session.removeAttribute("failList");
    session.removeAttribute("successList");
    session.removeAttribute("multipleSelect");
    request.removeAttribute("solveSuccessId");
    request.removeAttribute("solveFailId");
    	
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/MultipleJs/MultipleJavaScript.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/kfonts2.css" rel="stylesheet">
<title>cosmos</title>
</head>
<body>
	<div class="progress">
  		<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
    		<span class="sr-only">40% Complete (success)</span>
 		</div>
	</div>

	<c:forEach var="fail" items="${failList }" begin="0" end="${failList.size() }">
		<c:if test="${fail !=null }">
			<p>틀린문제 : ${fail}</p><br>
		</c:if>
	</c:forEach>
	
	<c:forEach var="success" items="${successList }" begin="0" end="${successList.size() }">
		<c:if test="${success !=null }">
			<p>맞춘문제 : ${success }</p><br>
		</c:if>
	</c:forEach>
	
	<input type=button value="돌아가기" onclick=returnMultipleMain()></input>
	
</body>
</html>