<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cosmos.multiple.model.MultipleChoice"%>
<%@page import="cosmos.multiple.model.MultipleService"%>
<%@page import="cosmos.multiple.model.Multiple"%>
<%! static int checkCount=0;
    static ArrayList<String>failList = new ArrayList<String>(); 
	static ArrayList<String>successList = new ArrayList<String>();%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%	
	MultipleService service = MultipleService.getInstance();	//답에대한 화면만 바꾸기 위한 체크
	if(request.getParameter("reCheckCount")!=null){
		failList = new ArrayList<String>();				//static failList 초기화
		successList = new ArrayList<String>();
		checkCount=0;
	}
	
	if(session.getAttribute("multipleSelect")!=null){
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
				failList = new ArrayList<String>();				//static failList 초기화
				successList = new ArrayList<String>();				//static successList 초기화
				}
				
				
				request.setAttribute("checkCount", checkCount);
				request.setAttribute("multipleSelectCount", multipleSelectCount);
				
				
					Multiple multipleSelect = multipleCount.get(checkCount);
					MultipleChoice multipleChoiceSelect = service.selectMultipleChoice(multipleSelect.getMultipleChoiceId());
					
					request.setAttribute("multipleSelect", multipleSelect);
					request.setAttribute("multipleChoiceSelect", multipleChoiceSelect);
					if(checkCount<multipleSelectCount){
						checkCount++;	//마지막 번호와 번호가 같아지면 순서 증가를 멈춘다.
					}else if(checkCount==multipleSelectCount){
						checkCount=0;
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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/kfonts2.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/MultipleJs/MultipleJavaScript.js"></script>
<link href="css/MultipleCss/MultipleMenu.css" rel="stylesheet" type="text/css">
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
    					<input type="radio" name="mulquestCategori" value="for문" id="sort-best"><label for="sort-best">for문</label>
   						<input type="radio" name="mulquestCategori" value="if문" id="sort-low"><label for="sort-low">if문</label>
    					<input type="radio" name="mulquestCategori" value="while문" id="sort-high"><label for="sort-high">while문</label>
    					<input type="radio" name="mulquestCategori" value="기초구문" id="sort-brand"><label for="sort-brand">기초구문</label>
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
     			<input type="submit" value="선택">             
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
	
	<div class="col-md-4">
		<div class="well well-large">
			<c:if test="${multipleSelect != null }">
				<div class="row-fluid"> 
					<div class="btn-group-vertical" role="group" aria-label="...">
						<div class="btn-group" data-toggle="buttons">
						  <label class="btn btn-primary" onclick = choiceButton()>
						  	<input type="hidden" name = "multipleChoiceSelectAnswer" value=${multipleSelect.mulquestAnswer }></input>
						    <input type="radio" name="multipleChoiceSelect" value=${multipleChoiceSelect.multipleChoiceOne } > ${multipleChoiceSelect.multipleChoiceOne }
						  </label>
						  <label class="btn btn-primary" onclick = choiceButton()>
						    <input type="radio" name="multipleChoiceSelect" value=${multipleChoiceSelect.multipleChoiceTwo } > ${multipleChoiceSelect.multipleChoiceTwo }
						  </label>
						  <label class="btn btn-primary" onclick = choiceButton()>
						    <input type="radio" name="multipleChoiceSelect" value=${multipleChoiceSelect.multipleChoiceThree } > ${multipleChoiceSelect.multipleChoiceThree }
						  </label>
						  <label class="btn btn-primary" onclick = choiceButton()>
						    <input type="radio" name="multipleChoiceSelect" value=${multipleChoiceSelect.multipleChoiceFour } > ${multipleChoiceSelect.multipleChoiceFour }
						  </label>
						</div>
					</div>
				</div>
				<div class="row-fluid" id="myCheckButton" style= "display:none" >
					<button type="button" id="myButton" class="btn btn-primary" onclick=selectMutlpleCheck() >
 						 [답 Check]
					</button>
				</div>
			 </c:if>
		</div>
			<div id="checkAnswer"></div>
			
			<br>
			<div id= "solveButton" style= "display:none">
				<c:if test="${checkCount<multipleSelectCount}">
					<input type="hidden" name= "solveSelectId" value=${multipleSelect.mulquestId } ></input>
					<input type="button" name="nextButton" value="다음" onclick=Next()>
				</c:if>
				<c:if test="${checkCount==multipleSelectCount && checkCount!=null }">
					<input type="hidden" name= "LastsolveSelectId" value=${multipleSelect.mulquestId } ></input>
					<input type="button" value="결과보기" onclick=resultMultiple()></input>
				</c:if>
			</div><!-- solveButton end  -->
		</div><!-- 3단 col end  -->
	</div><!-- clo 12 end  -->
</div><!-- main row -->
</body>
</html>