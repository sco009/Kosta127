<%@page import="cosmos.education.model.EducationService"%>
<%@page import="cosmos.education.model.EducationContents"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String dataClassify= request.getParameter("dataClassify");
	String memberID = request.getParameter("memberID");
	String data =""; 
	int  pages=1;
	
	if((request.getParameter("pages") !=null)){
		pages = Integer.parseInt(request.getParameter("pages"));
	}
	
			EducationService service = EducationService.getInstance();
			List<EducationContents> list = service.selectmemberID(memberID); 
			if(list!=null){	
				for(int i = 0 ; i < list.size() ; i ++){
					if(i>0){
					 			data+="/";   
					 		}
					data+= list.get(i).gethl_contents();

				}
			}

	request.setAttribute("data", data);
	request.setAttribute("pages", pages);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JAVA 자바의 소개</title>
<meta name="description"
	content="Fullscreen Pageflip Layout with BookBlock" />
<meta name="keywords"
	content="fullscreen pageflip, booklet, layout, bookblock, jquery plugin, flipboard layout, sidebar menu" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="../css/education/jquery.jscrollpane.custom.css" />
<link rel="stylesheet" type="text/css" href="../css/education/bookblock.css" />
<link rel="stylesheet" type="text/css" href="../css/education/custom.css" />
<link rel="stylesheet" href="../css/Log_css/header.css">
<script src="../js/educationJS/modernizr.custom.79639.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/educationJS/eductionScript.js"></script>
<style>
.bottens{
	text-align: center;
}

