<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/image/skyblue2.ico" type="image/x-icon" sizes="16x16">
<title>1:1 문의</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 
	<style>
      a {text-decoration: none !important; }
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
<div style="margin-left: 10em;">
  <h4>1:1 문의</h4>
</div>
<hr style="width: 75%; margin-left: auto;margin-right: auto;">

<!-- 상세보기 table -->
<div class="row">
  <div style="width: 75%; margin-left: auto; margin-right: auto;">
    <table class="table">
      <tr>
        <th colspan="9" style="border-color:White; text-align: center; font-size:20px;" ><a hidden>${aapple.seq}${aapple.root}</a>${aapple.title}</th>
      </tr>
      <tr>
        <th scope="col" colspan="5" style="border-bottom-color:LightGray; text-align: center; font-size:10px;">문의 작성자: ${aapple.id}  작성일 :${aapple.regdate}</th>
      </tr>
      <tr>
		<td style="text-align: center; height: auto; font-size: 16px; border-bottom-color:DarkGray; border-bottom-width:1px;">
		  <p class="text-break" >${aapple.content}</p></td>        
      </tr>
    </table>
<c:if test="${aapple.indent > 0}">
  <c:if test="${secAdmin=='admin'}">
 	<a href="aupdatef?seq=${aapple.seq}" style="color:RebeccaPurple; font-size: 18px;">글수정</a>&nbsp;&nbsp;
	<a href="adelete?root=${aapple.root}&seq=${aapple.seq}" style="color: RebeccaPurple; font-size: 18px;">글삭제</a>&nbsp;&nbsp;
		<!-- 삭제시 원글삭제 or 답글삭제 확인을 위함 -->
  </c:if>
</c:if>
<c:if test="${aapple.indent == 0}">
<c:if test="${loginID==aapple.id  || secAdmin=='admin'}">
 	<a href="aupdatef?seq=${aapple.seq}" style="color:RebeccaPurple; font-size: 18px;">글수정</a>&nbsp;&nbsp;
	<a href="adelete?root=${aapple.root}&seq=${aapple.seq}" style="color: RebeccaPurple; font-size: 18px;">글삭제</a>&nbsp;&nbsp;
		<!-- 삭제시 원글삭제 or 답글삭제 확인을 위함 -->
  </c:if>
</c:if>
<c:if test="${secAdmin=='admin'}">
<a href="ansinsertf?root=${aapple.root}&indent=${aapple.indent}&step=${aapple.step}&id=${aapple.id}" style="color: RebeccaPurple; font-size: 18px;">답글등록</a><br>
</c:if>

</div>
</div>

<div align="center">
<a href='javascript:history.go(-1)' class="btn btn-primary" style="font-size: 13px;">목록</a>&nbsp;&nbsp;
</div>
<br>
<br>
<div class="row container-fluid" style="height: 10rem; position: absolute; background: WhiteSmoke; ">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
</div>
</body>
</html>