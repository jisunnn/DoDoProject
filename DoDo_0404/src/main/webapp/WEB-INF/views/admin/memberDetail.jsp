<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/image/skyblue2.ico" type="image/x-icon" sizes="16x16">
<title>너Do나Do : 회원 관리</title>
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
    <h3>회원 정보</h3>
    <br><br>
    <div class="row">
        <table class="table">
            <thead class="table-light">
            <tr>
            <th colspan='2'>${selectedMember.id}님의 회원정보</th>
            </tr>
            </thead>
            <tr> 
                <th>ID</th>
                <td>${selectedMember.id}</td>
            </tr>
            <tr>
                <th>이름</th>
                <td>${selectedMember.name}</td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>${selectedMember.nick}</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>${selectedMember.mail}</td>
            </tr>
            <tr>
                <th>포인트</th>
                <td>${selectedMember.point}</td>
            </tr>
        </table>
    </div>
    <div class="row">
        <table class="table">
            <thead class="table-light">
            <tr>
                <th colspan='6'>${selectedMember.id}님의 신고내역</th>
            </tr>
            <tr>
                <th>#</th>
                <th>신고사유</th>
                <th>내용</th>
                <th>날짜</th>
                <th>바로가기</th>
            </tr>
            </thead>
            <c:forEach var="list" items="${reportedReplies}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${list.detail}</td>
                <td>${list.content}</td>
                <td><fmt:formatDate value="${list.regdate}" pattern="yyyy/MM/dd"/></td>
                <td><a href="cdetail?seq=${list.seq}">link</a></td>
            </tr>
            </c:forEach>
            
        </table> 
    </div>



    <div class="row">
        <div class="col-lg-6 col-sm-12 text-lg-start text-center">
            <form class="form" style='display:inline' action="adminMdelete" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" id="id" name="id" value="${selectedMember.id}"/>
                <button type="submit" class="btn btn-danger">탈퇴</button>
            </form>
            <button type="button" class="btn btn-secondary" onclick="location.href='adminList'">목록</button>
        </div>
    </div>

</div>

<div class="row container-fluid" style="height: 10rem; position: absolute;">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
</div>
</body>
</html>