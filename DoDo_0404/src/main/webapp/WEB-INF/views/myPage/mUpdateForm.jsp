<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원정보수정</title>
<link rel="icon" href="resources/image/skyblue2.ico" type="image/x-icon" sizes="16x16">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/mUpdateCheck.js"></script>
<script> 
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if (responseMessage != ""){
        alert(responseMessage)
        }
    })
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>

<br><br>
<h3>회원정보</h3>
<br><hr><br>
<form class="form" action="mUpdate" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <div class="form-group">
        <label for="id">아이디: </label>
        <input type="text" class="form-control" name="id" id="id" value="${loginUser.id}" readonly="readonly">
    </div><br>
    <div class="form-group">
        <label for="password">비밀번호: </label>
        <input type="password" class="form-control" name="password" id="password" value="${loginUser.password}">
    </div><br>
    <div class="form-group">
        <label for="passwordRe">비밀번호 확인: </label>
        <input type="password" class="form-control" name="passwordRe" id="passwordRe" value="${loginUser.password}">
    </div><br>
    <div class="form-group">
        <label for="mail">이메일: </label>
        <input type="email" class="form-control" name="mail" id="mail" value="${loginUser.mail}" readonly="readonly">
    </div><br>
    <div class="form-group">
        <label for="name">이름: </label>
        <input type="text" class="form-control" name="name" id="name" value="${loginUser.name}">
    </div><br>
    <div class="form-group">
        <label for="nick">닉네임: </label>
        <input type="text" class="form-control" name="nick" id="nick" value="${loginUser.nick}">
    </div><br>
    <div class="form-group">
        <label for="prefer">관심사: </label>
        <div class="radio">
        <label><input type="radio" name="prefer" value="workout">운동</label>
        </div>
        <div class="radio">
        <label><input type="radio" name="prefer" value="study">공부</label>
        </div>
        <div class="radio">
        <label><input type="radio" name="prefer" value="routine">생활</label>
        </div>
        <div class="radio">
        <label><input type="radio" name="prefer" value="hobby">취미</label>
        </div>
    </div><br>
        <button type="submit" class="btn btn-danger" onclick="return mUpdateCheck()">정보수정</button>    
	</form>
<c:if test="${not empty message}">
<br>${message}<br><br> 
</c:if>
</body>
</html>