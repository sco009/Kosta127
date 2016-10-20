<%@page import="cosmos.login.model.LoginService"%>
<%@page import="cosmos.login.model.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	LoginService service = LoginService.getInstance();
	request.setAttribute("service", service);
	
	String memberName = (String) session.getAttribute("memberName");
	String memberID = (String) session.getAttribute("memberID"); //id넘어옴
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>COSMOS MAIN</title>

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

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description"
   content="Custom Drop-Down List Styling with CSS3" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="../css/Log_css/drop_style.css" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700'
   rel='stylesheet' type='text/css' />
<script type="text/javascript" src="../js/Log_js/modernizr.custom.79639.js"></script>
<noscript>
   <link rel="stylesheet" type="text/css" href="../css/Log_css/noJS.css" />
</noscript>
</head>
<script type="text/javascript">
	function logout() {
		location.href = "logout.jsp";
	}
</script>

<body>
	<div class="drop_container">

      <section class="drop_main">
      <div class="wrapper-demo">
         <div id="dd" class="wrapper-dropdown-5" tabindex="1">
            <%=memberName%>
            <ul class="dropdown">
               <li><a href="TestAr.jsp"><i class="icon-user"></i>접속기록 확인</a></li>
               <li><a href="updateInfo.jsp"><i class="icon-cog"></i>회원정보수정</a></li>
               <li><a href="logout.jsp"><i class="icon-remove"></i>로그아웃</a></li>
            </ul>
         </div>
         ​
      </div>
      </section>

   </div>

   <!-- jQuery if needed -->
   <script type="text/javascript"
      src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
   <script type="text/javascript">
      function DropDown(el) {
         this.dd = el;
         this.initEvents();
      }
      DropDown.prototype = {
         initEvents : function() {
            var obj = this;

            obj.dd.on('click', function(event) {
               $(this).toggleClass('active');
               event.stopPropagation();
            });
         }
      }

      $(function() {

         var dd = new DropDown($('#dd'));

         $(document).click(function() {
            // all dropdowns
            $('.wrapper-dropdown-5').removeClass('active');
         });

      });
   </script>
	
	<!-- <h4><a href="Test.jsp">Test</a></h4>
	<h4><a href="TestAr.jsp">Test</a></h4>
	<a href="../Ranking_jsp/Ranking.jsp">랭킹</a> -->


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
							</a> <a class="plate" href="../Ranking_jsp/Ranking.jsp"> <i class="fa fa-trophy"
                        aria-hidden="true"></i>
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
							<a class="plate2" href="Test.jsp"> <i
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
