<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<link rel="stylesheet" href="${cp}/resources/noticeBoard.css">
</head>
<body>
	<div id="warp">
		<div id="Category">
			<img src="${cp}/resources/img/logo.png" alt="로고" class="image">
			<div id="customSelect">
				<div class="SelectHealth">운동</div>
				<div class="select-itemsHealth">
					<div>
						<a href="${cp}/page/login">운동 하는 방법</a>
					</div>
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
			<script>
				$(document).ready(function() { //운동 카테고리 버튼
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

				$(document).ready(function() { //식단 카테고리 버튼
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
				$(document).ready(function() { //질병 카테고리 버튼
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
		</div>
		<!-- <div id="Category"> -->
		<!--  -->
		<div id="main">
			<div id="top">
				<!-- ★TODO★ :: 로그인 if 문 추가하여 구분 하여야 함(최) -->
				<input placeholder="Event, Place or type">
				<div>
					<c:choose>
						<c:when test="${empty login}">
							<!--         <p>비회원</p> -->
							<a href="${cp}/page/login">
								<div id="signupBox">SIGN UP</div>
							</a>
						</c:when>
						<c:otherwise>
							<%--         <p>${login}</p> --%>
							<!--         마이페이지(로그인 시 노출)</a> -->
							<div id="user">
								<a href="${cp}/page/logout">로그아웃</a> <a
									href="${cp}/page/mainWeb">${login}</a> <img class="icon"
									alt="bell" src="${cp}/resources/img/bell.png"> <a
									href="${cp}/page/mainWeb"><img class="Profile"
									alt="사용자 프로필" src="${cp}/resources/img/profile.jpg"></a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- 			내가 한 거 -->
			<div>
				<div class="boardTotalWrap">
					<h4 class="boardTotal">전체</h4>
					<span class="boardTotalCount">7건</span>
				</div>
				<div class="titleLineK"></div>
				<div class="noticeWrap">
					<div class="noticeBox">
						<div class="noticeHead">공지</div>
						<div class="noticeBody">금융거래소 이용약관 개칭 안내</div>
					</div>
					<div class="noticeBox">
						<div class="noticeHead">공지</div>
						<div class="noticeBody"></div>
					</div>
					<div class="noticeBox">
						<div class="noticeHead">공지</div>
						<div class="noticeBody"></div>
					</div>
				</div>
				<div class="boardList">
					<div class="flexK">
						<div class="listNumber">7</div>
						<div class="listContent"></div>
					</div>
				</div>
				<div class="boardList">
					<div class="flexK">
						<div class="listNumber">6</div>
						<div class="listContent"></div>
					</div>
				</div>
				<div class="boardList">
					<div class="flexK">
						<div class="listNumber">5</div>
						<div class="listContent"></div>
					</div>
				</div>
				<div class="boardList">
					<div class="flexK">
						<div class="listNumber">4</div>
						<div class="listContent"></div>
					</div>
				</div>
				<div class="boardList">
					<div class="flexK">
						<div class="listNumber">3</div>
						<div class="listContent"></div>
					</div>
				</div>
				<div class="boardList">
					<div class="flexK">
						<div class="listNumber">2</div>
						<div class="listContent"></div>
					</div>
				</div>
				<div class="boardList">
					<div class="flexK">
						<div class="listNumber">1</div>
						<div class="listContent"></div>
					</div>
				</div>
				<div class="titleBottomLineK"></div>
				<!-- 				페이징 블럭 -->
				<div class="pagingBlock">
					<div class="arrowBox">
						<img src="${cp}/resources/img/leftdoublearrow.png" alt="왼쪽 연속 화살표"
							class="arrowBigImage">
					</div>
					<div class="arrowBox">
						<img src="${cp}/resources/img/leftarrow.png" alt="왼쪽 화살표"
							class="arrowSmallImage">
					</div>
					<div class="pageBox">1</div>
					<div class="arrowBox">
						<img src="${cp}/resources/img/rightarrow.png" alt="오른쪽 화살표"
							class="arrowSmallImage">
					</div>
					<div class="arrowBox">
						<img src="${cp}/resources/img/rightdoublearrow.png" alt="오른쪽 연속 화살표"
							class="arrowBigImage">
					</div>
				</div>
			</div>
			<!-- 			내가 한 거 끝남 -->
		</div>
		<!-- 	<div id="top"> -->

	</div>
</body>
</html>