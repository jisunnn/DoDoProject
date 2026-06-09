## 너do나do   

### 개요

계획이나 목표를 다른 사람들과 같이 참여하여 더욱더 잘 이룰 수 있도록 챌린지 서비스를 제공하는 '너Do나Do'입니다. 
다양한 주제의 챌린지(미션)를 생성하거나 원하는 챌린지에 참여하고 다른 회원들과 함께 챌린지를 수행하여 성공시 포인트를 얻어 상위 랭킹에 도전할 수 있습니다.


***

### 개발 기간
2022.01.03 ~ 2022.02.17

### 개발 기간 동안 사용한 Github 주소
https://github.com/Hjjjjjjjjj9/DoDo_Challenge

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
      * DB: Trigger사용( 멤버 테이블과 랭킹 테이블의 데이터 연동) 및 분석 함수(rank over())를 사용하여 1~5등까지 출력 
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
### 기본 데이터 흐름 구조
<img width="795" height="301" alt="image" src="https://github.com/user-attachments/assets/3c89580d-44c7-430e-8e4c-0fd8c9f21c4e" />

***
### 기능 도메인 별 데이터 흐름
1. 회원 관리 (Member): MemberController ➔ MemberService(Impl) ➔ MemberMapper ➔ Oracle DB
   설명: 사용자가 로그인, 회원가입, 회원정보 수정 등을 요청하면 컨트롤러가 이 요청을 받아 서비스로 전달합니다. 서비스는 암호화나 비즈니스 검증을 거친 후 매퍼를 통해 DB의 회원 테이블 데이터를 생성, 조회, 수정, 삭제(CRUD)합니다.
2. 챌린지 관리 (Challenge): ChallengeController ➔ ChallengeService(Impl) ➔ ChallengeMapper ➔ Oracle DB
   설명: 사용자가 챌린지를 개설하거나 목록을 조회할 때 작동합니다. 챌린지 상태(진행 중, 마감 등)나 카테고리별 필터링 데이터가 이 라인을 통해 처리됩니다.
3. 파일/인증 데이터 관리 (Piledata): ChallengeController ➔ PiledataService(Impl) ➔ PiledataMapper ➔ Oracle DB
   설명: 사용자가 챌린지 참가 후 인증 사진이나 파일(Piledata)을 업로드할 때 사용됩니다. 파일의 메타데이터나 참가 인증 정보가 DB에 기록됩니다.
4. 댓글/답변 관리 (Reply): ChallengeController ➔ ReplyService(Impl) ➔ ReplyMapper ➔ Oracle DB
   설명: 특정 챌린지 내에서 사용자들이 작성하는 댓글, 신고(report) 등의 데이터가 전송되고 저장되는 경로입니다.
5. 자유게시판 (Board) / 문의사항 (Ask) / 공지사항 (Notice): 각 Controller ➔ 각 Service(Impl) ➔ 각 Mapper ➔ Oracle DB
   설명: 일반적인 게시판 형태의 데이터 흐름입니다. 페이징 처리된 리스트(pageList), 상세 보기(selectOne), 글쓰기/수정/삭제 데이터가 오고 갑니다.
6. 랭킹 시스템 (Ranking): HomeController ➔ RankingService(Impl) ➔ RankingMapper ➔ Oracle DB
   설명: 메인 화면(HomeController)이 구동될 때, 사용자의 활동 점수나 챌린지 달성도를 기반으로 한 상위 랭킹 데이터를 DB에서 조회하여 메인 페이지로 전달합니다.

***

### 실행화면

- 로그인, 회원가입, 아이디·비밀번호 찾기
![image](https://user-images.githubusercontent.com/97445449/162340948-673773d6-59b1-4baf-99fd-e8f0709b907f.png)

- 공지사항 
![image](https://user-images.githubusercontent.com/97445449/162346211-d533f934-e23a-4a11-bbd7-33d3a794a9d9.png)

- 고객지원(1:1문의)
![image](https://user-images.githubusercontent.com/97445449/162346283-92f83e75-fa03-41c6-b4e5-da9715ed415a.png)

- 챌린지 검색·정렬, 출석, 신고하기
![image](https://user-images.githubusercontent.com/97445449/162348504-52a46cbd-9f53-406c-8be7-fc4cf08c0c0a.png)

- 마이페이지
![image](https://user-images.githubusercontent.com/97445449/162347505-8417f8d5-3438-45a0-9748-a63995b6a7c9.png)

-관리자 로그인· 페이지
![image](https://user-images.githubusercontent.com/97445449/162347974-6a6a5cb7-7ca2-433f-8fb9-85d418c6135d.png)

- 랭킹 시스템
![image](https://user-images.githubusercontent.com/97445449/162349025-9d8a517e-a9cf-45bb-8b69-61c742781d8c.png)



***
### 개발 시 겪은 오류 및 해결 사례
- 회원가입시 오류 발생 -> 가자 최근에 수정한 부분이 트리거 부분이라서 트리거 부분을 체크해보니, 이전에 삭제하지 않은 랭킹 업데이트 트리거 때문에 발생한 트리거 중복 오류였음
-> 트리거 삭제로 간단하게 해결함

***

### 추가하고 싶은 기능
- 적립한 포인트로 폰트나 이모티콘 또는 기프티콘을 구매할 수 있는 상점
- 챌린지 참여자간 채팅 기능
- 소셜 계정 연동
- 지도 api를 활용하여 내 주변에 있는 챌린지에 참여할 수 있는 기능 


