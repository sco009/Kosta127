<%@page import="cosmos.compile.model.WC_CompileService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String wc_result = "";
	String wc_code = "";
	
	if(request.getParameter("wc_code")!=null && !(request.getParameter("wc_code").equals(""))){
		wc_code = (String)request.getParameter("wc_code");
		
		WC_CompileService wc_service = WC_CompileService.wc_getInstance();
		wc_result = wc_service.wc_getResultCompile(wc_code);
	}
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
</style>
<script type="text/javascript">	
	window.onload = function(){
		   
		   var editor = new Behave({
		   
		      textarea:       document.getElementById('demo'),
		      replaceTab:    true,
		       softTabs:       true,
		       tabSize:       4,
		       autoOpen:       true,
		       overwrite:       true,
		       autoStrip:       true,
		       autoIndent:    true
		   });
		   
		};
	
	 function setup_editor(div, nr) {

	      var editor_div = div.find(".editor" + nr);
	      var diagram_div = div.find(".diagram" + nr);
	      var theme_div = div.find(".theme" + nr);

	      // Setup the editor diagram
	      var editor = ace.edit(editor_div.get(0));
	      editor.setTheme("ace/theme/crimson_editor");
	      editor.getSession().setMode("ace/mode/asciidoc");
	      editor.getSession().on('change', _.debounce(on_change, 100));

	      theme_div.change(on_change);
	      on_change();

	      function on_change() {
	        try {
	          var diagram = flowchart.parse(editor.getValue());

	          editor.getSession().setAnnotations([]);

	          // Clear out old diagram
	          diagram_div.html('');

	          // Draw
	          if (nr === 1) {
	            diagram.drawSVG(diagram_div.get(0));
	          } else if (nr === 2) {
	            diagram.drawSVG(diagram_div.get(0), {
	              'flowstate' : {
	                'past' : { 'fill' : '#CCCCCC', 'font-size' : 12},
	                'current' : {'fill' : 'yellow', 'font-color' : 'red', 'font-weight' : 'bold'},
	                'future' : { 'fill' : '#FFFF99'},
	                'invalid': {'fill' : '#444444'},
	                'approved' : { 'fill' : '#58C4A3', 'font-size' : 12, 'yes-text' : 'APPROVED', 'no-text' : 'n/a' },
	                'rejected' : { 'fill' : '#C45879', 'font-size' : 12, 'yes-text' : 'n/a', 'no-text' : 'REJECTED' }
	              }
	            });
	          }

	        } catch(err) {
	          var annotation = {
	            type: "error", // also warning and information
	            column: 0,
	            row: 0,
	            text: err.message
	          };
	          if (err instanceof diagram.ParseError) {
	            annotation.row    = err.loc.first_line - 1;
	            annotation.column = err.loc.first_column;
	          }
	          editor.getSession().setAnnotations([annotation]);
	          throw err;
	        }
	      }
	    }

	    $(document).ready(function() {
	      // Example diagrams

	      // Setup all the editors
	      setup_editor($('#demo1'), 1);
	    });

	    $(document).ready(function() {
	      var i18nextOptions = {
	        fallbackLng: 'en',
	        backend: {
	          referenceLng: 'en',
	          projectId: '8166472e-7ac6-44e5-a53f-96a6ca165e2b'
	        }
	      };
	      var i18nextInstance = window.i18next
	        .use(window.i18nextLocizeBackend)
	        .use(window.i18nextBrowserLanguageDetector)
	        .init(i18nextOptions, function () {
	          window.i18nextJquery.init(i18nextInstance, $, {
	            tName: 't', // --> appends $.t = i18next.t
	            i18nName: 'i18n', // --> appends $.i18n = i18next
	            handleName: 'localize', // --> appends $(selector).localize(opts);
	            selectorAttr: 'data-i18n', // selector for translating elements
	            targetAttr: 'i18n-target', // data-() attribute to grab target element to translate (if diffrent then itself)
	            optionsAttr: 'i18n-options', // data-() attribute that contains options, will load/set if useOptionsAttr = true
	            useOptionsAttr: false, // see optionsAttr
	            parseDefaultValueFromContent: true // parses default values from content ele.val or ele.text
	          });

	          $('body').localize();
	        });
	    });
</script>
<body>

<div id="main">
	<div class="row" id="demo1">
      <div class="col-md-4">
      	<form action="wc_compileForm.jsp" method="post">
			<textarea rows="30" cols="50" name="wc_code"
				onkeydown="useTab(this)" id="demo"><%=wc_code%></textarea><br>
			<input type="submit" value="Compile"><br>
			<textarea rows="10" cols="50" type="disabled"><%=wc_result%></textarea>
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