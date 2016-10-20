<%@page import="cosmos.login.model.Login"%>
<%@page import="cosmos.login.model.LoginService"%>
<%@page import="cosmos.login.model.Member"%>
<%@page import="java.util.List"%>
<%@page import="cosmos.login.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   request.setCharacterEncoding("utf-8");
   String memberID = request.getParameter("memberID");
   String memberPw = request.getParameter("memberPw");
   String memberName = null;

   if (memberID != null && memberPw != null) {
      MemberService service = MemberService.getInstance();
      List<Member> mlist = service.listMemberService();
      //멤버에 있는 애들 갖고오기 mlist

      LoginService loservice = LoginService.getInstance();
      Login login = loservice.checkCurrentLoginMember(memberID);

      //중복로그인을 위해 현재접속중인 애를 갖고온다.
      int re = -1;

      for (int i = 0; i < mlist.size(); i++) {

         Member m = mlist.get(i);
         //가입한 회원인지 찾는다
         if (m.getMemberID().equals(memberID)
               && m.getMemberPw().equals(memberPw)) {

            if (login != null) {
               response.sendRedirect("login_fail.jsp");
            } else {
               memberName = m.getMemberName();
               Login clogin = new Login();
               clogin.setMemberID(memberID);
               clogin.setMemberName(memberName);
               session.setAttribute("memberName", memberName);
               session.setAttribute("memberID", memberID);

               try {
                  re = loservice
                        .currentLoginMemberService(clogin);
               } catch (Exception e) {
                  e.printStackTrace();
               }
               response.sendRedirect("log_main.jsp");
               return;
            }
         }
      }
   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/Log_css/login.css" rel="stylesheet" type="text/css"></link>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>COSMOS</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/Log_css/font-awesome.min.css"
   rel="stylesheet" type="text/css">
<link
   href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
   rel='stylesheet' type='text/css'>
<link
   href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
   rel='stylesheet' type='text/css'>
<link href="../css/Log_css/magnific-popup.css" rel="stylesheet">
<link href="../css/Log_css/creative.min.css" rel="stylesheet">
</head>
<body id="page-top">

   <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
         <!-- Brand and toggle get grouped for better mobile display -->
         <div class="navbar-header">
            <a class="navbar-brand page-scroll" href="#page-top">COSMOS</a>
         </div>
      </div>
   </nav>

   <header>
      <div class="header-content">
         <div class="header-content-inner">
            <h1 id="homeHeading">With you, COSMOS</h1>
            <hr>
            <p>COSMOS와 함께 당신의 실력을 키워보세요!</p>
            <a href="#about" class="btn btn-primary btn-xl page-scroll">START
               COSMOS</a>
         </div>
      </div>
   </header>

   <section class="bg-primary" id="about">
      <br><br><br><br>
      <div class="container">
         <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center"></div>

            <form action="login.jsp" method="post">
            <h2>
               <span class="entypo-login"></span> Login
            </h2>
            <button type="submit" class="submit">
               <span class="entypo-lock"><i class="fa fa-arrow-right" aria-hidden="true"></i></span>
            </button>
            <span class="entypo-user inputUserIcon"><i class="fa fa-user" aria-hidden="true"></i></span> <input type="text"
               class="user" placeholder="id" name="memberID" /> <span
               class="entypo-key inputPassIcon"><i class="fa fa-lock" aria-hidden="true"></i></span> <input type="password"
               class="pass" placeholder="password" name="memberPw" />

            <div class="join">
               <a href="join.jsp">아직 회원이 아니세요?</a>
            </div>
         </form>
         </div>
      </div>
      <br><br><br><br><br><br><br><br>
   </section>

   <!-- jQuery -->
   <script src="../js/jquery.min.js"></script>

   <!-- Bootstrap Core JavaScript -->
   <script src="../js/bootstrap.min.js"></script>

   <!-- Plugin JavaScript -->
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
   <script src="../js/Log_js/scrollreveal.min.js"></script>

   <!-- Theme JavaScript -->
   <script src="../js/Log_js/creative.min.js"></script>
</body>
</html>
