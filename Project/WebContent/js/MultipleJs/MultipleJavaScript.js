function Next() {
	var selectAnswer = $(":input:radio[name=multipleChoiceSelect]:checked").val(); // 다음페이지로 넘어갈때 틀린 문제 아이디를 받기 위해.
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

function returnMultipleMain() {
	location.href = "MultipleMain.jsp";
}

function selectMutlpleCheck() {

	var selectAnswer = $(":input:radio[name=multipleChoiceSelect]:checked")
			.val();
	var Answer = $(":input:hidden[name=multipleChoiceSelectAnswer]").val(); // 선택된
	// 문제에
	// 해당하는
	// 값
	// 가져오기
	var check = "";

	if (selectAnswer === Answer) {
		check = "<img src='../MultipleImage/ok.gif'>";
	} else if (selectAnswer !== Answer) {
		check = "<img src='../MultipleImage/x.gif'>";
	}

	$("#radio-option-1").attr("disabled", true);
	$("#radio-option-2").attr("disabled", true);
	$("#radio-option-3").attr("disabled", true);
	$("#radio-option-4").attr("disabled", true);

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

$(document).ready(function() {
	$('[data-toggle="popover"]').popover({
		container : "body"
	});
});

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

$(document).keydown(function(e) {			/*F5키 입력 방지*/
    key = (e) ? e.keyCode : event.keyCode;
     
    var t = document.activeElement;
     
    if (key == 8 || key == 116 || key == 17 || key == 82) {
        if (key == 8) {
            if (t.tagName != "INPUT") {
                if (e) {
                    e.preventDefault();
                } else {
                    event.keyCode = 0;
                    event.returnValue = false;
                }
            }
        } else {
            if (e) {
                e.preventDefault();
            } else {
                event.keyCode = 0;
                event.returnValue = false;
            }
        }
    }
});