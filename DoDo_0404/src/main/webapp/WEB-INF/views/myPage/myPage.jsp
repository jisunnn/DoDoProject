<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
-->
<title> 마이페이지</title>
<link rel="icon" href="resources/image/skyblue2.ico" type="image/x-icon" sizes="16x16">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" 
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script> 
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if (responseMessage != ""){
        alert(responseMessage)
        }
    })
    </script>

<style>
@font-face {
    font-family: 'GangwonEduPowerExtraBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduPowerExtraBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {font-family: "GangwonEduPowerExtraBoldA";}
li span{
  font-weight:bold;
  text-align: center;
  cursor:pointer;
} 
</style>	    
</head>
<body>

<!-- svg path -->
<svg xmlns="http://www.w3.org/2000/svg" style="display:none;">
  <symbol id="people-circle" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
  </symbol>
</svg>

<%@ include file="/WEB-INF/views/header.jsp" %>
<br>
<!-- 메뉴 바 -->
  <br style="background: snow;">
  <div class="row">
    <ul class="nav nav-tabs">
      <li class="nav-item col-2">
        <a class="nav-link disabled" style="text-align: center;"> </a></li>
      <li class="nav-item col-1">
        <span class="nav-link" onclick="changeView(6)" id="recom" style="text-align: center; color:black !important;">전체 목록</span></li>
      <li class="nav-item col-1">
        <span class="nav-link" onclick="changeView(7)" id="recruit" style="text-align: center; color:black !important; ">모 집</span></li>
      <li class="nav-item col-1">
        <span class="nav-link" onclick="changeView(8)"id="doing"  style="text-align: center; color:black !important;">진 행</span></li>
      <li class="nav-item col-1">
        <span class="nav-link" onclick="changeView(9)"id="done" style="text-align: center; color:black !important;">완 료</span></li>
      <li class="nav-item col-3">
        <a class="nav-link disabled" style="text-align: center;"> </a></li>
      <li class="nav-item col-1">
        <span class="nav-link" onclick="changeView(10)" id="notice" style="text-align: center; color:black !important;">공지사항</span></li>
      <li class="nav-item col-2">
        <a class="nav-link disabled" style="text-align: center;"> </a></li>
    </ul>
  </div>
<br>
<div class="row" > 
  <div class="col-2" ></div>
  <div class="col-8">

  <div>
    <div class="row row-col-2">
      <div class="col-3">
        <div class="d-flex flex-column flex-shrink-0 p-3" style="background-color: #e6e6e6;">
        <br>
        <svg  style="width: 7em; height: 8em; align-self: center;" ><use xlink:href="#people-circle"/></svg>
        <br>
        <div class="fs-5 text-center">${loginName} 님 반갑습니다!</div>
        <div class="fs-6 text-center">point : ${loginPoint}</div>
        <br><hr><br>
        <ul class="nav nav-pills flex-column mb-auto">
          <li>
            <h4 class="text-center">나의 기록</h4>
          </li>
          <br>
          <li class="nav-item">
            <a href="#" class="nav-link link-dark" id="mplist">
              참여 챌린지
            </a>
          </li>
          <br><br>
          <li>
            <h4 class="text-center">회원정보</h4>
          </li>
          <br>
          <li class="nav-item">
            <a href="#" class="nav-link link-dark" id="mupdatef">
              회원정보 수정
            </a>
          </li>
          <li class="nav-item">
            <a href="mdelete" class="nav-link link-dark" onclick="return confirm('탈퇴하시겠습니까?')">
              회원탈퇴
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link link-dark" id="agree">
              개인정보 이용내역
            </a>
          </li>
        </ul>
        <br><hr><br>
        </div>
      </div>
    <div class="col" id="contentarea"></div>
  </div>
</div>

  </div>
  <div class="col-2" ></div>
</div>
<br>
<br>
<div class="row container-fluid" style="height: 10rem; position: absolute; background: WhiteSmoke; ">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
</div>
<script>
$('#mplist').click(function() {
	$.ajax({
		type:"Get",
		url:"mplist",
		success:function(resultPage) {
			$('#contentarea').html(resultPage);	
		},
		error:function() {
			alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
		}
	}); //ajax
});
$('#resultlist').click(function() {
	$.ajax({
		type:"Get",
		url:"resultlist",
		success:function(resultPage) {
			$('#contentarea').html(resultPage);	
		},
		error:function() {
			alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
		}
	}); //ajax
});
$('#mupdatef').click(function() {
	$.ajax({
		type:"Get",
		url:"mUpdatef",
		success:function(resultPage) {
			$('#contentarea').html(resultPage);	
		},
		error:function() {
			alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
		}
	}); //ajax
});
$('#agree').click(function() {
	$.ajax({
		type:"Get",
		url:"info",
		success:function(resultPage) {
			$('#contentarea').html(resultPage);	
		},
		error:function() {
			alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
		}
	}); //ajax
});
function confirmDelete(){
	
	if(confirm('정말 탈퇴?')){
		alert('성공')
		return true;
	}else{
		alert('취소');
		return false;
	}
	
}
</script>

</body>
</html>