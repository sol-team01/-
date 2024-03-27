<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="${cp}/sign/createId" method="post">
아이디 입력: <input type="text" maxlength="20" name="U_id"><br>
비밀번호 입력: <input type="password" maxlength="20" name="U_pw"><br>
비밀번호 확인: <input type="password" maxlength="20" name="rePw"><br>
이메일: <input type="email" maxlength="20" name="I_email"><br>
생년월일: <input type="date" name="I_birthdate"> <br>
성별: <input type="radio" name="I_gender" data-th-value="남">
     <input type="radio" name="I_gender" data-th-value="여"><br>
<!-- pw찾기힌트질문: <input type="email" maxlength="20" name="rePw"><br>
pw찾기힌트대답: <input type="email" maxlength="20" name="rePw"><br> -->
<input type="submit" value="회원가입">
</form>
</body>
</html>