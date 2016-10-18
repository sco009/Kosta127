<%@page import="Education.model.EducationContents"%>
<%@page import="Education.service.EducationService"%>
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
			for(int i = 0 ; i < list.size() ; i ++){
				if(i>0){
		 			data+="/";
		 		}
				data+= list.get(i).gethl_contents();
			}

	request.setAttribute("data", data);
	request.setAttribute("pages", pages);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JAVA 데이터형과 연산자</title>
<meta name="description"
	content="Fullscreen Pageflip Layout with BookBlock" />
<meta name="keywords"
	content="fullscreen pageflip, booklet, layout, bookblock, jquery plugin, flipboard layout, sidebar menu" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="css/jquery.jscrollpane.custom.css" />
<link rel="stylesheet" type="text/css" href="css/bookblock.css" />
<link rel="stylesheet" type="text/css" href="css/custom.css" />
<script src="js/modernizr.custom.79639.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {

			start();
		var page ='<%=pages%>';
		if(page >  1){
			for(var i = 1 ; i < page ; i ++){
				setTimeout(function(page){
					click(page)
				}, i*1000);
			}
		}
		$('p').mouseup(function() {
			var txt = '';
			if (window.getSelection) {
				txt = window.getSelection();
			} else if (document.getSelection) {
				txt = document.getSelection();
			} else if (document.selection) {
				txt = document.selection.createRange().text;
			} else {
				return;
			}

			txt = String(txt); // Type Casting	
			// txt = "" + txt; // 같음. 역시 자바스크립트		    

			$('.texts').val(txt);

		});
	});
	function click(page){
		
		$('#bb-nav-next').trigger('click');
			Page.init();
		
	}
	function start(){
		var datas = '<%=data%>'
			var list = datas.split("/");
			for (var i = 0; i < list.length; i++) {
				wordSearch(list[i]);
			}
		
	} 
	function wordSearch(word,form_id) {
		console.log(word);
		$ptags = $('div.scroller p');

		var reg = new RegExp(word, "gi");

		$ptags.each(function(index) {
			var p = $(this);
			var text = p.html();
			var newText = text.replace(reg, "<span style='background:yellow'>"
					+ word + "</span>");
			p.html(newText);
		});
		if(typeof form_id != 'undefined'){
			$("#"+form_id).submit();
		}
		
	}
</script>
</head>

<body>
	<div id="container" class="container">

		<div class="menu-panel">
			<h3>JAVA 데이터형과 연산자</h3>
			<ul id="menu-toc" class="menu-toc">
				<li class="menu-toc-current"><a href="#item1">1. 기본구조</a></li>
				<li><a href="#item2">2. 식별자(Identifier)</a></li>
				<li><a href="#item3">3. 예약어(Keyword)</a></li>
				<li><a href="#item4">4. 데이터 형</a></li>
				<li><a href="#item5">5. 상수(Constant)</a></li>
				<li><a href="#item6">6. 변수(Variable) </a></li>
				<li><a href="#item7">7. 데이터 변환과 캐스팅</a></li>
				<li><a href="#item8">8. 연산자</a></li>
			</ul>
