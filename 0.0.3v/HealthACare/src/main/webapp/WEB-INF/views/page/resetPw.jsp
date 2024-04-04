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

    암호 변경<br>
    ${hint.getU_id()}
    <form action="${cp}/page/?????" method="post">
        <div>
            <label for="newPassword">새 암호:</label>
            <input type="password" id="userPw" name="U_pw" required>
        </div>
        <div>
            <label for="confirmPassword">새 암호 확인:</label>
            <input type="password" id="userRePw" name="U_repw" required>
        </div>
        <div>
            <input type="submit" value="암호 변경">
        </div>
    </form>
</body>
</html>