$(function(){
	 
	$('.nav-link').click(function () { 
		$(".nav-item > .active"); 
		$('.nav-link').removeClass('active'); 
		$(this).addClass('active'); 
		$(".nav-item > .active").css("color", "DimGray"); 
	});
}); //ready

function changeView(value){
// 고객지원
    if(value == "1") {
        location.href="apagelist";
    }
// 회원가입
    else if(value == "2") {
        location.href="joinf";
    }
// 로그인
    else if(value == "3") {
		location.href="loginform";
    }
// 마이페이지
    else if(value == "4") {
        location.href="myPage";
    }
// 로그아웃
    else if(value == "5") {
        location.href="mlogout";
    }
// 전체 챌린지
    else if(value == "6") {
        location.href="clist";
    }
// 모집중 챌린지
    else if(value == "7") {
        location.href="recruitlist";
    }
// 진행중 챌린지
    else if(value == "8") {
        location.href="doinglist";
    }
// 완료 챌린지
    else if(value == "9") {
        location.href="donelist";
    }
// 공지사항
    else if(value == "10") {
        location.href="npagelist";
    }
// 로그인 안했는데 고객지원 클릭
    else if(value == "11") {
    	alert("로그인 후 이용가능 합니다.");
        location.href="loginform";
    }
	else if(value == "12") {
		location.href="plist"
	}
}

/* 랭킹 */
window.onload = function(){
	$.ajax({
		type:"Get",
		url:"ranklist",
		datatype:"html",
		success:function(resultPage) {
			$('#rankarea').html(resultPage);	
		},
		error:function() {
			alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
		}
	}); //ajax
};