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
  <div class="select-selected">옵션1</div>
  <div class="select-items">
    <div>옵션 1</div>
    <div>옵션 2</div>
    <div>옵션 3</div>
  </div>
</div>
</div><!-- <div id="Category"> -->
	<div id="main">
	<div id="top">
	<P>서버 열린시간: ${serverTime}.</P>
	</div><!-- 	<div id="top"> -->
	<h1></h1>
	<pre>
<a href="${cp}/sign/signIn">로그인</a>
<a href="${cp}/page/mainWeb">마이페이지(로그인 시 노출)</a>
</pre>
<div class="dropdown">
  <button class="dropbtn">Dropdown</button>
  <div class="dropdown-content1">
  <a href="#">Link 1</a>
  <a href="#">Link 2</a>
  <a href="#">Link 3</a>
  </div>
</div>
<script>
$(document).ready(function(){
  // 셀렉트 박스를 클릭했을 때 이벤트 처리
  $("#customSelect .select-selected").click(function(event) {
//     event.stopPropagation(); // 이벤트 전파 방지
    
    // 다른 열려 있는 셀렉트 박스들을 닫음
    $(".select-items").toggleClass("select-show");
  });
  
  $("#customSelect .select-selected").hover(function(event) {
//    event.stopPropagation(); // 이벤트 전파 방지
   
   // 다른 열려 있는 셀렉트 박스들을 닫음
   $(".select-items").toggleClass("select-show");
 });
  
//옵션을 선택했을 때 이벤트 처리
  $("#customSelect .select-items").on("click", "div", function() {
    var selectedOption = $(this).text(); // 선택한 옵션의 텍스트

    // 선택한 옵션을 선택된 옵션으로 표시
    $(this).parent().siblings(".select-selected").text(selectedOption);

    // 셀렉트 박스 닫기
    $(this).parent().removeClass("select-show");
  });
});
</script>
</div><!-- <div id="main"> -->
</div><!-- <div id="warp"> -->
</body>
</html>
