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
<link rel="stylesheet" href="${cp}/resources/writeBoard.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
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


<script src="${cp}/resources/js/writeBoard.js"></script>
<link rel="stylesheet" href="${cp}/resources/list.css">
<link rel="stylesheet" href="${cp}/resources/signCommon.css">
<link rel="stylesheet" href="${cp}/resources/noticeBoard.css">
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>
			<script
				src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
			<div class="test">

				<div class="container">
					<div class="test1">
						<img src="${cp}/resources/img/noticeboardicon.svg">
						<h3>
							여러분의 이야기를 기다립니다! <br> 이 공간은 소통과 공유의 장이니, 자유롭게 의견을 표현해 주세요.
						</h3>
					</div>
					<div class="mb-3 d-flex gap-2">
						<input type="text" name="B_title" class="form-control"
							id="B_title" placeholder="제목">
						<div class="labelFlexK">
							<label for="category">분류: </label> <select id="B_category"
								name="B_category" class="sort">
								<option value="공지사항">공지사항</option>
								<option value="일반">일반</option>
								<option value="질문">질문</option>
							</select>
						</div>
					</div>

					<div id="summernote"></div>
					<div class="mt-4 d-flex gap-3 justify-content-end">
						<button class="writeBoardBtnK" id="btnSubmit">저장</button>
						<button class="writeBoardBtnKBorder">뒤로가기</button>
					</div>
				</div>
			</div>
<!-- 			<div>이 게시판에 글을 작성해주셔서 감사합니다. 여러분의 의견과 생각을 자유롭게 나누어주세요. 함께 소통하며 -->
<!-- 				유익한 정보를 공유하는 공간이 되길 바랍니다. 감사합니다!"</div> -->

		</div>
	</div>
	<script>
		$('#summernote').summernote(
				{
					placeholder : '내용을 입력해주세요',
					tabsize : 2,
					height : 478,
					toolbar : [ [ 'style', [ 'style' ] ],
							[ 'font', [ 'bold', 'underline', 'clear' ] ],
							[ 'color', [ 'color' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'table', [ 'table' ] ],
							[ 'insert', [ 'link', 'picture', 'video' ] ],
							[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
				});
	</script>
</body>

</html>