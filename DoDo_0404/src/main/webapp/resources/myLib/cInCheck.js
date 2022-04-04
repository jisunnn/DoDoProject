function title() {
	if($('#title').val() == "") {
		$('#tMessage').html('제목을 입력하세요');
		$('#tMessage').css('color','red');
		return false;
	} else {
		$('#tMessage').html('');
		return true;
	}
}
 
function category() {
	if($('#category').val() == "") {
		$('#cMessage').html('카테고리를 선택하세요');
		$('#cMessage').css('color','red');
		return false;
	} else {
		$('#cMessage').html('');
		return true;
	}
}

function date() {
	if($('#sdate').val() == "") {
		$('#dMessage').html('시작날짜를 선택하세요');
		$('#dMessage').css('color','red');
		return false;
	} else {
		$('#dMessage').html('');
		return true;
	}
}

function term() {
	if(!$('input:radio[name="term"]:checked').val()) {
		$('#termMessage').html('기간을 선택하세요');
		$('#termMessage').css('color','red');
		return false;
	} else {
		$('#termMessage').html('');
		return true;
	}
}
