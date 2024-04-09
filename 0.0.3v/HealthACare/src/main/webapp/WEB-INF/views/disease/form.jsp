<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form</title>
</head>
<body>

	<form action="/disease/list" method="post">
		<label for="sickCd">Enter Sick Code:</label>
		<input type="text" id="sickCd" name="sickCd" required>
		<button type="submit">Submit</button>
	</form>

</body>
</html>