
<%@page import="net.sf.json.JSONArray"%>
<%@page import="cosmos.login.model.LoginService"%>
<%@page import="cosmos.login.model.Login"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//currentList 가져오기
	List<Login> list = LoginService.getInstance().currentLoginMemberPrintService();
	
	JSONArray jsonArray = JSONArray.fromObject(list);
	
	String json = jsonArray.toString();
	
	out.print(json);
	
%>
