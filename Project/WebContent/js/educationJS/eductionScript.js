
	$(document).ready(function() {
		start();  //hl_contents사이에  "/"있는것을 기준으로 데이터 분리 하기 위한 function
		var page = $('#pages').val(); //해당하는 페이지 값을 받아온다.

		
		if(page >  1){//만약 받은 페이지 수가 1이상이라면 ( 즉, 페이지가 2번째인지 3번째인지 등)
			for(var i = 1 ; i < page ; i ++){//그 페이지에 자동으로 넘어가기위해 그페이지 수만큼 넘어가는 기능 반복
				setTimeout(function(page){
					click(page)    // 해당 페이지를 찾아가기 위해 클릭하는 function
				}, i*1000); // 1초마다
			}
		}
		$('p').mouseup(function() {//p태그 영역안에 드래그(mouseUP) 설정 , // 블럭(block) 선택한 텍스트 가져오기
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

			
			
			 if(txt == '' || txt == ' '){//드래그 한값이 공백일때
				$('.texts').val('null');
			}else{
				txt = String(txt);
				if(txt.length > 10){//드래그한 값이 10자이상일때
					$('.texts').val('null');
				}else{
					$('.texts').val(txt);
				}
			}
			
		});
	});
	function click(page){
		
		$('#bb-nav-next').trigger('click');
			//Page.init();
		
	}
	function start(){
		var datas = $('#data').val();
		var list = datas.split("/");
		for (var i = 0; i < list.length; i++) {
			wordSearch(list[i]); // 잘라진 hl_contents를 앞뒤에 span을 추가 하기 위한 function
		}

	}
	function wordSearch(word, form_id) { //입력 받은 값을 앞뒤에 span 을 줘서 배경 색을 노란색으로 변경 
		 if(!(word == 'null')){
			$ptags = $('div.scroller p'); //드래그 영역

			var reg = new RegExp(word, "gi"); // 대문자 소문자 구분 (gi)
			var spanID = 1;

			$ptags.each(function(index) {
				var p = $(this);//각 p태그중 해당하는 p태그 선택
				var text = p.html(); //드래그된 값을 넣어준다.
				var newText = text.replace(reg, "<span id="+(spanID++)+" style='background:yellow'>"// 이제 형광펜 기능
						+ word + "</span>");
				p.html(newText);// 다시 써줌
			});
			if(typeof form_id != 'undefined'){//form id가 넘어왔다면 submit을 해라
				$("#"+form_id).submit();
			}
		} 
		
	}