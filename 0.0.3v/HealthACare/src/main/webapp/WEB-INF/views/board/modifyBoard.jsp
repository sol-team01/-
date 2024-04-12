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
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>
			<!-- 			내가 한 거 -->
			
			  <script src="${cp}/resources/summernote/summernote-lite.js"></script>
  <script src="${cp}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${cp}/resources/summernote/summernote-lite.css">
			<div>
				<h1>게시글 수정</h1>
				
				
		<form method="post" enctype="multipart/form-data">
            <!-- 제목-->
            <input type="hidden" id="B_no" name="B_no" value="${read.b_no}">
            <input type="text" name="B_title" class="form-control" id="B_title" placeholder="제목" value="${read.b_title} ">
            <!-- 카테고리-->
             <div class="mt-2 d-flex gap-2 justify-content-end">
            <label for="category">분류: </label>
            <select id="B_category"   name="B_category">
               <option value="일반">일반</option>
               <option value="공지사항">공지사항</option>
               <option value="질문">질문</option>
            </select>
            </div>

            <!-- 썸머노트 에디터 -->
            <textarea id="summernote" name="content"></textarea>

                  <div class="mt-2 d-flex gap-2 justify-content-end">
                     <input type="submit" id = "fix" class="btn btn-primary" name="doit" value="수정" />
                     <button class="btn btn-secondary">취소</button>
            </div>
         </form>
         <script>
   	  $("#summernote").summernote('code',  '${read.b_text}');
         </script>
				
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
			<!-- 			내가 한 거 끝남 -->
		</div>
	</div>
</body>
</html>