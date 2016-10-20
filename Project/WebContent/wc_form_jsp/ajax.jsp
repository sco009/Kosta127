<%@page import="cosmos.compile.model.WC_CompileService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
	String wc_result = "";
	String wc_code = "";
	
	if(request.getParameter("wc_code")!=null && !(request.getParameter("wc_code").equals(""))){
		wc_code = (String)request.getParameter("wc_code");
		
		WC_CompileService wc_service = WC_CompileService.wc_getInstance();
		wc_result = wc_service.wc_getResultCompile(wc_code);
	}
	
	out.print(wc_result);
%>