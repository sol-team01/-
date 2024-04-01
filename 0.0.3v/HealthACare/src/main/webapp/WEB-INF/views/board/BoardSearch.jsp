<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 검색 test</title>
</head>
<body>
	<c:forEach var="list" items="${search}">
		${list.b_NO} ${list.b_TITLE} ${list.b_DATETIME}
		<br>
	</c:forEach>
	
	<fieldset>
		<legend>페이지 블럭</legend>
		${searchPaging.getHtmlPageList()}
	</fieldset>
	
	<fieldset>
		<legend>검색</legend>
		<form action="${cp}/board/BoardSearch" method="get">
			<input type="hidden" name="currentPage" value="1">
			<input type="text" name="word">
			<input type="submit" value="검색">
		</form>
	</fieldset>
	
</body>
</html>