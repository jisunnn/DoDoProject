## 너do나do   

### 개요
다양한 주제의 챌린지(미션)를 생성하거나 원하는 챌린지에 참여하고 다른 회원들과 함께 챌린지를 수행하여 성공시 포인트를 얻어 상위 랭킹에 도전할 수 있습니다.

***

### Backend

- 사용 언어 : Java, Jsp

- 프레임 워크 : Spring Framework, MyBatis              

- 데이터 베이스 : Oracle

- 서버 : Apache Tomcat 9.0


### Frontend

- 사용 언어 :  CSS3, HTML, JavaScript, Bootstrap(부분적 사용)

- 라이브러리 : JQuery, Ajax


***

### 구현 내용

- 요구사항
![image](https://user-images.githubusercontent.com/97445449/162133767-3e13e04f-87c7-4336-bcdf-56b4a8e07d87.png)

![image](https://user-images.githubusercontent.com/97445449/162133790-5d4765bd-44a8-47bb-b0d9-7ff2dc224ae9.png)



- 나의 참여도 : 35%

- 나의 참여 내용

    * 고객지원(1:1 문의 게시판) 
      * 관리자만 답글 가능, 문의 작성자는 본인의 글과 답변만 열람 가능, 페이징 처리


    * 공지사항  
      * 관리자만 글작성,수정,삭제,페이징 처리

    * 랭킹 시스템  
      * DB: Trigger사용( 멤버 테이블과 랭킹 테이블의 데이터 연동) 및 분석 함수(rank over()) 사용 
      * 메인 페이지에 상단에 출력: Ajax 사용(실시간 랭킹 DB반영을 위해 Ajax사용)

    * 로고(미리캔버스로 제작) 및 배너(슬라이드 기능 : jquery 사용)

    * 전체적인 프론트단 수정
      * css3, HTML5, 부트스트랩 일부 사용

    * 챌린지 상세페이지 사이드바
      * 챌린지 시작 전 : D-day표시, 시작 후: 시작일로부터 일수 표시
      * jquery로 마우스를 따라 움직이게 구현 


### DB Table
![image](https://user-images.githubusercontent.com/97445449/162133665-615b63cb-1630-4306-a268-8bfe8779a8f4.png)

***

### 추가하고 싶은 기능
- 적립한 포인트로 폰트나 이모티콘 또는 기프티콘을 구매할 수 있는 상점
- 챌린지 참여자간 채팅 기능
- 소셜 계정 연동
- 지도 api를 활용하여 내 주변에 있는 챌린지에 참여할 수 있는 기능 


