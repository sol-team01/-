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
<form action="${cp}/page/signIn" method="post">
아이디 입력: <input type="text" maxlength="20" name="U_id"><br>
비밀번호 입력: <input type="password" maxlength="20" name="U_pw"><br>
<input type="submit" value="로그인">
</form>
<a href="${cp}/page/signUp"><button>회원가입</button></a>
</div>
</body>
</html>