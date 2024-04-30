<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품정보</title>
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css"><!-- 기본 CSS -->
<link rel="stylesheet" href="${cp}/resources/list.css">
<link rel="stylesheet" href="${cp}/resources/detailList.css">
<link rel="stylesheet" href="${cp}/resources/information.css">
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>
			<div class="nutriInformationBackground">
				<div class="nutriInformationWrap">
					<div class="foodInformationCategory">
						음식 검색<span>></span><span>${food.body.items.get(0).DESC_KOR }</span>
					</div>
					<div class="foodInformationTitle">${food.body.items.get(0).DESC_KOR }</div>
					<form action="${cp}/food/information" id="foodForm">
						<!-- 						<input type="text" name=desc_kor autocomplete="off" -->
						<!-- 							placeholder="검색어를 입력하세요"> -->
						<div class="detailListSearchWrapInfo">
							<input type="text" id="desc_kor" placeholder="음식명으로 검색"
								name="desc_kor" value="" class="detailListSearch">
							<button class="searhBoxK">
								<img src="${cp}/resources/img/search.svg">
							</button>
						</div>
					</form>

					<h2 class="nutriInformation">영양정보</h2>
					<div class="foodInformationNutrient">
						<div class="foodInformationNutrientCal">${food.body.items.get(i).SERVING_WT }g</div>
						<table class="foodInformationTable">
							<tr class="tableBorderTop">
								<td class="leftCol">칼로리</td>
								<td class="rightCol">${food.body.items.get(i).NUTR_CONT1 }kcal</td>
							</tr>
							<tr class="tableBorderTop">
								<td class="leftCol">탄수화물</td>
								<td class="rightCol">${food.body.items.get(i).NUTR_CONT2 }g</td>
							</tr>
							<tr class="tableBorderTop">
								<td class="leftColDetail"><img class="indentIcon"
									src="https://cdn.pillyze.io/web/img/indent-arrow.png">
									<p>당류</p></td>
								<td class="rightCol">${food.body.items.get(i).NUTR_CONT5 }g</td>
							</tr>
							<tr class="tableBorderTop">
								<td class="leftCol">단백질</td>
								<td class="rightCol">${food.body.items.get(i).NUTR_CONT3 }g</td>
							</tr>
							<tr class="tableBorderTop">
								<td class="leftCol">지방</td>
								<td class="rightCol">${food.body.items.get(i).NUTR_CONT4 }g</td>
							</tr>
							<tr class="tableBorderTop">
								<td class="leftColDetail"><img class="indentIcon"
									src="https://cdn.pillyze.io/web/img/indent-arrow.png">
									<p>포화지방</p>
								</td>
								<td class="rightCol">${food.body.items.get(i).NUTR_CONT8 }g</td>
							</tr>
							<tr class="tableBorderTopNone">
								<td class="leftColDetail"><img class="indentIcon"
									src="https://cdn.pillyze.io/web/img/indent-arrow.png">
									<p>트랜스지방</p>
								</td>
								<td class="rightCol">${food.body.items.get(i).NUTR_CONT9 }g</td>
							</tr>
							<tr class="tableBorderTop">
								<td class="leftCol">콜레스테롤</td>
								<td class="rightCol">${food.body.items.get(i).NUTR_CONT7 }g</td>
							</tr>
							<tr class="tableBorderTop">
								<td class="leftCol">나트륨</td>
								<td class="rightCol">${food.body.items.get(i).NUTR_CONT6 }g</td>
							</tr>
						</table>
					</div>
					<div class="nutritionWarningWrap">
						<div class="nutritionWarning"></div>
						<p>식품의 영양성분정보는 수확물의 품종, 발육, 생장환경 등에 따라 달라질 수 있으며, 조리법에 따라 달라질
							수 있습니다. 계산된 칼로리 및 성분 정보는 평균적인 수치로 참고용으로 사용해야하며, 일부 정보에 오류가 있거나
							누락이 있을 수 있습니다.</p>
					</div>
					<a href="#" onclick="goBack()">
						<div class="backArrowWrap">
							<img src="${cp}/resources/img/leftarrow.png" class="backArrowK">
							<p>뒤로가기</p>
						</div>
					</a>
				</div>
			</div>

			<script>
				function goBack() {
					window.history.back();
				}
			</script>
</body>
</html>