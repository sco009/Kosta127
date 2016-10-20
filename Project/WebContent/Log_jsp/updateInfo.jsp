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
				<h2>Please Update Info <small>ȸ�������� �������ּ���</small></h2>
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
				alert("���̵�� �����Ͻ� �� �����ϴ�!")
				return;
			}
		}
	</script>
		
	<script type="text/javascript">
		// <![CDATA[
		jQuery(function($) { // HTML ������ ��� ������ ������ �ڵ带 ����

			// ���Խ��� ������ �Ҵ�
			// ���Խ��� ���� �ۼ��� �� �˸� �� ��������
			// ���� ������ �Ҵ�� ���Խ��� �˻��ϸ� ���� ã�� �� �ִ� 
			// �� �������� Ȱ����� ����Ѵ�
			// ���� �̸��� 're_'�� ���Ѱ��� 'Reguar Expression'�� �Ӹ�����
			var re_memberPw = /^[a-z0-9_-]{6,18}$/; // ��й�ȣ �˻��
			var re_memberName = /([a-z\.])$/; // �̸� �˻��
			var re_memberEmail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // �̸��� �˻��
			var re_memberPhoneNum = /^[0-9]{8,11}$/; // ��ȭ��ȣ �˻��

			// ������ ��Ҹ� ������ �Ҵ�
			// ������ �Ҵ����� ������ �Ź� HTML ��Ҹ� �����ؾ� �ϱ� ������ ������ ���ɿ��� ���� �ʴ�
			// ��ǥ�� �̿��ؼ� ���� ������ �� ���� ������ �� �ִ�
			// ���� ������� ��ǥ ������ ���� �ٲ�� 
			var form = $('.form'), memberPw = $('#memberPw'), memberName = $('#memberName'), memberEmail = $('#memberEmail'), memberPhoneNum = $('#memberPhoneNum');

			// ������ form�� ���� �̺�Ʈ�� �߻��ϸ� �����Ѵ�
			// if (����� �Է� ���� ���Խ� �˻翡 ���� ���� �ƴϸ�) {������ �ڵ带 ����}
			// if ������ ���� '���Խ�.test(�˻��Ұ�)' ������ true �Ǵ� false�� ��ȯ�Ѵ�
			// if ������ ���� �˻� ����� '!= true' ���� �ƴϸ� {...} ����
			// ����� �Է� ���� ���� �ƴϸ� alert�� ����
			// ����� �Է� ���� ���� �ƴϸ� ������ �߻��� input���� ��Ŀ���� ������
			// ����� �Է� ���� ���� �ƴϸ� form ������ �ߴ��Ѵ�
			form.submit(function() {
				if (re_memberPw.test(memberPw.val()) != true) { // ��й�ȣ �˻�
					alert('[��й�ȣ �Է� ����] ��ȿ�� PW�� �Է��� �ּ���');
					memberPw.focus();
					return false;
				} else if(re_memberName.test(memberName.val()) != true){
					alert('[�̸� �Է� ����] ��ȿ�� �̸��� �Է��� �ּ���');
					memberName.focus();
					return false;
				} else if (re_memberPhoneNum.test(memberPhoneNum.val()) != true) { // ��ȭ��ȣ �˻�
					alert('[��ȭ��ȣ �Է� ����] ��ȿ�� ��ȭ��ȣ�� �Է��� �ּ���');
					memberPhoneNum.focus();
					return false;
				} else if (re_memberEmail.test(memberEmail.val()) != true) { // �̸��� �˻�
					alert('[�̸��� �Է� ����] ��ȿ�� �̸��� �ּҸ� �Է��� �ּ���');
					memberEmail.focus();
					return false;
				} 
			});

			// #id, #password ��ǲ�� �Էµ� ���� ���̰� �������� �˷��ַ��� �Ѵ�
			// #id, #password ���� ������ ��� �ؽ�Ʈ ����� ���� �� strong ��Ҹ� �߰��Ѵ�
			// ���δ�� �ڹٽ�ũ��Ʈ�� �̿��ؼ� HTML �����ϴ� ���� ���� ���� ����
			// �׷��� �� ���� strong ��Ұ� ��� ������ form �ٽ� ����� �̿��� �� �����ϱ� ���� ����
			$('#memberPw').after('<strong></strong>');


			// #password ��ǲ���� onkeyup �̺�Ʈ�� �߻��ϸ�
			memberPw.keyup(function() {
				var s = $(this).next('strong'); // strong ��Ҹ� ������ �Ҵ�
				if (memberPw.val().length == 0) { // �Է� ���� ���� ��
					s.text(''); // strong ��ҿ� ���Ե� ���� ����
				} else if (memberPw.val().length < 6) { // �Է� ���� 6���� ���� ��
					s.text('�ʹ� ª�ƿ�'); // strong ��ҿ� ���� ���
				} else if (memberPw.val().length > 18) { // �Է� ���� 18���� Ŭ ��
					s.text('�ʹ� ����'); // strong ��ҿ� ���� ���
				} else { // �Է� ���� 6 �̻� 18 ������ ��
					s.text('�����ؿ�'); // strong ��ҿ� ���� ���
				}
			});

			
			// #phone_n ��ǲ�� onkeydown �̺�Ʈ�� �߻��ϸ�
			// ������(-) Ű�� ���ȴ��� Ȯ��
			// ������(-) Ű�� ���ȴٸ� �Է� �ߴ�
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