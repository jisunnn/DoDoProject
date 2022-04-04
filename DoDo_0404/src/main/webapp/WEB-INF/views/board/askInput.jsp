<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 작성하기</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

 
<script>
$(document).ready(function(){
	$("#submit").click(function(){
		if($("#title").val()==""){alert("제목을 입력하세요."); $("#title").focus(); return false;}
		if($("#content").val()==""){alert("내용을 입력하세요."); $("#content").focus(); return false;}
	});
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
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
<div style="margin-left: 15em;">
  <p>1:1문의 작성하기</p>
</div>
<hr style="width: 70%; margin-left: auto;margin-right: auto; margin-bottom: 2em;">

<form action="ainsert" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<div class="row-col-3">
  <div>
  <table class="table" style="width: 60em; margin-left:auto; margin-right: auto;">
      <tr  style="border-color: White;">
        <th rowspan="6" width="80" ></th>
        <th style="border-color: white;">제 목</th>
        <td style="border-color: white;"><input type="text" name="title" id="title" placeholder="제목을 입력해주세요" size="80"></td>
      </tr>
      <tr>
        <th scope="col" colspan="5" style="border-bottom-color:Gainsboro;">작성자 : 
        <input type="text" name="id" value="${loginID}" size="80" readonly="readonly"></th>
      </tr>
      <!-- <tr style="border-color: White;">
        <td><input type="text" name="id" value="admin" hidden></td>
      </tr> -->
      <tr  style="border-color: white;">
        <th >내 용</th>
        <td><textarea rows="18" cols="81" name="content"   placeholder="내용을 입력해주세요" ></textarea></td>
      </tr>
      <!-- <tr>
        <th>사진첨부</th>
        <td><input type="file" name="uploadfilef" id="uploadfilef">
			<script>
			$('#uploadfilef').change(function(){
				if(this.files && this.files[0]) {
					var reader = new FileReader;
				 	reader.onload = function(e) {
			 			$(".select_img").attr("src", e.target.result)
			 			.width(100).height(100); 
			 		} // onload_function
			 		reader.readAsDataURL(this.files[0]);
			 	} // if
			}); // change			
			</script>
		</td>
      </tr> -->
      <tr style="border-color: white;">
        <td colspan="2" style="text-align: center; border-color: white;">
          <div style="margin-left: 20em; margin-right: 24em;">
          <input type="submit" id="submit" value="확인">&nbsp;&nbsp;
		  <input onclick="javascript:history.go(-1)" type="reset" value="취소">&nbsp;&nbsp;
		  </div>
		</td>
	  </tr>
    </table>
</div>
</div>
</form>

<div class="row container-fluid" style="height: 10rem; position: absolute; background: WhiteSmoke; ">
  <%@ include file="/WEB-INF/views/footer.jsp" %>
  </div>

</body>
</html>