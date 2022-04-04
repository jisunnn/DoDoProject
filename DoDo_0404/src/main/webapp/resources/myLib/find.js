
function search_check(num) {
	$('#resultArea').css('display','none');
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}
 
$(function () {
	$('#tmpPasswordCheck').click(function() {
		var name = $('#inputName').val();
		var id = $('#inputId').val();
		var mail = $('#inputMail_2').val();
		$.ajax({
			type:"POST",
			data:{
				name : name,
				id : id,
				mail : mail
			},
			success:function() {
				alert("메일 전송!!"+id+", "+mail);
			},
			error:function() {
				alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
			}
		}); //ajax
	}); //recruit_click
	
}); //ready
