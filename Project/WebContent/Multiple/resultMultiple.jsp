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
	
    if(request.getParameter("solveFailId")!=null){
        failList.add(request.getParameter("solveFailId"));			//마지막 문제 맞았는지 틀렸는지 체크해서 리스트에 추가
    }else if(request.getParameter("solveSuccessId")!=null){
        successList.add(request.getParameter("solveSuccessId"));	//마지막 문제 맞았는지 틀렸는지 체크해서 리스트에 추가
    }
    
    if(failList !=null){
    	for(int i=0; i<failList.size(); i++){
        	reMultiple.add(service.reMultiple(failList.get(i)));
        }
    }
    
    
    request.setAttribute("reMultiple", reMultiple);
    	
    failCount = failList.size();								//진행바를 위해 틀린갯수 변수에 담기
    successCount = successList.size();						//진행바를 위해 맞은갯수 변수에 담기
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
    reMultiple = new ArrayList<Multiple>();	//저장된 오답들을 초기화한다.
    	
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../js/MultipleJs/MultipleJavaScript.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/kfonts2.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
       $(document).ready(function() {
            $('[data-toggle="popover"]').popover({container: "body"});
       });
</script>
<title>cosmos</title>
</head>
<body>
	<div class="col-md-3 col-md-offset-1">
		<div class="progress">
			<div class="progress-bar" role="progressbar"
				aria-valuenow=${successProgress } aria-valuemin="0"
				aria-valuemax="100" style="width:${successProgress }%;">
				Success : ${successProgress }%
			</div>
		</div>
	</div>
	
	<div class="col-md-4">
		<c:forEach var="reMultiple" items="${reMultiple }" begin="0"
					end="${reMultiple.size() }">
			<c:if test="${failList !=null }">
			<div class="col-md-4">
			<label>틀린문제 : ${reMultiple.mulquestId }</label>
				<div class="container">
					<button type="button" class="btn btn-default" title= "문제내용 : ${reMultiple.mulquestContent }"
						data-container="body" data-toggle="popover" data-placement="right"
						data-content= "답 : ${reMultiple.mulquestAnswer }">
						문제번호 : ${reMultiple.mulquestId }</button>								<!-- 틀린문제 정보 보여주기 -->
				</div>
			<br>
			</div>
		 </c:if>
		
	</c:forEach>
	</div>
	<input type=button value="돌아가기" onclick=returnMultipleMain()></input>

</body>
</html>