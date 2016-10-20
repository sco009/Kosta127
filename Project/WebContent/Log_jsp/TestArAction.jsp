<%@page import="net.sf.json.JSONArray"%>
<%@page import="cosmos.login.model.MemberService"%>
<%@page import="cosmos.login.model.AccessRecord"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberid = (String) session.getAttribute("memberID");
	List<AccessRecord> list = MemberService.getInstance().printAccessRecordService(memberid);
	
	JSONArray jsonArray = JSONArray.fromObject(list);
	String json = jsonArray.toString();

	out.print(json);
%>
