<%@page import="cosmos.login.model.AccessRecord"%>
<%@page import="java.util.List"%>
<%@page import="cosmos.login.model.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
 <link href="../css/bootstrap.min.css" rel="stylesheet">
 <link href="../css/custom2.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	
	$.ajax({ 
    	url: "TestArAction.jsp",
    	success: successHandler,
    	dataType: "json"
    });

	
	
});

function successHandler(data){
    
	console.log('Z');

	var $table = $('.table');
	$table.find('tbody').empty();
	
	$.each(data,function(index,entry){
		
		var html = '<tr><td>'+entry.memberid+'</td><td>'+entry.logintime+
		'</td><td>'+entry.logouttime+'</td></tr>'
		$table.find('tbody').append(html);
	});
}

</script>
</head>
<body>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>로그인 시간</th>
					<th>로그아웃 시간</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
		
			
		</table>
	</div>




</body>
</html>