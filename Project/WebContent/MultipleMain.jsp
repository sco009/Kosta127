<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cosmos.multiple.model.MultipleChoice"%>
<%@page import="cosmos.multiple.model.MultipleService"%>
<%@page import="cosmos.multiple.model.Multiple"%>
<%! static int checkCount=0; %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%! static int PageCount=0; %> --%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%	
	MultipleService service = MultipleService.getInstance();	//답에대한 화면만 바꾸기 위한 체크
	
	if(session.getAttribute("multipleSelect")!=null){
				int multipleSelectCount = (int)session.getAttribute("multipleSelectCount")-1;
				List<Multiple> multipleCount = (List<Multiple>)session.getAttribute("multipleSelect");
				ArrayList<String>failList = new ArrayList<String>();
				
				failList.add(request.getParameter("solveSelectId"));	//틀린 문제 번호를 리스트에 담기.
				request.setAttribute("failList", failList);				
				
				request.setAttribute("checkCount", checkCount);
				request.setAttribute("multipleSelectCount", multipleSelectCount);
				
				
					Multiple multipleSelect = multipleCount.get(checkCount);
					MultipleChoice multipleChoiceSelect = service.selectMultipleChoice(multipleSelect.getMultipleChoiceId());
					
					request.setAttribute("multipleSelect", multipleSelect);
					request.setAttribute("multipleChoiceSelect", multipleChoiceSelect);
					if(checkCount<multipleSelectCount){
						checkCount++;	//마지막 번호와 번호가 같아지면 순서 증가를 멈춘다.
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
<script type="text/javascript">
	function Next() {
		var selectAnswer = $(":input:radio[name=multipleChoiceSelect]:checked").val();	//다음페이지로 넘어갈때 틀린 문제 아이디를 받기 위해.
		var Answer = $(":input:hidden[name=multipleChoiceSelectAnswer]").val();
		var solveSelectId =$(":input:hidden[name=solveSelectId]").val();
		if(selectAnswer!==Answer){
			location.href= "MultipleMain.jsp?solveSelectId=" + solveSelectId;
		}else{
			location.href="MultipleMain.jsp";
		}
	}
	function selectMutlpleCheck() {
		
		var selectAnswer = $(":input:radio[name=multipleChoiceSelect]:checked").val();
		var Answer = $(":input:hidden[name=multipleChoiceSelectAnswer]").val();		//선택된 문제에 해당하는 값 가져오기
		var check = "";
		
		if(selectAnswer===Answer){
			check = "O";
		}else if(selectAnswer!==Answer){
			check = "X";
		}
		document.getElementById("checkAnswer").innerHTML = check;	//선택된 문제에 해당하는 답 출력하기	
	}
	function resultMultiple() {
		respon
	}
	
</script>


</head>
<body>
	 <div class="row-fluid">
	<div class="col-md-1">
	<form action="MultipleMainSend.jsp" method="POST">
		<table>
			<tr>
				<td>
					<button type="button" class="btn btn-primary" data-toggle="modal" 
					data-target=".bs-example-modal-sm-1">
						<c:if test="${multipleSelect!=null }">
								${multipleSelect.mulquestCategori }
						</c:if>
						<c:if test="${multipleSelect==null }">
							카테고리 선택
						</c:if>
						</button>

					<div class="modal fade bs-example-modal-sm-1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  						<div class="modal-dialog modal-sm-1">
    						<div class="modal-content">
    							<div class="btn-group" data-toggle="buttons">
  									<label class="btn btn-primary active">
  								  		<input type="radio" name="mulquestCategori" id="option1" value="for문" >for문
 									 </label>
  									<label class="btn btn-primary">
   										 <input type="radio" name="mulquestCategori" id="option2" value="if문" > if문
  									</label>
  									<label class="btn btn-primary">
   										 <input type="radio" name="mulquestCategori" id="option3" value="while문" > while문
  									</label>
  									<label class="btn btn-primary">
   										 <input type="radio" name="mulquestCategori" id="option3" value="기초구문" > 기초구문
  									</label>
								</div>
							</div>
						</div>
					</div>

				</td>
			</tr>

			<tr>
				<td>
				<button type="button" class="btn btn-primary" data-toggle="modal" 
					data-target=".bs-example-modal-sm">
						<c:if test="${multipleSelect!=null }">
							${multipleSelect.mulquestLevel }
						</c:if>
						<c:if test="${multipleSelect==null }">
							난이도 선택
						</c:if>
				
				</button>
					<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  						<div class="modal-dialog modal-sm">
    						<div class="modal-content">
    							<div class="btn-group" data-toggle="buttons">
 									<label class="btn btn-primary active">
   		 								<input type="radio" name="mulquestLevel" value="상" id="option1" > 상
  									</label>
  									<label class="btn btn-primary">
    									<input type="radio" name="mulquestLevel" value="중" id="option2" > 중
  									</label>
  									<label class="btn btn-primary">
    									<input type="radio" name="mulquestLevel" value="하" id="option3" > 하
  									</label>
  								</div>
							</div>	
						</div>
					</div>
				</td>
			</tr>
			
			<tr>
				<td>
				<button type="submit" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off">
 					 선택
				</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<div class="col-md-1"></div>
	<div class="col-md-5">
		<div class="well well-large problem">
			 ${multipleSelect.mulquestContent }
			 	<br>
				<c:if test="${multipleSelect!=null }">
					<br>
				 	<small><cite title="Examiner">출제자-</cite>킹왕짱+${multipleSelect.mulquestExaminer }</small>
				</c:if>
		</div>
	
	</div>
	
	<div class="col-md-5">
		<div class="well well-large">
			<c:if test="${multipleSelect != null }">
				<div class="row-fluid"> 
					<div class="btn-group-vertical" role="group" aria-label="...">
						<div class="btn-group" data-toggle="buttons">
						  <label class="btn btn-primary">
						  	<input type="hidden" name = "multipleChoiceSelectAnswer" value=${multipleSelect.mulquestAnswer }></input>
						    <input type="radio" name="multipleChoiceSelect" value=${multipleChoiceSelect.multipleChoiceOne } > ${multipleChoiceSelect.multipleChoiceOne }
						  </label>
						  <label class="btn btn-primary">
						    <input type="radio" name="multipleChoiceSelect" value=${multipleChoiceSelect.multipleChoiceTwo } > ${multipleChoiceSelect.multipleChoiceTwo }
						  </label>
						  <label class="btn btn-primary">
						    <input type="radio" name="multipleChoiceSelect" value=${multipleChoiceSelect.multipleChoiceThree }> ${multipleChoiceSelect.multipleChoiceThree }
						  </label>
						  <label class="btn btn-primary">
						    <input type="radio" name="multipleChoiceSelect" value=${multipleChoiceSelect.multipleChoiceFour }> ${multipleChoiceSelect.multipleChoiceFour }
						  </label>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<button type="button" id="myButton" class="btn btn-primary" onclick=selectMutlpleCheck()>
 						 [답 Check]
					</button>
				</div>
			 </c:if>
		</div>
			<div id="checkAnswer"></div>
			
			<br>
			<c:if test="${checkCount<multipleSelectCount}">
				<input type="hidden" name= "solveSelectId" value=${multipleSelect.mulquestId } ></input>
				<input type="button" name="nextButton" value="다음" onclick=Next()>
			</c:if>
			<c:if test="${checkCount==multipleSelectCount && checkCount!=null }">
				<form action="resultMultiple.jsp" method="post">
				<input type="hidden" name="failList" value=${failList } ></input>
				<input type="submit" value="결과보기"></input>
				</form>
				<% checkCount=0; %>
			</c:if>
		</div>
	</div>
</body>
</html>