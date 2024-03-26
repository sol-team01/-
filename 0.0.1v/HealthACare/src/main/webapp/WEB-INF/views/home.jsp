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
</head>
<body>
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
<a href="${cp}/page/mainWeb">로그인</a>
<a href="${cp}/page/mainWeb">마이페이지(로그인 시 노출)</a>
<a href="${cp}/page/mainWeb">커뮤니티(추후에 li 리스트로 변경 건의)</a>
<a href="${cp}/page/mainWeb">공지사항</a>
<a href="${cp}/page/mainWeb">오운완</a>
<a href="${cp}/page/mainWeb">식단추천</a>
<a href="${cp}/page/mainWeb">운동추천</a>
</pre>
</body>
</html>
