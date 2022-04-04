<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	
<script type="text/javascript">

$(document).ready(function () {
	$(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
	
	setInterval(nextSlide, 6000); //6초(4000)마다 다음 슬라이드로 넘어감
});

//이전 슬라이드
function prevSlide() {
	$(".mySlideDiv").hide(); //모든 div 숨김
	var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
	var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
	
	//반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
	$(".mySlideDiv").each(function(index,item){ 
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	//새롭게 나타낼 div의 index
	var newIndex = 0;
    
	if(currentIndex <= 0) {
		//현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
		newIndex = allSlide.length-1;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
		newIndex = currentIndex-1;
	}

	//모든 div에서 active 클래스 제거
	$(".mySlideDiv").removeClass("active");
    
	//새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();

}

//다음 슬라이드
function nextSlide() {
	$(".mySlideDiv").hide();
	var allSlide = $(".mySlideDiv");
	var currentIndex = 0;
	
	$(".mySlideDiv").each(function(index,item){
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	var newIndex = 0;
	
	if(currentIndex >= allSlide.length-1) {
		//현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
		newIndex = 0;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
		newIndex = currentIndex+1;
	}

	$(".mySlideDiv").removeClass("active");
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();
	
}

</script>

<style type="text/css">
/* Slideshow container */
.slideshow-container {
  width: 90%;
  height:18em;
  position: relative;
  margin: auto;
  margin-top: 120px;
}


/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;	
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: Silver;
  font-weight: bold;
  font-size: 23px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  text-decoration: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}
</style>
</head>
 <body> 
 <div class="slideshow-container">
     <div class="mySlideDiv slide active" style="background:MediumAquaMarine; width: 100%; height: 100%; text-align:center; line-height: 4em;">
     <span style="font-size: 25px; color: Black;"><br>
       만들고 싶은 습관, 작심삼일로 끝나는 계획들... <br>
       <span style="font-size: 30px; color: MidnightBlue ;">
         <span style="color:  Purple;">
           '너DO 나DO'
         </span>
         에서 다른 사람들과 같이 챌린지로 시작해보세요!!
       </span>
       </span>
     </div>
            
     <div class="mySlideDiv slide" style="background:PaleTurquoise; width: 100%; height: 100%;">
        <img src="resources/image/plan.png" style="height: 18em; width: 27em;">&nbsp;&nbsp; <span style="font-size: 20px;">다양한 챌린지에 도전하여 상위 랭크에 도전하세요!</span>
     </div>
            
     <div class="mySlideDiv slide" style="background:SteelBlue; width: 100%; height: 100%; text-align:center; line-height: 4em; ">
     <br>
         <span style="font-size: xx-large;">Point <span style="color: red;">2X</span></span><br>
                                           <span style="font-size: x-large;">챌린지 달성 포인트 2배 이벤트 진행중 ~</span> <br> 
     </div>
     <div class="mySlideDiv slide" style="background:white; width: 100%; height: 100%; text-align:center; line-height: 4em;">
         <img src="resources/image/study1.jpg" style="height: 18em; width: 70%;">
     </div>

     <a class="prev" onclick="prevSlide()">&#10094;</a>
     <a class="next" onclick="nextSlide()">&#10095;</a> 
            
</div>
 
</body>
</html>