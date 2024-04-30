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
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css"><!-- 기본 CSS -->
<link rel="stylesheet" href="${cp}/resources/howtoSports.css">
<style>
</style>
</head>
<body>
<div id="useKcal">
	<div id="choiceSportsBox">
		<div class="choiceSports">걷기</div>
		<!-- 소모 칼로리=( 새로운 체중/10 kg )×(운동시간/10 분)×7 kcal -->
		<div class="choiceSports">뛰기</div>
		<!-- 소모 칼로리=( 새로운 체중/10 kg )×(운동시간/10 분)×12 kcal -->
		<div class="choiceSports">계단</div>
		<!-- 소모 칼로리=( 새로운 체중/10 kg )×(운동시간/10 분)×12 kcal -->
		<div class="choiceSports">등산</div>
		<!-- 소모 칼로리=( 새로운 체중/10 kg )×(운동시간/10 분)×14 kcal -->
		<div class="choiceSports">수영</div>
		<!-- 소모 칼로리=( 새로운 체중/10 kg )×(운동시간/10 분)×16 kcal -->
		<div class="choiceSports">요가</div>
		<!-- 소모 칼로리=( 새로운 체중/10 kg )×(운동시간/10 분)×4 kcal -->
		<div class="choiceSports">복싱</div>
		<!-- 소모 칼로리=( 새로운 체중/10 kg )×(운동시간/10 분)×18 kcal -->
		<div class="choiceSports">줄넘기</div>
		<!-- 소모 칼로리=( 새로운 체중/10 kg )×(운동시간/10 분)×18 kcal -->
		<div class="choiceSports">자전거</div>
		<!-- 소모 칼로리=( 새로운 체중/10 kg )×(운동시간/10 분)×14 kcal -->
		<div class="choiceSports">스쿼시</div>
		<!-- 소모 칼로리=( 새로운 체중/10 kg )×(운동시간/10 분)×12 kcal -->
	</div>
	<div id="useKcalMainBox">
		<div class="inputBox">
				<div class="bodyInfoBox">
				체중
				<div class="Box">
				<div class="bodyInfo">	${physical.p_weightLog}</div>
				<a>kg</a>	</div></div>
				<div class="bodyInfoBox">
				신장
				<div class="Box">
				<div class="bodyInfo">	${physical.p_heightLog}</div>
				<a>cm</a>	</div></div>
				<div class="bodyInfoBox">
				<!-- ★todo 제이쿼리 사용해서 실시간 반영 해야 함 -->
				운동시간
				<div class="Box">
				<input class="bodyInfoInput">
				<a>분</a>	</div></div>
		</div>
		<div class="sumKcalBox">
		소모되는 칼로리
			<div class="resultKcal">0 Kcal</div>
		</div>
		<div class="dayKcalBox">
			<p>표준체중은  <span  class="blue">0kg</span >입니다.</p>
			<p>현재체중은 <span class="blue">정상체중</span>입니다.</p>
			<p>하루 <span class="blue">0kcal</span>의 열량 섭취가 권장됩니다.</p>
			<div class="kcalColor">
				<div class="underWeight">저체중</div>
				<div class="normalWeight">정상체중</div>
				<div class="dangerWeight">과체중</div>
				<div class="dangerWeight2">경도비만</div>
				<div class="dangerWeight3">중정도 비만</div>
				<div class="dangerWeight4">고도 비만</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    // 운동 시간 입력란에 입력이 있을 때마다 칼로리 재계산
    $(".bodyInfoInput").on("input", function() {
        var weight = parseInt($(".bodyInfo:eq(0)").text().trim());
        var height = parseInt($(".bodyInfo:eq(1)").text().trim());
        var standardWeight = (height - 100) * 0.9; // 표준 체중 계산 공식
        var duration = parseInt($(this).val());

        // 운동시간 입력란이 비어있지 않고 운동 시간이 유효한 경우에만 계산
        if (!isNaN(duration) && duration > 0) {
            var newWeight = standardWeight / 10;
            var newDuration = duration / 10;
            var calories = newWeight * newDuration * 7;
            $(".resultKcal").text(calories.toFixed(1) + " Kcal");
        } else {
            $(".resultKcal").text("0 Kcal"); // 운동시간이 0일 때 0 Kcal로 표시
        }
    });

    // 운동 종목에 따라 분당 소모 칼로리 설정 및 결과 업데이트
    $(".choiceSports").on("click", function() {
        var sport = $(this).text().trim(); // 선택한 운동 종목 가져오기
        var caloriesPerMinute = 0; // 분당 소모 칼로리 초기값
        var height = parseInt($(".bodyInfo:eq(1)").text().trim());
        var standardWeight = (height - 100) * 0.9;

        // 운동 종목에 따라 분당 소모 칼로리 설정
        switch (sport) {
            case "걷기":
                caloriesPerMinute = 7;
                break;
            case "뛰기":
            case "계단":
                caloriesPerMinute = 12;
                break;
            case "등산":
                caloriesPerMinute = 14;
                break;
            case "수영":
                caloriesPerMinute = 14;
                break;
            case "요가":
                caloriesPerMinute = 4;
                break;
            case "복싱":
                caloriesPerMinute = 18;
                break;
            case "줄넘기":
                caloriesPerMinute = 18;
                break;
            case "자전거":
                caloriesPerMinute = 14;
                break;
            case "스쿼시":
                caloriesPerMinute = 21;
                break;
            default:
                caloriesPerMinute = 7; // 기본 값으로 걷기 설정
                break;
        }

        // 현재 체중과 입력된 운동 시간을 가져와서 칼로리 계산
        var weight = parseInt($(".bodyInfo:eq(0)").text().trim());
        var duration = parseInt($(".bodyInfoInput").val());
        if (!isNaN(duration) && duration > 0) {
            var newWeight = standardWeight / 10;
            var newDuration = duration / 10;
            var calories = newWeight * newDuration * caloriesPerMinute;
            $(".resultKcal").text(calories.toFixed(1) + " Kcal"); // 결과 업데이트
        } else {
            $(".resultKcal").text("0 Kcal"); // 운동시간이 0일 때 0 Kcal로 표시
        }
    });

 // 표준체중, 현재체중, 열량 섭취 권장량, 비만도 등을 계산하는 함수
    function calculateBodyInfo() {
        var height = parseInt($(".bodyInfo:eq(1)").text().trim());
        var standardWeight = height * height * 21 / 10000; // 새로운 표준 체중 계산 공식
        var weight = parseInt($(".bodyInfo:eq(0)").text().trim());
        var bmi = (weight / ((height / 100) * (height / 100))).toFixed(1); // BMI 계산 공식
        var dailyCalories = 25 * weight; // 하루 열량 섭취 권장량 계산 공식
        var weightStatus = "";

        // 비만도 계산
        var obesityPercentage = (weight / standardWeight) * 100;

        if (weight < standardWeight * 0.9) {
            weightStatus = "저체중";
        } else if (weight < standardWeight * 1.1) {
            weightStatus = "정상체중";
        } else if (weight < standardWeight * 1.2) {
            weightStatus = "과체중";
        } else if (weight < standardWeight * 1.3) {
            weightStatus = "경도 비만";
        } else if (weight < standardWeight * 1.6) {
            weightStatus = "중등도 비만";
        } else {
            weightStatus = "고도 비만";
        }

        // 표준체중, 현재체중, 열량 섭취 권장량, 비만도 등을 페이지에 출력
        $(".blue:eq(0)").text(standardWeight.toFixed(1) + "kg");
        $(".blue:eq(1)").text(weightStatus);
        $(".blue:eq(2)").text(dailyCalories.toFixed(0) + "kcal");
        $(".blue:eq(3)").text(obesityPercentage.toFixed(1) + "%");
    }

    // 페이지 로드 시 계산 함수 호출
    calculateBodyInfo();

});
</script>
</body>
</html>