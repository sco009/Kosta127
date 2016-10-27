<%@page import="cosmos.ranking.model.CodeRanking"%>
<%@page import="cosmos.ranking.model.AlgoRanking"%>
<%@page import="java.util.List"%>
<%@page import="cosmos.ranking.model.RankingService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	RankingService service = RankingService.getInstance();

	List<AlgoRanking> algoList = service.selectAlgoRanking();

	List<CodeRanking> codeList = service.selectCodeRanking();

	request.setAttribute("algoList", algoList);
	request.setAttribute("codeList", codeList);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../Log_module/header.jsp" /><br>
<br>
<br>

<title>Cosmos</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/Ranking_css/Ranking.css" rel="stylesheet">

<!-- Bootstrap -->
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../css/bootstrap/bootstrap.min.js"></script>
<script src="../css/bootstrap/main.js"></script>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link href="../css/Ranking_css/ranking.css" rel="stylesheet"
	type="text/css">

</head>
<body id='body'>


	<div id="main">
		<div class="col-md-6">
			<h2 align="center">학습 문제 랭킹</h2>

			<div class="wrapper">

				<div class="table">

					<div class="row header">
						<div class="cell">순위</div>
						<div class="cell">이름</div>
						<div class="cell">포인트</div>
					</div>


					<c:forEach var="list" items="${algoList}" varStatus="status">
						<div class="row">
							<div class="cell">${list.algo_ranking }</div>
							<div class="cell">${list.memberName }</div>
							<div class="cell">${list.algo_point }</div>
						</div>
					</c:forEach>

				</div>

			</div>
		</div>
		<div class="col-md-6">
			<h2 align="center">코드파이트 랭킹</h2>

			<div class="wrapper">

				<div class="table">

					<div class="row header">
						<div class="cell">순위</div>
						<div class="cell">이름</div>
						<div class="cell">포인트</div>
					</div>


					<c:forEach var="list" items="${codeList}" varStatus="status">
						<div class="row">
							<div class="cell">${list.code_ranking }</div>
							<div class="cell">${list.memberName }</div>
							<div class="cell">${list.code_point }</div>
						</div>
					</c:forEach>

				</div>

			</div>
		</div>
	</div>





</body>
</html>