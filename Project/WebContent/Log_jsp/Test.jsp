<%@page import="cosmos.login.model.Login"%>
<%@page import="java.util.List"%>
<%@page import="cosmos.login.model.LoginService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<style type="text/css">
@import url("http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css");
@import url("http://fonts.googleapis.com/css?family=Roboto:400,300,700italic,700,500&subset=latin,latin-ext");

  body {
        padding-top: 40px;
        padding-bottom: 40px;
    	
      }
      .price.panel-green>.panel-heading {
			color: #fff;
			background-color: #FF5E00;
			border-color: #71DF71;
			border-bottom: 1px solid #71DF71;
		}
		
			
		.price.panel-green>.panel-body {
			color: #fff;
			background-color: #65C965;
		}
				
		
		.price.panel-green>.panel-body .lead{
				text-shadow: 0px 3px 0px rgba(50,50,50, .3);
		}
		
		.price.panel-green .list-group-item {
			color: #333;
			background-color: rgba(50,50,50, .01);
			font-weight:600;
			text-shadow: 0px 1px 0px rgba(250,250,250, .75);
		}
</style>
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript">
        window.alert = function(){};
        var defaultCSS = document.getElementById('bootstrap-css');
        function changeCSS(css){
            if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
            else $('head > link').filter(':first').replaceWith(defaultCSS); 
        }
        
        $(document).ready(function(){
        	  $.ajax({ 
      	    	url: "TestAction.jsp",
      	    	success: successHandler,
      	    	dataType: "json"
      	    });
        	
        	setInterval(function(){
        	    $.ajax({ 
        	    	url: "TestAction.jsp",
        	    	success: successHandler,
        	    	dataType: "json"
        	    });
        	}, 5000);
        });
        
        function successHandler(data){
    
        	var $listGroup = $('.list-group');
 			$listGroup.empty();
    		$.each(data,function(index,entry){
    			
    			var html = '<li class="list-group-item">'+entry.memberName+
    						'&nbsp;&nbsp;&nbsp;<i class='+'"icon-user text-success"></i></li>';
    			$listGroup.append(html);
    		});
    	}
       
    </script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-1 col-sm-1 col-md-1 col-lg-2">
				<div class="panel price panel-green">
					<div class="panel-heading arrow_box text-center">
						<h3>친구 목록</h3>
					</div>
					<ul class="list-group list-group-flush text-center">
					</ul>
					<h4 id="test"></h4>
				</div>
			</div>
		</div>
	</div>

</body>
</html>