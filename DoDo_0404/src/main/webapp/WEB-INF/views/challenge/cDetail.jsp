<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/image/skyblue2.ico" type="image/x-icon" sizes="16x16">
<title>Challenge Detail List</title>
<link rel="icon" href="resources/image/skyblue.ico" type="image/x-icon" sizes="16x16">
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/myLib/mainPage.js"></script>

	<script>
	$(window).scroll(function(){
	       var position = $(document).scrollTop();
	       $(".floating").css('middle',  position );     
	});
	</script>
<style>
.dd {
    color: #6423ff;
    background: rgba(100, 35, 255, 0.04);
    border-color: rgba(100, 35, 255, 0.4);
    float: left; 
    font-size: 5px; 
    margin: 2em;
      
  }
.floating{
	position:sticky;
	position:-webkit-sticky;
	right:60;
	top:140px;
	background-color: white ; 
	border: 1px solid black;
	z-index:1;
}  
a { 
 	text-decoration: none !important;
 } 
  </style> 
</head>	
<body>
 
<%@ include file="../header.jsp" %>
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
<div id="mainArea" class="col-8">
<br>
<div>
  <h3>챌린지 상세보기</h3>
</div>
<hr>

<!-- 상세보기 table -->
<div class="row" > 
<div class="col-9">
    <div  >
    <table class="table" style="width: 100%; background-color: #fafafa;">
      <tr>
        <th rowspan="4"></th>
        <th colspan="5" style="text-align: center; ">${apple.title}</th>
        <th rowspan="4"></th>
      </tr>
      <tr>
        <th scope="col" colspan="5" style="text-align: center;">
        	작성자 : ${apple.id} &nbsp; 
        	시작날짜 : ${apple.sdate}
      </tr>
      <tr>
        <td colspan="3" style="text-align: left;" width="65%;">
        <br>
		  <p class="text-break"><img src="${apple.thumbnail}" width="400" height="250" style="margin-bottom:10px; margin-left: 5em;"><br>${apple.content}</p></td>  
        <td colspan="2" style="text-align: center; ">
        </td>
      </tr>
      <tr>
        <c:if test="${apple.state =='doing'}">
  	    <c:forEach var="list" items="${result}"> 
		<td>
		  <span style="text-align: right;">${list.nick}(${list.result}%)</span><br>
		  <progress value="${list.result}" max="100" class="progress-bar-striped"></progress>
		</td>
	  	</c:forEach>
	  	</c:if>
	  	<c:if test="${apple.state =='done'}">
  	    <c:forEach var="list" items="${result}"> 
		<td>
		  <span style="text-align: right;">${list.nick}(${list.result}%)</span><br>
		  <progress value="${list.result}" max="100" class="progress-bar-striped"></progress>
		</td>
	  	</c:forEach>
	  	</c:if>
	  </tr>
    </table>
    </div>
    


<c:if test="${nickName == apple.id  || loginID=='admin'}">
	<a href="cdetail?jcode=U&seq=${apple.seq}">글수정</a>&nbsp;
	<a href="cdelete?seq=${apple.seq}">글삭제</a>
</c:if> 
<br>
<!-- <a class="btn btn-primary" style="font-size: 13px;" href="home">Home</a>&nbsp; -->
<div align="center">
<a class="btn btn-primary" style="font-size: 13px;" href='javascript:history.go(-1)'>목록보기</a><br>
</div>
<c:if test="${not empty message}">
  <span>${message}</span><br>
</c:if>
<c:if test="${not empty rmessage}">
  <span>${rmessage}</span><br>
</c:if>
<c:if test="${not empty amessage}">
  <span>${amessage}</span><br>
</c:if>


