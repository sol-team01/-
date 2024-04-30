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
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css"><!-- 기본 CSS --> -->
<link rel="stylesheet" href="${cp}/resources/list.css">
<link rel="stylesheet" href="${cp}/resources/signCommon.css">
<link rel="stylesheet" href="${cp}/resources/noticeBoard.css">
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>
			<form id="searchForm" action="${cp}/board/searchBoard" method="get">
				<input type="hidden" name="currentPage" value="1"> 
				<select class="box_a1" id="I_birthDate_m" name="searchInfo">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="titleOrContent">제목+내용</option>
					<option value="writer">글쓴이</option>
				</select> <input type="text" name="word" class="noticeBoardSearchInput">
				<input type="submit" value="검색" class="noticeBoardSearchBtn">
			</form>
			<!-- 내가 한 거 -->
			<div>
				<div class="boardTotalWrap">
					<div class="boardTotalWrapFlexWrap">
						<div class="boardTotalWrapFlex">
						</div>
						<div>
							<c:choose>
								<c:when test="${empty login}">
									<button type="button" id="writeBtnK" style="display: none">글쓰기</button>
								</c:when>
								<c:otherwise>
									<button type="button" id="writeBtnK">글쓰기</button>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="sortTableK">
					<label for="sort">정렬 순서:</label> <select id="sort" class="sort" name="sort">
						<option value="desc">최신순</option>
						<option value="asc">오래된순</option>
					</select>
				</div>
				<div class="listTemplate">
					<div class="listContentGrid">
						<div class="listContentFlex">
							<div>번호</div>
							<div>제목</div>
						</div>
						<div class="listContentEnd">
							<div>글쓴이</div>
							<div class="ml-20">카테고리</div>
							<div class="ml-20">댓글수</div>
							<div class="ml-20">조회수</div>
						</div>
					</div>
				</div>
				<div class="titleLineK"></div>
				<div id="ttt">
					<c:forEach var="list" items="${list}">
						<c:choose>
							<c:when test="${list.b_category eq '이벤트'}">
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
							
							<c:otherwise>

							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<div class="titleBottomLineK"></div>
				<!-- 				페이징 블럭 -->
				<div class="pagingBlock">
					<!-- 처음으로 -->
					<div class="arrowBoxFirst"></div>
					<!-- 이전 페이지로 -->
					<div class="arrowBoxPrev"></div>
					<div class="pageBox"></div>
					<!-- 다음 페이지로 -->
					<div class="arrowBoxNext"></div>
					<!-- 맨끝으로 -->
					<div class="arrowBoxLast"></div>
				</div>
			</div>
			<!-- 			내가 한 거 끝남 -->
		</div>
	</div>
</body>
</html>