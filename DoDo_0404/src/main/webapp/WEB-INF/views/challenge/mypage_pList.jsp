<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Participate List</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/myLib/mainPage.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<style>
a { 
 text-decoration: none !important;
 color: black !important;
 }
 .card-text span {
    color: #6423ff;
    background: rgba(100, 35, 255, 0.04);
    border:solid blue;
    border-width:thin; 
    font-size: 12px;
      
  } 
</style>
</head>
<body>
 
<c:if test="${not empty message}">
=> ${message}<br>
</c:if>
<!-- 글목록 -->
<hr>
  <div class="row justify-content-center row-cols-4">
    <c:forEach var="list" items="${banana}">
      <div class="card" style=" height: 15rem; margin: 20px;">
        <img src="${list.thumbnail}" onClick="location.href='cdetail?seq=${list.seq}'" class="card-img-top" style="cursor:pointer; height:150px;">
	    <div class="card-body">
          <p class="card-text">
          <c:if test="${list.category == '공부'}"><span>공부</span></c:if>
	   	  <c:if test="${list.category == '운동'}"><span>운동</span></c:if>
		  <c:if test="${list.category == '생활'}"><span>생활</span></c:if>
		  <c:if test="${list.category == '취미'}"><span>취미</span></c:if>
          <br><a href="cdetail?seq=${list.seq}">${list.title}</a>
        </div>
      </div>
    </c:forEach>
  </div>

</body>
</html>