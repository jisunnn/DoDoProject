<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge Update</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
	<script src="resources/myLib/cInCheck.js"></script>
</head>
<body>


<%@ include file="../header.jsp" %>
<div class="row" > 
  <div class="col-2" style="background-color: lavender;"></div>
  <div id="mainArea" class="col-8" >
<br>
<div>
  <p>수정하기</p>
</div>
<hr>
 
<div class="row-col-3">
  <div>
  <form action="cupdate?${_csrf.parameterName}=${_csrf.token}" method="post">
  <input hidden="hidden" name="seq" value="${apple.seq}">
  <table class="table">
    <tr>
      <th rowspan="7" width="80"></th>
      <th>제 목</th>
        <td><input name="title" id="title" type="text" value="${apple.title}" size="80"></td>
    </tr>
    <tr>
      <th>작성자</th>
        <td><input name="id" type="text" size="20" readonly="readonly" value="${apple.id}"></td>
    </tr>
    <tr height="40"><td bgcolor="Thistle">카테고리</td>
	  <c:if test="${apple.category=='-'}">
      <td><select name="category" id="category">
		<option value="-" selected>----</option>
		<option value="공부">공부</option>
		<option value="운동">운동</option>
		<option value="생활">생활</option>
		<option value="취미">취미</option>
	  </select>
	  </td>
	  </c:if>
	  <c:if test="${apple.category=='공부'}">
	  <td><select name="category" id="category">
		<option value="-">----</option>
		<option value="공부" selected>공부</option>
		<option value="운동">운동</option>
		<option value="생활">생활</option>
		<option value="취미">취미</option>
		</select>
	  </td>
	  </c:if>
	  <c:if test="${apple.category=='운동'}">
	  <td><select name="category" id="category">
		<option value="-">----</option>
		<option value="공부">공부</option>
		<option value="운동" selected>운동</option>
		<option value="생활">생활</option>
		<option value="취미">취미</option>
		</select>
	  </td>
	  </c:if>
	  <c:if test="${apple.category=='생활'}">
	  <td><select name="category" id="category">
		<option value="-">----</option>
		<option value="공부">공부</option>
		<option value="운동">운동</option>
		<option value="생활" selected>생활</option>
		<option value="취미">취미</option>
		</select>
	  </td>
	  </c:if>
	  <c:if test="${apple.category=='취미'}">
	  <td><select name="category" id="category">
		<option value="-">----</option>
		<option value="공부">공부</option>
		<option value="운동">운동</option>
		<option value="생활">생활</option>
		<option value="취미" selected>취미</option>
		</select>
	  </td>
	  </c:if>
	</tr>
    <tr>
      <th>시작날짜</th>
        <td><input name="sdate" id="sdate" type="date" value="${apple.sdate}"></td>
    </tr>
    <tr>
      <th>기 간</th>
        <c:if test="${apple.term==10}">
          <td><input id="term_10" class="termCheck" name="term" type="radio" value="10" checked>
        	    <label for="term_10">10일</label> &nbsp;&nbsp;
        	  <input id="term_15" name="term" type="radio" value="15">
        		<label for="term_15">15일</label> &nbsp;&nbsp;
        	  <input id="term_30" name="term" type="radio" value="30">
        		<label for="term_30">30일</label> &nbsp;&nbsp;
        	  <input id="term_60" name="term" type="radio" value="60">
        		<label for="term_60">60일</label> &nbsp;&nbsp;
          </td>
        </c:if>
        <c:if test="${apple.term==15}">
          <td><input id="term_10" class="termCheck" name="term" type="radio" value="10">
        	    <label for="term_10">10일</label> &nbsp;&nbsp;
        	  <input id="term_15" name="term" type="radio" value="15" checked>
        		<label for="term_15">15일</label> &nbsp;&nbsp;
        	  <input id="term_30" name="term" type="radio" value="30">
        		<label for="term_30">30일</label> &nbsp;&nbsp;
        	  <input id="term_60" name="term" type="radio" value="60">
        		<label for="term_60">60일</label> &nbsp;&nbsp;
          </td>
        </c:if>
        <c:if test="${apple.term==30}">
          <td><input id="term_10" class="termCheck" name="term" type="radio" value="10">
        	    <label for="term_10">10일</label> &nbsp;&nbsp;
        	  <input id="term_15" name="term" type="radio" value="15">
        		<label for="term_15">15일</label> &nbsp;&nbsp;
        	  <input id="term_30" name="term" type="radio" value="30" checked>
        		<label for="term_30">30일</label> &nbsp;&nbsp;
        	  <input id="term_60" name="term" type="radio" value="60">
        		<label for="term_60">60일</label> &nbsp;&nbsp;
          </td>
        </c:if>
        <c:if test="${apple.term==60}">
          <td><input id="term_10" class="termCheck" name="term" type="radio" value="10">
        	    <label for="term_10">10일</label> &nbsp;&nbsp;
        	  <input id="term_15" name="term" type="radio" value="15">
        		<label for="term_15">15일</label> &nbsp;&nbsp;
        	  <input id="term_30" name="term" type="radio" value="30">
        		<label for="term_30">30일</label> &nbsp;&nbsp;
        	  <input id="term_60" name="term" type="radio" value="60" checked>
        		<label for="term_60">60일</label> &nbsp;&nbsp;
          </td>
        </c:if>
    </tr>
    <tr>
      <th>내 용</th>
        <td><textarea name="content" rows="20" cols="81">${apple.content}</textarea></td>
        <td><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></td>
    </tr>
    <tr>
      <td colspan="4" style="text-align: center;">
        <input type="submit" value="확인">&nbsp;&nbsp;
	    <input type="reset" value="취소">&nbsp;&nbsp;
	  </td>
	</tr>
    </table>
    </form>
<hr>
<a href="home" >[Home]</a>
  </div>
</div>
</div>

<div class="col-2" style="background-color: lavender;"></div>
</div>

<c:if test="${not empty message}">
  <span>${message}</span>
</c:if>

<div class="row container-fluid" style="height: 10rem; position: absolute; background: snow; ">
  <%@ include file="../footer.jsp" %>
</div>

<script>
function nullCheck() {
	alert('nullCheck');
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