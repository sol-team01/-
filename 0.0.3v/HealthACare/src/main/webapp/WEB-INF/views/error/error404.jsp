<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/NullMemberCommon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/loginCommon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/error404.css">
<style>
</style>
</head>
<body>
	<div id="warp">
		<div id="Category">
			<img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="로고" class="image">
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
					<div>
						<a href="${cp}/food/list">식품 영양 정보</a>
					</div>
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

		<div id="main">
			<div id="top">
				<div id="Search">
					<img alt="" src="${pageContext.request.contextPath}/resources/img/Magnifier.png"> <input
						placeholder="Event, Place or type">
				</div>
				<div>
					<c:choose>
						<c:when test="${empty login}">
							<!--         <p>비회원</p> -->
							<a href="${pageContext.request.contextPath}/page/login">
								<div id="signupBox">SIGN UP</div>
							</a>
						</c:when>
						<c:otherwise>
							<%--         <p>${login}</p> --%>
							<!--         마이페이지(로그인 시 노출)</a> -->
							<div id="user">
								<a href="${pageContext.request.contextPath}/page/logout" class="out">SIGNOUT</a> <img
									class="icon" alt="bell" src="${cp}/resources/img/bell.png">
								<a href="${pageContext.request.contextPath}/page/mainWeb">
									<div class="box">
										${login} <img class="Profile" alt="사용자 프로필"
											src="${pageContext.request.contextPath}/resources/img/profile.jpg">
									</div>
								</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- 	<div id="top"> -->
			<div class="errorWrap">
				<div class="error404">
					<h3 class="title404">404</h3>
					<h4 class="notFound">페이지를 찾을 수 없음!</h4>
					<p class="notFoundContent">죄송합니다. 블로그에 찾고 계신 페이지가 없습니다</p>
					<p class="notFoundContentLast">수정, 이동 또는 삭제되었을 수 있습니다.</p>
					<button id="signUPBt"><a href="${pageContext.request.contextPath}/"></a>홈으로 돌아가기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- <div id="main"> -->
	</div>
	<!-- <div id="warp"> -->
</body>
</html>
