<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> PW Update Form </title>
<link rel="icon" href="resources/image/skyblue2.ico" type="image/x-icon" sizes="16x16">
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>	

</head>
<body>

<div style="padding:5rem;">
<h3>비밀번호 수정</h3>
<br><hr><br>
<form action="pwUpdate" method="post" >
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<table>
	<tr><td style="text-align: center;">임시번호</td>
		<td><input type="text" name="tmpPassword" id="tmpPassword"></td>
	</tr>
	<tr><td style="text-align: center;">새 비밀번호</td>
		<td><input type="password" name="password" id="password"></td>
	<tr><td></td>
		<td><span id="passwordMessage"></span></td>
	</tr>
	<tr><td style="text-align: center;">새 비밀번호 확인</td>
		<td><input type="password" name="passwordCheck" id="passwordCheck"></td>
	</tr>
	<tr><td></td>
		<td><span id="passwordCheckMessage"></span></td>
	<tr><td colspan="2"><input type="submit" class="btn btn-danger w-100" value="수정하기" onclick="return passwordCheck()"></td>
	</tr>
</table>
</form>
</div>

<div>
<span id="message"></span><br>
<c:if test="${not empty message}">
	<br>=> ${message}<br><br>
</c:if>
</div>

<div class="row container-fluid" style="height: 10rem; position: absolute;">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
  </div>
</body>
<script>
	$('#password').focusout(function() {
		var password = $('#password').val();
		if ( password.length<4) {
			$('#passwordMessage').html(' 4글자 이상 입니다 ');
			return false;
		} else if ( password.replace(/[!-*.@]/gi,'').length >= password.length ) {
			$('#passwordMessage').html(' 특수문자가 반드시 1개 이상 포함되어야 합니다 ');
			return false;
		} else if ( password.replace(/[a-z.0-9.!-*.@]/gi ,'').length > 0 ) {
			$('#passwordMessage').html(' 영문자, 숫자, 특수문자 로만 입력 하세요 ');
			return false;
		} else {
			$('#passwordMessage').html('');
			return true;
		}
	});	
	
	$('#passwordCheck').focusout(function() {
		var password = $('#password').val();
		if(password == $('#passwordCheck').val()) {
			$('#passwordCheckMessage').html('');
			return true;
		} else {
			$('#passwordCheckMessage').html(' 비밀번호와 비밀번호 확인 내용이 일치하지 않습니다. ');
			return false;
		}
	});
</script>




</html>