<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cosmos.multiple.model.MultipleChoice"%>
<%@page import="cosmos.multiple.model.MultipleService"%>
<%@page import="cosmos.multiple.model.Multiple"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%! static int PageCount; %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%	
	MultipleService service = MultipleService.getInstance();

	if(session.getAttribute("multipleSelect")!=null){
		
			List<Multiple> multipleCount = (List<Multiple>)session.getAttribute("multipleSelect");

			if(request.getParameter("count")==null){
				PageCount=0;
			}
			
			if(PageCount==0){
				Multiple multipleSelect = multipleCount.get(PageCount);
				MultipleChoice multipleChoiceSelect = service.selectMultipleChoice(multipleSelect.getMultipleChoiceId());
				
				request.setAttribute("multipleSelect", multipleSelect);
				request.setAttribute("multipleChoiceSelect", multipleChoiceSelect);
				PageCount++;
			}else{
				Multiple multipleSelect = multipleCount.get(PageCount);
				MultipleChoice multipleChoiceSelect = service.selectMultipleChoice(multipleSelect.getMultipleChoiceId());
				
				request.setAttribute("multipleSelect", multipleSelect);
				request.setAttribute("multipleChoiceSelect", multipleChoiceSelect);
				PageCount++;
			}
		}
		
		if(session.getAttribute("successCheck")!=null){
			String check = (String)session.getAttribute("successCheck");
			request.setAttribute("check", check);
		}else if(session.getAttribute("failCheck")!=null){
			String check = "정답은 : " + (String)session.getAttribute("failCheck");
			request.setAttribute("check", check);
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
		location.href= "MultipleMain.jsp?count=0"
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
				 	<small><cite title="Examiner">출제자-</cite>킹왕짱+${multipleSelect.mulquestExaminer }</small>
				</c:if>
		</div>
	
	</div>
	
	<div class="col-md-5">
		<div class="well well-large">
			<c:if test="${multipleSelect != null }">
				<form action="MultipleCheck.jsp" method="post">
				<div class="row-fluid"> 
					<div class="btn-group-vertical" role="group" aria-label="...">
						<input type="hidden" name = "mulquestAnswer" value= ${multipleSelect.mulquestAnswer }></input>
						<div class="btn-group" data-toggle="buttons">
						  <label class="btn btn-primary">
						    <input type="radio" name="multipleChoiceSelect" value=${multipleChoiceSelect.multipleChoiceOne } 
						    id="option1"> ${multipleChoiceSelect.multipleChoiceOne }
						  </label>
						  <label class="btn btn-primary">
						    <input type="radio" name="multipleChoiceSelect" value=${multipleChoiceSelect.multipleChoiceTwo } 
						    id="option2"> ${multipleChoiceSelect.multipleChoiceTwo }
						  </label>
						  <label class="btn btn-primary">
						    <input type="radio" name="multipleChoiceSelect" value=${multipleChoiceSelect.multipleChoiceThree }
						     id="option3"> ${multipleChoiceSelect.multipleChoiceThree }
						  </label>
						  <label class="btn btn-primary">
						    <input type="radio" name="multipleChoiceSelect" value=${multipleChoiceSelect.multipleChoiceFour } 
						    id="option4"> ${multipleChoiceSelect.multipleChoiceFour }
						  </label>
						</div>
					</div>
				</div>
				<div class="row-md-6">
					<button type="submit" id="myButton" class="btn btn-primary">
 						 [답 Check]
					</button>
				</div>
				</form>
			 </c:if>
		</div>
			${check }
			<br>
			<input type="button" value="다음" onclick=Next()>
	</div>
	</div>
</body>
</html>