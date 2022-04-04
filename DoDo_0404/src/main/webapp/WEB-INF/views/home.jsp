<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoDo_Home</title>
<link rel="icon" href="resources/image/skyblue2.ico" type="image/x-icon" sizes="16x16">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/myLib/mainPage.js"></script>
	<link href="resources/myLib/myStyle.css" type="text/css" rel="stylesheet">
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
 
<!-- header -->
<div>
<!-- 상단 바 -->
  <br>
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
</div>
<!-- header 끝 -->
<%@ include file="banner2.jsp" %>

<!-- 본문 -->
<div class="row" > 
<div class="col-2" ></div>
<div id="mainArea" class="col-8" >

<!-- 현재 사용 X -->
<!-- 챌린지 -->  
<%-- <%@ include file="challenge/cList.jsp" %> --%>
<%-- <%@ include file="challenge/cDetail.jsp" %> --%>
<%-- <%@ include file="challenge/cinsertForm.jsp" %> --%>

<!-- 마이페이지 -->
<%-- <%@ include file="myPage/myPage.jsp" %> --%>

<!-- 공지사항 -->
<%-- <%@ include file="board/notice.jsp" %> --%>
<%-- <%@ include file="board/nDetail.jsp" %> --%>
<%-- <%@ include file="board/nInput.jsp" %> --%>

<!-- 문의 -->
<%-- <%@ include file="board/ask.jsp" %> --%>
<%-- <%@ include file="board/askDetail.jsp" %> --%>
<%-- <%@ include file="board/askInput.jsp" %> --%>

  </div>
  <div class="col-2" ></div>
</div>
<br>
<br>
<div class="row container-fluid" style="height: 10rem; position: absolute; background: WhiteSmoke; ">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
</div>

<script>
function refresh() {
	window.location = window.location.pathname;
} 
</script>
</body>
</html>