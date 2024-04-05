<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
    <link rel="stylesheet" href="${cp}/resources/searchPwHint.css">
</head>
<body>

<div id="searchPwHintBox">
<a href="/"><img src="${cp}/resources/img/logo.png" alt="로고" class="image"></a>
 
 	<form action="${cp}/page/searchHint" method="post">
 		<c:choose>
 			<c:when test="${pwFinding.getI_pwFinding() == '1'}">
 			<p>질문입니다. 당신의 대답은?</p>
 			</c:when>
 			<c:when test="${pwFinding.getI_pwFinding() == '2'}">
 			<p>학원 근처에서 가장 맛있었던 식당은?</p>
 			</c:when>
 			<c:when test="${pwFinding.getI_pwFinding() == '3'}">
 			<p>학원에서 처음으로 갔던 단체회식 장소는?</p>
 			</c:when>
 			<c:when test="${pwFinding.getI_pwFinding() == '4'}">
 			<p>수강하고 계신 수업에 가장 어려운 과목은?</p>
 			</c:when>
 		</c:choose>
 
 	<input id="I_hint" name="I_hint" type="text">
 	<input id="U_no" name="U_no" type="hidden" value="${pwFinding.getU_no()}">
 	<input id="searchPwHint" type="submit" value="비밀번호재설정">
 
 	</form>
</div><!-- searchPwHintBox -->

 
</body>
</html>