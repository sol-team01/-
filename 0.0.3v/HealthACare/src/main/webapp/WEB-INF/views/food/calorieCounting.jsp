<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<%-- <%@ page errorPage="/error/error404.jsp" %> --%>
<html>
<head>
<title>칼로리 계산</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="${cp}/resources/js/Calorie.js"></script>
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css"><!-- 기본 CSS -->
<link rel="stylesheet" href="${cp}/resources/calorieCounting.css">
<style>
</style>
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>
			<div class="topBox">
			<h1 class="calorieTitle">
				칼로리 계산
			</h1>
				<form id="foodForm" action="${cp}/food/calorieCounting">
					<div class="calorieSearchWrap">
					<input type="text" name=desc_kor autocomplete="off"
						class="calorieSearch" placeholder="음식명으로 검색">
					<button class="searhBoxK">
							<img src="${cp}/resources/img/search.svg">
					</button>
					</div>
					<!-- div class="calorieSearchWrap" -->
					<div class="textBox">
					<a class="text">**** 한 식단 저장 후 다음 식단을 저장 할 수 있습니다. ****</a>
					</div>
				</form>
				</div>
				<!--div class="topBox"-->
		<div class="calorieBackground">
			<div class="basket">
			<select id="C_meal">
        		<option value="0">아침</option>
        		<option value="1">점심</option>
       			<option value="2">저녁</option>
        		<option value="3">간식</option>
  		 	 </select>
				<div id="foodDiv" class="foodDiv">

					<table>
						<tr>
							<td class="testF fixed-column"> 식품이름 </td>
							<td class="testF fixed-column"> 1회제공량(g) </td>
							<td class="testF fixed-column"> 열량(kcal) </td>
							<td class="testF fixed-column"> 이동 </td>
						</tr>
						<c:forEach var="item" items="${food.body.items}">
							<tr>
								<td class="testFS">${item.DESC_KOR}</td>
								<td class="testFS">${item.SERVING_WT}</td>
								<td class="testFS">${item.NUTR_CONT1}</td>
								<td class="testFS"><button class="moveButton"> > </button></td>
							</tr>
						</c:forEach>
					</table>
				</div><!-- <div id="foodDiv"> -->
				<div id="cartDiv" class="cartDiv">
					<table>
						<tr>
							<td class="testF fixed-column"> 식품이름 </td>
							<td class="testF fixed-column"> 1회제공량(g) </td>
							<td class="testF fixed-column"> 열량(kcal) </td>
							<td class="testF fixed-column"> 삭제 </td>
						</tr>
					</table>
				</div><!-- <div id="cartDiv"> -->
			</div>
			
			<div class="result">
				<a class="calorieText">총 칼로리</a>&nbsp;&nbsp;&nbsp;
				<a id="caloriePlus"></a>
				&nbsp;&nbsp;&nbsp;<a id="calorieText">/</a>&nbsp;&nbsp;&nbsp;

				<c:choose>
					<c:when test="${physical.p_heightLog < 150}">
				 <c:set var="recommendedCalories" value="${(physical.p_heightLog - 100) * 30}" />
					</c:when>
					<c:when test="${150 <= physical.p_heightLog && physical.p_heightLog < 160}">
				 <c:set var="recommendedCalories" value="${((physical.p_heightLog - 100)/2 + 50)*30}" />
					</c:when>
					<c:when test="${160 <= physical.p_heightLog}">
				 <c:set var="recommendedCalories" value="${(physical.p_heightLog - 100) * 0.9*30}" />
					</c:when>
					
				</c:choose>
				<a class="calorieText">권장 칼로리</a>&nbsp;&nbsp;&nbsp;
				<a class="recommendedCalories"> ${recommendedCalories}</a>
				<br>
				<button id="clearSessionButton">저장</button>
				
<!-- 		선택 - 육체활동이 거의 없는 경우 표준체중 X 30(kcal) 
				- 보통의 활동을 하는 경우 표준체중 X 35(kcal)
				- 심한 육체활동을 하는 경우 표준체중 X 40(kcal) 
   표준체중 구하는 법 - 신장이 150cm미만 : 신장 -100
   				- 신장이 150cm 이상 -160cm 미만인 경우 : (신장-150) /2 +50   <- 이거 우선
			    - 신장이 160cm 이상인 경우 : (신장-100)X0.9 권장칼로리 선택 -->
			    
			   </div>
			   <!-- div class="result" -->
			</div>
            <!--div class="calorieBackground" -->
			</div>
            <!-- div class="nutriInformationBackground" -->
		</div>
		<!-- <div id="main"> -->
	</div>
	<!-- <div id="warp"> -->

</body>
</html>