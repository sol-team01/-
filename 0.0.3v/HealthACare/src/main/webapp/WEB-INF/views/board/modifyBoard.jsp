<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="${cp}/resources/writeBoard.css">
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
				<h1>게시글 작성</h1>
				
				<form action="${cp}/board/modify" method="post">
					<input type="hidden" id="id" name="b_ID" value="${bId}">
					<input type="hidden" id="no" name="b_NO" value="${read.b_NO}">
					<label for="title">제목: </label>
					<input type="text" width="400px" name="b_TITLE" value="${read.b_TITLE}" required>
					<label for="category">분류: </label>
					<select id="category" name="B_CATEGORY">
						<option value="공지사항">공지사항</option>
						<option value="일반">일반</option>
						<option value="질문">질문</option>
						<option value="답변">답변</option>
					</select>
					<br>
					<br>
					<label for="content">내용: </label>
					<textarea rows="5" cols="40" id="content" name="b_TEXT" required>${read.b_TEXT}</textarea>
					<textarea rows="5" cols="40" id="content" name="b_TEXT"  required>${read.b_TEXT}</textarea>
					<input type="submit" value="수정하기">
				</form>
			</div>
			<!-- 			내가 한 거 끝남 -->
		</div>
		<!-- 	<div id="top"> -->
	</div>
</body>
</html>