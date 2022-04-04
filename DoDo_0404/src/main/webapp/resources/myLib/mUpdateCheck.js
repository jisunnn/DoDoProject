function mUpdateCheck() {
    var PwCheck = RegExp(/^[A-Za-z0-9]{4,20}$/); // 영문 + 숫자 4~20자리
    var getName= RegExp(/^[가-힣]+$/); //한글만
 
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