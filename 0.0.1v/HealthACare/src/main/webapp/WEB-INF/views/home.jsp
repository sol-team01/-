<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
</h1>
<P>  서버 열린시간: ${serverTime}. </P>
<pre>
<a href="${cp}/page/mainWeb">로그인</a>
<a href="${cp}/page/mainWeb">마이페이지(로그인 시 노출)</a>
<a href="${cp}/page/mainWeb">커뮤니티(추후에 li 리스트로 변경 건의)</a>
<a href="${cp}/page/mainWeb">공지사항</a>
<a href="${cp}/page/mainWeb">오운완</a>
<a href="${cp}/page/mainWeb">식단추천</a>
<a href="${cp}/page/mainWeb">운동추천</a>
</pre>
</body>
</html>
