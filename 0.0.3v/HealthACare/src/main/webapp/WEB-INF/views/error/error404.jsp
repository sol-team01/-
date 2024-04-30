<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css"><!-- 기본 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/error404.css">
<style>
</style>
</head>
<body>
	<div id="warp">
<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
<div id="main">
<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>			
			<div class="errorWrap">
				<div class="error404">
					<h3 class="title404">404</h3>
					<h4 class="notFound">페이지를 찾을 수 없음!</h4>
					<p class="notFoundContent">죄송합니다. 블로그에 찾고 계신 페이지가 없습니다</p>
					<p class="notFoundContentLast">수정, 이동 또는 삭제되었을 수 있습니다.</p>
					<a href="${pageContext.request.contextPath}/"><button id="signUPBt">홈으로 돌아가기</button></a>
				</div>
			</div>
		</div>
	</div>
	<!-- <div id="main"> -->
	</div>
	<!-- <div id="warp"> -->
</body>
</html>
