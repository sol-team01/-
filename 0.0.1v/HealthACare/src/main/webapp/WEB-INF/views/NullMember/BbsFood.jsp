<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단</title>
</head>
<body>
식단
<br>
음식껑껑껑이

<form action="${cp}/NullMember/BbsFood">
<input type="text" name=desc_kor autocomplete="off">
</form>
	[식품이름] ${kw.body.items.get(0).DESC_KOR }<br>
	[1회제공량] ${kw.body.items.get(0).SERVING_WT } g<br>
	[칼로리]   ${kw.body.items.get(0).NUTR_CONT1 }<br>
 	[탄수화물]  ${kw.body.items.get(0).NUTR_CONT2 }<br>
 	<hr>
	[이름] ${kw.body.items.get(1).DESC_KOR }<br>
	[1회제공량] ${kw.body.items.get(0).SERVING_WT } g<br>
	[칼로리]   ${kw.body.items.get(1).NUTR_CONT1 }<br>
 	[탄수화물]  ${kw.body.items.get(1).NUTR_CONT2 }<br>
 	<hr>
	[이름] ${kw.body.items.get(2).DESC_KOR }<br>
	[1회제공량] ${kw.body.items.get(0).SERVING_WT } g<br>
	[칼로리]   ${kw.body.items.get(2).NUTR_CONT1 }<br>
 	[탄수화물]  ${kw.body.items.get(2).NUTR_CONT2 }<br>
 	<hr>

<a href="#" onclick="goBack()">뒤로가기</a>

<script>
function goBack() {
  window.history.back();
}
</script>


</body>
</html>