<%@page import="cosmos.login.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="cosmos.login.model.Member" />
<jsp:setProperty property="*" name="member" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
      MemberService service = MemberService.getInstance();
      int re = -1;

      try {
         re = service.insertMemberService(member);
      } catch (Exception e) {
         e.printStackTrace();
      }

      if (re > 0) {
   %>
      <script type="text/javascript">
         alert("회원가입에 성공하셨습니다");
         location.href = "login.jsp";
      </script>
   <%
      } else {
         %>
         <script type="text/javascript">
            alert("회원가입에 실패하셨습니다");
            location.href = "join.jsp";
         </script>   
         <%
      }
   %>
</body>
</html>