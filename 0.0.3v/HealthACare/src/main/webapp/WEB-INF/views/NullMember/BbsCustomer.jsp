<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원</title>
</head>
<body>
고객지원
<%-- <c:forEach var="guest" items="${list}"> <!-- for반복문 --> --%>
<%--     ${guest.bno} --%>
<%--     <a href="${cp}/guest/read?bno=${guest.bno}"> ${guest.btext}</a> --%>
<!--     <hr> -->
<!--     <hr> -->
<%-- </c:forEach> --%>


<a href="#" onclick="goBack()">뒤로가기</a>

<script>
function goBack() {
  window.history.back();
}
</script>
</body>
</html>