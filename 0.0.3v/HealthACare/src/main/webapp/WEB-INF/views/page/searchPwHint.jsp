<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
</head>
<body>
 <form action="${cp}/page/searchHint" method="post">
 <c:choose>
 <c:when test="${pwFinding.getI_pwFinding() == '1'}">
 <p>질문을 넣어주세요</p>
 </c:when>
 <c:when test="${pwFinding.getI_pwFinding() == '2'}">
 <p>질문을 넣어주세요2</p>
 </c:when>
 <c:when test="${pwFinding.getI_pwFinding() == '3'}">
 <p>질문을 넣어주세요3</p>
 </c:when>
 </c:choose>
 <input id="I_hint" name="I_hint" type="text">
 <input id="U_no" name="U_no" type="hidden" value="${pwFinding.getU_no()}">
 <input id="searchPwHint" type="submit" value="비밀번호재설정">
 </form>
</body>
</html>