/**
 * 회원가입, 회원정보수정 유효성 검사
 */
 
function joinCheck(){
	if (!idCheck($('#id').val())){
        $("id").focus();
		return false;
	} else if (!pwCheck($('#password').val())){
		return false;
	} else if (!mailCheck($('#mail').val())){
		return false;
	} else if (!nameCheck($('#name').val())){
		return false;
	} else if (!nickCheck($('#nick').val())){
		return false;
	}
	return true;
}

//공백일 시 
function checkEmptyAlert(value, dataName) {
    if (value == "") {
        alert(dataName + " 입력 필수 항목입니다.");
        return false;
    }
    return true;
}

function idCheck(id) {
    if (!checkEmptyAlert(id, "아이디는"))
        return false;
    return true; //확인이 완료되었을 때
}

function pwCheck(password){
    if (!checkEmptyAlert(password, "비밀번호는"))
        return false;	
	
	return true;
}


function mailCheck(mail){
	
	return true;
}

function nameCheck(name){
	
	return true;
}

function nickCheck(nick){
	
	return true;
}

