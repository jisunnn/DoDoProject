<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의_수정하기</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
<div style="margin-left: 15em;">
  <p>문의사항_수정하기</p>
</div>
<hr style="width: 70%; margin-left: auto;margin-right: auto; margin-bottom: 2em;">
<form action="aupdate" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<!-- 상세보기 table -->
<div class="row">
  <div>
    <table class="table" border="2" style="width: 60em; margin-left:auto; margin-right: auto;">
      <tr>
        <th colspan="9" style="border-color:GhostWhite; text-align: center;" >글번호: <input name="seq" value="${aapple.seq}" hidden><input name="title" value="${aapple.title}"></th>
      </tr>
      <tr>
        <th scope="col" colspan="5" style="border-bottom-color:gray; text-align: center; font-size:5px;">작성자: ${aapple.id} 작성일 :${aapple.regdate}</th>
      </tr>
      <tr>
		<td style="text-align: center;">
		  <textarea cols="40" rows="10" name="content">${aapple.content}</textarea>></td>        
      </tr>
      <tr style="text-align: center;">
        <td><input type="submit" value="수정">&nbsp;&nbsp;
			<input onclick="javascript:history.go(-1)" type="reset" value="취소"></td>
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