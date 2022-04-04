
function idCheck() {
	var id=$('#id').val(); 	
	if (id.length<4) {
		$('#idMessage').html('~~ id 는 4글자 이상 입니다 ~~');
		return false;
	}else if ( id.replace(/[a-z.0-9]/gi ,'').length > 0 ) {
		$('#idMessage').html('~~ id 는 영문자, 숫자로만 입력 하세요 ~~');
		return false;
	}else {
		$('#idMessage').html('');
		return true;
	}
} //idCheck
 
function passwordCheck() {
	var password=$('#password').val()
	if (password.length<4) {
		$('#passwordMessage').html('~~ password 는 4글자 이상 입니다 ~~');
		return false;
	}else if ( password.replace(/[!-*.@]/gi,'').length >= password.length ) {
		$('#passwordMessage').html('~~ password 는 특수문자가 반드시 1개 이상 포함되어야 합니다 ~~');
		return false;
	}else if ( password.replace(/[a-z.0-9.!-*.@]/gi ,'').length > 0 ) {
		$('#passwordMessage').html('password 는 영문자, 숫자, 특수문자 로만 입력 하세요');
		return false;
	}else {
		$('#passwordMessage').html('');
		return true;
	}
} //password

function nameCheck() {
	var name=$('#name').val();
	if (name.length<2) {
		$('#nameMessage').html(' ~~ name 은 2글자 이상  입니다 ~~');
		return false;
	}else if (name.replace(/[a-z.가-힣]/gi,'').length > 0) {
		$('#nameMessage').html(' ~~ name 은 한글 또는 영문 으로만 입력 하세요 ~~');
		return false;
	}else {
		$('#nameMessage').html('');
		return true;
	}	
} //name

function mailCheck() {
	var mail=$('#mail').val();
	if (mail.length<5) {
		$('#mailMessage').html(' ~~ mail은 5글자 이상입니다 ~~');
		return false;
	}else if ( mail.replace(/[@]/gi,'').length >= mail.length ) {
		$('#mailMessage').html('~~ mail은 특수문자가 반드시 1개 이상 포함되어야 합니다 ~~');
		return false;
	}else {
		$('#mailMessage').html('');
		return true;
	}	
} //mail

function nickCheck() {
	var nick=$('#nick').val(); 	
	if (nick.length<3) {
		$('#nickMessage').html('~~ nick은 3글자 이상 입니다 ~~');
		return false;
	}else {
		$('#nickMessage').html('');
		return true;
	}
} //nick





