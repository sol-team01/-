<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경하기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${cp}/resources/js/rePwCk.js"></script>
<link rel="stylesheet" href="${cp}/resources/resetPw.css">
</head>
<body>
 <div id="searchPwBox">
	<a href="/"><img src="${cp}/resources/img/logo.png" alt="로고" class="image"></a>
   <div id="inBox">
    <a class="idText">비밀번호 변경</a>
      <form action="${cp}/page/pwChange" method="post">
    	<input type = "hidden" value="${U_no}" name ="U_no">
        <div>
            <label class="text3" for="newPassword">새 암호:</label>
            <input class="idInput" type="password" maxlength="20" id="userPw" name="U_pw" required>
            <label id="checkTextPw"></label>
        </div>
        <div>
            <label class="text3" for="confirmPassword">새 암호 확인:</label>
            <input class="idInput" type="password" maxlength="20" id="userRePw" name="U_repw" required>
            <label id="checkRePw"></label>
        </div>
        <label id="checkTextPw"></label> 
        <div id="rePwCk">
            <input id="changePwBt" type="submit" value="암호 변경">
        </div>
      </form>
    </div>
	<!-- inBox -->
 </div>
 <!-- searchPwBox -->
</body>
</html>