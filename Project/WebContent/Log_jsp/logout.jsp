<%@page import="cosmos.login.model.Login"%>
<%@page import="cosmos.login.model.LoginService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String memberName =(String) session.getAttribute("memberName");
	String memberID = (String)session.getAttribute("memberID");
	
	Login login = new Login();
	login.setMemberID(memberID);
	login.setMemberName(memberName);
	
	LoginService loservice = LoginService.getInstance();
	int re = -1;
	
	try{
		re = loservice.currentLogoutMemberService(login);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	session.invalidate();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert("<%=memberName %>님은 로그아웃되었습니다.");
		location.href="login.jsp";
	</script>
</body>
</html>