</style>
</head>
<body>
	<div class="pages">
		<input type="hidden" id="pages" value="<%=pages%>">
	</div>
	<div class="data">
		<input type="hidden" id="data" value="<%=data%>">
	</div>
	<div id="container" class="container">

		<div class="menu-panel">
			<h3>JAVA 제어문과 배열</h3>
			<ul id="menu-toc" class="menu-toc">
				<li class="menu-toc-current"><a href="#item1">1. 제어문</a></li>
				<li><a href="#item2">2. 조건문(if문, switch case문)</a></li>
				<li><a href="#item3">3. 반복문(for문, while문)</a></li>
				<li><a href="#item4">4. 분기문(break문, continue문)</a></li>
				<li><a href="#item5">5. 배열</a></li>
			</ul>
		</div>

		<div class="bb-custom-wrapper">
		
			<div id="bb-bookblock" class="bb-bookblock">
				<div class="bb-item" id="item1">
					<div class="content">
						<div class="scroller">
							<h2><br><br>1. 제어문</h2>
							<form id="submit_form" action="educationinsert.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="1">
							 	<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="button" class="button-3d" value="형광펜 추가하기" style="display: scroll; position: fixed; top: 80px; left: 800px;" onClick="wordSearch(this.form.hl_contents.value,'submit_form')">
							</form>
							
							<form action="education_delete.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="1">
								<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="submit" class="button-3d" value="형광펜 삭제하기" style="display: scroll; position: fixed; top: 80px; left: 950px;" >
							</form>
							<p>
								제어문은 프로그램의 순서를 바꾸는 기술을 가진 명령어로써 조건문(if문, switch case문)과 반복문
								(for문, while문, do~while문), 분기문(break문, continue문)등이 있다.<br>
								<br>프로그램은 여러개의 문장으로 구성되어 있으며 처음부터 순차적으로 진행이 된다. 다른 프로그래밍 언
								어도 같은 구성으로 되어있으며, 실행의 순서를 제어하는 조건문과 실행을 순환시키는 반복문으로 나뉘 는데 각
								제어문마다 블록 설정시 기능의 효력은 해당 블록 안에서 능력을 발휘하게 된다.<br> <br> ․
								블록 : 하나 이상의 문장들을 중괄호를 사용하여 논리적으로 묶은 것을 말한다.<br> <br> {
								int a;<br> { int b;<br> ;.... // 변수 b의 유효 범위<br>
								&nbsp;}<br> ... // 변수 a의 유효 범위, 변수b는 유효하지 않는다. }<br> }<br>
								<br> 서로 다른 블록안에서 같은 이름의 변수를 선언 및 초기화 할 수 없다. 또한 블록 안에서 선언한
								변수 는 그 블록의 범위를 벗어나게 되면 효력을 잃게 된다.(위 코드 참조)<br> 이는 상위 메소드에서
								선언한 변수는 하위 메소드에서 똑같은 이름으로 변수를 선언할수 없다는 말과 같으며 반대로 하위 메소드에서 선언한
								변수는 상위메소드에서 효력이 없음을 알아야 한다.<br> <br>․ 실행문과 주석문<br>
								실행문은 메서드를 호출하거나, 변수 및 상수를 선언하거나, 출력시키는 메소드등 모든 연산을 수행하 는 문장은
								실행문이 될 수 있다. 그 명령문 뒤에는 항상 ‘ ; ’ 세미콜론이 있어야 한다.<br> 컴퓨터는
								세미콜론이 문장의 끝임을 알고 있다.<Br> int a = 10; String hoho = new
								String(); 등 문장뒤에 항상 세미콜론이 붙어있음을 확인할 수 있다.<br> <br>
								주석문은 컴파일이 되지 않는 문장으로 보통 프로그래머가 이해하긴 힘든 코드가 적혀있을시 부연설명 을 위해 사용한다.
								사용방법은 한줄 주석문(//)과 여러줄 주석문(/* */), JavaDoc 주석문(/** */)이 있다.<br>
								<br> int a; // a는 뭐 어쩌구 저쩌구 에 쓰일 변수이다...<br> /* 이렇게
								여러줄을 주석 처리 하고자 할때 사용됨.<br> if(a == 10)<br>
								&nbsp;System.out.println("hello");<br> */<br>
							</p>

						</div>
					</div>
				</div>
				<div class="bb-item" id="item2">
					<div class="content">
						<div class="scroller">
							<h2><br><br>2. 조건문(if문, switch case문)</h2>
							<form id="submit_form2" action="educationinsert.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="2">
							 	<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="button" class="button-3d" value="형광펜 추가하기" style="display: scroll; position: fixed; top: 80px; left: 800px;" onClick="wordSearch(this.form.hl_contents.value,'submit_form2')">
							</form>
							
							<form action="education_delete.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="2">
								<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="submit" class="button-3d" value="형광펜 삭제하기" style="display: scroll; position: fixed; top: 80px; left: 950px;" >
							</form>
							<p>
								․ if문<br> if문은 참, 거짓으로 인한 결과를 통해서 문장을 선택적으로 실행할 수 있게 해준다.<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three1.png">
							</div>
							<p>
								실습<br> 01 public class java3-1{<br> 02public static
								void main(String[] args){<br> 03int a = 10;<br> 04if(a
								== 10)<br> 05System.out.println("참“);<br> 06 else<Br>
								07System.out.println("거짓“);<br> 08}<br> 09}<br>
								해석<br> 03 : int 형 a변수 선언 및 초기화<br> 04 : if문 시작. 만약 a가
								10과 같다면 05행을 수행, 그렇지 않다면 07행을 실행한다.<Br> <br> ․ 다중if문<Br>
								다중if문은 조건이 여러 가지가 있을경우에 많이 쓰이며 다중이므로 {} 중괄호를 사용한다.<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three2.png">
							</div>
							<p>
								실습<br> 01 public class java3-2{<br> 02 public static
								void main(String[] args){<br> 03 int a = 10;<Br> 04
								if(a <= 5)<br> 05 System.out.println("조건1“);<br> 06
								else if (a <= 8)<br> 07 System.out.println("조건2“);<br>
								08 else if (a <= 9)<Br> 09 System.out.println("조건3“);<Br>
								10 else<br> 11 System.out.println("조건4“);<br> 12 }<br>
								13 }<br> <br>해석<br> 03 : int형 a변수 선언 및 초기화<br>
								04 : if(a <= 5) 만약 a가 5보다 작거나 같으면 05행 명령문 실행<br> 06 : 04행의
								조건문이 거짓이면서 06행의 조건이 참일 경우 07행 명령문 실행<br> 06 : 04행의 조건문이
								거짓이면서 06행의 조건이 참일 경우 07행 명령문 실행<br> 10 : 위 04행, 06행, 08행 모두
								조건이 거짓일 경우 11행의 명령문 실행<br> <br>10 : 위 04행, 06행, 08행 모두
								조건이 거짓일 경우 11행의 명령문 실행<br> 10 : 위 04행, 06행, 08행 모두 조건이 거짓일
								경우 11행의 명령문 실행<br>
							</p>
							<br>
							<div align="center">
								<img src="edu_image/java_three3.png">
							</div>
							<p>
								해석<br> 01 : int형 a변수 선언 및 초기화<br> 02 : switch(a) 즉
								case에서 a와 조건이 같은 문장을 찾아 실행하게 된다.<br> 03 : a의 값이 3이면(case
								3:) 04행 명령문을 실행 후 05행 break문을 만나 블록을 나오게 된다.<br> 06 : a의 값이
								5이면(case 5:) 07행 명령문을 실행 후 08행 break문을 만나 블록을 나오게 된다.<br>
								09 : a의 값이 10이면(case 10:) 10행 명령문을 실행 후 11행 break문을 만나 블록을 나오게
								된다.<br> 12 : 만약 위 case중 조건이 하나도 맞지 않는 경우가 생긴다면 default: 문을
								만나 13행 명령문 실행.<br>
							</p>

						</div>
					</div>
				</div>
				<div class="bb-item" id="item3">
					<div class="content">
						<div class="scroller">
							<h2><br><br>3. 반복문(for문, while문)</h2>
							<form id="submit_form3" action="educationinsert.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="3">
							 	<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="button" class="button-3d" value="형광펜 추가하기" style="display: scroll; position: fixed; top: 80px; left: 800px;" onClick="wordSearch(this.form.hl_contents.value,'submit_form3')">
							</form>
							
							<form action="education_delete.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="3">
								<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="submit" class="button-3d" value="형광펜 삭제하기" style="display: scroll; position: fixed; top: 80px; left: 950px;" >
							</form>
							<p>
								주어진 조건이 true일 경우 블록으로 묶인 명령어들을 반복해서 실행시켜준다.<Br> 반복문에는 for,
								while, do~while 문이 있고 각각의 기능이 비슷하므로 상황에 맞게 사용한다.<br> <br>․
								for문<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three4.png">
							</div>
							<p>
								for문을 만나게 되면.<br> ① 초기화 문장 실행<br> ② 반복 조건 문장 실행 (조건
								true이면 ③번 실행, false이면 for문 탈출)<br> ③ 수행될 명령문 실행 후<br>
								④증감문장 실행, 다시 ②->③->④번 반복<br> <br>
							</p>
							<div align="center">
								<img src="edu_image/java_three5.png">
							</div>
							<p>
								해석<br> 03 : int형 i변수를 1값으로 초기화 하였고, i가 10보다 작거나 같을때까지 04행을
								실행시키게된다.<Br> 04 : 03행의 조건이 맞을 경우 명령문이 실행되며 다시 03행의 i++ 가
								실행되면서 반복<br> ․ while문<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three6.png">
							</div>
							<p>
								while문은 동일한 명령문을 여러 번 반복 실행할 때 사용한다. for문과 달리 초기화 문장과 증감 문장 이
								없다. 그래서 먼저 반복 조건 문장이 참일 경우 반복으로 명령문을 수행하고 거짓일 경우는 한번도 실행되지 않는다.<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three7.png">
							</div>
							<p>
								해석<br> 01 : while문안에서 초기값을 줄수 없으므로 미리 a변수에 초기값을 할당한다.<br>
								02 : while(a <= 10) a가 10보다 작거나 같을때까지 03행 실행, 조건이 거짓이 될 경우
								while문 탈출<Br> <br>․ do ~ while문<br> while문과 다른점은
								조건을 나중에 검사 한 다는 것이다. 즉. 일단 조건이 맞든 안맞든 꼭 한번은 수행 될 명령문을 실행하고 조건을
								검사한다.<br> 밑에 코드를 보면 이해가 빨라질것이다.<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three8.png">
							</div>
							<p>
								해석<br> 01 : for문과 다르게 초기값을 먼저 설정해준다.<br> 02 : ‘ do { ‘
								일단 do~while문의 첫 번째 문장이다. while()문의 조건식이 먼저 실행이 되지 않으므로<br>
								03행, 04행 실행후 05행 반복 조건 문장을 검사하게 된다. true 일 경우 do{ 문장부터 반복실행.<br>
								false일 경우 do~while문을 빠져나오게 된다.<br>
							</p>
						</div>
					</div>
				</div>
				<div class="bb-item" id="item4">
					<div class="content">
						<div class="scroller">
							<h2><br><br>4. 분기문(break문, continue문)</h2>
							<form id="submit_form4" action="educationinsert.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="4">
							 	<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="button" class="button-3d" value="형광펜 추가하기" style="display: scroll; position: fixed; top: 80px; left: 800px;" onClick="wordSearch(this.form.hl_contents.value,'submit_form4')">
							</form>
							
							<form action="education_delete.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="4">
								<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="submit" class="button-3d" value="형광펜 삭제하기" style="display: scroll; position: fixed; top: 80px; left: 950px;" >
							</form>
							<p>
								․ break문<br> switch case문, for문, while문, do~while문의 반복문 수행을
								포기하고 반복문 다음 문장으로 빠져 나 가는 것을 말한다. 1개의 break문에 의해 하나의 루프만 벗어나므로
								중첩된 루프에서는 그 수만큼의 break문이 필요하다.<br> <br> ․ continue 문<br>
								break문과 달리 반복문을 빠져나가지 않고, 반복문의 조건부로 실행위치를 옮긴다. 따라서 continue문 뒤에
								실행문은 실행되지 않는다. 밑 의 코드를 살펴보자.<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three9.png">
							</div>
							<p>
								02 : 02행부터 04행까지는 반복문을 그대로 실행한다.<br> 05 : if문을 만나서 조건이 거짓일
								경우 07행이 실행되고 나중에 참이 될 경우에는 continue문을 만나<br> 07행은 실행조차 하지
								못하고 바로 반복문으로 돌아가게 된다.<br>
							</p>
						</div>
					</div>
				</div>
				<div class="bb-item" id="item5">
					<div class="content">
						<div class="scroller">
							<h2><br><br>5. 배열</h2>
							<form id="submit_form5" action="educationinsert.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="5">
							 	<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="button" class="button-3d" value="형광펜 추가하기" style="display: scroll; position: fixed; top: 80px; left: 800px;" onClick="wordSearch(this.form.hl_contents.value,'submit_form5')">
							</form>
							
							<form action="education_delete.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="5">
								<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="submit" class="button-3d" value="형광펜 삭제하기" style="display: scroll; position: fixed; top: 80px; left: 950px;" >
							</form>
							<p>
								같은 종류의 데이터가 하나의 이름으로 표시되는 데이터의 묶음을 말한다. 배열을 이용하면 여러 데이 터를 한
								변수이름으로 지정할 수 있는데 이를 배열명이라고 하며 각 배열에 포함되어 있는 데이터들을 배열요소라고 한다.<br>
								해당 배열 요소에 접근 하는 방법은 맨 처음 위치한 배열의 index와 배열명을 가지고 접근할 수 있다.<br>
								<br> a -> 배열명<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three10.png">
							</div>
							<p>
								위 a[0]이 배열의 첫 번째 주소(배열의 index)이다.<br> <br> ․ 배열의 선언<br>
								일단 배열은 같은 종류의 데이터 묶음 이기 때문에 배열을 선언하기 전에 어떤 종류의 데이터를 이용할 것인지 생각후에
								배열을 선언한다. 데이터형은 일반 기본형뿐만 아니라 레퍼런스 데이터형도 가능하다. 배열 선언시 크기를 미리 정할 수
								없고 초기화나 생성하기 전까지는 배열 요소를 이용할 수 없다.<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three11.png">
							</div>
							<p>
								․ 배열의 초기화<br> 배열의 초기값을 지정하는 것인데 생성되지 않는 배열을 초기화시키고자 할 경우에는
								반드시 선언문에 서 초기화를 시켜야 한다.<br> 선언과 동시에 초기화된 배열은 힙 영역에 메모리를
								할당받기 때문에 바로 사용이 가능하다.<Br>
							</p>
							<div align="center">
								<img src="edu_image/java_three12.png">
							</div>
							<p>
								․ 배열의 생성(메모리 할당)<br> 배열은 데이터의 묶음이므로 일반적으로 변수로 나타내듯 이용하면
								안된다.<br> 초기화 없이 단지 메모리를 할당해 주는것이다.<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three13.png">
							</div>
							<p>
								생성된 배열은 초기화를 시켜주지 않아도 정수형의 경우 0으로 초기화 되며 그 외에는 null로 초기화됨.<br>
								<br>․ 배열의 요소<br> 할당받은 메모리의 배열요소를 이용해보자. 배열요소마다 값을
								대입시키는것은 일반변수에 값을 넣는것 과 같다.<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three14.png">
							</div>
							<p>
								메모리에 할당받은 각 배열의 요소에 값을 주었다.<br> <br> 엇..근데 위에 배열의 초기화를
								보면 배열의 요소에 값을 주는 것 과 비슷하다.<br> 사실 똑같은 개념이다. 단지 배열의 초기화는 배열을
								선언하면서 값을 넣기 때문에 메모리가 값의 크기 를 보고 자동으로 메모리를 할당해 주는 것이고 배열의 요소에서는
								미리 크기를 정의하여 메모리를 할 당 받아놓고 값을 넣는 것의 차이일 뿐 이다.<br> <br>
								․ 다차원 배열<br> 지금까지 위에서 설명한 내용은 1차원 배열이었으며, 다차원 배열 또한 1차원 배열과
								문법이 똑같다.<br> 다만 1차원 배열보다는 좀 더 복잡하게 메모리를 할당받게 된다.<br>
								그림을 보면 좀 더 이해가 쉽다.<br> <br> 1차원 배열<br> int
								level[] = new int[5]<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three15.png">
							</div>
							<br>
							<p>
								2차원 배열 (배열명[][] : []대괄호가 2개 들어간다.)<br> int level = new
								int[3][5]<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three16.png">
							</div>
							<br>
							<p>
								․ 2차원 배열의 선언과 초기화 및 메모리 할당<br> int level[][]; // 2차원 배열 선언<Br>
								int level[][] = new int[][]; //2차원 배열 메모리 할당<br> <br>int
								level[][] = {{1,2,3,4,5},{6,7,8,9,10},{11,12,13,14,15}}; // 2차원
								배열 초기화<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three17.png">
							</div>
							<br>
							<p>좀 더 이해를 쉽게 하기 위해서 메모리 할당할 때 “ level [①] [②] ” 차이를 그림으로 보여주겠다.<br>
							<br>int level[][];<br>①level = new int[2][];<br></p>
							<div align="center">
								<img src="edu_image/java_three18.png">
							</div>
							<p>②level = new int[2][3];<br>
							</p>
							<div align="center">
								<img src="edu_image/java_three19.png">
							</div>
						</div>
					</div>
				</div>
			</div>

			<nav>
				<span id="bb-nav-prev">&larr;</span> <span id="bb-nav-next">&rarr;</span>
			</nav>

			<span id="tblcontents" class="menu-button">Table of Contents</span>

		</div>

	</div>
	<!-- /container -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="../js/educationJS/jquery.mousewheel.js"></script>
	<script src="../js/educationJS/jquery.jscrollpane.min.js"></script>
	<script src="../js/educationJS/jquerypp.custom.js"></script>
	<script src="../js/educationJS/jquery.bookblock.js"></script>
	<script src="../js/educationJS/page.js"></script>
	<script>
		$(function() {

			Page.init();

		});
	</script>
</body>
</html>