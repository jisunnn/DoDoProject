function nullCheck() {
	if($('#title').val() == null) {
		$('#tMessage').html('제목을 입력하세요');
		return false;
	} else if($('#category').val() == null) {
		$('#cMessage').html('카테고리를 선택하세요');
		return false;
	} else if($('#sdate').val() == null) {
		$('#dMessage').html('시작날짜를 선택하세요');
		return false;
	} else if($('.termCheck').val() == null) {
		$('#termMessage').html('기간을 선택하세요');
		return false;
	} else 
		return true;
}
 