<a href="javaone.jsp?dataClassify=javatone&memberID=ohwoosung"><h4>이전장으로</h4> </a>
<a href="javathree.jsp?dataClassify=javathree&memberID=ohwoosung"><h4>다음장으로</h4> </a>
		</div>

		<div class="bb-custom-wrapper">
			<div id="bb-bookblock" class="bb-bookblock">
				<div class="bb-item" id="item1">
					<div class="content">
						<div class="scroller">
							<h2>1. 기본구조</h2>
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
							<p>1. 기본구조</p>
							<br>
							<p>
								프로그램의 기본이 되는내용 중 하나가 바로 데이터형과 연산자이다. 컴퓨터에서 저장되는 데이터가 모 두 프로그램
								언어의 데이터형으로 바뀌어 저장이 되기 때문에 데이터형에 대한 이해가 필요하다.<br>
							</p>
							<p>
								자바는 크게 위 구조를 바탕으로 해서 코드가 작성된다.<br>자바 프로그램에는 반드시 한 개 이상의
								class가 존재하며 위 코드 같은 경우 java2-1 이라는 클래스 가 존재한것이다. 즉 클래스를 프로그램의 한
								모듈이라고 보면 되고 이 클래스 안에는 여러 함수가 존 재한다. 이것을 멤버 함수 또는 메소드라 부른다.<br>클래스
								내부에 선언된 변수를 멤버 변수라 하고 여러 메소드내에서는 사용이 가능하며 메소드 내에서 선언된 변수를 지역 변수라
								한다. 지역변수 같은 경우에는 정의한 메소드 내에서만 사용이 가능하다.<br> <br>위 코드는
								많은 문법으로 이루어져 있는데 우리는 컴퓨터와 의사소통을 하듯이 이렇게 문법을 정의해 서 사용해 주어야 컴퓨터도
								우리가 작성한 코드를 읽고서 동작하는것이다.<br>public class java2-1 같은 경우도
								class public java2-1 등 바꾸면 안된다는 말이다. 정해진 문법이 있으므로 그 문법에 맞게 우리는
								코드를 작성해 주어야 한다.
							</p>

						</div>
					</div>
				</div>
				<div class="bb-item" id="item2">
					<div class="content">
						<div class="scroller">
							<h2>2. 식별자(Identifier)</h2>
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
								식별자는 자바로 프로그래밍을 할때 변수의 이름이나, 클래스, 메서드의 이름등을 지정할 때 사용한다.<br>①
								길이에 제한이 없고, 문자로 시작하며, 문자나 숫자가 연속적으로 이어져 식별자를 구성한다.<Br>②
								자바에서 명령어로 사용하는 키워드와 동일한 이름을 사용할수 없다. static, void 등<br>③
								대소문자를 구분한다. 'SONG' 과 ‘song' 과는 서로 틀린 식별자이다.<br>④ 영어대소문자,
								한글, 숫자, 언더스코어(_) 문자, 달러($)문자 등이며 숫자로 시작할수 없다.<Br> <br>01
								public class java2-2{<br>02 public static void
								main(String[] args){<br>03 int _10S, ass;<br>04 char
								$koko;<br>05 }<br>06 }<br>위 코드는 유효한 식별자를 보여주는
								예이다.<br> <br>int 10v; // 숫자가 앞에 먼저 있으므로 오류 발생.<br>float
								^why; // _, $ 외에 특수문자로 시작할수 없다.<br>char if abc; // 키워드를
								식별자로 사용할수 없으며 공백또한 허용하지 않는다.char if abc; // 키워드를 식별자로 사용할수 없으며
								공백또한 허용하지 않는다.<Br>
							</p>
							<br>
						</div>
					</div>
				</div>
				<div class="bb-item" id="item3">
					<div class="content">
						<div class="scroller">
							<h2>3. 예약어(Keyword)</h2>
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
								자바에서는 정해져 있는 식별자가 있다. 그래서 이 예약어를 변수이름으로 사용하게 되면 에러가 생기 므로 주의하자.<br>
							</p>
							<div align="center">
								<img src="image/java_two_image1.png">
							</div>
						</div>
					</div>
				</div>
				<div class="bb-item" id="item4">
					<div class="content">
						<div class="scroller">
							<h2>4. 데이터 형</h2>
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
								컴퓨터는 여러 종류의 값들을 계산할 때 처리되는 방식이 달라서 결과도 달라져 보일수가 있다. 이 때 문에 여러
								종류의 자료형 중 자신이 얻고자 하는 형태의 자료형을 골라서 계산해야 하다.<br>가장 기본적인 형태(기본
								데이터형) 3가지와 레퍼런스 데이터형 으로 구분해서 사용하게 된다.<br>․ 기본 데이터형 (논리형,
								문자형, 수치형)<br>논리형 : 1byte 길이의 가장 간단한 형태의 데이터 타입으로 오로지
								참(true)과 거짓(false)의 값만 가 지고 있다.<br>문자형 : 문자를 저장하기 위해 사용되며
								c에서는 8bit의 ASCII 코드를 사용하였으나 자바에서는 16bit 유니코드(Unicode)를 사용한다.<br>수치형(정수형,
								실수형) : 자바의 정수형은 byte(8bit), short(16비트), int(32비트), long(64비트)이
								크 기별로 사용되며, 정수 이외에 숫자를 나타내어 사용되는 것이 실수형이다. float(32비트),
								double(64비 트) 두 가지 형태의 실수형이 존재한다.<br>
							</p>
							<br>
							<div align="center">
								<img src="image/java_image1.png">
							</div>

							<p>
								․ 레퍼런스 데이터형<br> 기본 데이터형 처럼 정해져 있는 크기 형태별로 값을 할당하는 것이 아니라 그
								값에는 ‘주소‘를 할당한 다. 주소 라면 어떤 주소일까? 하는 의문이 들기마련.<br>이 주소는 다른 값이
								포함된 ‘객체’의 주소를 말한다. 우리는 그저 일반적으로 정해진 값이 아닌 ‘위치’ 가 값으로 들어왔다고 생각하자.
								자세한 내용은 뒤에 가서 설명하겠다.<br>
							</p>
						</div>
					</div>
				</div>
				<div class="bb-item" id="item5">
					<div class="content">
						<div class="scroller">
							<h2>5. 상수(Constant)</h2>
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
								상수는 숫자, 텍스트 등 값을 직접 나타내는 단순 식별자로서 값이 변하지 않는다는 것이 특징이다.<br>
								<br>․ 논리형 상수 : 데이터가 될수 있는 것은 true와 false밖에 없다. 참과 거짓 밖에 없음.<br>․
								문자형 상수 : 문자형 변수에 할당되는 값은 ‘ ’ 사이에 들어 있는 문자이다. ‘a' 와 같음.
							</p>
							<div align="center">
								<img src="image/java_image2.png">
							</div>
							<p>
								․ 정수형 상수는 우리가 흔히 쓰는 일반적인 정수를 말하며 8, 10, 16진수 형태로 나타낸다.<br>10진수는
								일반 숫자 형태로 쓰인다.<br>16진수는 '0x'로 시작된다. 0부터 9까지의 수와 A~F까지의 문자를
								붙여서 숫자로 표현할수 있음. 8진수는 숫자 ‘0’으로 시작해서 표현하면 된다. 0부터 7까지 숫자로 할당함.<br>long
								int같은 경우에는 상수 뒤에 'L'을 붙여서 사용함.<Br>예) int a = 0xa4 <- 16진수의
								예, 실제 값은 10×16+4 = 164<br>․ 실수형 상수는 그냥 지정하면 기본적으로 double형을
								가진다. 좀더 명시적으로 표현하려면 f(float)형 이나 d(double)형으로 붙여서 지정해준다.<br>예)
								-1.1212 또는 -11212e-2 (과학식 표현 방법) 또는 1.1212F, 1,1212D 이렇게 표현가능하다.
							</p>
						</div>
					</div>
				</div>
				<div class="bb-item" id="item6">
					<div class="content">
						<div class="scroller">
							<h2>6. 변수(Variable)</h2>
							<form id="submit_form6" action="educationinsert.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="6">
							 	<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="button" class="button-3d" value="형광펜 추가하기" style="display: scroll; position: fixed; top: 80px; left: 800px;" onClick="wordSearch(this.form.hl_contents.value,'submit_form6')">
							</form>
							
							<form action="education_delete.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="6">
								<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="submit" class="button-3d" value="형광펜 삭제하기" style="display: scroll; position: fixed; top: 80px; left: 950px;" >
							</form>
							<p>
								변수는 프로그램이 실행되는 동안 변화되는 값을 저장할 수 있는 공간에 대한 이름이라고 말할 수 잇 다. 다르게
								표현하면 프로그램 내에서 수시로 바뀔수 있는 공간이라고 표현하겠다.<Br> <br>변수의 이름은
								식별자로서 데이터형(자료형)과 함께 선언된다.<br> <br>변수 선언시 변수를 사용하기 위해서는
								먼저 변수 선언이라는 절차가 필요하다. 메모리를 할당을 받아 야 하고 메모리를 할당 받기 위해서는 데이터가 필요로
								하는 크기만큼의 메모리를 할당받아야 하므로 변수명 앞에는 항상 데이터형을 적어서 초기화를 시켜야 한다.<br>예)
								int a;<br>a라는 변수를 int형으로 만들어주었다. 그러면 a라는 공간의 크기는 int형(정수형)
								만큼이되고. a라는 공 간 안에 값을 넣기 위해서는 a = 10; 또는 int a = 10; 이렇게 넣어주면 a에는
								정수 10의 값이 할당된 것이다.<br> <br>․ 레퍼런스형 변수 : 위 레퍼런스 데이터형에서
								설명했듯이 공간을 할당받으면 그 공간에 값을 일반적인 데이터가 아니라 ‘주소’가 들어간다고 설명하였다.<br>
							</p>
							<div align="center">
								<img src="image/java_image3.png">
							</div>
						</div>
					</div>
				</div>
				<div class="bb-item" id="item7">
					<div class="content">
						<div class="scroller">
							<h2>7. 데이터 변환과 캐스팅</h2>
							<form id="submit_form7" action="educationinsert.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="7">
							 	<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="button" class="button-3d" value="형광펜 추가하기" style="display: scroll; position: fixed; top: 80px; left: 800px;" onClick="wordSearch(this.form.hl_contents.value,'submit_form7')">
							</form>
							
							<form action="education_delete.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="7">
								<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="submit" class="button-3d" value="형광펜 삭제하기" style="display: scroll; position: fixed; top: 80px; left: 950px;" >
							</form>
							<p>
								데이터 변환이란 서로 종류가 다른 데이터간의 연산시 대입을 하는 경우에 한 종류의 데이터형이 다른 종류의
								데이터형으로 바뀌는 것을 말한다.<br>종류가 다른 데이터형의 변환 : 종류가 다른 것 끼리는 호환이
								안된다.<br>수치형 데이터형의 변환 : 작은 공간의 값을 큰 공간에 넣는 것은 허용하나 반대가 되면 손실
								발생.<br>
							</p>
							<div align="center">
								<img src="image/java_image4.png">
							</div>
							<p>
								․ byte aaa = 5000;<br>이렇게 하게 되면 값이 다르게 할당된다. byte의 범위의 수를
								벗어나는 값을 할당했기 때문이다.<br>․ float f = (float)6.5;<Br>double
								d = f;<br>이번 코드는 에러가 나지 않는다. float형은 double형보다 크기가 작기 때문에
								크기가 더 커지는 형으 로 바뀌는것은 당연하다고 할수있다.<br>․ int a = 5;<Br>float
								f = (float)a;<br>a의 경우 크기가 큰 데이터형(int)이 자기보다 크기가 작은
								데이터형(float)으로 바뀌는것을 볼수있다. 강제으로 float형이 된다. 이 경우 자료의 손실이 발생할수 있다.<br>이와
								같은 변환을 캐스팅이라고 한다.
							</p>
						</div>
					</div>
				</div>
				<div class="bb-item" id="item8">
					<div class="content">
						<div class="scroller">
							<h2>8. 연산자</h2>
							<form id="submit_form8" action="educationinsert.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="8">
							 	<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="button" class="button-3d" value="형광펜 추가하기" style="display: scroll; position: fixed; top: 80px; left: 800px;" onClick="wordSearch(this.form.hl_contents.value,'submit_form8')">
							</form>
							
							<form action="education_delete.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts">
								<input type="hidden" name="pages" value="8">
								<input type="hidden" name="dataClassify" value="<%=dataClassify%>">
								<input type="hidden" name="memberID" value="<%=memberID%>">
								<input type="submit" class="button-3d" value="형광펜 삭제하기" style="display: scroll; position: fixed; top: 80px; left: 950px;" >
							</form>
							<p>
								수학에서의 연산과 비슷하다. 자바에서 연산자는 변수의 값을 대입하거나, 내용을 변경하는데 사용된 다. 또한 자바
								연산자는 연산 대상이 될 수 있는 데이터 형이 정해져 있고, 범위를 넘는 연산에 대해서 는 에러가 일어나지 않고
								단지 연산결과에 이상한 값이 들어가 있는 경우가 발생한다.<Br>연산자의 종류는 산술 연산자, 관계
								연산자, 조건 연산자, 비트 연산자, 대입 연산자, 형변환 연산자, 객체형 연산자가 있다.<br>․
								산술연산자 : 다항 연산자와 단항 연산자로 나뉜다. 다항연산자는 두 개 이상의 값을 가지고서 이루어 지는
								연산식이며, 단항 연산자는 한 연산항에 대해서 계산을 하는것이다.<br>
							</p>
							<div align="center">
								<img src="image/java_image5.png">
							</div>
							<p>
								int a = 10, b = 20; // 변수를 초기화 시킨다.<br>
								System.out.println(a + b); // 출력시 a + b는 즉 10 + 20 과 같은 의미.<br>
								System.out.println(a * b); // 10 * 20<br>
								System.out.println(++a); // 증감 연산자로써 ++가 변수 앞에 존재하면 먼저 값 증가 11.<br>
								System.out.println(a++); // 증감 연사자이지만 ++가 변수 뒤에 존재해서 먼저 값 변화없음.<br>
								<br> 마지막 예를 보면 ++연산자가 뒤에 있는 경우 값이 증가를 하지만 먼저 처리하지 않고 변수의 값을
								먼 저 출력후 증가된 값이 적용된다.<br> System.out.println(a++); // 값 10.
								(값은 10이 지만 연산자가 다음 연산처리시에 적용된다.)<br>
								System.out.println(++a); // 값 12가 되어 버린다. (위 a++에서 연산 후 값이 11로
								변해있을것이고 여기서 다시 ++연산자가 앞에 존재하므로 값이 같이 증가 해 버린다.)<br> <br>
								․ 관계연산자 : 연산항 간의 관계를 통해서 서로 크기(값)을 비교하여 결과값이 논리형으로 나온다.<br>
							</p>
							<div align="center">
								<img src="image/java_image6.png">
							</div>
							<p>
								int a = 10, b = 20, c = 15;<br> System.out.println(a + ">"
								+ b + ":" + (a>b)); // 10 > 20 : false<br>
								System.out.println(a + "!=" + c + ":" + (a!=c)); // 10 != 15 :
								true<br> <br> ․ 조건연산자 : 두 개 이상의 조건을 사용하고자 할 때에 쓰이는
								연산자이다.<br> A와 B 모두 참이거나 A는 참이고 B는 거짓이다. 와 같이 다양한 조건을 처리하고자
								할때 쓰임.<br>

							</p>
							<div align="center">
								<img src="image/java_image7.png">
							</div>
							<p>
								int a = 10, b = 20;<br> if(a==10 && b==20)<br>
								&nbsp;System.out.println("true");<br> else<br>
								&nbsp;System.out.println("false");<br> <br> if문은 뒤에 가서
								배우겠지만 여기서 간단히 설명하자면 만약 a가 10과 같고(참) b가 20과 같으면(참) 둘다 참이므로(true)
								System.out.println("true") 명령문이 실행이 된다.<br> <br> 또 다른
								예를 들어서<br> int a = 10, b = 20;<br>
								System.out.println(a==11 ? "true" : "false");<br> 이 코드는 a가
								11과 같다면 true를.. 그렇지 않다면 false를 출력. 당연 같지 않으므로 false 출력됨.<br>
								․ 비트 연산자 : 변수의 값을 비트 단위로 처리하고자 할 때 사용된다. 영화 메트릭스를 보면 0과1로 된 숫자가
								여러화면을 통해서 전달되고 보여진다. 물론 그 영화의 내용과 다르지만.; 아무튼 그런 0과 1로 된 비트단위로
								연산을 하는 것이라고 보면 된다.<Br>
							</p>
							<div align="center">
								<img src="image/java_image8.png">
							</div>
							<p>
								무슨말인지.. 잘 모를것이다.. 나 또한 맨 처음 이게 무슨 말인지 잘 몰랐으며<Br> 지금 이것을 어떻게
								설명해야 하는지도 참 난감하다.<Br> <br>컴퓨터는 숫자라는것을 0과 1을 이용해서 2진수
								형태로 컴퓨터 내부에 저장된다.<br>int형이 4바이트의 공간을 차지하다면 32비트(1바이트가
								8비트이므로.)이다.<Br>
							</p>
							<div align="center">
								<img src="image/java_image9.png">
							</div>
							<p>
								엇 그렇다면 << 연산자 같은 경우 남은 공백을 0으로 채웠는데 맨 위에 >> 연산자에서 남은 공백은 어 떻게
								처리가 되는것일까? 그것은 맨 왼쪽에 있던 비트를 복사해서 넣는다.<br>그 이유는 부호 때문이다.
								컴퓨터는 부호를 나타낼때 최상위 비트(가장 맨 왼쪽)에 1을 놓게된다. 그렇 게 하면 최상위 비트가 유지가 되므로
								값의 부호는 바뀌지 않게 되기 때문이다. 하지만 막상 오른쪽으 로 이동하는 >> 연산자를 쓰이는 일이 많지 않으므로
								이것보다는 >>> 연산자를 사용하게 된다. 이것은 최상위 비트에 무조건 0을 넣는다.<Br>
								<br>비트 논리 연산<br>
							</p>
							<div align="center">
								<img src="image/java_image10.png">
							</div>
							<p>
								nt a = 3; &nbsp; // 0000 0011<br> int b = 4;&nbsp; // 0000
								0100<br> int c = a & b;&nbsp; // 0000 0000 결과 값은 0이다.<br>
								int c = a | b; &nbsp; // 0000 0111 결과 값은 7이다.<Br> int c = a
								^ b; &nbsp;// 0000 0111 결과 값은 7이다.<br> <Br> ․ 대입연산자 :
								연산식의 값을 변수에 옮길 때 사용한다. 우리가 많이 사용하는 ‘ = ’ 기호이다. int a = 4; // 변수
								a에다가 4라는 값을 대입시킨다.<br> 4 = a; // 이것은 말도 안된다. 안됨.<br>
								<br>
							</p>
							<div align="center">
								<img src="image/java_image11.png">
							</div>
							<p>
								short a = 5;<br> int b = 10;<Br> long e = 0;<Br>
								<br>e += b // e = e + b 이므로 값은 10<Br> e -= a // e = e
								- a 이므로 값은 5<Br>
								<br>․ 형변환연산자 : 위 데이터형 변환에서 설명했듯이 작은 공간의 값을 큰 공간으로 이동시킬 때와
								반대 로 큰 공간의 값을 작은 공간의 값으로 바꿀 때 쓰인다<br> <br> int a = 10;<br>
								byte b = 100;<br> float c = 5.5f;<br> <Br> a = b;
								// 이때 b는 a와 같은 자료형이므로 자동으로 형변환 된다.<br> c = (float)a; //
								int형인 a를 float형인 c에 넣기 위해 강제로 a변수앞에 (float)을 선언하였다. c의 현재 값은
								100.0f로 바뀌었다.<br>
								<br> 자료형이 다를 때 보통 작은 공간의 자료형이 큰 공간의 자료형으로 바뀌어 결과값을 보여준다.<br>

							</p>
							<div align="center">
								<img src="image/java_image12.png">
							</div>
							<p>연산자 우선 순위</p>
							<div align="center">
								<img src="image/java_image13.png">
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
	<script src="js/jquery.mousewheel.js"></script>
	<script src="js/jquery.jscrollpane.min.js"></script>
	<script src="js/jquerypp.custom.js"></script>
	<script src="js/jquery.bookblock.js"></script>
	<script src="js/page.js"></script>
	<script>
		$(function() {

			Page.init();

		});
	</script>
</body>
</html>