<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Cosmos</title>
</head>
<body>
	<div class=”btn-group”>
		<a class=”btn btn-primary” href=”#”>드롭다운메뉴</a> <a class=”btn
			btn-primary dropdown-toggle” data-toggle=”dropdown” href=”#”><span
			class=”caret”></span></a>
		<!–클래스명과 data-toggle=”dropdown”을 걸어준다–>
		<ul class=”dropdown-menu”>
			<!–드롭다운 메뉴에 ‘dropdown-menu’클래스를 걸어준다–>
			<li><a href=”#”><i class=”icon-pencil”></i> 수정</a></li>
			<li><a href=”#”><i class=”icon-trash”></i> 삭제</a></li>
			<li><a href=”#”><i class=”icon-ban-circle”></i> 차단</a></li>
			<li class=”divider”></li>
			<li class=”disabled”><a href=”#”>비활성화</a></li>
		</ul>
	</div>
</body>
</html>