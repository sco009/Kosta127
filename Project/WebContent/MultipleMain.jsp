<%@page import="cosmos.multiple.model.MultipleService"%>
<%@page import="cosmos.multiple.model.Multiple"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<%	
	MultipleService service = MultipleService.getInstance();
	
	if (session.getAttribute("content") != null) {
		Multiple multipleSelect = (Multiple)session.getAttribute("multipleSelect");
		request.setAttribute("mulquestCategori", multipleSelect.getMulquestCategori());
		request.setAttribute("mulquestLevel", multipleSelect.getMulquestLevel());
		request.setAttribute("mulquestExaminer", multipleSelect.getMulquestExaminer());
		
		String content = (String)request.getAttribute("content");
		request.setAttribute("content", content);
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>


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
						<c:if test="${mulquestCategori!=null }">
								${mulquestCategori }
						</c:if>
						<c:if test="${mulquestCategori==null }">
							카테고리 선택
						</c:if>
						</button>

					<div class="modal fade bs-example-modal-sm-1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  						<div class="modal-dialog modal-sm-1">
    						<div class="modal-content">
								<input type="radio" name="mulquestCategori" value="for문">for문</input> 
								<input type="radio" name="mulquestCategori" value="if문">if문</input> 
								<input type="radio" name="mulquestCategori" value="while문">while문</input> 
								<input type="radio" name="mulquestCategori" value="기초구문">기초구문</input>
							</div>
						</div>
					</div>

				</td>
			</tr>

			<tr>
				<td>
				<button type="button" class="btn btn-primary" data-toggle="modal" 
					data-target=".bs-example-modal-sm">
						<c:if test="${mulquestLevel!=null }">
							${mulquestLevel }
						</c:if>
						<c:if test="${mulquestLevel==null }">
							난이도 선택
						</c:if>
				
				</button>
					<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  						<div class="modal-dialog modal-sm">
    						<div class="modal-content">
      							<input type="radio" name="mulquestLevel" value="상">상</input> 
      							<input type="radio" name="mulquestLevel" value="중">중 </input> 
      							<input type="radio" name="mulquestLevel" value="하">하 </input>
    						</div>
  						</div>
					</div>	
				</td>
			</tr>
			
			<tr>
				<td><input type="submit" value="선택"></td>
			</tr>
		</table>
	</form>
	</div>
	
	<div class="col-md-6">
		<div class="well well-large">
			 ${content }
		</div>
		<c:if test="${muquestExaminer!=null }">
			 	<small><cite title="Examiner">출제자-</cite>${mulquestExaminer }</small>
		</c:if>
	</div>
	
	<div class="col-md-5">
		<div class="well well-large">
			 ${content}
		</div>
	</div>
	</div>
</body>
</html>