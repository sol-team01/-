<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${cp}/resources/searchPw.css">
</head>
<body>

<div id="searchPwBox">
	<a href="/"><img src="${cp}/resources/img/logo.png" alt="로고" class="image"></a>
	<div id="inBox">
	<a class="idText">비밀번호 찾기</a>
	<a class="cText">**** 아이디와 답을 입력해주시면 비밀번호를 찾을 수 있어요! ****</a>
	
	<form action="${cp}/page/searchPw" method="post" name="PwSearch">
	<label class="text3">아이디</label>
		<input id="idInput" type="text" maxlength="20" name="U_id" placeholder="아이디를 입력해주세요.">
		
	<label for="securityQuestion" class="text3">비밀번호 찾기 질문</label>
   		<select class="passwordQuestion" id="I_pwFinding" name="I_pwFinding">
     		<option value="1">질문입니다. 당신의 대답은?</option>
			<option value="2">학원 근처에서 가장 맛있었던 식당은?</option>
			<option value="3">학원에서 처음으로 갔던 단체회식 장소는?</option>
			<option value="4">수강하고 계신 수업에 가장 어려운 과목은?</option>
   		</select>
	<label for="QuestionAnswer" class="text3">비밀번호 찾기 답변</label>
	<input id="I_hint" name="I_hint" type="text" placeholder="답을 입력해주세요.">
	
		<input id="searchPwBt" type="submit" value="비밀번호 찾기">
	</form>
	</div><!-- inBox -->
</div><!-- searchPwBox -->

</body>
</html>