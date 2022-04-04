<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입</title>
<link rel="icon" href="resources/image/skyblue2.ico" type="image/x-icon" sizes="16x16">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/joinFormCheck.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" 
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<style type="text/css">
    .container.custom-container {
      padding: 0 8rem;
    }
    
  @font-face {
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
/* * {font-family: "GangwonEduPowerExtraBoldA";}  */
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
  <br>
<div class="custom-container container">
<br><br>
<h3>회원가입</h3>
<br><hr><br>
<div class="row">
<form class="form" action="join" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <div class="form-group">
        <label for="id">아이디: </label>
        <input type="text" class="form-control" name="id" id="id" placeholder="ID">
        <input type="hidden" name="ifIdDupChecked" id="ifIdDupChecked" value="unchecekd">
        <input type="button" value="ID중복확인" id="idDup" onclick="idDupCheck()">
    </div><br>
    <div class="form-group">
        <label for="password">비밀번호: </label>
        <input type="password" class="form-control" name="password" id="password" placeholder="Password">
    </div><br>
    <div class="form-group">
        <label for="passwordRe">비밀번호 확인: </label>
        <input type="password" class="form-control" name="passwordRe" id="passwordRe" placeholder="Password 재입력">
    </div><br>
    <div class="form-group">
        <label for="mail">이메일: </label>
        <input type="email" class="form-control" name="mail" id="mail" placeholder="example@dodo.com">
        <input type="hidden" name="ifMailDupChecked" id="ifMailDupChecked" value="unchecked">
        <input type="button" value="Email중복확인" id="mailDup" onclick="mailDupCheck()">
    </div><br>
    <div class="form-group">
        <label for="name">이름: </label>
        <input type="text" class="form-control" name="name" id="name" placeholder="Name">
    </div><br>
    <div class="form-group">
        <label for="nick">닉네임: </label>
        <input type="text" class="form-control" name="nick" id="nick" placeholder="Nickname">
    </div><br>
    <div class="form-group">
        <label for="prefer">관심사: </label>
        <div class="radio">
        <label><input type="radio" name="prefer" value="운동">운동</label>
        </div>
        <div class="radio">
        <label><input type="radio" name="prefer" value="공부">공부</label>
        </div>
        <div class="radio">
        <label><input type="radio" name="prefer" value="생활">생활</label>
        </div>
        <div class="radio">
        <label><input type="radio" name="prefer" value="취미">취미</label>
        </div>
    </div><br>
    <div class="form-group">
        <label for="rid">추천인: </label>
        <input type="text" class="form-control" name="rid" id="rid" placeholder="recommender ID">
    </div><br><br>
        <button type="submit" class="btn btn-primary" onclick="return joinCheck()">회원가입</button>    
	</form>
<c:if test="${not empty message}">
<br>${message}<br><br> 
</c:if>
</div>
</div>
<br><br>
<div class="row container-fluid" style="height: 10rem; position: absolute; background: WhiteSmoke; ">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
</div>

</body>
</html>