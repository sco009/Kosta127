<%@page import="cosmos.compile.model.WC_CompileService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Architects+Daughter" rel="stylesheet" type="text/css">

    <link rel="stylesheet" type="text/css" href="../css/compile/style.css" media="screen" />

    <title>flowchart.js</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/i18next/3.1.0/i18next.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/i18next-locize-backend/0.1.1/i18nextLocizeBackend.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-i18next/0.0.14/i18next-jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/i18next-browser-languagedetector/0.3.0/i18nextBrowserLanguageDetector.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <!-- Needed for the text editor -->
    <script src="https://d1n0x3qji82z53.cloudfront.net/src-min-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
    <script src="../wc_algorithm_js/underscore-min.js"></script>
    <script src="../wc_algorithm_js/raphael-min.js"></script>
    <script src="../wc_algorithm_js/flowchart-latest.js"></script>
    <script src="../wc_algorithm_js/svginnerhtml.min.js"></script>
    <script type='text/javascript' src="../wc_algorithm_js/behave.js"></script>
    <script type="text/javascript" src="../wc_algorithm_js/wc_algorithmScript.js"></script>
    <!-- Bootstrap -->
	<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="../css/bootstrap/bootstrap.min.js"></script>
	<script src="../css/bootstrap/main.js"></script>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script
		src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<jsp:include page="../Log_module/header.jsp" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	$(function(){
		$("#complieFrom").submit(function(event){
			event.preventDefault();
			
			$.ajax({
				url : "ajax.jsp",
				type : "post",
				dataType:"text",
				data : $(this).serialize(),
				success : successHandler,
				error : function(){
					alert("실패");
				}
			});
		});
		
		function successHandler(data){
			var str = data.replace(/^\s+/, "");
			$("#wc_result").empty();
			$("#wc_result").text(str);
		}
		
		$(document).ajaxStart(function(){
		      $("#loading").fadeIn();
		   }).ajaxStop(function(){
			   $("#loading").fadeOut();
		   });
		
	});

</script>
		<br><br><br>
</head>
<style type='text/css'>
      textarea{
         font-family: monospace;
         font-size:13px;
      }
      
      textarea:focus{
         border-color:#333;
      }
      
      #wc_algorithmImg{
      	padding-bottom:30px;
      }
      
      #loading{
        
        position : absolute;
        display: none;
      	height: 100%;
      	width: 100%;
      	z-index: 1;
      }
      
</style>
<body>

<div id="main">

	<div class="row" id="demo1">
      <div class="col-md-4">
      	<form action="wc_compileForm.jsp" method="post" id="complieFrom">
			<%-- <textarea rows="30" cols="50" name="wc_code"
				onkeydown="useTab(this)" id="demo"><%=wc_code%></textarea><br> --%>
				<textarea rows="30" cols="50" name="wc_code"
				onkeydown="useTab(this)" id="demo"></textarea>
				<div id="loading" style="width: 100%; text-align: center" >
						<img alt="" src="Loading.gif"style="width: 100%; max-width: 150px; vertical-align: middle">
					</div><br>
			<input type="submit" value="Compile"><br>
					
					<%-- <textarea rows="10" cols="50" type="disabled"><%=wc_result%></textarea> --%>
			<textarea rows="10" cols="50" type="disabled" id="wc_result"></textarea>
		</form>
      </div>
      <div class="col-md-4" >
      <div>
      	<img id="wc_algorithmImg" src="../wc_image/wc_algorithmEx.png">
      </div>
      <div class="editor-wrapper">
<div class="editor editor1">st=>start: Start:>
e=>end:>
op1=>operation: My Operation
sub1=>subroutine: My Subroutine
cond=>condition: Yes
or No?:>
io=>inputoutput: catch something...

st->op1->cond
cond(yes)->io->e
cond(no)->sub1(right)->op1</div>
           </div>
      </div>
      <div class="col-md-4">
      	<div class="diagram diagram1" align="center"></div>
      </div>
    </div>
</div>
</body>
</html>