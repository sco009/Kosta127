<%@page import="cosmos.login.model.Member"%>
<%@page import="java.util.List"%>
<%@page import="cosmos.login.model.MemberService"%>
<%@page import="cosmos.login.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="../js/common.js" charset="UTF8"></script>
<title>Insert title here</title>
</head>
<body>

<form name=frm>
<table border="2">
 <tr>
  <td>memberID</td>
  <td>memberName</td>
 </tr>
 
<%
 // DAO 객체 생성
 MemberDao dao = new MemberDao();
 // dao 객체의 메소드를 이용해서 테이블의 정보 가져오기
 MemberService service = MemberService.getInstance();
 List<Member> list = service.logMemberListService();
 
 
 for(Member member: list){
%>
 <tr>
  <td>   
   <input type="text" name=logMemberID value=<%= member.getMemberID() %>>
  </td>
  <td>   
   <input type="text" name=logMemberName value=<%= member.getMemberName() %>>
  </td>
  
 </tr>
<%   
 }
%>
</table>
</form>
</body>
</html>
