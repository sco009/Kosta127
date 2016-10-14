<%@page import="cosmos.multiple.model.MultipleService"%>
<%@page import="cosmos.multiple.model.Multiple"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! ArrayList<Multiple>reMultiple = new ArrayList<Multiple>();
	int successCount; 
 	int failCount; %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <%    
    MultipleService service = MultipleService.getInstance();
    ArrayList<String> failList = (ArrayList<String>)session.getAttribute("failList");
    ArrayList<String> successList = (ArrayList<String>)session.getAttribute("successList");
	
    
    failList.add(request.getParameter("solveFailId"));			//마지막 문제 맞았는지 틀렸는지 체크해서 리스트에 추가
    successList.add(request.getParameter("solveSuccessId"));	//마지막 문제 맞았는지 틀렸는지 체크해서 리스트에 추가
    for(int i=0; i<failList.size(); i++){
    	reMultiple.add(service.reMultiple(failList.get(i)));
    }
    request.setAttribute("reMultiple", reMultiple);
    	
    failCount = failList.size();								//진행바를 위해 틀린갯수 변수에 담기
    successCount = successList.size()-1;						//진행바를 위해 맞은갯수 변수에 담기
    int totalProgress = failCount+successCount;					//진행바를 위해 총갯수 변수에 담기
    int successProgress = (100*successCount)/totalProgress;		//진행바를 위해 총갯수에 대한 퍼센티지 변수에 담기
    
    request.setAttribute("successProgress", successProgress);
    request.setAttribute("failList", failList);
    request.setAttribute("successList", successList);
    
    session.removeAttribute("failList");
    session.removeAttribute("successList");
    session.removeAttribute("multipleSelect");
    request.removeAttribute("solveSuccessId");
    request.removeAttribute("solveFailId");
    	
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/MultipleJs/MultipleJavaScript.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/kfonts2.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>cosmos</title>
</head>
<body>
	<div class="progress">
  		<div class="progress-bar" role="progressbar" aria-valuenow=${successProgress } aria-valuemin="0" aria-valuemax="100" style="width:${successProgress }%;">
    		Success : ${successProgress }%
  		</div>
	</div>

	<c:forEach var="reMultiple" items="${reMultiple }" begin="0" end="${reMultiple.size() }">
			<c:if test="${reMultiple !=null }">
				<label>틀린문제 : ${reMultiple.mulquestId }</label>

				<div class="container">

	<button type="button" class="btn btn-default" title="Popover title" data-container="body" 
	data-toggle="popover" data-placement="right" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus.">
		Popover on right
	</button>

	</div>
			
				<!-- <button type="button" class="btn btn-lg btn-danger" data-toggle="popover" 
				title="asd" data-content="asd" >
				다시한번 보기</button> -->
				
				<br>
			</c:if>
	</c:forEach>
	
	<c:forEach var="success" items="${successList }" begin="0" end="${successList.size() }">
		<c:if test="${success !=null }">
			<p>맞춘문제 : ${success }</p><br>
		</c:if>
	</c:forEach>
	
	<input type=button value="돌아가기" onclick=returnMultipleMain()></input>
	
</body>
</html>