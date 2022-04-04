<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge List</title>
<link rel="icon" href="resources/image/skyblue2.ico" type="image/x-icon" sizes="16x16">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/myLib/mainPage.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">

<style>
</style>	
<script>
$(function () {
	$('#searchButton1').click(function() {
		$.ajax({
			type:"GET",
			url:'checkTitle',
			success:function(resultPage) {
				$('#mainArea').html(resultPage);	
			},
			error:function() {
				alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
			}
		});
	}); 
	 
	$('#searchButton2').click(function() {
		$.ajax({
			type:"GET",
			url:'checkCategory',
			success:function(resultPage) {
				$('#mainArea').html(resultPage);	
			},
			error:function() {
				alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
			}
		});
	}); 
	
	$('#searchButton3').click(function() {
		$.ajax({
			type:"GET",
			url:'checkState',
			success:function(resultPage) {
				$('#mainArea').html(resultPage);	
			},
			error:function() {
				alert("~~ 서버오류!!! 잠시후 다시 하세요 ~~");
			}
		});
	}); 
}); //ready
</script>
<style>
a { 
 text-decoration: none !important;
 color:black  !important;
 }
.card-text span {
    color: #6423ff;
    background: rgba(100, 35, 255, 0.04);
    border:solid blue;
    border-width:thin; 
    font-size: 12px;
      
  } 
 .search{
    border-width:1px;
    height: 2em;
    background-color: white;
    border-color: blue;
    border-right: none;
    
 } @font-face {
    font-family: 'GangwonEduPowerExtraBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduPowerExtraBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
    }
/* * {font-family: "GangwonEduPowerExtraBoldA";} */
* {font-family: "Pretendard-Regular";}    
</style>
</head>
<body>

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
<div class="row" > 
  <div class="col-2" ></div>
  <div class="col-8">
  
    <!-- 키워드 검색 -->
	<br>
	<div style=" float: right;">
	<nav class="navbar navbar-light">
	  <div class="container-fluid">
	    <form class="d-flex" action="checkTitle" method="get">
      <button class="search" type="submit" id="searchButton1"><img src="resources/image/search.png"  style="height:27px; width:25px;"></button><!-- 🔍 -->
      <input class="form-control me-2" type="text" name="check" placeholder="검색어를 입력하세요" aria-label="Search" style=" border-radius:0px; border-color: blue; height:2em;">
        </form>
	  </div>
	</nav>
	</div>
	<div style="float: left;">
	
	<!-- 진행 상황 검색 -->
	<form action="checkState" method="get">
	  &nbsp;&nbsp;&nbsp;
	  <select name="check">
	    <option value="">--</option>
	    <option value="recruit">모집중</option>
	    <option value="doing">진행중</option>
	    <option value="done">완료</option>
	  </select>
	  <input class="btn btn-primary"  style="font-size: x-small;" type="submit" value="조회" id="searchButton3" >&nbsp;
	</form>
	</div>
	<br>
	
	<!-- 카테고리별 검색 -->
	<br>
	<div style="float: left;">
	  <div class="col-12">
	    <form action="checkCategory" method="get">
			<b>&nbsp;&nbsp;&nbsp;
			카테고리 : </b>
			<input type="checkbox" name="check" id="s" value="공부">
				<label for="s"> 공부&nbsp;</label>
			<input type="checkbox" name="check" id="e" value="운동">
				<label for="e"> 운동&nbsp;</label>
			<input type="checkbox" name="check" id="l" value="생활">
				<label for="l"> 생활&nbsp;</label>
			<input type="checkbox" name="check" id="h" value="취미">
				<label for="h"> 취미&nbsp;&nbsp;</label>
			<input class="btn btn-primary"  style="font-size:  x-small;" type="submit" value="검색" id="searchButton2" >&nbsp;
			<input class="btn btn-primary" style="font-size:  x-small;"  type="reset" value="취소">
		</form>
	  </div>
	</div>
	<br>
	<c:if test="${not empty message}">
	=> ${message}<br>
	</c:if>
	<br>
	
	<!-- 글목록 -->
	<hr>
	<div style="float: right;">
	<c:if test="${not empty loginID}">
	  <a href="cinsertf">챌린지 등록</a><br>
	</c:if>
	</div>
	 <br> 
	 <br>
	  <div class="row justify-content-center row-cols-4">
    <c:forEach var="list" items="${banana}">
      <div class="card" style=" height: 15rem; margin: 20px;">
        <c:if test="${not empty loginID}">
        <img src="${list.thumbnail}" onClick="location.href='cdetail?seq=${list.seq}'" class="card-img-top" style="cursor:pointer; height:150px;">
        </c:if>
        <c:if test="${empty loginID}">
        <img src="${list.thumbnail}" onClick="location.href='loginform'" class="card-img-top" style="cursor:pointer; height:150px;">
        </c:if>
	    <div class="card-body">
          <p class="card-text">
          <c:if test="${list.category == '공부'}"><span>공부</span></c:if>
	   	  <c:if test="${list.category == '운동'}"><span>운동</span></c:if>
		  <c:if test="${list.category == '생활'}"><span>생활</span></c:if>
		  <c:if test="${list.category == '취미'}"><span>취미</span></c:if>
          <c:if test="${not empty loginID}">
          <a href="cdetail?seq=${list.seq}">${list.title}</a>
          </c:if>
          <c:if test="${empty loginID}">
          <a href="loginform">${list.title}</a>
          </c:if>
		  <br>
 		  <a>작성자 : ${list.id}</a></p>
        </div>
      </div>
    </c:forEach>
  </div>

  </div>
  <div class="col-2" ></div>
</div>

<div class="row container-fluid" style="height: 10rem; position: absolute; background: WhiteSmoke; ">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
</div>

</body>
</html>