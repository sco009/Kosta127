<%@page import="cosmos.login.model.MemberDao"%>
<%@page import="cosmos.login.model.Member"%>
<%@page import="cosmos.login.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../css/Log_css/confirmId.css" type="text/css" media="screen" />
<title>ID �ߺ�Ȯ��</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<%
		String memberID = request.getParameter("memberID");

		MemberService service = MemberService.getInstance();
		Member member = service.selectMemberService(memberID);

		if (member != null) {
	%>

	
			<form class="form" name="checkForm" method="post" action="confirmId.jsp">
				<b><span class="strong"><%=memberID%></span>��  
			�̹� ������� ���̵��Դϴ�.<br><b>�ٸ� ���̵� �����ϼ���.</b><br> <br> <input type="text"
					name="memberID"> <input type="submit" value="�ߺ�Ȯ��"> </b>
			</form>
	<%
		} else {
	%>
	<center>
		<b><span class="font">�Է��Ͻ� <span class="strong"><%=memberID%></span>�� ����Ͻ� �� �ִ� ID�Դϴ�.
		</span><br> </b><br> <br> <input type="button" value="�ݱ�"
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