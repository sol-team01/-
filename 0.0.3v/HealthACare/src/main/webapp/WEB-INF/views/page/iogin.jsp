<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<form action="${cp}/sign/signIn" method="post">
아이디 입력: <input type="text" maxlength="20" name="id"><br>
비밀번호 입력: <input type="password" maxlength="20" name="pw"><br>
</form>
<form action="${cp}/sign/signUp">
<input type="submit" name="signUp" value="회원가입">
</form>
</div>
</body>
</html>