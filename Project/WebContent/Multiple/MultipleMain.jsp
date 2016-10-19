<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cosmos.multiple.model.MultipleChoice"%>
<%@page import="cosmos.multiple.model.MultipleService"%>
<%@page import="cosmos.multiple.model.Multiple"%>
<%! static int checkCount=0;	//문제수를 카운팅
    static ArrayList<String>failList = new ArrayList<String>(); 
	static ArrayList<String>successList = new ArrayList<String>();%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%	
	if(session.getAttribute("memberID")==null){
		response.sendRedirect("../Log_jsp/log_main.jsp");
	}
	MultipleService service = MultipleService.getInstance();	
	if(request.getParameter("reCheckCount")!=null){		//문제풀이중 카테고리, 난이도를 재설정했을 때를 위해
		failList = new ArrayList<String>();				//static변수들을 초기화 해준다.
		successList = new ArrayList<String>();			
		checkCount=0;
	}
	
	if(session.getAttribute("multipleSelect")!=null){		//카테고리와 난이도를 선택했을 시
			int multipleSelectCount = (int)session.getAttribute("multipleSelectCount")-1;
				List<Multiple> multipleCount = (List<Multiple>)session.getAttribute("multipleSelect");
				
				request.setAttribute("checkCount", checkCount);
			if(request.getParameter("solveFailId")!=null){				  
				failList.add(request.getParameter("solveFailId"));		  //틀린 문제 번호를 리스트에 담기.
			}else if(request.getParameter("solveSuccessId")!=null){
				successList.add(request.getParameter("solveSuccessId"));  //맞은 문제 번호를 리스트에 담기.
			}
				
			if(checkCount==multipleSelectCount){					
				session.setAttribute("failList", failList);			//틀린문제 세션에 담기
				session.setAttribute("successList", successList);	//맞은문제 세션에 담기
			 	failList = new ArrayList<String>();				//마지막 문제 까지 재설정없이 다 풀면 static list 변수들을 초기화 해준다.
				successList = new ArrayList<String>();			 
				}
				
				
				request.setAttribute("checkCount", checkCount);
				request.setAttribute("multipleSelectCount", multipleSelectCount);
				
				
					Multiple multipleSelect = multipleCount.get(checkCount);
					MultipleChoice multipleChoiceSelect = service.selectMultipleChoice(multipleSelect.getMultipleChoiceId());
					
					request.setAttribute("multipleSelect", multipleSelect);
					request.setAttribute("multipleChoiceSelect", multipleChoiceSelect);
					if(checkCount<multipleSelectCount){
						checkCount++;	//문제를 불러오기 위해 카운트값을 증가 시킨다..
					}else if(checkCount==multipleSelectCount){
						checkCount=0;	//마지막번호와 번호가 같아지면 순서 증가를 멈춘다.
					}
			}
		
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Cosmos</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/MultipleJs/MultipleJavaScript.js"></script>
<link href="../css/MultipleCss/MultipleMenu.css" rel="stylesheet" type="text/css">
<link href="../css/MultipleCss/MultipleRadioButton.css" rel="stylesheet" type="text/css">
<jsp:include page="../Log_module/header.jsp" />
</head>
<body>


	<div class="row-fluid">
		<div class="col-md-12">
    		<div class="row-fluid">
     			<label class="large label green"><b>카테고리:</b> ${multipleSelect.mulquestCategori }</label>
     			<label class="large label green"><b>난이도 :</b>${multipleSelect.mulquestLevel }</label>
         	</div>
         	
  		 <div class="col-md-3 col-md-offset-1*">
  		 	<form action="MultipleMainSend.jsp" method="POST">
   	 			<div class="row-fluid">
   
   					<span class="dropdown-el " id="drop">
   						<input type="radio" name="mulquestCategori" checked="checked" value="sort-list" ><label for="sort-relevance">카테고리</label>
    					<input type="radio" name="mulquestCategori" value="variable" id="sort-1"><label for="sort-1">variable</label>
    					<input type="radio" name="mulquestCategori" value="for문" id="sort-2"><label for="sort-2">for문</label>
   						<input type="radio" name="mulquestCategori" value="if문" id="sort-3"><label for="sort-3">if문</label>
    					<input type="radio" name="mulquestCategori" value="while문" id="sort-4"><label for="sort-4">while문</label>
    					<input type="radio" name="mulquestCategori" value="정렬" id="sort-5"><label for="sort-5">정렬</label>
    					<input type="radio" name="mulquestCategori" value="객체지향" id="sort-6"><label for="sort-6">객체지향</label>
  					</span>
  	 			</div><!-- 1번 col row end -->
   	 	
   	 	<div class="row-fluid">
   	 		<span class="dropdown-els " id="drop">
    			<input type="radio" name="mulquestLevel" checked="checked" value="sort-list" ><label for="sort_level">난이도</label>
    			<input type="radio" name="mulquestLevel" value="상" id="sort_h"><label for="sort_h">상</label>
    			<input type="radio" name="mulquestLevel" value="중" id="sort_m"><label for="sort_m">중</label>
    			<input type="radio" name="mulquestLevel" value="하" id="sort_d"><label for="sort_d">하</label>
  	 		</span>
  	 	</div>
     
  	 	<div clsass="row-fluid">
   	 		<br>
     			<input class = "multipleSelect_css" type="submit" value="선택">             
  	 	</div>
  	 </form>
  </div><!--1번 col row end -->

	<div class="col-md-4">
		<div class="well well-large problem">
			 ${multipleSelect.mulquestContent }
			 	<br>
				<c:if test="${multipleSelect!=null }">
					<br>
				 	<small><cite title="Examiner">출제자-</cite>킹왕짱+${multipleSelect.mulquestExaminer }</small>
				</c:if>
		</div>
	
	</div><!--2단 end  -->
	
	<div class="col-md-4 checkd">
      <div class="well well-large">
         <!-- 유형이 선택되야만 보기가 보여짐 -->
         <c:if test="${multipleSelect != null }">
         <!-- 보기 시작 -->
            <div>
               <input type="hidden" name = "multipleChoiceSelectAnswer" value=${multipleSelect.multipleAnswer }>
                <input type="radio" name="multipleChoiceSelect" id="radio-option-1" value=${multipleChoiceSelect.multipleChoiceOne} onclick = choiceButton() />
                 <label for="radio-option-1">  ${multipleChoiceSelect.multipleChoiceOne } </label>
            </div>
            <div>
                <input type="radio" name="multipleChoiceSelect" id="radio-option-2" value=${multipleChoiceSelect.multipleChoiceTwo} onclick = choiceButton() />
                 <label for="radio-option-2">  ${multipleChoiceSelect.multipleChoiceTwo } </label>
            </div>
            <div>
                <input type="radio" name="multipleChoiceSelect" id="radio-option-3" value=${multipleChoiceSelect.multipleChoiceThree} onclick = choiceButton() />
                 <label for="radio-option-3">  ${multipleChoiceSelect.multipleChoiceThree} </label>
            </div>
            <div>
                <input type="radio" name="multipleChoiceSelect" id="radio-option-4" value=${multipleChoiceSelect.multipleChoiceFour} onclick = choiceButton() />
                 <label for="radio-option-4">  ${multipleChoiceSelect.multipleChoiceFour} </label>
            </div>
            
            <div id="myCheckButton" style= "display:none" >
               
               <input type="button" class="multipleSelect_css" value="답 Check"  onclick=selectMutlpleCheck()>
            </div>
         <!-- 보기 끝 -->
          </c:if><!-- 유형이 선택되야만 보기가 보여짐 end -->
      </div>
         <div id="checkAnswer"></div>
         
         <br>
         <div id= "solveButton" style= "display:none" >
            <c:if test="${checkCount<multipleSelectCount}">
               <input type="hidden" name= "solveSelectId" value=${multipleSelect.mulquestId } ></input>
               <input type="button" name="nextButton" value="다음" class="multipleSelect_css" onclick=Next()>
            </c:if>
            <c:if test="${checkCount==multipleSelectCount && checkCount!=null }">
               <input type="hidden" name= "LastsolveSelectId" value=${multipleSelect.mulquestId } ></input>
               <input type="button" value="결과보기" class="multipleSelect_css" onclick=resultMultiple()></input>
            </c:if>
         </div><!-- solveButton end  -->
      </div><!-- 3단 col end  -->
	</div><!-- clo 12 end  -->
</div><!-- main row -->
</body>
</html>