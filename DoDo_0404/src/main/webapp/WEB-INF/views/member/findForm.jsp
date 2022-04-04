<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<% 
request.setCharacterEncoding("UTF-8");
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FindForm</title>
	<link rel="icon" href="resources/image/skyblue2.ico" type="image/x-icon" sizes="16x16">
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<form >
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<div class="container text-center" style="width: 25%; border: 1; margin-top: 8rem;">
  <div class="area_inputs wow fadeIn">
    <div class="text-center font-weight-bold "><br>
	  <h3>ID / PW 찾기</h3>
	  <hr>
	</div>
	<!-- ID/PW 선택 -->
	<div style="margin-bottom: 10px;"
		class="custom-control custom-radio custom-control-inline">
	  <input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
	    <label class="custom-control-label font-weight-bold" for="search_1">아이디 찾기</label>
	  &nbsp;
	  <input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
	    <label class="custom-control-label font-weight-bold" for="search_2">비밀번호 찾기</label>
	</div>
	  
	<!-- ID 찾기 -->
	<div id="searchI">
	  <div class="form-group text-start">
	    <label class="font-weight-bold" for="inputName">이름</label>
		<div>
		  <input type="text" class="form-control" id="inputName" name="name" placeholder="ex) 이름">
		</div>
	  </div>
	  <div class="form-group text-start">
		<label class="font-weight-bold" for="inputMail_1">이메일</label>
		<div>
		  <input type="text" class="form-control" id="inputMail_1" name="mail" placeholder="ex) abcde@naver.com">
		</div>
	  </div>
	  <!-- 버튼 -->
	  <div class="form-group" style="margin-top : 10px;">
		<button id="searchBtn" class="btn btn-secondary btn-block" type="button" onclick="idSearch_click()">확인</button>
		<a class="btn btn-light btn-block"	href="loginform">취소</a><br>
	  </div>
	</div>
	  
	<!-- PW 찾기 -->
	<div id="searchP" style=" display: none;">
	  <div class="form-group text-start">
	    <label class="font-weight-bold" for="inputId">아이디</label>
		<div>
		  <input type="text" class="form-control" id="inputId" name="inputId" placeholder="ex) hjjjjjjjjj9" value="${findId}">
		</div>
	  </div>
	  <div class="form-group text-start">
		<label class="font-weight-bold " for="inputMail_2">이메일</label>
		<div>
		  <input type="email" class="form-control" id="inputMail_2"	name="inputMail_2" placeholder="ex) abcde@naver.com">
		</div>
	  </div>
	  <!-- 버튼 -->
	  <div class="form-group" style="margin-top : 10px;">
		<button id="searchBtn2" class="btn btn-secondary btn-block" type="button" onclick="pwSearch_click()" >확인</button>
		<a class="btn btn-light btn-block"	href="loginform">취소</a><br>
	  </div>
	</div>
	
	<div style="background: AliceBlue;" id="resultArea" >
		<div id="resultID">
	  	<c:if test="${not empty findID}">
		  <span>ID : ${findID}</span><br>
		  <a href="loginform" class="btn btn-primary btn-block" >로그인 하기</a><br>
		</c:if>
		</div>
		<div id="resultPW">
		<c:if test="${not empty findPW}">
		  <a href="sendMail?id=${id}&mail=${mail}" class="btn btn-primary btn-block" id="tmpPasswordCheck">임시 비밀번호 확인하기</a>
		</c:if>
		</div>
	  </div>
	
  </div>
</div>
</form>

<div>
  <h4 id="message">${message}</h4><br>
</div>
<hr>
<a href="home">[Home]</a>

</body>
<script>

function search_check(num) {
	$('#resultArea').css('display','none');
	if (num == '1') {
		$('#resultID').css('display','none');
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";
	} else {
		$('#resultPW').css('display','none');
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}
	
function idSearch_click(){
	$.ajax({
		type:"GET",
		url:"findID",
		data: {
			name : $('#inputName').val(),
			mail : $('#inputMail_1').val()
		},
		success:function(data){
			if(data != null){
				location.reload();
				var name = $('#inputName').val();
				var mail1 = $('#inputMail_1').val();
				var check = confirm("이름 : "+name+" / 메일 : "+mail1);
				location.reload();
				$('#resultArea').css('display','');
				
			} else {
				$('#message').html("※ 해당 정보와 일치하는 회원 정보 없음 ※");	
			}
		},
		error:function() {
			alert("~~ 서버오류 !!! 잠시후 다시 하세요 ~~");
		}
	});
}
function pwSearch_click() {
	$.ajax({
		type:"GET",
		url:"findPW",
		data:{
			id : $('#inputId').val(),
			mail : $('#inputMail_2').val()
		},
		success:function(data){
			if(data != null){
				location.reload();
				var id = $('#inputId').val();
				var mail2 = $('#inputMail_2').val();
				var check = confirm("아이디 : "+id+" / 메일 : "+mail2);
				location.reload();
				$('#resultArea').css('display','');
				
			} else
				$('#message').html("※ 해당 정보와 일치하는 회원 정보 없음 ※");	
		},
		error:function() {
			alert("~~ 서버오류 !!! 잠시후 다시 하세요 ~~");
		}
	});
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
				console.log(id+mail);
				alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
			}
		}); //ajax
	});
}); //ready
</script>

</html>