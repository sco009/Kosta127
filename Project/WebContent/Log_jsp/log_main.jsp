<%@page import="cosmos.login.model.LoginService"%>
<%@page import="cosmos.login.model.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String memberName = (String) session.getAttribute("memberName");
	String memberID = (String) session.getAttribute("memberID"); //id넘어옴

	Login login = new Login();
	login.setMemberID(memberID);
	login.setMemberName(memberName);

	LoginService loservice = LoginService.getInstance();
	int re = -1;

	try {
		if (memberName != null) {

			re = loservice.currentLoginMemberService(login);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	if (memberName == null) {
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	 <jsp:include page="../Log_module/mainHeader.jsp" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/Log_css/mainHeader.css">
<link rel="stylesheet" type="text/css" href="../css/Log_css/mainMenu1.css">
<link rel="stylesheet" type="text/css" href="../css/Log_css/mainMenu2.css">
<link rel="stylesheet" type="text/css" href="../css/Log_css/mainMenu3.css">

<!-- 부트스트랩 시작  -->

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<!-- 부트스트랩 끝 -->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	

</head>
<script type="text/javascript">
	function logout() {
		location.href = "logout.jsp";
	}
</script>

<body>
	
	<h4><%=memberName%>님 반갑습니다.</h4>

	<h4><a href="Test.jsp">Test</a></h4>
	<h4><a href="TestAr.jsp">Test</a></h4>
	<a href="../Ranking_jsp/Ranking.jsp">랭킹</a>

	<button class="small logout" Onclick="logout()">LOGOUT</button>

	<div class="container">
		<div class="row-fluid">
			<div class="col-md-12">
				<div class="row-fluid">
					<div class="col-md-3 col-md-offset-1">
						<input id='check' type='checkbox'> <label class='main'
							for='check'>
							<div class='title'>
								<i class="fa fa-graduation-cap" aria-hidden="true"></i>
							</div>
						</label>
						<div class="ma">
							<a class="plate" href="../EducationJSP/education_main.jsp"> <i class="fa fa-book"
								aria-hidden="true"></i>
							</a> <a class="plate" href="../Multiple/MultipleMain.jsp"> <i
								class="fa fa-pencil" aria-hidden="true"></i>
							</a> <a class="plate" href="codeTrace.jsp"> <i
								class="fa fa-balance-scale" aria-hidden="true"></i>
							</a> <a class="plate" href="codeFight.jsp"> <i
								class="fa fa-keyboard-o" aria-hidden="true"></i>
							</a>
						</div>
					</div>

					<div class="col-md-4">
						<input id='check2' type='checkbox'></input> <label class='main2'
							for='check2'>
							<div class='title2'>
								<i class="fa fa-users" aria-hidden="true"></i>
							</div>
						</label>
						<div class="ma2">
							<a class="plate2" href="createGroup.jsp"> <i
								class="fa fa-user-plus" aria-hidden="true"></i>
							</a> <a class="plate2" href="enterGroup.jsp"> <i
								class="fa fa-arrow-circle-o-right" aria-hidden="true"></i>
							</a> <a class="plate2" href="../wc_form_jsp/wc_compileForm.jsp"> <i
								class="fa fa-file-code-o" aria-hidden="true"></i>
							</a>
						</div>
					</div>

					<div class="col-md-3 col-md-offset-1*">
						<input id='check3' type='checkbox'> <label class='main3'
							for='check3'>
							<div class='title3'>
								<i class="fa fa-pencil-square-o" aria-hidden="true"><a
									class="plate3" href="#"></a></i>
							</div>
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
