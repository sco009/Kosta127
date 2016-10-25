
	$(document).ready(function() {
		start();  //hl_contents사이에  "/"있는것을 기준으로 데이터 분리 하기 위한 function
		var page = $('#pages').val();

		
		if(page >  1){
			for(var i = 1 ; i < page ; i ++){
				setTimeout(function(page){
					click(page)    // 해당 페이지를 찾아가기 위해 클릭하는 function
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

			
			
			 if(txt == '' || txt == ' '){
				$('.texts').val('null');
			}else{
				txt = String(txt);
				if(txt.length > 10){
					$('.texts').val('null');
				}else{
					$('.texts').val(txt);
				}
			}
			
		});
	});
	function click(page){// 페이지 이동 버튼 클릭이벤트 트리거 
		
		$('#bb-nav-next').trigger('click');
			Page.init();
		
	}
	function start(){
		var datas = $('#data').val();
		var list = datas.split("/");
		for (var i = 0; i < list.length; i++) {
			wordSearch(list[i]); // 잘라진 hl_contents를 앞뒤에 span을 추가 하기 위한 function
		}

	}
	function wordSearch(word, form_id) { //입력 받은 값을 앞뒤에 span 을 줘서 배경 색을 노란새으로 변경 
		 if(!(word == 'null')){
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
		
	}