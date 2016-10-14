function Next() {
	var selectAnswer = $(":input:radio[name=multipleChoiceSelect]:checked")
			.val(); // 다음페이지로 넘어갈때 틀린 문제 아이디를 받기 위해.
	var Answer = $(":input:hidden[name=multipleChoiceSelectAnswer]").val();
	var solveSelectId = $(":input:hidden[name=solveSelectId]").val();
	if (selectAnswer !== Answer) {
		location.href = "MultipleMain.jsp?solveFailId=" + solveSelectId;
	} else {
		location.href = "MultipleMain.jsp?solveSuccessId=" + solveSelectId;
	}
}

function choiceButton() {
	document.getElementById("myCheckButton").style.display = "block";
}

function selectMutlpleCheck() {

	var selectAnswer = $(":input:radio[name=multipleChoiceSelect]:checked").val();
	var Answer = $(":input:hidden[name=multipleChoiceSelectAnswer]").val(); // 선택된 문제에 해당하는 값 가져오기
	var check = "";

	if (selectAnswer === Answer) {
		check = "O";
	} else if (selectAnswer !== Answer) {
		check = "X";
	}
	document.getElementById("solveButton").style.display = "block";
	document.getElementById("checkAnswer").innerHTML = check; // 선택된 문제에 해당하는
																// 답 출력하기
}
function resultMultiple() {
	var selectAnswer = $(":input:radio[name=multipleChoiceSelect]:checked").val(); // 마지막 값은 바로 resultMultiple.jsp로 넘겨준다.
	var Answer = $(":input:hidden[name=multipleChoiceSelectAnswer]").val();
	var solveSelectId = $(":input:hidden[name=LastsolveSelectId]").val();
	if (selectAnswer !== Answer) {
		location.href = "resultMultiple.jsp?solveFailId=" + solveSelectId;
	} else {
		location.href = "resultMultiple.jsp?solveSuccessId=" + solveSelectId;
	}
}

function returnMultipleMain() {
	location.href = "MultipleMain.jsp";
}

$(function() {
	$('.dropdown-el').click(function(e) {
		e.preventDefault();
		e.stopPropagation();
		var el = $(this);
		$(el).toggleClass('expanded');
		$('#' + $(e.target).attr('for')).prop('checked', true);
	});

	$('.dropdown-els').click(function(e) {
		e.preventDefault();
		e.stopPropagation();
		var els = $(this);
		$(els).toggleClass('expanded');
		$('#' + $(e.target).attr('for')).prop('checked', true);
	});
});