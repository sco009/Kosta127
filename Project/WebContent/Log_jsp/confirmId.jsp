<%@page import="cosmos.login.model.MemberDao"%>
<%@page import="cosmos.login.model.Member"%>
<%@page import="cosmos.login.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/Log_css/confirmId.css" type="text/css" media="screen" />
<title>ID 중복확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		String memberID = request.getParameter("memberID");

		MemberService service = MemberService.getInstance();
		Member member = service.selectMemberService(memberID);

		if (member != null) {
	%>

	
			<form class="form" name="checkForm" method="post" action="confirmId.jsp">
				<b><span class="strong"><%=memberID%></span>는  
			이미 사용중인 아이디입니다.<br><b>다른 아이디를 선택하세요.</b><br> <br> <input type="text"
					name="memberID"> <input type="submit" value="중복확인"> </b>
			</form>
	<%
		} else {
	%>
	<center>
		<b><span class="font">입력하신 <span class="strong"><%=memberID%></span>는 사용하실 수 있는 ID입니다.
		</span><br> </b><br> <br> <input type="button" value="닫기"
			onclick="setid()">

	</center>
	<%
		}
	%>

	<script language="javascript">
	function setid() {
		opener.document.userForm.id.value="<%=memberID%>";
			opener.document.userForm.chkID.value = "Y";
			self.close();
		}
	</script>
</body>
</html>