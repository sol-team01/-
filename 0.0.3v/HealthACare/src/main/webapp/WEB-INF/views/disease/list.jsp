<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질병 리스트</title>
</head>
<body>

	<c:forEach items="${itemList}" var="item">
   [나이] ${item.age} <br>
   [환자 수] ${item.ptntCnt} <br>
   [받은 보조 부담금 액] ${item.rvdInsupBrdnAmt} <br>
   [귀환 치료액] ${item.rvdRpeTamtAmt} <br>
   [성별] ${item.sex} <br>
   [질병 코드] ${item.sickCd} <br>
   [질병 이름] ${item.sickNm} <br>
   [특수 카운트] ${item.specCnt} <br>
   [일일 방문 의사 수] ${item.vstDdcnt} <br>
   [===================================================] <br>


	</c:forEach>
</body>
</html>