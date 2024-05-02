<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css"><!-- 기본 CSS -->
<link rel="stylesheet" href="/resources/myPage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
						<div id="myFood">
							<div id="myFoodText">
								하루 권장칼로리
								<div>
								<div class="kaclBox"></div>
									<a class="textKcal"> kcal</a>
								</div> 

							</div>
							<div id="myFoodListBox">
							<div id="myFoodList"><!-- List 전체 묶어주기 -->
							<c:if test ="${myCalorieLog != null}">
							<c:forEach var = "myDay" items="${myCalorieLog}"><!-- 개별목록 포이츠 -->
								<div class="mainBox"><!-- List 개별 목록 -->
									<div class="dateBox">
										<div class="time">${myDay.date}</div>
										<div class="time">${myDay.meal}</div>
									</div>	<div class="myEatBox"><div class="myEatLog">
<!-- 먹은 칼로리 목록 넣는 곳  -->
<c:forEach var="food" items="${myDay.foodList}">
			<div class="myDayfoodList">
			<div class="foodName">${food.c_foodName}</div><div class="calorie"> ${food.c_servingAmount } g </div> ${food.c_calorie } kcal<br>
			</div>
</c:forEach>
									</div>	<div class="totalBox">Total<div>
									<div class="totalSum">
<!-- 리스트당 칼로리 계산 넣는 곳 -->
								${myDay.sumCalorie }
									</div>	<a class="textKcal"> kcal</a>
									</div>	</div>	</div>
	
								</div> 						   <!-- List 개별 목록 -->
							</c:forEach>	<!-- 개별목록 포이츠 -->
							</c:if>
							</div><!-- List 전체 묶어주기 -->
							</div>
							</div>
																						<script>
						        var weight = ${presentPhysical.p_weightLog};
						        var dailyCalories = 25 * weight; // 하루 열량 섭취 권장량 계산 공식
						        $(".kaclBox").html(dailyCalories);
							</script>

</body>
</html>