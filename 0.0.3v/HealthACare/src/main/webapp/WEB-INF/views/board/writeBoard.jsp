<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<link rel="stylesheet" href="${cp}/resources/writeBoard.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<!-- 부트 스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


<script src="${cp}/resources/js/writeBoard.js"></script>
</head>
<body>
<div id="warp">
<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
<div id="main">
<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>			
			<!-- 			내가 한 거 -->
			

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<div class = "container">
<div class="mb-2 d-flex gap-2">
<input type="text" name="B_title" class="form-control" id = "B_title" placeholder="제목">

					<label for="category">분류: </label>
					<select id ="B_category" name="B_category">
						<option value="공지사항">공지사항</option>
						<option value="일반">일반</option>
						<option value="질문">질문</option>
					</select>
</div>
				    
		<div id="summernote"></div>
			<div	class ="mt-2 d-flex gap-2 justify-content-end">
				<button class="btn btn-primary" id="btnSubmit">저장</button>
				<button class="btn btn-secondary">뒤로가기</button>
			</div>
		</div>

			
<%-- 			<div>
				<h1>게시글 작성</h1>
				<form action="${cp}/board/write" method="post">
					<input type="hidden" id="id" name="b_ID" value="${user.i_name}">
					<input type="hidden" id="no" name="u_NO" value="${user.u_no}">
					<label for="title">제목: </label>
					<input type="text" width="400px" name="b_TITLE" required>
					<br>
					<br>
					<label for="content">내용: </label>
					<textarea rows="5" cols="40" id="content" name="b_TEXT" required></textarea>
					<input type="submit" value="작성하기">
				</form>
			</div> --%>
			<!-- 			내가 한 거 끝남 -->
		</div>
		<!-- 	<div id="top"> -->
	</div>
	    <script>
      $('#summernote').summernote({
        placeholder: ' 입력해라',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
</body>

</html>