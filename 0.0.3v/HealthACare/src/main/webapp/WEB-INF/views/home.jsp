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
<<<<<<< HEAD
</div><!-- <div id="Category"> -->

<div id="main">
<div id="top">
<input placeholder="Event, Place or type">
<div id="user">
Moscow
<img class="icon" alt="bell" src="${cp}/resources/img/bell.png"> 
<div class="Profile">
<img  alt="사용자 프로필" src="${cp}/resources/img/profile.jpg">
</div> 
</div>
</div><!-- 	<div id="top"> -->

<pre>
	<P>서버 열린시간: ${serverTime}.</P>
<c:choose>
    <c:when test="${empty login}">
        <p>비회원</p>
        <a href="${cp}/page/login">로그인</a>
    </c:when>
    <c:otherwise>
        <p>${login}</p>
        <a href="${cp}/page/logout">로그아웃</a>
        <a href="${cp}/page/mainWeb">마이페이지(로그인 시 노출)</a>
    </c:otherwise>
</c:choose>
</pre>
<script>
=======
	<script>
>>>>>>> 4187689f069cb607fd38bfd40bbc5ab2f02e58c6
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
<!-- ★TODO★ :: 로그인 if 문 추가하여 구분 하여야 함(최) -->
	<input placeholder="Event, Place or type">
	<div>
<!-- 	<div id="user"> -->
<!-- 	Moscow -->
<%-- 	<img class="icon" alt="bell" src="${cp}/resources/img/bell.png">  --%>
<%-- 	<img class="Profile"  alt="사용자 프로필" src="${cp}/resources/img/profile.jpg"> --%>
<!-- 	</div> -->
	<div id="signupBox">
	SIGN UP
	</div>
	</div>
<!-- ★TODO★ ::  로그인 상태에 따라 변화 되도록 추가로 짜야함(최)-->
<!-- <pre> -->
<%-- 서버 열린시간: ${serverTime} --%>
<%-- <a href="${cp}/page/login">로그인</a> --%>

<%-- ${login} --%>
<%-- <a href="${cp}/page/logout">로그아웃</a> --%>
<%-- <a href="${cp}/page/mainWeb">마이페이지(로그인 시 노출)</a> --%>
<!-- </pre> -->
</div><!-- 	<div id="top"> -->

</div><!-- <div id="main"> -->
</div><!-- <div id="warp"> -->
</body>
</html>
