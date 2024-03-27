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
	[열량]   ${kw.body.items.get(0).NUTR_CONT1 } kcal<br>
 	[탄수화물]  ${kw.body.items.get(0).NUTR_CONT2 } g<br>
 	[단백질]  ${kw.body.items.get(0).NUTR_CONT3 } g<br>
 	[지방]  ${kw.body.items.get(0).NUTR_CONT4 } g<br>
 	[당류]  ${kw.body.items.get(0).NUTR_CONT5 } g<br>
 	[나트륨]  ${kw.body.items.get(0).NUTR_CONT6 } mg<br>
 	[콜레스테롤]  ${kw.body.items.get(0).NUTR_CONT7 } mg<br>
 	[포화지방산]  ${kw.body.items.get(0).NUTR_CONT8 } g<br>
 	[트랜스지방산]  ${kw.body.items.get(0).NUTR_CONT9 } g<br>
 	[구축년도]  ${kw.body.items.get(0).BGN_YEAR } <br>
 	[가공업체]  ${kw.body.items.get(0).ANIMAL_PLANT } <br>
 	<hr>
 	
 	<table>
	<tr>
		<td> 식품이름 </td>
		<td> 1회제공량 </td>
		<td> 열량 </td>
		<td> 탄수화물 </td>
		<td> 단백질 </td>
		<td> 지방 </td>
		<td> 당류 </td>
		<td> 나트륨 </td>
		<td> 콜레스테롤 </td>
		<td> 포화지방산 </td>
		<td> 트랜스지방산 </td>
		<td> 구축년도 </td>
		<td> 가공업체 </td>
	</tr>
	
<c:forEach var="i" begin="0" end="9" varStatus="loop">
    <tr>
        <td> ${kw.body.items.get(i).DESC_KOR } </td>
        <td> ${kw.body.items.get(i).SERVING_WT } g </td>
        <td> ${kw.body.items.get(i).NUTR_CONT1 } kcal </td>
        <td> ${kw.body.items.get(i).NUTR_CONT2 } g </td>
        <td> ${kw.body.items.get(i).NUTR_CONT3 } g </td>
        <td> ${kw.body.items.get(i).NUTR_CONT4 } g </td>
        <td> ${kw.body.items.get(i).NUTR_CONT5 } g </td>
        <td> ${kw.body.items.get(i).NUTR_CONT6 } mg </td>
        <td> ${kw.body.items.get(i).NUTR_CONT7 } mg </td>
        <td> ${kw.body.items.get(i).NUTR_CONT8 } g </td>
        <td> ${kw.body.items.get(i).NUTR_CONT9 } g </td>
        <td> ${kw.body.items.get(i).BGN_YEAR } </td>
        <td> ${kw.body.items.get(i).ANIMAL_PLANT } </td>
    </tr>
</c:forEach>
</table>
 	
 	
<a href="#" onclick="goBack()">뒤로가기</a>

<script>
function goBack() {
  window.history.back();
}
</script>


</body>
</html>