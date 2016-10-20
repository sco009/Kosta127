<%@page import="java.util.List"%>
<%@page import="cosmos.login.model.Member"%>
<%@page import="cosmos.login.model.MemberService"%>
<%@page import="cosmos.login.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 

	request.setCharacterEncoding("utf-8");
	MemberService service = MemberService.getInstance();
	
	/* String id = (String)request.getParameter("id");  */
	String memberID = (String)session.getAttribute("memberID");
	String memberPw = (String)session.getAttribute("memberPw");
	String memberName = (String)session.getAttribute("memberName");
	String memberPhoneNum = (String)session.getAttribute("memberPhoneNum");
	String memberEmail = (String)session.getAttribute("memberEmail"); 
	Member member = service.selectMemberService(memberID);
	
	request.setAttribute("member", member);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../css/Log_css/join.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../css/Log_css/header.css" type="text/css" media="screen" />
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../Log_module/header.jsp" />
		<br><br>
		<div class="container">
		<br><br><br><br>
	<div class="row">
	    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form role="form" action="updateOk.jsp?memberID=${member.memberID}" class="form" method="post" name="userForm">
				<h2>Please Update Info <small>회원정보를 수정해주세요</small></h2>
				<hr class="colorgraph">
				
				<div class="form-group">
					<input type="text" name="memberID" id="memberID" class="form-control input-lg" placeholder="${member.memberID}" tabindex="1" onkeyup="openUpdateId(this.form)">
				</div>
				
				<div class="form-group">
					<input type="password" name="memberPw" id="memberPw" class="form-control input-lg" placeholder="${member.memberPw}" tabindex="4" value="${member.memberPw}">
				</div>
				
				<div class="form-group">
					<input type="text" name="memberName" id="memberName" class="form-control input-lg" placeholder="${member.memberName}" tabindex="4" value="${member.memberName}">
				</div>
				
				
				<div class="form-group">
					<input type="text" name="memberPhoneNum" id="memberPhoneNum" class="form-control input-lg" placeholder="${member.memberPhoneNum}" tabindex="3" value="${member.memberPhoneNum}">
				</div>
				<div class="form-group">
					<input type="text" name="memberEmail" id="memberEmail" class="form-control input-lg" placeholder="${member.memberEmail}" tabindex="4" value="${member.memberEmail}">
				</div>
				
				
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-md-6"><input type="submit" value="Update" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
				</div>

			</form>
		</div>
	</div> 
		
	<!-- <script type="text/javascript"
		src="http://code.jquery.com/jquery-latest.min.js"></script> -->
		
	<script type="text/javascript">
		function openUpdateId(inputid) {
			if(inputid.memberID.value != "") {
				alert("아이디는 변경하실 수 없습니다!")
				return;
			}
		}
	</script>
		
	<script type="text/javascript">
		// <![CDATA[
		jQuery(function($) { // HTML 문서를 모두 읽으면 포함한 코드를 실행

			// 정규식을 변수에 할당
			// 정규식을 직접 작성할 줄 알면 참 좋겠지만
			// 변수 우측에 할당된 정규식은 검색하면 쉽게 찾을 수 있다 
			// 이 변수들의 활약상을 기대한다
			// 변수 이름을 're_'로 정한것은 'Reguar Expression'의 머릿글자
			var re_memberPw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식
			var re_memberName = /([a-z\.])$/; // 이름 검사식
			var re_memberEmail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
			var re_memberPhoneNum = /^[0-9]{8,11}$/; // 전화번호 검사식

			// 선택할 요소를 변수에 할당
			// 변수에 할당하지 않으면 매번 HTML 요소를 선택해야 하기 때문에 귀찮고 성능에도 좋지 않다
			// 쉼표를 이용해서 여러 변수를 한 번에 선언할 수 있다
			// 보기 좋으라고 쉼표 단위로 줄을 바꿨다 
			var form = $('.form'), memberPw = $('#memberPw'), memberName = $('#memberName'), memberEmail = $('#memberEmail'), memberPhoneNum = $('#memberPhoneNum');

			// 선택한 form에 서밋 이벤트가 발생하면 실행한다
			// if (사용자 입력 값이 정규식 검사에 의해 참이 아니면) {포함한 코드를 실행}
			// if 조건절 안의 '정규식.test(검사할값)' 형식은 true 또는 false를 반환한다
			// if 조건절 안의 검사 결과가 '!= true' 참이 아니면 {...} 실행
			// 사용자 입력 값이 참이 아니면 alert을 띄운다
			// 사용자 입력 값이 참이 아니면 오류가 발생한 input으로 포커스를 보낸다
			// 사용자 입력 값이 참이 아니면 form 서밋을 중단한다
			form.submit(function() {
				if (re_memberPw.test(memberPw.val()) != true) { // 비밀번호 검사
					alert('[비밀번호 입력 오류] 유효한 PW를 입력해 주세요');
					memberPw.focus();
					return false;
				} else if(re_memberName.test(memberName.val()) != true){
					alert('[이름 입력 오류] 유효한 이름을 입력해 주세요');
					memberName.focus();
					return false;
				} else if (re_memberPhoneNum.test(memberPhoneNum.val()) != true) { // 전화번호 검사
					alert('[전화번호 입력 오류] 유효한 전화번호를 입력해 주세요');
					memberPhoneNum.focus();
					return false;
				} else if (re_memberEmail.test(memberEmail.val()) != true) { // 이메일 검사
					alert('[이메일 입력 오류] 유효한 이메일 주소를 입력해 주세요');
					memberEmail.focus();
					return false;
				} 
			});

			// #id, #password 인풋에 입력된 값의 길이가 적당한지 알려주려고 한다
			// #id, #password 다음 순서에 경고 텍스트 출력을 위한 빈 strong 요소를 추가한다
			// 무턱대고 자바스크립트를 이용해서 HTML 삽입하는 것은 좋지 않은 버릇
			// 그러나 이 경우는 strong 요소가 없어도 누구나 form 핵심 기능을 이용할 수 있으니까 문제 없다
			$('#memberPw').after('<strong></strong>');


			// #password 인풋에서 onkeyup 이벤트가 발생하면
			memberPw.keyup(function() {
				var s = $(this).next('strong'); // strong 요소를 변수에 할당
				if (memberPw.val().length == 0) { // 입력 값이 없을 때
					s.text(''); // strong 요소에 포함된 문자 지움
				} else if (memberPw.val().length < 6) { // 입력 값이 6보다 작을 때
					s.text('너무 짧아요'); // strong 요소에 문자 출력
				} else if (memberPw.val().length > 18) { // 입력 값이 18보다 클 때
					s.text('너무 길어요'); // strong 요소에 문자 출력
				} else { // 입력 값이 6 이상 18 이하일 때
					s.text('적당해요'); // strong 요소에 문자 출력
				}
			});

			
			// #phone_n 인풋에 onkeydown 이벤트가 발생하면
			// 하이픈(-) 키가 눌렸는지 확인
			// 하이픈(-) 키가 눌렸다면 입력 중단
			memberPhoneNum.keydown(function() {
				if (event.keyCode == 109 || event.keyCode == 189) {
					return false;
				}
			});
		});
		
		// ]]>
	</script>
	
	<%-- <jsp:include page="module/footer.jsp" /> --%>
	</div>
</body>
</html>