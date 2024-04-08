<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>운동 하는 방법</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<link rel="stylesheet" href="${cp}/resources/howtoSports.css">
<style>
</style>
</head>
<body>
<div id="warp">
<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
<div id="main">
<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>			
<!-- 여기에서 작업하세요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<div id="useKcal">
	<div id="choiceSportsBox">
		<div class="choiceSports">칼로리1</div>
		<div class="choiceSports">칼로리2</div>
		<div class="choiceSports">칼로리3</div>
		<div class="choiceSports">칼로리4</div>
		<div class="choiceSports">칼로리5</div>
		<div class="choiceSports">칼로리6</div>
		<div class="choiceSports">칼로리7</div>
		<div class="choiceSports">칼로리8</div>
		<div class="choiceSports">칼로리9</div>
		<div class="choiceSports">칼로리</div>
	</div>
	<div id="useKcalMainBox">
		<div class="inputBox">
				<div class="bodyInfoBox">
				체중
				<div class="Box">
				<div class="bodyInfo">	50	</div>
				<a>kg</a>	</div></div>
				<div class="bodyInfoBox">
				신장
				<div class="Box">
				<div class="bodyInfo">	150</div>
				<a>kg</a>	</div></div>
				<div class="bodyInfoBox">
				신장
				<div class="Box">
				<div class="bodyInfo">	150</div>
				<a>kg</a>	</div></div>
		</div>
		<div class="sumKcalBox">
		소모되는 칼로리
		</div>
		<div class="dayKcalBox">
		하루 권장 칼로리 섭취량
		</div>
	</div>
</div>
</div><!-- <div id="main"> -->
</div><!-- <div id="warp"> -->
</body>
</html>
