<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너Do나Do: 관리자 로그인</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" 
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<style type="text/css">
    .container.custom-container {
      padding: 0 9rem;
    } 
</style>
</head>
<body>


<div class="custom-container container">
<br><br>
<h3>관리자 로그인</h3>
<br><hr><br>
    <div class="row">
       <form class="form" action="login" method="post">
           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
           <div class="form-group">
               <input type="text" class="form-control" name="username" id="username" placeholder="Admin ID">
           </div>
           <div class="form-group">
               <input type="password" class="form-control" name="password" id="password" placeholder="Admin PASSWORD">
           </div>
           <input type="submit" class="btn btn-danger w-100" value="관리자 로그인" />            
       </form>
     </div>

    <div class="row">
        <span id="message"></span><br>
        <c:if test="${not empty message}">
	        <br> ${message}<br><br>
	    </c:if>
	</div>
</div>
	

</body>
</html>