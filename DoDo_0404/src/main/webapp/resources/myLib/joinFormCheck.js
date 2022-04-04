 
function joinCheck() {
    var PwCheck = RegExp(/^[A-Za-z0-9]{4,20}$/); // 영문 + 숫자 4~20자리
    var getName= RegExp(/^[가-힣]+$/); //한글만

    if (idCheck() == false){
	    return false;
    }
	if($("#ifIdDupChecked").val() != "idChecked"){
	    alert("아이디 중복 체크해주세요");
        $("#id").focus();
        return false;
    }
 
    //비밀번호
    if($("#password").val() == ""){
        alert("패스워드를 입력하세요");
        $("#password").focus();
        return false;
    }
    if(!PwCheck.test($("#password").val())) {
        alert("비밀번호는 영문과 숫자로 이루어진 4~20자 조합으로 입력해주세요.");
        $("#password").val("");
        $("#password").focus();
    	return false;
    }

    if($("#password").val() != ($("#passwordRe").val())){
	    alert("비밀번호 확인이 동일하지 않습니다.");
        $("#passwordRe").val("");
        $("#passwordRe").focus();
        return false;
    }
   
    //id-pw 중복검사
    if ($("#id").val() == ($("#password").val())) {
        alert("아이디와 비밀번호는 동일하게 입력할 수 없습니다.");
        $("#password").val("");
        $("#password").focus();
        return false;
    }  
   
   //이메일
	if (mailCheck() == false){
	    return false;
    }

	if($("#ifMailDupChecked").val() != "mailChecked"){
	    alert("이메일 중복 체크해주세요");
        $("#mail").focus();
        return false;
    }

    //이름
    if($("#name").val() == ""){
        alert("이름을 입력하세요");
        $("#name").val("");
        $("#name").focus();
        return false;
    }
    if (!getName.test($("#name").val())) {
        alert("이름은 한글만 가능합니다");
        $("#name").val("");
        $("#name").focus();
        return false;
    }

	//닉네임
    if($("#nick").val() == ""){
        alert("닉네임을 입력하세요");
        $("#nick").val("");
        $("#nick").focus();
        return false;
    }
	return true;
}

// 아이디
function idCheck(){
    if($("#id").val() == ""){
        alert("아이디를 입력하세요");
        $("#id").focus();
        return false;
    }
    var idRegCheck = RegExp(/^[A-Za-z0-9]{4,16}$/); //영문이랑 숫자만 + 4~16자
    if(!idRegCheck.test($("#id").val())){
        alert("아이디는 영문과 숫자로 이루어진 4~16자 조합으로 입력해주세요.");
        $("#id").val("");
        $("#id").focus();
        return false;
    }
}

//아이디중복
function idDupCheck(){
	if (idCheck() == false){
		return false;
	}else{
		var url="idcheck?id="+$('#id').val(); 
		window.open(url,'_blank',
				'toolbar=no,menubar=yes,scrollbars=yes,	resizable=yes,width=400,height=300');
	}
}

// 메일 체크함수
function mailCheck(){
    var mailRegCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); //메일
    if($("#mail").val() == ""){
        alert("이메일을 입력해주세요");
        $("#mail").focus();
        return false;
    }

    var mailRegCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); //메일
    if(!mailRegCheck.test($("#mail").val())){
        alert("이메일형식에 맞게 입력해주세요")
        $("#mail").val("");
        $("#mail").focus();
        return false;
    }
}

//메일중복
function mailDupCheck(){
	if (mailCheck() == false){
		return false;
	}else{
		var url="mailcheck?mail="+$('#mail').val(); 
		window.open(url,'_blank',
				'toolbar=no,menubar=yes,scrollbars=yes,	resizable=yes,width=400,height=300');
	}		
}			
				
				
				