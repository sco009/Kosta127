<%@page import="cosmos.multiple.model.MultipleService"%>
<%@page import="cosmos.multiple.model.Multiple"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%! ArrayList<Multiple>reMultiple = new ArrayList<Multiple>();
	ArrayList<Multiple>pointMultiple = new ArrayList<Multiple>();
	int successCount; 
 	int failCount; %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%    
    MultipleService service = MultipleService.getInstance();
	
    ArrayList<String> failList = (ArrayList<String>)session.getAttribute("failList");
    ArrayList<String> successList = (ArrayList<String>)session.getAttribute("successList");
	
    if(request.getParameter("solveFailId")!=null){
        failList.add(request.getParameter("solveFailId"));			//마지막 문제 맞았는지 틀렸는지 체크해서 리스트에 추가
    }else if(request.getParameter("solveSuccessId")!=null){
        successList.add(request.getParameter("solveSuccessId"));	//마지막 문제 맞았는지 틀렸는지 체크해서 리스트에 추가
    }
    
    if(failList.size()>0){
    	for(int i=0; i<failList.size(); i++){
        	reMultiple.add(service.reMultiple(failList.get(i)));
        }
    }
    
    if(successList.size()>0){
    	for(int i=0; i<successList.size(); i++){
    		pointMultiple.add(service.reMultiple(successList.get(i)));
    	}
    	int successPoint = pointMultiple.get(0).getMulquestPoint();		//정답인 문제의 Point값 뽑아오기.
    }
    
    
    request.setAttribute("reMultiple", reMultiple);
    	
    failCount = failList.size();								//틀린갯수 변수에 담기
    successCount = successList.size();							//맞은갯수 변수에 담기
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
    
    pointMultiple = new ArrayList<Multiple>();
    reMultiple = new ArrayList<Multiple>();	//저장된 오답들을 초기화한다.
    	
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="../js/MultipleJs/MultipleJavaScript.js"></script>
<link href="../css/MultipleCss/MultipleMenu.css" rel="stylesheet" type="text/css">

<title>Cosmos</title>
</head>
<body>
<jsp:include page="../Log_module/header.jsp" />
<br><br><br>
		
	<div class="col-md-12">
		<c:if test="${successProgress !=100 }">
		<div class="progress">
			<c:if test="${successProgress!=0 }">
			<div class="progress-bar" role="progressbar"
				aria-valuenow=${successProgress } aria-valuemin="0"
				aria-valuemax="100" style="width:${successProgress }%;">
				Success : ${successProgress }%
			</div>
			</c:if>
			<c:if test="${successProgress==0 }">
			<div class="progress-bar" role="progressbar"
				aria-valuenow=100 aria-valuemin="0"
				aria-valuemax="100" style="width:100%;">
				Success : 0
			</c:if>
		</div>
		</c:if>
		<c:if test="${successProgress==100 }">
				<img src='../MultipleImage/total100.jpg'>
		</c:if>
	</div>
	
	<div class="col-md-12">
		<c:forEach var="reMultiple" items="${reMultiple }" begin="0"
					end="${reMultiple.size() }">
			<c:if test="${failList !=null }">
					<label class="row-md">틀린문제 : ${reMultiple.mulquestId }</label>
								<button type="button" class="btn btn-default" title= "문제내용 : ${reMultiple.mulquestContent }"
										data-container="body" data-toggle="popover" data-placement="right"
										data-content= "답 : ${reMultiple.multipleAnswer }">
										틀린문제 상세보기</button>								<!-- 틀린문제 정보 보여주기 -->
						<br>
		 	</c:if>
	</c:forEach>
	</div>
	<br>
	<br>
	<input type=button class = "multipleSelect_css returnButton" value="돌아가기" onclick=returnMultipleMain()></input>
	
</body>
</html>