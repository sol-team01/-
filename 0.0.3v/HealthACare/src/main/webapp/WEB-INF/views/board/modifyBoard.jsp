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
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css"><!-- 기본 CSS -->
<link rel="stylesheet" href="${cp}/resources/list.css">
<link rel="stylesheet" href="${cp}/resources/signCommon.css">
<link rel="stylesheet" href="${cp}/resources/noticeBoard.css">
<link rel="stylesheet" href="${cp}/resources/writeBoard.css">
<!-- 부트 스트랩 css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<script src="${cp}/resources/js/toolBox.js"></script>
<style>
/* .note-icon-caret::after { */
/* 	display: none !important; */
/* } */

.note-icon-caret::before {
	content: "";
	display: none !important;
}
</style>
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>
			<!-- 			내가 한 거 -->

			<script src="${cp}/resources/summernote/summernote-lite.js"></script>
			<script src="${cp}/resources/summernote/lang/summernote-ko-KR.js"></script>
			<link rel="stylesheet"
				href="${cp}/resources/summernote/summernote-lite.css">
			<div class="test">
				<div class="container">
					<div class="test1">
						<img src="${cp}/resources/img/noticeboardicon.svg">
						<h3>
							게시글 수정합니다.<br> 원하는 부분을 수정하고자 할 때 자유롭게 내용을 변경해주세요. 감사합니다!
						</h3>
					</div>
					<div class="mb-3 d-flex">
						<form method="post" enctype="multipart/form-data" class="testForm">
							<!-- 카테고리-->
							<div class="mt-2 mb-3 d-flex gap-2 justify-content-end">
								<!-- 제목-->
								<input type="text" name="B_title" class="formControl"
									id="B_title" placeholder="제목" value="${read.b_title}">
								<div class="labelFlexK">
									<label for="category">분류: </label> <select id="B_category"
										name="B_category" class="sort">
										<option value="일반">일반</option>
										<option value="공지사항">공지사항</option>
										<option value="질문">질문</option>
									</select>
								</div>
							</div>
							<!-- 					</div> -->
							<!-- 썸머노트 에디터 -->
							<textarea id="summernote" name="content" rows="5" cols="40"
								id="content" required>${read.b_text}</textarea>

							<div class="mt-4 d-flex gap-3 justify-content-end">
								<!-- 								<input type="submit" value="수정하기" class="writeBoardBtnK" id="btnSubmit">							 -->
								<button class="writeBoardBtnK" id="fix">수정하기</button>
								<button class="writeBoardBtnKBorder" id="fixBack">뒤로가기</button>
							</div>
						</form>
					</div>
					<script>
						$("#summernote").summernote('code', '${read.b_text}');
					</script>
					<input type="hidden" value="${read.b_no}" id="B_no">

					<%-- 				<form action="${cp}/board/modify" method="post">
					<input type="hidden" id="id" name="B_name" value="${user.i_name}">
					
					<label for="title">제목: </label>
					<input type="text" width="400px" name="B_title" value="${read.b_title}" required>
					<label for="category">분류: </label>
					<select id="category" name="B_category">
						<option value="공지사항">공지사항</option>
						<option value="일반">일반</option>
						<option value="질문">질문</option>
					</select>
					<br>
					<br>
					<label for="content">내용: </label>
					<textarea rows="5" cols="40" id="content" name="B_text" required>${read.b_text}</textarea>
					<input type="submit" value="수정하기">
				</form> --%>
				</div>
			</div>
			<!-- 			내가 한 거 끝남 -->
		</div>
	</div>
</body>
</html>