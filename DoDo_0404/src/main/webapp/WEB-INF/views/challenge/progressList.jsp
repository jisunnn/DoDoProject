<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Progress List</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/myLib/mainPage.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
</head>
<body>

<c:if test="${not empty message}">
=> ${message}<br>
</c:if>

<!-- 글목록 -->
<hr>
  <div class="row justify-content-center row-cols-4" style="float: left;">
    <c:forEach var="list" items="${result}">
	    <div>
          <span style="text-align: right;">${list.cno}(${list.result}%)</span><br>
		  <progress value="${list.result}" max="100" class="progress-bar-striped"></progress>
        </div>
    </c:forEach>
  </div>
<hr>
<a style="float: left;" href="home">[Home]</a>

</body>
</html>