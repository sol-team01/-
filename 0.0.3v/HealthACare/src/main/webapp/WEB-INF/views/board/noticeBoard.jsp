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
<jsp:include page="/WEB-INF/views/board/homeDesign/category.jsp"></jsp:include>
		<!--  -->
		<div id="main">
<jsp:include page="/WEB-INF/views/board/homeDesign/homeTop.jsp"></jsp:include>
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
				<c:forEach var="list" items="${list}">
					<div class="boardList">
						<div class="flexK">
							<div class="listNumber">${list.b_NO}</div>
							<div class="listContent">
								<a href="${cp}/board/readBoard?b_NO=${list.b_NO}">
									${list.b_TITLE}
								</a>
							</div>
							<div class="listWriter">${list.b_ID}</div>
						</div>
					</div>
				</c:forEach>
				<div class="titleBottomLineK"></div>
				<!-- 				페이징 블럭 -->
				<div class="pagingBlock">
					<div class="arrowBox">
<%-- 						<img id="leftDoubleArrow" src="${cp}/resources/img/leftdoublearrow.png" alt="왼쪽 연속 화살표" class="arrowBigImage"> --%>
						${paging.goToFirstPage()}
					</div>
					<div class="arrowBox">
<%-- 						<img id="leftArrow" src="${cp}/resources/img/leftarrow.png" alt="왼쪽 화살표" class="arrowSmallImage"> --%>
						${paging.getPrevPageButton()}
					</div>
					<div class="pageBox">
						 ${paging.getHtmlPageList()}
					</div>
					<div class="arrowBox">
						${paging.getNextPageButton()}
<%-- 						<img id="rightArrow" src="${cp}/resources/img/rightarrow.png" alt="오른쪽 화살표" class="arrowSmallImage"> --%>
					</div>
					<div class="arrowBox">
						${paging.goToLastPage()}
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
			
		</div>
	</div>
	<script>
		writeBtn.addEventListener('click', function() {
			window.location.href = '${cp}/board/writeBoard';
		});
	</script>
</body>
</html>