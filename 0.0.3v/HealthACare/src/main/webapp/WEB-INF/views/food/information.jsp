<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품정보</title>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<link rel="stylesheet" href="${cp}/resources/information.css">
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>
			<div class="foodInformationCategory">
				음식 검색><span>${food.body.items.get(0).DESC_KOR }</span>
			</div>
			<div class="foodInformationTitle">잣</div>
			<form action="${cp}/food/information">
				<input type="text" name=desc_kor autocomplete="off"
					placeholder="검색어를 입력하세요">
			</form>

			<h2>영양정보</h2>
			<div class="foodInformationNutrient">
				<div>${food.body.items.get(i).SERVING_WT }g</div>
				<table class="foodInformationTable">
					<tr class="tableBorderTop">
						<td class="left-col">칼로리</td>
						<td class="right-col">${food.body.items.get(i).NUTR_CONT1 }kcal</td>
					</tr>
					<tr style="border: 1px solid #E6E9ED;">
						<td class="left-col">탄수화물</td>
						<td class="right-col">${food.body.items.get(i).NUTR_CONT2 }g</td>
					</tr>
					<tr style="border: 1px solid #E6E9ED;">
						<td class="left-col">당류</td>
						<td class="right-col">${food.body.items.get(i).NUTR_CONT5 }g</td>
					</tr>
					<tr style="border: 1px solid #E6E9ED;">
						<td class="left-col">단백질</td>
						<td class="right-col">${food.body.items.get(i).NUTR_CONT3 }g</td>
					</tr>
					<tr style="border: 1px solid #E6E9ED;">
						<td class="left-col">지방</td>
						<td class="right-col">${food.body.items.get(i).NUTR_CONT4 }g</td>
					</tr>
					<tr style="border: 1px solid #E6E9ED;" rowspan="2">
						<td class="left-col">포화지방</td>
						<td class="right-col">${food.body.items.get(i).NUTR_CONT8 }g</td>
					</tr>
					<tr style="border: 1px solid #E6E9ED;">
						<td class="left-col">트랜스지방</td>
						<td class="right-col">${food.body.items.get(i).NUTR_CONT9 }g</td>
					</tr>
					<tr style="border: 1px solid #E6E9ED;">
						<td class="left-col">콜레스테롤</td>
						<td class="right-col">${food.body.items.get(i).NUTR_CONT7 }g</td>
					</tr>
					<tr style="border: 1px solid #E6E9ED;">
						<td class="left-col">나트륨</td>
						<td class="right-col">${food.body.items.get(i).NUTR_CONT6 }g</td>
					</tr>

					<!-- 				<tr> -->
					<!-- 					<td>식품이름</td> -->
					<!-- 					<td>1회제공량</td> -->
					<!-- 					<td>열량</td> -->
					<!-- 					<td>탄수화물</td> -->
					<!-- 					<td>단백질</td> -->
					<!-- 					<td>지방</td> -->
					<!-- 					<td>당류</td> -->
					<!-- 					<td>나트륨</td> -->
					<!-- 					<td>콜레스테롤</td> -->
					<!-- 					<td>포화지방산</td> -->
					<!-- 					<td>트랜스지방산</td> -->
					<!-- 				</tr> -->

					<!-- 				<hr> -->
					<%-- 				테스트입니다// ${food.body.items.get(0).DESC_KOR } --%>
					<%-- 				</td> 테스트입니다// ${foodTEST.body.items.get(0).DESC_KOR } --%>
					<!-- 				</td> -->
					<!-- 				<hr> -->
					<%-- 				테스트입니다: ${food.body.items[0].DESC_KOR} --%>
					<!-- 				<hr> -->
					<hr>

<%-- 					<c:forEach var="i" begin="0" end="9" varStatus="loop"> --%>
<!-- 						<tr> -->
<%-- 													<td>${food.body.items.get(i).DESC_KOR }</td> --%>
<%-- 							<td>${food.body.items.get(i).SERVING_WT }g</td> --%>
<%-- 							<td>${food.body.items.get(i).NUTR_CONT1 }kcal</td> --%>
<%-- 							<td>${food.body.items.get(i).NUTR_CONT2 }g</td> --%>
<%-- 							<td>${food.body.items.get(i).NUTR_CONT3 }g</td> --%>
<%-- 							<td>${food.body.items.get(i).NUTR_CONT4 }g</td> --%>
<%-- 							<td>${food.body.items.get(i).NUTR_CONT5 }g</td> --%>
<%-- 							<td>${food.body.items.get(i).NUTR_CONT6 }mg</td> --%>
<%-- 							<td>${food.body.items.get(i).NUTR_CONT7 }mg</td> --%>
<%-- 							<td>${food.body.items.get(i).NUTR_CONT8 }g</td> --%>
<%-- 							<td>${food.body.items.get(i).NUTR_CONT9 }g</td> --%>
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
				</table>

			</div>


			<a href="#" onclick="goBack()">뒤로가기</a>

			<script>
				function goBack() {
					window.history.back();
				}
			</script>
</body>
</html>