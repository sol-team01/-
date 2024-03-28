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
<link rel="stylesheet" href="${cp}/resources/menu.css">
</head>
<body>
<!-----------------------------------------------------------------
0.0.0v - 팀프로젝트 시작
0.0.1v - 기본 jsp, 로그인 백엔드, api 연결
0.0.2v - 상세 jsp css, 로그인 구현
------------------------------------------------------------------->
	<h1></h1>
	<P>서버 열린시간: ${serverTime}.</P>
	<nav class="top-nav">
		<ul>
			<li class="dropdownA"><a href="${cp}/NullMember/BbsFood">식단</a>
				<div class="dropdown-content">
					<!-- 드롭다운 메뉴 항목 -->
					<a href="#">칼로리</a>
					<a href="#">식품 정보</a>
					<a href="#">추천 식단</a>
				</div></li>
			<li class="dropdownB"><a href="${cp}/NullMember/BbsDisease">질병</a>
				<div class="dropdown-content">
					<!-- 드롭다운 메뉴 항목 -->
					<a href="#">서브 메뉴 1</a>
					<a href="#">서브 메뉴 2</a>
					<a href="#">서브 메뉴 3</a>
				</div></li>
			<li class="dropdown3"><a href="${cp}/NullMember/BbsHealth">운동</a>
				<div class="dropdown-content">
					<!-- 드롭다운 메뉴 항목 -->
					<a href="#">서브 메뉴 1</a>
					<a href="#">서브 메뉴 2</a>
					<a href="#">서브 메뉴 3</a>
				</div></li>
			<li class="dropdown4"><a href="${cp}/NullMember/BbsCustomer">고객지원</a>
				<div class="dropdown-content">
					<!-- 드롭다운 메뉴 항목 -->
					<a href="#">서브 메뉴 1</a>
					<a href="#">서브 메뉴 2</a>
					<a href="#">서브 메뉴 3</a>
				</div></li>
		</ul>
	</nav>
	<pre>
<a href="${cp}/sign/signIn">로그인</a>
<a href="${cp}/page/mainWeb">마이페이지(로그인 시 노출)</a>
<a href="${cp}/page/mainWeb">커뮤니티(추후에 li 리스트로 변경 건의)</a>
<a href="${cp}/page/mainWeb">공지사항</a>
<a href="${cp}/page/mainWeb">오운완</a>
<a href="${cp}/page/mainWeb">식단추천</a>
<a href="${cp}/page/mainWeb">운동추천</a>
</pre>

<div class="dropdown">
  <button class="dropbtn">Dropdown</button>
  <div class="dropdown-content1">
  <a href="#">Link 1</a>
  <a href="#">Link 2</a>
  <a href="#">Link 3</a>
  </div>
</div>

<div id="customSelect">
  <div class="select-selected">옵션1</div>
  <div class="select-items">
    <div>옵션 1</div>
    <div>옵션 2</div>
    <div>옵션 3</div>
  </div>
</div>
<script src="${cp}/resources/menu.js"></script>
</body>
</html>
