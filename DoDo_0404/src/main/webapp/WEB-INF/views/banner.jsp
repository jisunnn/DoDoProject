<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
  *{margin:0;padding:0;}
  ul,li{list-style:none;}
  #sslide{height:300px;position:relative;overflow:hidden;}
  #sslide ul{width:400%;height:100%;transition:1s;}
  #sslide ul:after{content:"";display:block;clear:both;}
  #sslide li{float:left;width:25%;height:100%; transform:scale(1);}
  #sslide li:nth-child(1){background:MediumAquaMarine;}
  #sslide li:nth-child(2){background:PaleTurquoise;} 
  #sslide li:nth-child(3){background:SteelBlue;}
  #sslide li:nth-child(4){background:white;}
  #sslide input{display:none;}
  #sslide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
  #sslide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
  #pos1:checked~ul{margin-left:0%;}
  #pos2:checked~ul{margin-left:-100%;}
  #pos3:checked~ul{margin-left:-200%;}
  #pos4:checked~ul{margin-left:-300%;}
  #pos1:checked~.pos>label:nth-child(1){background:#666;}
  #pos2:checked~.pos>label:nth-child(2){background:#666;}
  #pos3:checked~.pos>label:nth-child(3){background:#666;}
  #pos4:checked~.pos>label:nth-child(4){background:#666;} 
  
  </style>
<body>
<div id="sslide" style="width: 100%; height: 18em; text-align:center; line-height: 4em;">
  <input type="radio" name="pos" id="pos1" checked>
  <input type="radio" name="pos" id="pos2">
  <input type="radio" name="pos" id="pos3">
  <input type="radio" name="pos" id="pos4">
  <ul  style="padding-left: 0px;">
    <li><span class="fadein" style="font-size: 25px; color: Black;">
       <hr>
       만들고 싶은 습관, 작심삼일로 끝나는 계획들... <br>
       <span style="font-size: 30px; color: MidnightBlue ;">
         <span style="color:  Purple;">
           '너DO 나DO'
         </span>
         에서 다른 사람들과 같이 챌린지로 시작해보세요!!<br>
         <br><hr>
       </span>
     </span></li>
    <li><img src="resources/image/plan.png" style="height: 18em; width: 27em;">&nbsp;&nbsp; <span style="font-size: 20px;">다양한 챌린지에 도전하여 상위 랭크에 도전하세요!</span></li>
    <li>
       <br>
       <span style="font-size: xx-large;">Point <span style="color: red;">2X</span></span><br>
                                           <span style="font-size: x-large;">챌린지 달성 포인트 2배 이벤트 진행중 ~</span> <br>
    </li>
    <li><img src="resources/image/study1.jpg" style="height: 18em; width: 70%;"></li>
  </ul>
  <p class="pos">
    <label for="pos1"></label>
    <label for="pos2"></label>
    <label for="pos3"></label>
    <label for="pos4"></label>
  </p>
</div>
</body>
</html>