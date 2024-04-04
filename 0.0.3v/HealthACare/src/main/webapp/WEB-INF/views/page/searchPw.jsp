<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<div>
<form action="${cp}/page/searchPw" method="post" name="PwSearch">
<a>아이디</a>
<input type="text" maxlength="20" name="U_id">
<input id="signUPBt" type="submit" value="비밀번호 찾기">
</form>
</div>
</body>
</html>