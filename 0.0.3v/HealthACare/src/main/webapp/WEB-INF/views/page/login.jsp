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
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div id="loginBox">
<a href="/"><img src="${cp}/resources/img/logo.png" alt="로고" class="image"></a>
<form id="loginForm" method="post">

<div class="textbox">
<a class="text">아이디</a> 
<input id="idInput" type="text" maxlength="20" name="U_id" placeholder="아이디를 입력해주세요">
</div><!-- textbox -->
<div class="textbox">
<a class="text">비밀번호 </a>
<input id="pwInput" type="password" maxlength="20" name="U_pw" placeholder="패스워드를 입력해주세요">
</div><!-- textbox -->
<input id="loginBt" type="submit" name="signIn" value="로그인">
</form>
<a href="${cp}/page/signUp"><button id="signUPBt">회원가입</button></a>
<div id=textContain>
   <a class="text2" href="${cp}/page/searchIdPw">아이디찾기</a> 
   &nbsp;<a class="text2"> | </a> &nbsp;
   <a class="text2" href="${cp}/page/searchPwId">비밀번호찾기</a>
</div><!-- textContain -->
</div><!-- loginBox -->
<script>
$(document).ready(function() {
	$("#loginForm").submit(function(event) {
	    event.preventDefault(); // 기본 동작 방지
	    var formData = $(this).serialize(); // 폼 데이터 직렬화

	    $.ajax({
	        type: "POST",
	        url: "/page/signIn",
	        data: formData,
	        dataType: "json", // 반환되는 데이터 타입을 JSON으로 지정
	        success: function(response) {
	        	console.log(response);
	            if(response.success === true) { // JSON 데이터에서 success 값 확인
	                // 로그인 성공 시 처리
	                window.location.href = "/"; // 성공 페이지로 이동
	                self.close(); //현재 자신 창 닫는 명령어
	                opener.location.reload(); //팝업창 열게하는 창을 부모로 지정해서 부모창을 다시 뜨게 리로드 한다
	            } else {
	                // 로그인 실패 시 처리
	                alert("로그인에 실패했습니다."); // 실패 팝업 표시
	            }
	        },
	        error: function(xhr, status, error) {
	            // AJAX 오류 시 처리
	            alert("존재하지 않는 계정입니다.");
	        }
	    });
	});
});
</script>
</body>
</html>