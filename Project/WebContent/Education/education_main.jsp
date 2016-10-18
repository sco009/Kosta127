<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String memberID = request.getParameter("memberID");
	request.setAttribute("memberID", memberID);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Examples of Pseudo-Elements Animations and Transitions " />
<meta name="keywords"
	content="pseudo-elements, before, after, animation, transition, css3" />
<meta name="author" content="Marco Barria for Codrops" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="Education_jsp/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="Education_jsp/css/style2.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="Education_jsp/js/modernizr.custom.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>자바 ! 교육 자료</title>
</head>
<body>
<jsp:include page="../Log_module/header.jsp" />
		<br><br><br>
		
	<div class="container">
		<div class="main clearfix">
			<div class="col-md-4">
				<a
					href="Education_jsp/javaone.jsp?dataClassify=javaone&memberID=ohwoosung"><div
						class="circle">
						<h1>자바의 소개</h1>
					</div></a>
			</div>
			<div class="col-md-4">
				<a
					href="Education_jsp/javatwo.jsp?dataClassify=javatwo&memberID=<%=memberID%>"><div
						class="circle">
						<h1>데이터형과 연산자</h1>
					</div></a>
			</div>
			<div class="col-md-4">
				<a
					href="Education_jsp/javathree.jsp?dataClassify=javathree&memberID=<%=memberID%>"><div
						class="circle">
						<h1>제어문과 배열</h1>
					</div></a>
			</div>
		</div>
	</div>
</body>
</html>