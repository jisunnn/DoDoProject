<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성하기</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/mainPage.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<script>
$(document).ready(function(){
	$("#submit").click(function(){
		if($("#title").val()==""){alert("제목을 입력하세요."); $("#title").focus(); return false;}
		if($("#content").val()==""){alert("내용을 입력하세요."); $("#content").focus(); return false;}
	});
}); 
</script>
<style>
.sticky{
background-color:white;
position:-webkit-sticky;
position:sticky;
top:0px;
z-index: 2;
}
a{
   font-size: 14px; 
   font-family: Pretendard-Regular; 
   cursor:pointer;
}
button{
     cursor:pointer;
}
li span{
  font-weight:bold;
  text-align: center;
  cursor:pointer;
} 
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
    }
@font-face {
    font-family: 'GangwonEduPowerExtraBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduPowerExtraBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Vitro_core';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Vitro_core.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
/* * {font-family: "GangwonEduPowerExtraBoldA";}  */ 
* {font-family: "Pretendard-Regular";}   
</style>	
</head>
<body>
 <div class="sticky">
  <div class="row container-fluid">
    <div class="col-1"></div>
    <div class="col-2">
      <img onClick="location.href='home'" src="resources/image/dodo.png" style="cursor:pointer; width: 9em; height: 7em; margin-left:5em; margin-bottom:auto; margin-top: auto;"> 
    </div>
    <div class="col-5" >
    <br>
    <div id="rankarea" style="height: 3em; width: 20em; margin-left: 2em;">
      <!-- <iframe style="height: 3em; width: 22em;" name="frameTest" src="http://localhost:8080/dodo/ranklist" scrolling="auto" frameborder="0"></iframe> -->
    </div>
    </div>
    <div class="col-3 text-start">
     <br>
      <c:if test="${empty loginID}">
        <a onclick="changeView(11)">고객지원</a>&nbsp;
        <div class="vr"></div>&nbsp;
        <a onclick="changeView(2)">회원가입</a>&nbsp;
        <div class="vr"></div>&nbsp;
        <a onclick="changeView(3)">로그인</a>
      </c:if>
      <c:if test="${not empty loginID}">
        <a onclick="changeView(1)"  id="apagelist">고객지원</a>&nbsp;
        <div class="vr"></div>&nbsp;
        <a onclick="changeView(4)">마이페이지</a>&nbsp;
        <div class="vr"></div>&nbsp;
        <a onclick="changeView(5)">로그아웃</a>
      </c:if>
      <br><br>
      <c:if test="${not empty loginID}">
  	    <button type="button" title="참여중인 챌린지보기" class="btn btn-secondary btn-sm" style="margin-top: 5px; font-size: small;" onclick="location.href='plist?loginID=${loginID}';" >참여중</button>&nbsp;&nbsp;
  	    <span class="badge rounded-pill bg-light text-dark text-start" style="margin-top: 8px">${nickName}님 환영합니다</span>
  	  </c:if>
    </div>
    <div class="col-2"></div>
  </div><hr size="4em;"></div>
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
<div style="margin-left: 15em;">
  <p>공지사항 작성하기</p>
</div>
<hr style="width: 70%; margin-left: auto;margin-right: auto; margin-bottom: 2em;">

<form action="ninsert" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<div class="row-col-3">
  <div>
  <table class="table" style="width: 60em; margin-left:auto; margin-right: auto;">
      <tr  style="border-color: White;">
        <th rowspan="6" width="80" ></th>
        <th style="border-color: white;">제 목</th>
        <td style="border-color: white;"><input type="text" name="title" id="title" placeholder="제목을 입력해주세요" size="80"></td>
      </tr>
      <tr style="border-color: White;">
      <th style="border-color: white;">작성자</th>
        <td><input type="text" name="id" value="admin"></td>
      </tr>
      <tr  style="border-color: white;">
        <th >내 용</th>
        <td><textarea rows="18" cols="80" name="content" id="content" placeholder="내용을 입력해주세요" ></textarea></td>
      </tr>
      <!-- <tr>
        <th>사진첨부</th>
        <td><input type="file" name="uploadfilef" id="uploadfilef">
			<script>
			$('#uploadfilef').change(function(){
				if(this.files && this.files[0]) {
					var reader = new FileReader;
				 	reader.onload = function(e) {
			 			$(".select_img").attr("src", e.target.result)
			 			.width(100).height(100); 
			 		} // onload_function
			 		reader.readAsDataURL(this.files[0]);
			 	} // if
			}); // change			
			</script>
		</td>
      </tr> -->
      <tr style="border-color: white;">
        <td colspan="2" style="text-align: center; border-color: white;">
          <div style="margin-left: 20em; margin-right: 24em;">
          <input type="submit" id="submit" value="확인">&nbsp;&nbsp;
		  <input onclick="javascript:history.go(-1)" type="reset" value="취소">&nbsp;&nbsp;
		  </div>
		</td>
	  </tr>
    </table>
</div>
</div>
</form>

<div class="row container-fluid" style="height: 10rem; position: absolute; background: WhiteSmoke; ">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
  </div>
</body>
</html>