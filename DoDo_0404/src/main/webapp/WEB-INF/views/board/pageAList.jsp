<%@ page import="vo.AskVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원</title>
	<link rel="icon" href="resources/image/skyblue2.ico" type="image/x-icon" sizes="16x16">
	
	<style>
     table {text-align: center; margin-left: auto; margin-right: auto;}
     .td1 { font-size: 10pt; width: 60%}
     .td2 { font-size: 10pt; width:17.5%;}
     th {font-size: 10pt; width: 10%;}
     .th1 {font-size: 10pt;}
       a {text-decoration: none !important;}
      
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
/* * {font-family: "GangwonEduPowerExtraBoldA"; */
}
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
<div class="row" > 
  <div class="col-2" ></div>
  <div class="col-8">
    <h3>Q & A</h3>
    <hr style="width: 95%; margin-left: auto;margin-right: auto; margin-bottom: 2em;">
    
    <div style="width: 95%; margin-left: auto; margin-right: auto;">
	<table class="table caption-top">
	<thead>
	  <tr height="40">
	    <th scope="col">글번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성자</th>
	    <th scope="col">날짜</th>
	  </tr>
	</thead>
	<tbody>
	<c:forEach var="list" items="${abanana}">
	  <tr height="40" style="vertical-align: middle;">
	    <th class="th1" scope="row"><c:if test="${list.indent > 0}">
		<c:forEach begin="1" end="${list.indent}">
		  <span>&nbsp;&nbsp;</span>
		</c:forEach>
		<span style="color:CornflowerBlue "> ↳ re : </span>${list.root}</c:if>
		<c:if test="${list.indent == 0}">${list.seq}</c:if></th>
	    <td class="td1"><c:if test="${loginID =='admin' || loginID==list.id || loginID==aapple.id}"><a style="color: black;" href="adetail?seq=${list.seq}">${list.title}</a></c:if><c:if test="${ loginID !='admin' && loginID != list.id}">${list.title}</c:if></td>
	    <td class="td2"><c:if test="${list.indent == 0}">${list.id}</c:if><c:if test="${list.indent > 0}">관리자</c:if></td>
	    <td class="td2">${list.regdate}</td>
	  </tr>
	</c:forEach>
	</tbody>
	</table>
	
	&nbsp;&nbsp;<a href="ainsertf" style="color: RebeccaPurple ;">글쓰기</a>&nbsp;&nbsp;
	<!-- <a href="home" style="color: RebeccaPurple ;">메인으로</a> -->
	</div>
<br>
	<div style="margin-left: 47%; margin-right: 53%;">
	  <nav aria-label="Page navigation example">
  	    <ul class="pagination justify-content-center">
    	  <li class="page-item">
      		<a class="page-link" href="apagelist?currPage=${sPageNo-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
    	  </li>
    	  <c:forEach var="i" begin="${sPageNo}" end="${ePageNo}">
			<c:if test="${i==currPage}">
			  <a class="page-link" style="color: Orchid;">${i}</a>
			</c:if>
			<c:if test="${i!=currPage}">
			  <a  class="page-link" href="apagelist?currPage=${i}">${i}</a>&nbsp;
			</c:if>
		  </c:forEach>
    	  <li class="page-item">
      		<a class="page-link" href="apagelist?currPage=${ePageNo+1}" aria-label="Next">
        	  <span aria-hidden="true">&raquo;</span>
      		</a>
    	  </li>
  		</ul>
	  </nav>
	</div>
    
  </div>
  <div class="col-2" ></div>
</div>


<div class="row container-fluid" style="height: 10rem; position: absolute; background: WhiteSmoke; ">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
  </div>

</body>
</html>