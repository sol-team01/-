<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${cp}/resources/js/searchPw.js"></script>
<link rel="stylesheet" href="${cp}/resources/searchPw.css">
</head>
<body>

	<div id="searchPwBox">
		<a href="/"><img src="${cp}/resources/img/logo.png" alt="로고"
			class="image"></a>
		<div id="inBox">
			<a class="idText">비밀번호 찾기</a> <a class="cText">**** 아이디와 답을
				입력해주시면 비밀번호를 찾을 수 있어요! ****</a>

			<form action="${cp}/page/searchPw" method="post" name="PwSearch">
				<label class="text3">아이디</label> <input id="idInput" type="text"
					maxlength="20" name="U_id" placeholder="아이디를 입력해주세요.">
				<div>
					<input class="ebox" id="email" name="email" type="text" /> 
					<a class="text4"><span id="middle">@</span></a> 
					<input class="ebox" id="domain" type="text" name = "domain"/> 
						<select class="ebox"id="domain-list" name ="domainList">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="kakao.com">kakao.com</option>
					</select>
				</div>

				<input id="searchPwBt" type="submit" value="비밀번호 찾기">
			</form>
		</div>
		<!-- inBox -->
	</div>
	<!-- searchPwBox -->

</body>
</html>