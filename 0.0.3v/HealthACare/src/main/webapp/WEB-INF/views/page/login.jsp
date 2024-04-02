<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${cp}/resources/loginCommon.css">
</head>
<body>
<div id="loginBox">
<a href="/"><img src="${cp}/resources/img/logo.png" alt="로고" class="image"></a>
<form action="${cp}/page/signIn" method="post">

<div class="textbox">
<a class="text">아이디</a> 
<input id="idInput" type="text" maxlength="20" name="U_id" placeholder="아이디를 입력해주세요">
</div>
<div class="textbox">
<a class="text">비밀번호 </a>
<input id="pwInput" type="password" maxlength="20" name="U_pw" placeholder="패스워드를 입력해주세요">
</div>
<input id="loginBt" type="submit" name="signIn" value="로그인">
</form>
<a href="${cp}/page/signUp"><button id="signUPBt">회원가입</button></a>
<div id=textContain>
   <a class="text2" href="${cp}/page/searchId">아이디찾기</a> 
   &nbsp;<a class="text2"> | </a> &nbsp;
   <a class="text2" href="비밀먼호 찾기">비밀번호찾기</a>
</div><!-- textContain -->
</div><!-- loginBox -->
<a href="${cp}/myInfo/myInfoChange">운동 하는 방법</a>
</body>
</html>