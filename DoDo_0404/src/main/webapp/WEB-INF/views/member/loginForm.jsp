<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너Do나Do : 로그인</title>
	<link rel="icon" href="resources/image/skyblue2.ico" type="image/x-icon" sizes="16x16">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<style type="text/css">
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
<br>
<br>

<!-- <h2 style="text-align: center; margin-top:1.5em; margin-bottom:1.5em;">LOGIN</h2> -->
<div style="width: 13em; height: 10em; margin-left:42%; margin-right:58%;  margin-top: 5em;"><img onClick="location.href='home'" style="cursor:pointer; width: 13em; height: 10em;" src="resources/image/dodo.png">
</div>
<div align="center" style="color: green;">
<span id="message" ></span><br>
<c:if test="${not empty message}"> 
	<br> ${message}<br><br>
</c:if>
</div>
<!-- login style1 -->

<div style="margin-bottom:8em; ">
<form class="form" action="mLogin" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<table style=" border-radius:9px; height:8em; width:30em; margin-top:2em; margin-left:auto; margin-right:auto;">
	<tr align="center" style="margin-top: 1em;">
		<td height="3.5em"><input style="border-radius: 3px; width: 20em;" type="text" name="id" id="id" placeholder="아이디" onfocus="this.placeholder=''" onblur="this.placeholder='아이디'"></td>
	</tr>	
	<tr align="center">
	<td height="3.5em"><input style="border-radius: 3px; width: 20em;"  type="password" name="password" id="password" placeholder="비밀번호" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'"></td>
	</tr>
	<tr align="center" height="3.5em">
	<td colspan="2"><button style="border-radius:3px; height:3em; width: 20em; font-weight:bold; border-width:thin; background-color:LightSteelBlue; color:black; align-self:center;" type="submit">로그인</button>&nbsp;</td>
	</tr>
</table>
</form>
<div style="text-align: center;">
<button type="button" onclick="location.href='findf'" style="color: gray; background-color:white; border-style:none; font-size: 12px;">아이디/비밀번호 찾기</button>
	        <span>|</span>&nbsp;
	        <button onclick="location.href='joinf'" style="color: gray; background-color:white; border-style:none; font-size: 12px;">회원가입</button>
</div>
</div>
<span id="message"></span><br>
        <c:if test="${not empty message}">
	        <br> ${message}<br><br>
	    </c:if>
<!-- login style2-->
<!-- <form action="login" method="post">
<div>
<table style=" border-radius:9px; height:13em; width:13em; margin-top:10em; margin-bottom:20em; margin-left:auto; margin-right:auto; background-color: WhiteSmoke;">
	<tr align="center"><td></td>
		<td><input style="border-radius: 6px;" type="text" name="id" id="id" placeholder="아이디" onfocus="this.placeholder=''" onblur="this.placeholder='아이디'"></td></tr>
	<tr align="center"><td></td>
		<td><input style="border-radius: 6px;" type="password" name="password" id="password" placeholder="비밀번호" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'"></td></tr>
	<tr align="center"><td></td>
	    <td>
	       <input style="border-radius:6px; background-color: MediumPurple; color:white; align-self:center; width: 11.5em;" type="submit" value="Login">&nbsp;
	    </td>
    </tr>	
	<tr align="center"><td></td>
	    <td>
	        <a onclick="joinForm.jsp" style="color: gray; font-size: 12px;">회원가입</a>
			<span id="axlogin" class="textLink">axLogin</span>&nbsp;
			<span id="jslogin" class="textLink">jsLogin</span>
		</td>
	<td></td></tr> 
</table>
</div>
</form> -->
<br>

<div class="row container-fluid" style="height: 10rem; width:60%; position: absolute; margin-left: 20em;">
  <%@ include file="../footer.jsp" %>
</div>
<!-- <a href="home">[Home]</a> -->
</body>
</html>




