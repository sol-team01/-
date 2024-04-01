<!-- --------------------------------------------------------------- -->
<!-- 
0.0.0v - 팀프로젝트 시작
0.0.1v - 기본 jsp, 로그인 백엔드 작업 시작, api 연결
0.0.2v - 상세 jsp css, 로그인 1차 구현
0.0.3v - 게시판, 메인, 로그인 회원가입 CSS 구현 / DB연결 버그 해결
		  	 로그인 및 회원가입 백엔드 기본 구현
		  	 이미지 업로드 및 다운로드 구현 / MY페이지 백엔드 작업 중
 -->
<!-- --------------------------------------------------------------- -->
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<style>
</style>
</head>
<body>
<div id="warp">
<div id="Category">
	<img src="${cp}/resources/img/logo.png" alt="로고" class="image">
	<div id="customSelect">
  <div class="SelectHealth">운동</div>
  <div class="select-itemsHealth">
    <div><a href="${cp}/page/login">운동 하는 방법</a></div>
    <div>오늘 운동 완료</div>
    <div>이벤트</div>
  </div>
  </div>
  	<div id="customSelect">
    <div class="SelectFood">식단</div>
  	<div class="select-itemsFood">
    <div>칼로리 계산</div>
    <div>식품 영양 정보</div>
    <div>질병 당 추천 음식</div>
  	</div>
	</div>
  	<div id="customSelect">
    <div class="SelectDisease">질병</div>
  	<div class="select-itemsDisease">
  	<div>연령대별 질병</div>
  	</div>
	</div>
  	<div class="SelecNone">고객지원</div> 
<script>
$(document).ready(function(){ //운동 카테고리 버튼
  // 셀렉트 박스를 클릭했을 때 이벤트 처리
  $("#customSelect .SelectHealth").click(function(event) {
    // 다른 열려 있는 셀렉트 박스들을 닫음
    $(".select-itemsHealth").toggleClass("select-show");
  });
  // 문서의 어느 곳을 클릭하든 셀렉트 박스가 닫히지 않도록 설정
  $(document).on("click", function(event) {
    if (!$(event.target).closest("#customSelect").length) {
//       $(".select-itemsHealth").removeClass("select-show");
    }
  });
});

$(document).ready(function(){ //식단 카테고리 버튼
	  // 셀렉트 박스를 클릭했을 때 이벤트 처리
	  $("#customSelect .SelectFood").click(function(event) {
	    // 다른 열려 있는 셀렉트 박스들을 닫음
	    $(".select-itemsFood").toggleClass("select-show");
	  });
	  // 문서의 어느 곳을 클릭하든 셀렉트 박스가 닫히지 않도록 설정
	  $(document).on("click", function(event) {
	    if (!$(event.target).closest("#customSelect").length) {
	    }
	  });
	});
$(document).ready(function(){ //질병 카테고리 버튼
	  // 셀렉트 박스를 클릭했을 때 이벤트 처리
	  $("#customSelect .SelectDisease").click(function(event) {
	    // 다른 열려 있는 셀렉트 박스들을 닫음
	    $(".select-itemsDisease").toggleClass("select-show");
	  });
	  // 문서의 어느 곳을 클릭하든 셀렉트 박스가 닫히지 않도록 설정
	  $(document).on("click", function(event) {
	    if (!$(event.target).closest("#customSelect").length) {
	    }
	  });
	});
</script>
</div><!-- <div id="Category"> -->

<div id="main">
<div id="top">
	<div id="Search">
	<img alt="" src="${cp}/resources/img/Magnifier.png">
	<input placeholder="Event, Place or type">
	</div>
	<div>
	<c:choose>
    <c:when test="${empty login}">
<!--         <p>비회원</p> -->
			<a href="${cp}/page/login">
        	<div id="signupBox"> SIGN UP	</div>
			</a>
    </c:when>
    <c:otherwise>
<%--         <p>${login}</p> --%>
<!--         마이페이지(로그인 시 노출)</a> -->
	<div id="user">	
    <a href="${cp}/page/logout" class="out">SIGNOUT</a>
	<img class="icon" alt="bell" src="${cp}/resources/img/bell.png"> 
	<a href="${cp}/page/mainWeb">
	<div class="box">
	${login}
	<img class="Profile"  alt="사용자 프로필" src="${cp}/resources/img/profile.jpg">
	</div>
	</a>
	</div>
    </c:otherwise>
</c:choose>
	</div>
</div><!-- 	<div id="top"> -->
<!-- 여기에서 작업하세요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<div id="title">Trending categries</div>
	<div id="buttonZONE">
		<a>운동</a>
		<a>게시판</a>
		<a>고객지원</a>
	</div>
	<div class="Banner">
	<a class="title">웨이트 트레이닝 순서, 근력운동 순서는?</a>
	<a class="text">by hanClass</a>
	</div>
	<div id="optionTitle">
	<div class="choiceTitle">리스트로 보기</div>
	<div class="choiceTitleGray">영상으로 보기</div>
	</div>
	<div id="midAlign">
	<div id="listBox">
	<div class="list">
		<div class="top">
			<a class="subtext"> 18, Thursday</a>
			<div class="subTextBox">Few tickets </div>
		</div>
		<div class="bottom">
			<a class="title">Memory day of Boris Ryzhiy  </a>
			Octover 18, Thursday
		</div>  
	</div>
	<div class="list">
			<div class="top">
			<a class="subtext"> 18, Thursday</a>
			<div class="subTextBox">Few tickets </div>
		</div>
		<div class="bottom">
			<a class="title">Memory day of Boris Ryzhiy  </a>
			Octover 18, Thursday
		</div>  
	</div>
	<div class="list">
			<div class="top">
			<a class="subtext"> 18, Thursday</a>
			<div class="subTextBox">Few tickets </div>
		</div>
		<div class="bottom">
			<a class="title">Memory day of Boris Ryzhiy  </a>
			Octover 18, Thursday
		</div>  
	</div>
	<div class="list">
			<div class="top">
			<a class="subtext"> 18, Thursday</a>
			<div class="subTextBox">Few tickets </div>
		</div>
		<div class="bottom">
			<a class="title">Memory day of Boris Ryzhiy  </a>
			Octover 18, Thursday
		</div>  
	</div>
	<div class="list">
			<div class="top">
			<a class="subtext"> 18, Thursday</a>
			<div class="subTextBox">Few tickets </div>
		</div>
		<div class="bottom">
			<a class="title">Memory day of Boris Ryzhiy  </a>
			Octover 18, Thursday
		</div>  
	</div>
	<div class="list">
			<div class="top">
			<a class="subtext"> 18, Thursday</a>
			<div class="subTextBox">Few tickets </div>
		</div>
		<div class="bottom">
			<a class="title">Memory day of Boris Ryzhiy  </a>
			Octover 18, Thursday
		</div>  
	</div>
	</div>
		<div id="rankingBox">
		<div class="realTime">ddddddd</div>
		</div>
	</div>
</div><!-- <div id="main"> -->
</div><!-- <div id="warp"> -->
</body>
</html>
