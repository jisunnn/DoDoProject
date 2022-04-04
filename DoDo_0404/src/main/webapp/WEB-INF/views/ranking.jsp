<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Rank</title>
  
  <script src="resources/myLib/jquery-3.2.1.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  
  <script>
    $(document).ready(function(){
        $(".divv>slide").click(function(){
        	$(this).next("ul").toggleClass("hide");
        });
    });
  </script>
  
  <style>
    *{margin:0; padding:0;}
    ul,li{list-style:none;}
    .slide{height:300px; overflow:hidden;}
    .slide ul{height:calc(100% * 5);animation:slide 12s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .slide li{height:calc(100% / 5); height:300px; font-family: Pretendard-Regular; letter-spacing: 2px;}
    
     @keyframes slide {
       0% {margin-top:0;}
      10% {margin-top:0;}
      22% {margin-top:-300px;}
      32% {margin-top:-300px;}
      44% {margin-top:-600px;}
      54% {margin-top:-600px;}
      65% {margin-top:-900px;}
      75% {margin-top:-900px;}
      83% {margin-top:-1200px;}
      99% {margin-top:-1200px;}
      100% {margin-top:0;}
    } 
   
    @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
    }
  </style>
</head>
<body>
<div class="divv" style="width: 23em; height: 2em; margin-left: auto; margin-right: auto; ">
<!-- <div style="border-top-left-radius:3px; border-bottom-left-radius:3px; font-family:Pretendard-Regular0; line-height:2em; width: 3em; height: 2em; border-right:none; color:SteelBlue; float: left;" align="center">Lank</div> -->
  <div class="slide" style="display:block; border-top-right-radius:3px; margin-left:0em; border-bottom-right-radius:3px; width: 20em; height: 2em;  margin-right: auto; float:right;">
  <ul class="hide" style="padding-left: 0px;">
    <c:forEach var="list" items="${rankbanana}" >
      <li style="text-align: center; font-size: 14px; font-weight: bold;"><span style="color: Crimson;">${list.rank}</span>위 &nbsp;&nbsp;&nbsp; 아이디  : <span style="color: DarkCyan;">${list.id}</span> &nbsp;&nbsp;&nbsp; 포인트  : <span style="color: Purple;">${list.point}</span></li>
      </c:forEach>
    </ul>
  </div>
 </div>
<!-- ul 왼쪽 여백 제거 다른 방법 : style="-webkit-padding-start:0px;" -->

</div>
</body>
</html>
    