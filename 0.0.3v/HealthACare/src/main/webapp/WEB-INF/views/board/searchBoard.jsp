<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<%@ page errorPage="/spring/resources/error404.html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png"
	type="image/png">
<!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css">
<!-- 기본 CSS -->
<link rel="stylesheet" href="${cp}/resources/noticeBoard.css">
<link rel="stylesheet" href="${cp}/resources/list.css">
<link rel="stylesheet" href="${cp}/resources/signCommon.css">
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>
			<!-- 			내가 한 거 -->
			<form id="searchForm" action="${cp}/board/searchBoard" method="get">
				<input type="hidden" name="currentPage" value="1"> <select
					class="box_a1" id="I_birthDate_m" name="searchInfo">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="titleOrContent">제목+내용</option>
					<option value="writer">글쓴이</option>
				</select> <input type="text" name="word" class="noticeBoardSearchInput">
				<input type="submit" value="검색" class="noticeBoardSearchBtn">
			</form>
			<div>
				<div class="boardTotalWrap">
					<h4 class="boardTotal">검색결과</h4>
					<span class="boardTotalCount">${searchTotal}건</span>
				</div>
				<div class="titleLineK"></div>
				<div class="noticeWrap">
					<c:forEach var="list" items="${noticeList}">
						<c:if test="${list.b_category eq '공지사항'}">
							<div class="noticeBox">
								<div class="noticeHead">공지</div>

								<div class="noticeBody">
									<a href="${cp}/board/readBoard?B_no=${list.b_no}">
										${list.b_title} </a>
								</div>

								<!-- 								<div class="listContentFlex"> -->
								<%-- 									<div class="listNumber">${list.b_no}</div> --%>
								<%-- 									<div class="title">${list.b_title}</div> --%>
								<!-- 								</div> -->
							</div>
						</c:if>
					</c:forEach>
				</div>
				<c:forEach var="list" items="${search}">
					<c:choose>
						<c:when
							test="${list.b_category eq '일반' || list.b_category eq '질문' }">
							<div class="boardList">
								<a href="${cp}/board/readBoard?B_no=${list.b_no}">
									<div class="listContentGrid">
										<div class="listContentFlex">
											<div class="listNumber">${list.b_no}</div>
											<div class="title">${list.b_title}</div>
										</div>
										<div class="listContentEnd">
											<div class="listWriter">${list.i_name}</div>
											<div class="listCategory">${list.b_category}</div>
											<div class="listContentIconWrap">
												<img src="${cp}/resources/img/comment.svg">
												<div class="listReplyCount">${list.b_replyCount}</div>
											</div>
											<div class="listContentIconWrap">
												<img src="${cp}/resources/img/eye.svg">
												<div class="listReplyCount">${list.b_hit}</div>
											</div>
										</div>
									</div>
								</a>
							</div>
						</c:when>
						<c:when test="${list.b_category eq '공지사항' }">
							<div class="boardList">
								<div class="flexK">
									<div class="listNumber">공지사항</div>
									<div class="listContent">
										<a href="${cp}/board/readBoard?B_no=${list.b_no}">
											${list.b_title} </a>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<div class="titleBottomLineK"></div>
				<!-- 				페이징 블럭 -->
				<div class="pagingBlock">
					<div class="arrowBoxFirst">
						<%-- 						<img id="leftDoubleArrow" src="${cp}/resources/img/leftdoublearrow.png" alt="왼쪽 연속 화살표" class="arrowBigImage"> --%>
						${searchPaging.goToFirstPage()}
					</div>
					<div class="arrowBoxPrev">
						<%-- 						<img id="leftArrow" src="${cp}/resources/img/leftarrow.png" alt="왼쪽 화살표" class="arrowSmallImage"> --%>
						${searchPaging.getPrevPageButton()}
					</div>
					<div class="pageBox">${searchPaging.getHtmlPageList()}</div>
					<div class="arrowBoxNext">
						${searchPaging.getNextPageButton()}
						<%-- 						<img id="rightArrow" src="${cp}/resources/img/rightarrow.png" alt="오른쪽 화살표" class="arrowSmallImage"> --%>
					</div>
					<div class="arrowBoxLast">
						${searchPaging.goToLastPage()}
						<%-- 						<img id="rightDoubleArrow" src="${cp}/resources/img/rightdoublearrow.png" alt="오른쪽 연속 화살표" class="arrowBigImage"> --%>
					</div>
				</div>

				<!-- 				<div class="pagingBlock"> -->
				<!-- 					처음으로 -->
				<%-- 					<div class="arrowBoxFirst">${paging.goToFirstPage()}</div> --%>
				<!-- 					이전 페이지로 -->
				<%-- 					<div class="arrowBoxPrev">${paging.getPrevPageButton()}</div> --%>
				<%-- 					<div class="pageBox">${paging.getHtmlPageList()}</div> --%>
				<!-- 					다음 페이지로 -->
				<%-- 					<div class="arrowBoxNext">${paging.getNextPageButton()}</div> --%>
				<!-- 					맨끝으로 -->
				<%-- 					<div class="arrowBoxLast">${paging.goToLastPage()}</div> --%>
				<!-- 				</div> -->
			</div>
			<!-- 			내가 한 거 끝남 -->
			<%-- 			<form id="searchForm" action="${cp}/board/searchBoard" method="get"> --%>
			<!-- 			    <input type="hidden" name="currentPage" value="1"> -->
			<!-- 			    <input type="text" name="word"> -->
			<!-- 			    <select id="I_birthDate_m" name="searchInfo"> -->
			<!-- 			        <option value="title">제목</option> -->
			<!-- 			        <option value="content">내용</option> -->
			<!-- 			        <option value="titleOrContent">제목+내용</option> -->
			<!-- 			        <option value="writer">글쓴이</option> -->
			<!-- 			    </select> -->
			<!-- 			    <input type="submit" value="검색"> -->
			<!-- 			</form> -->

		</div>
		<!-- 	<div id="top"> -->
	</div>
	<script>
		writeBtn.addEventListener('click', function() {
			window.location.href = '${cp}/board/writeBoard';
		});

		document.addEventListener('DOMContentLoaded', function() {
			document.getElementById("searchForm").onsubmit = function() {
				var word = document.getElementsByName("word")[0].value.trim();
				var searchInfo = document.getElementById("searchInfo").value;

				// 검색어가 2글자 이상인지 확인하고 공백이 아닌지 검사
				if (word.length < 2 || /\s/.test(word)) {
					alert("검색어는 2글자 이상이어야 하며, 공백을 포함해서는 안됩니다.");
					return false; // 검색 취소
				}
				return true; // 검색 진행
			};
		});
	</script>
</body>
</html>