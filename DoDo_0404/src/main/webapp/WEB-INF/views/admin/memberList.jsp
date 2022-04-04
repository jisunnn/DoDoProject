<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/image/skyblue2.ico" type="image/x-icon" sizes="16x16">
<title>너Do나Do : 회원리스트</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
    .container.custom-container {
      padding: 0 9rem;
    }
</style>
</head>
<body>
 
<div class="custom-container container">
<br><br>
<h3>회원 목록</h3> 
<img onClick="location.href='home'" src="resources/image/home.png" style="cursor:pointer; width: 2em; height: 1.5em; margin-left: 95%;">
<br><br>
<table class="table table-hover">
    <thead>
    <tr>
        <th>#</th>
        <th>아이디</th>
        <th>이름</th>
        <th>닉네임</th>
        <th>포인트</th>
        <th>신고알림</th>        
    </tr>
    </thead>
    <tbody>
    <c:forEach var="list" items="${memList}" varStatus="status">
    <tr>
        <th>${status.count}</th>
        <td>${list.id}</td>
        <td>${list.name}</td>
        <td>${list.nick}</td>
        <td>${list.point}</td>
        <td><button type="button" class="btn btn-primary btn-sm position-relative" onclick="location.href='mdetail?id=${list.id}'">정보</button></td>
    </tr>    
    </c:forEach>
    </tbody>
    </table>

<form id="adminLogout" action="<c:url value="/logout"/>" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <button type="submit" class="btn btn-secondary btn-sm">로그아웃</button>
</form>

</div>

<div class="row container-fluid" style="height: 10rem; position: absolute;">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
  </div>
</body>
</html>