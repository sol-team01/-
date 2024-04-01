<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="${cp}/resources/noticeBoard.css">
</head>
<body>
<div class="flexK"></div>
<h4>전체</h4>
<span>7건</span>
<div class="titleLineK"></div>
<div class="noticeWrap">
	<div class="noticeBox">
		<div class="noticeHead">공지</div>
		<div class="noticeBody">금융거래소 이용약관 개칭 안내</div>
	</div>
</div>
</body>
</html>