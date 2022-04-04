<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Update Form **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<body>
<h3>** Update Form **</h3>
<form action="mUpdate" method="post">
<table>
	<tr height="40"><td bgcolor="LemonChiffon ">I D</td>
		<td><input type="text" name="id" value="${apple.id}" size="20" readonly></td></tr>
	<tr height="40"><td bgcolor="LemonChiffon ">Password</td>
		<td><input type="password" name="password" id="password" value="${apple.password}" size="20"></td></tr>	
	<tr height="40"><td bgcolor="LemonChiffon ">Name</td>
		<td><input type="text" name="name" id="name" value="${apple.name}" size="20"></td></tr>
	<tr height="40"><td bgcolor="LemonChiffon ">Mail</td>
		<td><input type="text" name="mail" id="mail" value="${apple.mail}" size="20"></td></tr>
	<tr height="40"><td bgcolor="LemonChiffon ">Nick</td>
		<td><input type="text" name="nick" id="nick" value="${apple.nick}" size="20"></td></tr>
	<tr height="40"><td bgcolor="LemonChiffon" >관심사</td>
		<td><select name="prefer" id="prefer">
		    <c:choose>
			<c:when test="${apple.prefer=='공부'}">
				<option value="A" selected>공부</option>
				<option value="B">운동</option>
				<option value="C">생활</option>
				<option value="D">취미</option>
			</c:when>
			<c:when test="${apple.prefer=='운동'}">
				<option value="A">공부</option>
				<option value="B" selected>운동</option>
				<option value="C">생활</option>
				<option value="D">취미</option>
			</c:when>
			<c:when test="${apple.prefer=='생활'}">
				<option value="A">공부</option>
				<option value="B">운동</option>
				<option value="C" selected>생활</option>
				<option value="D">취미</option>
			</c:when>
			<c:when test="${apple.prefer=='취미'}">
				<option value="A">공부</option>
				<option value="B">운동</option>
				<option value="C">생활</option>
				<option value="D" selected>취미</option>
			</c:when>
		    </c:choose>
			</select>
		</td></tr>

	<tr height="40"><td></td>
		<td><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="submit" value="수정">&nbsp;&nbsp;
			<input type="reset" value="취소">
		</td></tr>			
</table>
</form>
<c:if test="${not empty message}">
<br>=> ${message}<br><br> 
</c:if>
<hr>
<a href="home" >[Home]</a>
</body>
</html>