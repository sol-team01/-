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
<link rel="stylesheet" href="${cp}/resources/common.css"><!-- 기본 CSS -->
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
							<h4 class="boardTotal">전체</h4>
							<span class="boardTotalCount">${totalContent}건</span>
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
				<div class="noticeWrap">
					<c:forEach var="list" items="${noticeList}">
						<c:if test="${list.b_category eq '공지사항'}">
							<div class="noticeBox">
								<div class="listContentGrid">
									<div class="listContentFlex">
										<div class="noticeHead">공지</div>
										<div class="noticeBody">
											<a href="${cp}/board/readBoard?B_no=${list.b_no}">
												${list.b_title} </a>
										</div>
									</div>
									<div></div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div id="ttt">
					<c:forEach var="list" items="${list}">
						<c:choose>
							<c:when test="${list.b_category eq '일반'}">
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
							<c:when test="${list.b_category eq '질문'}">
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
					<div class="arrowBoxFirst">${paging.goToFirstPage()}</div>
					<!-- 이전 페이지로 -->
					<div class="arrowBoxPrev">${paging.getPrevPageButton()}</div>
					<div class="pageBox">${paging.getHtmlPageList()}</div>
					<!-- 다음 페이지로 -->
					<div class="arrowBoxNext">${paging.getNextPageButton()}</div>
					<!-- 맨끝으로 -->
					<div class="arrowBoxLast">${paging.goToLastPage()}</div>
				</div>
			</div>
			<!-- 			내가 한 거 끝남 -->
		</div>
	</div>
	<script>
		writeBtnK.addEventListener('click', function() {
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

		// JSP 코드를 사용하여 JavaScript 변수에 현재 페이지 값 할당
		var currentPage = 1;

		$(document).ready(function() {
							console.log("문서가 준비되었습니다.");
							$('#sort').change(function() {
										$('#ttt').load('/board/noticeBoard #ttt');
										var sortValue = $(this).val(); // 선택한 정렬 순서
										console.log(sortValue);
										// 현재 페이지 변수를 사용하여 AJAX 요청 전달
										$.ajax({
													type : 'GET',
													url : '/board/noticeBoard',
													data : {
														sort : sortValue, // 선택한 정렬 순서를 매개변수로 전달
														currentPage : currentPage
													// 현재 페이지 정보를 함께 전달
													},
													success : function(
															data) {
														// Ajax 요청으로 받은 응답을 사용하여 페이지 일부 업데이트
														// 예를 들어, 게시글 목록을 업데이트하는 등의 작업 수행
														// data 변수에는 서버에서 전달한 HTML 또는 JSON 데이터가 포함됩니다.
														// 아래는 간단한 예시
														var newData = $(data).find('#ttt').html();
														$('#ttt').html(newData);
													},
													error : function(
															xhr,
															status,
															error) {
														console.log('AJAX 요청 실패');
													}
												});
											});

							var savedSort = getCookie("sort");
							if (savedSort) {
								$('#sort').val(savedSort);
							}

							$('#sort').change(function() {
								var sortValue = $(this).val();
								setCookie("sort", sortValue, 30); // 쿠키 유효기간을 30일로 설정
							});

							function setCookie(cname, cvalue, exdays) {
								var d = new Date();
								d.setTime(d.getTime()
										+ (exdays * 24 * 60 * 60 * 1000));
								var expires = "expires=" + d.toUTCString();
								document.cookie = cname + "=" + cvalue + ";"
										+ expires + ";path=/";
							}

							function getCookie(cname) {
								var name = cname + "=";
								var decodedCookie = decodeURIComponent(document.cookie);
								var ca = decodedCookie.split(';');
								for (var i = 0; i < ca.length; i++) {
									var c = ca[i];
									while (c.charAt(0) == ' ') {
										c = c.substring(1);
									}
									if (c.indexOf(name) == 0) {
										return c.substring(name.length,
												c.length);
									}
								}
								return "";
							}
						});
	</script>
</body>
</html>