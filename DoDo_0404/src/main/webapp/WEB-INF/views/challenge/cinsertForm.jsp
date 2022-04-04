<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge Input</title>
<link rel="icon" href="resources/image/skyblue.ico" type="image/x-icon" sizes="16x16">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/cInCheck.js"></script>
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
  <div class="col-2"></div>
  <div id="mainArea" class="col-8" >
<br>
<div>
  <h3>챌린지 신청하기</h3>
</div>
<hr>

<div class="row-col-3">
  <div>
  <form action="cinsert?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
  <table class="table">
    <tr>
      <th rowspan="7" width="80"></th>
      <th>제 목</th>
        <td><input name="title" id="title" type="text" placeholder="제목을 입력해주세요" size="80"><br>
            <span id="tMessage"></span>
        </td>
    </tr>
    <tr>
      <th>작성자</th>
        <td><input name="id" type="text" size="20" readonly="readonly" value="${nickName}"></td>
        <td><input name="loginID" type="text" value="${loginID}" hidden="hidden"></td>
    </tr>
    <tr>
      <th>카테고리</th>
	    <td><select name="category" id="category">
		  	  <option value="" selected>----</option>
			  <option value="공부" >공부</option>
			  <option value="운동" >운동</option>
			  <option value="생활" >생활</option>
			  <option value="취미" >취미</option>
		    </select><br>
		    <span id="cMessage"></span>
	    </td>
	</tr>
    <tr>
      <th>시작날짜</th>
        <td><input name="sdate" type="date" id="sdate"><br>
        	<span id="dMessage"></span>
        </td>
    </tr>
    <tr>
      <th>기 간</th>
        <td>
        <input id="term_10" class="termCheck" name="term" type="radio" value="10">
       		<label for="term_10">10일</label> &nbsp;&nbsp;
       	<input id="term_15" class="termCheck" name="term" type="radio" value="15">
       		<label for="term_15">15일</label> &nbsp;&nbsp;
       	<input id="term_30" class="termCheck" name="term" type="radio" value="30">
       		<label for="term_30">30일</label> &nbsp;&nbsp;
       	<input id="term_60" class="termCheck" name="term" type="radio" value="60">
       		<label for="term_60">60일</label> &nbsp;&nbsp;<br>
        <span id="termMessage"></span>
        </td>
    </tr>
    <tr>
      <th>내 용</th>
        <td><textarea name="content" rows="20" cols="81" placeholder="내용을 입력해주세요"></textarea></td>
    </tr>
    <tr>
      <th>썸네일 이미지</th>
        <td><input type="file" name="thumbnailf" id="uploadfilef">
        	<img src="" class="select_img"><br>
			<script>
			$('#uploadfilef').change(function(){
				if(this.files && this.files[0]) {
					var reader = new FileReader;
				 	reader.onload = function(e) {
			 			$(".select_img").attr("src", e.target.result)
			 			.width(100).height(100); 
			 		} // onload_function
			 		reader.readAsDataURL(this.files[0]);
			 	}
			});
			</script>
		<span>이미지는 수정할 수 없습니다. 선택하지 않을 시 기본 이미지가 자동 입력됩니다.</span>
		</td>

    </tr>
    <tr> 
      <td colspan="4" style="text-align: center;">

        <input type="submit" value="확인" onclick="return nullCheck()">&nbsp;&nbsp;
	    <input type="reset" value="취소" onclick="location.href='clist'">&nbsp;&nbsp;
	  </td>
	</tr>
    </table>
    </form>
  </div>
  <c:if test="${not empty message}">
    <span>${message}</span><br>
  </c:if>
</div>
</div>

<div class="col-2" ></div>
</div>

<div class="row container-fluid" style="height: 10rem; position: absolute; background: snow; ">
  <%@ include file="../footer.jsp" %>
</div>

<script>
function nullCheck() {
	var titleCheck = false;
	var categoryCheck = false;
	var dateCheck = false;
	var termCheck = false;
	
	titleCheck = title();
	categoryCheck = category();
	dateCheck = date();
	termCheck = term();
	
	if ( titleCheck && categoryCheck && dateCheck && termCheck ) {
		var insert = confirm("챌린지를 등록합니다.");
		if(insert == false) {
			alert('챌린지 등록이 취소되었습니다.');
			return false;
		} else {
			alert('챌린지 등록이 완료되었습니다.');
			return true;
		}
	} else 
		return false; 
} 
</script>
</body>
</html>