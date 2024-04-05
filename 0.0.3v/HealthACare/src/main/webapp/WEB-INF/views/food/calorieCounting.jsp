<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<%-- <%@ page errorPage="/error/error404.jsp" %> --%>
<html>
<head>
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="${cp}/resources/js/Calorie.js"></script>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<style>
</style>
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>

			<div>
				<form action="${cp}/food/calorieCounting">
					<input type="text" name=desc_kor autocomplete="off"
						placeholder="검색어를 입력하세요">
				</form>

				<div id="foodDiv" style="overflow: auto; max-height: 200px;">

					<table>
						<tr>
							<td>식품이름</td>
							<td>1회제공량</td>
							<td>열량</td>
							<td>버튼</td>
						</tr>
						<c:forEach var="item" items="${food.body.items}">
							<tr>
								<td>${item.DESC_KOR}</td>
								<td>${item.SERVING_WT}</td>
								<td>${item.NUTR_CONT1}</td>
								<td><button class="moveButton">이동</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>

			<hr>

			<div>
				<!-- 장바구니 보이고 오른쪽에 권장 칼로리와 계산된 칼로리가 보이는 곳 -->
				<div id="cartDiv" style="overflow: auto; max-height: 200px;">
					<table>
						<tr>
							<td>식품이름</td>
							<td>1회제공량</td>
							<td>열량</td>
							<td>버튼</td>
						</tr>
						<tr>
						</tr>
					</table>
				</div>
				<button id="clearSessionButton">세션 클리어</button>
				계산된 칼로리 (a+a+a+a+a+a+a+...) -> 권장 칼로리 보다 높으면 빨간색, 낮으면 초록색
				&nbsp;&nbsp;&nbsp;/
				<div>선택 - 육체활동이 거의 없는 경우 표준체중 X 30(kcal) - 보통의 활동을 하는 경우 표준체중
					X 35(kcal) - 심한 육체활동을 하는 경우 표준체중 X 40(kcal) 표준체중 구하는 법 - 신장이 150cm
					미만 : 신장 -100 - 신장이 150cm 이상 -160cm 미만인 경우 : (신장-150) /2 +50 - 신장이
					160cm 이상인 경우 : (신장-100)X0.9 권장칼로리 선택</div>
			</div>



		</div>
		<!-- <div id="main"> -->
	</div>
	<!-- <div id="warp"> -->

	<script>

</script>

</body>
</html>