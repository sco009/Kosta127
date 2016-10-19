
<%@page import="cosmos.education.model.EducationContents"%>
<%@page import="cosmos.education.model.EducationService"%>
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
			List<EducationContents> list = service.selectmemberID(memberID);  //해당 아이디에 입력되어있는 hl_contents값 가져옴,
			for(int i = 0 ; i < list.size() ; i ++){
				if(i>0){
		 			data+="/";   // 각각의 hl_contents사이에  "/" 추가 
		 		}
				String str = list.get(i).gethl_contents();
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
<title>JAVA 자바의 소개</title>
<meta name="description"
	content="Fullscreen Pageflip Layout with BookBlock" />
<meta name="keywords"
	content="fullscreen pageflip, booklet, layout, bookblock, jquery plugin, flipboard layout, sidebar menu" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/jquery.jscrollpane.custom.css" />
<link rel="stylesheet" type="text/css" href="css/bookblock.css" />
<link rel="stylesheet" type="text/css" href="css/custom.css" />
<script src="js/modernizr.custom.79639.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {

		start();  //hl_contents사이에  "/"있는것을 기준으로 데이터 분리 하기 위한 function
		var page ='<%=pages%>'; 
		if(page >  1){
			for(var i = 1 ; i < page ; i ++){
				setTimeout(function(page){
					click(page)    // 해당 페이지를 찾아가기 위해 클릭하는 function
				}, i*1000);
			}
		}
		$('p').mouseup(function() {    // 드레그한 값을 가져오기 위한 function
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
			
			
			
			if(txt == '' || txt == ' '){
				$('.texts').val('null');
			}else{
				txt = String(txt); 
				if(txt.length > 50){
					$('.texts').val('null');
				}else{
					$('.texts').val(txt);
				}
			}
			
			
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
				wordSearch(list[i]);   // 잘라진 hl_contents를 앞뒤에 span을 추가 하기 위한 function
			}
		
	} 
	function wordSearch(word,form_id) {   //입력 받은 값을 앞뒤에 span 을 줘서 배경 색을 노란새으로 변경 
<<<<<<< HEAD
		
		$ptags = $('div.scroller p');
=======
	
		if(!(word == 'null')){
			$ptags = $('div.scroller p');
>>>>>>> branch 'master' of https://github.com/sco009/Kosta127.git

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

	}
</script>
<style>
.button-3d {
  position:relative;
  width: auto;
  display:inline-block;
  color:#ecf0f1;
  text-decoration:none;
  border-radius:5px;
  border:solid 1px #f39c12;
  background:#e67e22;
  text-align:center;
  padding:16px 18px 14px;
  margin: 12px;
  
  -webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	
  -webkit-box-shadow: 0px 6px 0px #d35400;
  -moz-box-shadow: 0px 6px 0px #d35400;
  box-shadow: 0px 6px 0px #d35400;
}

.button-3d:active{
    -webkit-box-shadow: 0px 2px 0px #d35400;
    -moz-box-shadow: 0px 2px 0px #d35400;
    box-shadow: 0px 2px 0px #d35400;
    position:relative;
    top:4px;
}
</style>
</head>

<body>
<div>
	<jsp:include page="../../Log_module/header.jsp" />
		<br><br><br>
</div>


	<div id="container" class="container">

		<div class="menu-panel">
			<h3>JAVA 자바의 소개</h3>
			<ul id="menu-toc" class="menu-toc">
				<li class="menu-toc-current"><a href="#item1">1. Java의 소개</a></li>
				<li><a href="#item2">2. 개발환경의 구축</a></li>
				<li><a href="#item3">3. 자바 프로그래밍 과정</a></li>
			</ul>
			<a href="javatwo.jsp?dataClassify=javatwo&memberID=ohwoosung"><h4>다음장으로</h4> </a>
		</div>

		<div class="bb-custom-wrapper">
			<div id="bb-bookblock" class="bb-bookblock">
				<div class="bb-item" id="item1">
					<div class="content">
						<div class="scroller">
							<h2>1. Java의 소개</h2>
							<form id="submit_form" action="educationinsert.jsp" method="post">
								<input type="hidden" name="hl_contents" class="texts" value="null">
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
						
						

							<p>소개</p>
							<br>
							<p>자바는 년 사의 제임스 고슬링에 의해 만들어진 프로그래밍 언어이다 자바는 인터넷 환경에 1991 Sun
								. 서 응용프로그램을 개발할 수 있도록 설계된 객체지향언어이다 즉 등 다양한 환경 운 . windows, Linux
								영체제에서도 지원하고 있다 역사는 그리 오래 되지 않았지만 사용자가 매우 증가하고 있다 .</p>
							<p>처음 자바는 인터넷이 목적이 아닌 소형 가전 제품에 내장 언어를 구현할 목적으로 만들어졌다 이 과 . 정
								즉 프로젝트를 라는 이름으로 시작하여 제임스 고슬링이 맡아서 진행되었다 이후 년 Oak . 1994 Java 로
								이름이 바뀌었고 에 의해서 개발환경이 제공된다 년 이 , JDK(Java Development Kit) . 1996
								JDK1.0 발표된 이후로 플랫폼 등등 현재 플랫폼 버전까지 이르렀고 최 JDK1.1, Java2 JDK1.2
								Java2 JDK 5.0 , 근에는 이동통신분야 과 접목하여 발전되고 있다 , XML .</p>
							<p>자바를 설치함은 를 설치한다는 의미와 같으며 그 종류에는 시스템에 따라 일반적인 개인용 컴퓨 JDK
								테에서 많이 쓰이는 인 휴대폰 등의 임베디드 시스템을 위한 JDK J2SE(Java 2 Standard
								Edition), JDK 인 대규모의 서버에서 쓰이는 인 J2ME(Java 2 Micro Edition), JDK
								J2EE(Java 2 Enterprise Edition) 의 세가지로 구분된다 우리는 앞으로 일반적인 개인용
								컴퓨터에서 많이 쓰이는 를 다루겠다 . J2SE .</p>
							<p>자바는 어렵다 모두들 주목하는 기술인데 왜 익히기는 힘들다고 할까 그 이유는 자바를 제대로 사용 . 하기
								위해서는 기술적 배경( , , TCP/IP ) . 객체지향 병렬처리 등 을 정확히 이해해야 한다는 점이다 자바자
								체가 매우 쉬운 구조를 가지지만 기술적 배경을 사전에 알고 있다는 전제하에 쉬운것이지 해당 기술에 대한 개념을
								이해하기에는 쉽지 않다.</p>
							<p>두 번째로는 자바의 내용이 너무 방대하기 때문이다 언어자체로 이해되는 에 비해서는 자바는 . C, C++
								구 구조가 분산처리 네트워크 쓰레드 등의 다양한 방면에 연관되어 있기 때문이다 해서 배우고 GUI, , . 배워도
								계속 나오는 방대한 내용에 도중에 그만두기도 한다 해서 기술을 그냥 공개해 버리기까지 한다 . . 세 번째 이유는
								와 달리 자바는 C 주도적인 개발 툴이 없다는 것이다 는 부터 . C TURBO-C BORLAND C등 주도적인
								개발툴이 있는 반면 자바의 개발툴은 각자의 회사에서 나오는 툴로 서로 경쟁을 하기만 할뿐 초보자가 툴 자체를 익혀도
								그안에 대한 기본적인 개념을 알지 못해 곤란한 경우가 많다.</p>
							<Br>

							<p>특징</p>
							<Br>
							<p>플랫폼의 독립성 : . 자바의 가장 큰 특징은 플랫폼 독립성을 갖고 있다는 점이다 예전 프로그래머는 프
								로그램을 만들때 어느 환경에서 쓰일지 결정한 후 프로그램을 작성하였다 해서 다른 환경체제에서 다 . 시 프로그램을
								쓰게 될 경우 프로그램을 수정해야 하는 번거러움이 있었다 이에 비해 자바는 한번 만 . 들어진 프로그램은 아무
								운영체제에서 와 상관없이 프로그램을 동작시킬수 있다 이것이 가능한 이 CPU . 유는 자바가상머신 이라는 플랫폼이
								설치가 되면서 자바로 작성된 프로그램이 동일한 실행환경을 (JVM) 제공해 주기 때문이다.</p>
							<p>객체지향 언어 : ,, . 자료의 추상화 상속성 다형성과 같은 특성을 지원하여야 한다 자바는 클래스를 이
								용한 모듈 중심의 프로그램이 가능하고 프로그램 코드의 재사용이 용이하다 즉 기본 클래스를 확장할 , . 수 있으며
								유용한 클래스 라이브러리를 사용할수 있다 개발자가 작업해야 할 코딩을 어느정도 줄여줄 , . 수가 있으므로 매우
								편리하다고 할수 있다.</p>
							<p>멀티 스레드 지원 : . 사용자는 쉽게 작업을 분할해서 병렬적으로 수행되도록 할수있다 즉 하나의 프로
								그램에서 음악을 들으면서 자료도 다운 받는 등 프로그램 안에서 독립적으로 실행되는 작은 실행단위라 고 할 수 있다
								메모리 공유가 가능하면서 프로그램이 보다 효율적으로 실행할수 있도록 해준다 . .</p>
							<p>자동으로 메모리를 관리 : C/C++ , 는 포인터 즉 포인터의 무절제한 사용은 유지보수 및 디버깅의 어
								려움을 가져왔고 시스템 오류의 주범이 되기도 했다 자바에서는 이러한 개념을 제거하며 사용된 메모 , . 리를
								정리해주는 등 메모리에 대해 신경쓰지 않고도 코드를 개발할 수 있도록 해준다 개발자는 사용하 . 고 싶은대로 마음껏
								메모리를 사용하다가 필요없어지면 버리면 된다 프로그래머들에게는 매우 , . C/C++ 고마운일이 아닐수 없다.</p>
							<p>동적인 성능 확장 제공 : 실행 파일이 동적으로 갱신된 라이브러리 클래스를 호출할 수 있으므로 편리 하다
								이 기능은 자바의 큰 인상을 심어주었다 미리 설치 되지 않은 프로그램이 서버로부터 동적으로 . . 다운로드 되어 웹
								브라우저에서 실행할수 있다는 점인데 이것은 기존 컴퓨터에서 프로그램을 업데이트 시에 다시 교체하는 등 번거로운 일을
								서버와의 네트워크 연결시 자동으로 다운로드 되어 소프트웨어의 성능을 확장시킬수 있는 등 매우 효율적이라고 할수
								있다.</p>
							<p>자바는 오류에 강하다 : 자바는 네트워크에서 동작하므로 강력한 오류 또한 검사하는 기능을 가지고 있다
								오류가 날수 있는 코드 범위안에서 미리 오류 처리 루틴을 작성하여 불필요한 프로그램의 중단을 . 막아주고 많은
								실행시간 오류와 비정상적인 상황을 방지 할수 있다 , .</p>
							<br>
							<p>구조</p>
							<br>
							<p>
								프로그램 작성 바이트 코드 컴파일 자바가상머신 프로그램 실행 -> ( ) -> ( ) C CPU . 는 해당
								컴퓨터의 에서 실행할수 있는 기계어로 바꾸어준다 다른 종류의 컴퓨터에서 실행하기 위 해서는 다시 재 컴파일 해당
								컴퓨터 기계어로 을 해야한다 이에 반해 자바는 한번 컴파일을 수 ( CPU ..) . 행하면 바이트 코드라고 불리는
								중간단계의 컴파일이 생성되어 한번 컴파일된 바이트 코드는 자바 실행 환경 자바가상머신 이 구축된 곳이라면
								재컴파일없이 바로 실행이 가능하다 () . <Br>*여기서 컴파일은 우리가 프로그램을 만들기 위해 작성한
								소스를 컴퓨터가 알아볼수 있게 하기위한 변 환 과정으로 보면 된다
							</p>
							<p>그럼 자바가상머신이란 무엇일까 자바 바이트 코드를 실행시키기 위해 소프트웨어로 만들어진 가상 ? CPU
								이다 즉 자바 가상 머신은 단독으로 존재 할수도 웹 브라우저 안에서 존재 할수도 또는 한 플랫 폼 안에서도 동시에
								존재할수도 있다 그래서 바이트 코드가 종류에 상관없이 자바 가상머신만 존재하 . 면 어떤 플랫폼에서도 수행이
								가능하다.</p>
							<p>네트워크 역시 마찬가지 원격 컴퓨터에서 자바소스를 컴파일하여 만들어진 바이트 코드가 네트워크상 ! 로컬
								컴퓨터로 전송되면 로컬 자체에서 자바가상머신이 바이트코드를 읽어들일수가 있는것이다.</p>
							<Br>
							<p>유형</p>
							<br>
							<p>
								애플릿 : 네트워크의 원격컴퓨터에서 전송받아 웹이나 애플릿 뷰어에서 실행되는 프로그램이다.<br>
								애플리케이션 : . 독립적인 자바 실행 프로그램이다 자바가상머신이 존재하는 어느 플랫폼에서도 실행가 능하지만
								애플릿처럼 바로바로 다운받아쓰는 동적기능이 제공되지 않는다.<br> 서블릿 : (CGI ) . 웹 서버를
								통해서 서비스를 제공하는 자바의 프로그램 프로그램 이다 웹 브라우저를 통 해서 클라이언트의 요청을 프로그램이 처리함
								서버측 애플릿이라고도 한다 CGI . .<br> 빈즈 : . 자바로 만들어진 컴포넌트이다 독립적인 기능과
								화면을 갖고 있는 실행 모듈로서 프로그램의 재생산성을 드라마틱하게 향상시킨다.<br>
							</p>

						</div>
					</div>
				</div>
				<div class="bb-item" id="item2">
					<div class="content">
						<div class="scroller">
							<h2>2. 개발환경의 구축</h2>
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
							<p>JDK의 설치</p>
							<br>
							<p>
								자바의 개발도구인 는 무료로 제공이 된다 홈페이지에서 쉽게 다운로드가 가능하며 자바프로 JDK . Sun 그램을
								개발하기 위한 다양한 개발도구가 포함되어 있다 현재 버전은 까지 나와있으며 , . JDK 6.0 JDK 5.0 .
								http://java.sun.com .<br>다운받은 파일을 실행하여 프로그램을 설치한다 설치시 중간에
								설치할 요소를 선택하게 되는데 우리는 . 모두 선택해서 설치하는 것으로 하겠다.<Br>설치하는 방법은 매우
								쉬우나 자바를 본격적으로 컴파일하고 실행시키기 위해 환경설정을 해주어야 한 다.
							</p>
							<br>

							<p>JDK 환경설정</p>
							<br>
							<p>
								① 윈도우즈 바탕화면의 [내 컴퓨터] 에서 마우스 오른쪽 버튼을 클릭후 속성 메뉴를 클릭한다 .<br> ②
								[고급] 탭으로 이동 "환경변수"" 버튼을 클릭한다 .<br> ③ 사용자 변수와 시스템 변수를 각각
								설정하겠다 먼저 사용자 변수에서 Path를 선택 "편집" 버튼을 클릭한다 (없을시에는 새로 만들기 버튼을 클릭 후
								변수이름 항목에 라고 입력한다 .) 변수 값에 방금 자바를 설치한 폴더주소를 적는다.' c:₩Program
								Files₩Java₩jdk1.5.0_06₩bin; ' 처럼 입력한다.<br> ④ 시스템 변수에는
								CLASSPATH을 선택후 편집 버튼을 클릭한다 이 항목이 없을시에 위 방법처럼 만들어서 사용하면 된다 이 항목의
								변수값은 ‘.’만 넣는다 .
							</p>
							<br>
							<p>통합개발환경</p>
							<br>
							<p>
								앞으로 자바를 공부하면서 많은 코드를 보게되고 쳐보면서 결과를 확인해볼것이다.<br> 근데 각각 코드를
								메모장에서 치고 확인하고 일일이 도스창에서 컴파일해가며 결과를 출력하기란 여간 힘든것이 아니다 해서 프로그램의
								작성을 쉽게 할수있도록 에디터 컴파일러 디버거등을 한꺼번에 제 . 공하는 프로그램이 많이 나왔다 등 한번 설치해두면
								나중에 컴파일이나 출력할 때 간단한 키 . EditPlus 워드로 확인이 가능하다는 말이다.
							</p>
							<br>
							<p>하지만 대부분이 상용화된 개발도구로서 그 가격 또한 만만치 않다 그러니 이러한 프로그램은 각자 주 .
								변에서 구해서 쓰거나 혹은 프리웨어로 제공되는 JCreator을 사용해도 좋다 혹은 EditPlus로 일간 30
								체험판도 있으니 참고하시길.</p>
							<br>
						</div>
					</div>
				</div>
				<div class="bb-item" id="item3">
					<div class="content">
						<div class="scroller">
							<h2>3. 자바 프로그래밍 과정</h2>
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
								자바 프로그램에는 크게 자바 애플리케이션과 자바 애플릿으로 나뉘며 위에서 설명 (유형) 한것과 같이 애플리케이션은
								자바를 c나 c++처럼 사용한다 컴퓨터에서 실행할 수 있는 프로그램을 개발할수있으며 애플리케이션은 다시 콘솔
								애플리케이션과 윈도우 애플리케이션으로 나뉜다. <br> 애플릿 또한 위의 설명 (유형) 한것과 같이
								서버에서 클라이언트로 전송되어 실행되는 프로그램이다 이 . 실행결과를 보기위해서는 애플릿 뷰어 프로그램을 이용하는
								것과 웹 브라우저를 실행하는 방법이 있다.
							</p>
							<Br>
							<p>․ 자바 애플리케이션의 프로그래밍 과정으로는 ① 클래스명.java -> ② 컴파일러(javac) -> ③
								클래스명.class -> ④ 인터프린터(java) -> ⑤ 실행</p>
							<br>
							<p>
								① 파일 (클래스) AAA.java명을 로 저장을 한다 .<br> ② 코드를 작성했으니 이제 컴파일 하여
								자바 바이트코드로 변환 (컴퓨터가 알아볼수있도록) C:₩> javac AAA.java <br> ③
								컴파일하면 class파일이 생성이 된다 .<br> ④ 생성된 class파일을 인터프린터 시켜서 실행시켜본다
								. C:₩> java AAA <br> ⑤ 실행
							</p>
							<Br>
							<p>
								실습 (메모장을 열고서 똑같이 적어보자.)<br> 01 /* 파일이름 : java1-1.java */<br>
								02 public class java1-1{ // 클래스 이름 : java1-1<br> 03 public
								static void main(String[] args){<br> 04
								System.out.println("hello!! java!");<br> 05 }<br> 06 }
							</p>
							<br>
							<p>해석</p>
							<br>
							<p>
								01 : /* 주석 설명 */ , 여러 행을 주석으로 처리하고 싶을 때 사용한다.(여러줄 주석처리시 많이 사용)<br>
								02 : // 단행을 주석으로 처리하고 싶을 때 사용한다. (한줄 주석처리시 많이 사용) <br>public
								class java1-1 은 즉 java1-1로 시작하는 클래스명이며 자바는 클래스로 실행되는 객체지향언 어이다.
								해서 파일명 또한 처음 시작되는 java1-1.java로 해주어야한다. 만약 다르게 했을시 오류가 나 며 자바는
								대소문자도 정확히 구별해서 작성해야 하기 때문에 파일명도 대소문가 정확히 구별해서 저장 시켜야 한다.<br>03
								: public 어디서든 이 main()메소드 호출이 가능하다는 뜻이다. 다른클래스에서 공개됨. static은
								main()이 정적메소드로 정적메모리에 할당한다는 뜻이다.<br>void는 main()의 반환값이 없음을
								나타낸다. 마지막으로 main()메소드는 클래스의 시작을 나타낸다. String[] args 는 나중에 인터프리터
								명령 내리시에 인자값을 문자열 배열로 갖는다.<br>04 :
								System.out.println("hello!! java!"); 항상 명령뒤에는 ; 세미콜론이 붙어야 컴퓨터가
								명령의 끝으로 간주한다. System 이라는 클래스에 out 객체의 println() 메소드를 이용하여
								“hello!! java!"를 출력한다.<br>05 : main()메소드의 끝.<br> 06 :
								자바프로그램의 끝.(클래스 끝)<br>더 자세한 내용은 뒤에 가서 설명하겠다. 일단 지금은 이렇게 코드를
								쳐서 java1-1.java로 저장후 위에 프로그래밍과정에서 설명한대로 컴파일 및 실행을 해서 결과를 얻어보자.
							</p>
							<br>
							<p>자바 애플릿의 프로그래밍 과정으로는 ① 클래스명.java -> ② 컴파일러(javac) -> ③
								클래스명.class & 클래스명.html -> ④ Appletviewer or 웹 -> ⑤ 실행</p>
							<br>
							<p>
								애플릿 코드 작성시 main()메소드는 작성하지 않는다. 대신 init()라는 메소드와 애플릿코드를 작성하 기 위해
								applet객체를 import시켜서 코드를 작성한다.<br> ③ 컴파일된 클래스파일을 html 웹문서에
								심는다(?). 자바클래스명.html을 작성한다.<br> ④ c:₩>appletviewer 클래스명.html
							</p>
						</div>
					</div>
				</div>


			</div>

			<nav> <span id="bb-nav-prev">&larr;</span> <span
				id="bb-nav-next">&rarr;</span> </nav>

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