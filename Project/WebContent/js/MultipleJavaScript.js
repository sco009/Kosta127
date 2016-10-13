	function Next() {
		location.href= "MultipleMain.jsp"
	}
	function selectMutlpleCheck() {
		var Answer = "정답은 : "+$(":input:hidden[name=multipleChoiceSelectAnswer]").val();	//선택된 문제에 해당하는 값 가져오기
		document.getElementById("checkAnswer").innerHTML = Answer;	//선택된 문제에 해당하는 답 출력하기	
	}
	function resultMultiple() {
		
	}