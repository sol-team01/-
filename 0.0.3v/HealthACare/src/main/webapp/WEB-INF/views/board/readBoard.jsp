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
<jsp:include page="/WEB-INF/views/board/homeDesign/category.jsp"></jsp:include>
<div id="main">
<jsp:include page="/WEB-INF/views/board/homeDesign/homeTop.jsp"></jsp:include>
			<!-- 			내가 한 거 -->
			<div>
				<fieldset>
					<legend>글제목: :${read.b_TITLE}</legend>
					<label for="id">작성자: </label>
					${read.b_ID}
					<br>
					<label for="content">내용: </label>
					${read.b_TEXT}
					<br>
					<label for="date">작성일: </label>
					${read.b_DATETIME}
					<br>
					<label for="hit">조회수: </label>
					${read.b_HIT}
				</fieldset>
				<c:choose>
					<c:when test="${read.b_ID eq bId}">
						<form action="${cp}/board/del">
							<input type="hidden" name="b_NO" value="${read.b_NO}">
							<input type="submit" value="글 삭제">
						</form>
						<form action="${cp}/board/modifyBoard">
							<input type="hidden" name="b_NO" value="${read.b_NO}">
							<input type="submit" value="글 수정">
						</form>
					</c:when>
					<c:otherwise>
						
					</c:otherwise>
				</c:choose>
				
			</div>
			<!-- 			내가 한 거 끝남 -->
		</div>
		<!-- 	<div id="top"> -->
	</div>
</body>
</html>