<hr width="100%">
<!-- 댓글 table -->
<div class="row">
  <div>
    <form action="rinsert" method="get">
    <table class="table" style="width: 100%; background-color: #e6e6e6; " border="1">
      <tr>
        <td colspan="2"></td>
        <td colspan="2">
          <input type="text" name="content" placeholder="댓글 내용을 입력하세요" size="65"></td> 
        <td colspan="2">  
          <input type="text" name="id" hidden="hidden" value="${nickName}"></td> 
        <td colspan="2">  
          <input type="text" name="seq" hidden="hidden" value="${apple.seq}"></td> 
        <td style="text-align: center;">
          <input class="btn btn-light" style="font-size: 13px;"  type="submit" value="입력"> </td> 
      </tr>
    </table>
    </form>
  </div>

  <div>
    <c:forEach var="list" items="${cherry}">
    <form action="rreport" method="get">
      <table class="table" style="width: 100%;">
        <tr>
        <c:if test="${nickName != apple.id}"> <!-- apple.id는 작성한 nickname, nickName은 현재 로그인한 nickName -->
          <td width="5%"  rowspan="2"></td>
          <td width="15%" rowspan="2">${list.id}</td>
          <td width="40%" colspan="2">${list.content}</td>
          <td width="30%"><fmt:formatDate value="${list.regdate}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
          <td style="text-align: right ;"></td>
        </c:if>
        <c:if test="${nickName == apple.id}"><!-- 로그인한 닉네임이 글작성 닉네임(방장)과 같은 경우 -->
          <td width="5%"  rowspan="2"></td>
          <td width="15%" rowspan="2">${list.id}</td>
          <td width="40%" colspan="2">${list.content}</td>
          <td width="30%"><fmt:formatDate value="${list.regdate}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
          <td style="text-align: right ;"><!-- 신고 권한은 챌린지를 생성한 방장에게만 존재 -->
            <input type="image" src="resources/image/deicon.png" title="신고하기" onclick="return inputDetail(${list.seq},${list.step})" width="20em" height="20em"></td>
        </c:if>
        </tr>
      </table>
    </form>
    </c:forEach>
    </div>
   </div>
   
  </div>
 <!-- 사이드바 -->
  <div class="col-3" style=" height: inherit;">
    <div class="floating" style="margin-left:3em; width: 10em; height: 15em; border-radius:5px; border-radius: 5px; text-align: center;">
          <button class="dd"> 
          <c:if test="${apple.category == '공부'}">공부</c:if> 
          <c:if test="${apple.category == '운동'}">운동</c:if>
          <c:if test="${apple.category == '생활'}">생활</c:if>
          <c:if test="${apple.category == '취미'}">취미</c:if>
          </button>
          <br>
          <br>
          <!-- D-day -->
          <jsp:useBean id="toDay" class="java.util.Date"/>
          <fmt:parseDate value="${apple.sdate}" var="sDate" pattern="yyyy-MM-dd"/>
          <a hidden><fmt:formatDate value="${sDate}" pattern="yyyyMMdd"/></a>
          <fmt:parseNumber value="${toDay.time / (1000*60*60*24)}" integerOnly="true" var="nowDays" scope="request"></fmt:parseNumber>
          <fmt:parseNumber value="${sDate.time / (1000*60*60*24)}" integerOnly="true" var="sDates" scope="request"></fmt:parseNumber>
          <br>
          <c:if test="${(sDates - nowDays) > 0}"><span style="font-size: xx-large;"> D- ${sDates - nowDays}</span></c:if>
          <c:if test="${(sDates - nowDays) < 0}"><span style="font-size: x-large;"> ${(sDates - nowDays)*(-1)}일차 진행중</span></c:if>
          <c:if test="${(sDates - nowDays) == 0}"><span style="font-size: xx-large;">챌린지 시작!</span></c:if>
          <br>
          <br>
           <c:if test="${apple.state == 'recruit'}">
          <a href="participate?seq=${apple.seq}&term=${apple.term}" 
          		class="btn btn-secondary btn-sm">참여하기</a><br><br>
          </c:if>
          <c:if test="${apple.state == 'doing'}">
          <a href="attend?seq=${apple.seq}" 
          		class="btn btn-secondary btn-sm">출석하기</a>
          </c:if>
          <c:if test="${apple.id == nickName && apple.state == 'done'}">
          	  <a href="donePoint?loginID=${loginID}&seq=${apple.seq}" 
          		class="btn btn-secondary btn-sm">챌린지 완료 / 포인트 받기</a>
          </c:if>
          </div>
         </div>
       </div>
  
  
</div>

<div class="col-2"></div>
</div>
<div class="row container-fluid" style="height: 10rem; position: absolute; background: snow; ">
  <%@ include file="../footer.jsp" %>
</div>
<script>
function inputDetail(seq, step) {
	var seq = seq;
	var step = step;
	console.log('seq : '+seq+', step : '+step);
	var test = prompt('신고 사유를 입력해주세요.');
	if(test == null) {
		alert('신고가 취소되었습니다.');
		return false;
	} else {
		alert('신고 완료되었습니다.');
		location.href = 'rreport?seq='+seq+'&step='+step+'&detail='+test;
		return true;
	}
}
</script>
</body>
</html>