<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<%@ page errorPage="/spring/resources/error404.html" %>
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
<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
<div id="main">
<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>		
			<!-- 			내가 한 거 -->
			<div>
				<div class="boardTotalWrap">
					<h4 class="boardTotal">검색결과</h4>
					<span class="boardTotalCount">${searchTotal}건</span>
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
				<c:forEach var="list" items="${search}">
					<div class="boardList">
						<div class="flexK">
							<div class="listNumber">${list.b_NO}</div>
							<div class="listContent">
								<a href="${cp}/board/readBoard?b_NO=${list.b_NO}">
									${list.b_TITLE}
								</a>
							</div>
							<div class="listWriter">${list.b_ID}</div>
							<div class="listCategory">${list.b_CATEGORY}</div>
						</div>
					</div>
				</c:forEach>
				<div class="titleBottomLineK"></div>
				<!-- 				페이징 블럭 -->
				<div class="pagingBlock">
					<div class="arrowBox">
<%-- 						<img id="leftDoubleArrow" src="${cp}/resources/img/leftdoublearrow.png" alt="왼쪽 연속 화살표" class="arrowBigImage"> --%>
						${searchPaging.goToFirstPage()}
					</div>
					<div class="arrowBox">
<%-- 						<img id="leftArrow" src="${cp}/resources/img/leftarrow.png" alt="왼쪽 화살표" class="arrowSmallImage"> --%>
						${searchPaging.getPrevPageButton()}
					</div>
					<div class="pageBox">
						 ${searchPaging.getHtmlPageList()}
					</div>
					<div class="arrowBox">
						${searchPaging.getNextPageButton()}
<%-- 						<img id="rightArrow" src="${cp}/resources/img/rightarrow.png" alt="오른쪽 화살표" class="arrowSmallImage"> --%>
					</div>
					<div class="arrowBox">
						${searchPaging.goToLastPage()}
<%-- 						<img id="rightDoubleArrow" src="${cp}/resources/img/rightdoublearrow.png" alt="오른쪽 연속 화살표" class="arrowBigImage"> --%>
					</div>
				</div>
			</div>
			<!-- 			내가 한 거 끝남 -->
			<c:choose>
				<c:when test="${empty login}">
				</c:when>
				<c:otherwise>
					<button type="button" id="writeBtn">글쓰기</button>
				</c:otherwise>
			</c:choose>
			<form id="searchForm" action="${cp}/board/searchBoard" method="get">
			    <input type="hidden" name="currentPage" value="1">
			    <input type="text" name="word">
			    <select id="searchInfo" name="searchInfo">
			        <option value="title">제목</option>
			        <option value="content">내용</option>
			        <option value="titleOrContent">제목+내용</option>
			        <option value="writer">글쓴이</option>
			    </select>
			    <input type="submit" value="검색">
			</form>
		</div>
		<!-- 	<div id="top"> -->
	</div>
	<script>
		writeBtn.addEventListener('click', function() {
			window.location.href = '${cp}/board/writeBoard';
		});
	</script>
</body>
</html>