<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap/kfonts2.css" rel="stylesheet">
<link href="../css/custom1.css" rel="stylesheet">
<link href="../css/custom2.css" rel="stylesheet">
<link href="../css/group/creategroup.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">





$(function () {
	  $('#contact-list').searchable({
	        searchField: '#contact-list-search',
	        selector: 'li',
	        childSelector: '.col-xs-12',
	        show: function( elem ) {
	            elem.slideDown(100);
	        },
	        hide: function( elem ) {
	            elem.slideUp( 100 );
	        }
	    })
	
});


</script>
</head>
<body>
	<div class="container">

		<button class="btn btn-primary btn-lg" data-toggle="modal"
			data-target="#myModal">그룹 생성</button>

		<div class="modal" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel" align="center">팀원 생성</h4>
					</div>
					<div class="modal-body">

						<form role="form" class="form-inline">
							<div class="form-group">
								<span class="lead">그룹명 입력 :&nbsp;&nbsp;</span><label for="Name"
									class="sr-only">그룹명 입력</label> <input type="text"
									class="form-control" placeholder="그룹명 입력">
							</div>
						</form>
						<br> <br> <br>
						<form id="demo-2">
							<span class="lead">팀원 검색 :&nbsp;&nbsp;</span><input type="search"
								placeholder="Search" id="contact-list-search">
						</form>
						<br> <br> <br> <br>

						<ul class="list-group" id="contact-list">
							<li class="list-group-item">
								<div class="col-xs-12 col-sm-3">
									<img src="group_img/kab.jpg" alt="GodAnbin"
										class="img-responsive img-circle" />
								</div>
								<div class="col-xs-12 col-sm-9">
									<span class="name">GodAnbin</span><br />

								</div>
								<div class="clearfix"></div>
							</li>

							<li class="list-group-item">
								<div class="col-xs-12 col-sm-3">
									<img src="group_img/z.jpg"
										alt="umhu uddug hae" class="img-responsive img-circle" />
								</div>
								<div class="col-xs-12 col-sm-9">
									<span class="name">어머 어떻해</span><br />
								</div>
								<div class="clearfix"></div>
							</li>

						</ul>

						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
								<div class="panel price panel-green">
									<div class="panel-heading arrow_box text-center">
										<h3>초대 목록</h3>
									</div>
									<ul class="list-group list-group-flush text-center">
									</ul>
									<h4 id="test"></h4>
								</div>
							</div>
						</div>
						
						<br><br>

						<TEXTAREA ROWS="7" COLS="30" NAME="TextArea1" ID="TA1">
							Default text area
						</TEXTAREA>


						<br><br><br>









						<div class="modal-footer">
						<button type="button" class="btn btn-primary">완료</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
				<!-- 모달 콘텐츠 -->
			</div>
			<!-- 모달 다이얼로그 -->
		</div>
		<!-- 모달 전체 윈도우 -->



	</div>

</body>
</html>