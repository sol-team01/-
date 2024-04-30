<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>운동 하는 방법</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css"><!-- 기본 CSS -->
<%-- <link rel="stylesheet" href="${cp}/resources/howtoSports.css"> --%>
<link rel="stylesheet" href="${cp}/resources/howtoSportsMid.css">
<style>
</style>
</head>
<body>
<div id="warp">
<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
<div id="main">
<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>         
<!-- 여기에서 작업하세요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<!-- 상단 칼로리 계산탭 -->
<jsp:include page="/WEB-INF/views/sports/howtoSporysTOPkcal.jsp"></jsp:include>
<!-- 중단 운동 추천 -->
<hr>
<h1>데일리한 운동 추천!</h1>
<div class="mainOverflowBox">
<div class="overflow">
        <div class="mainTextBox">hi!!</div>
<div class="sportsAreaBox">

      <div class="slideshow-container"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide"><div class="content">
        <img alt="" src="https://www.k-health.com/news/photo/202310/67857_74360_1457.jpg">
        </div>
        <div class="titleBox"><h2>스쿼트</h2> <a class="dtext">자세가 중요하죠!</a> </div>
<div class="noneText">웨이트 트레이닝의 가장 대표적인 운동 중 하나이며, 
데드리프트, 벤치 프레스와 함께 웨이트 트레이닝의 트로이카 운동으로 꼽힌다. 
중량을 겨루는 스포츠인 파워리프팅 중 하나이다. 
</div>
        <div class="noneImg">https://www.k-health.com/news/photo/202310/67857_74360_1457.jpg</div>
        </div></div>
        
            <div class="slideshow-container"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide"><div class="content">
        <img alt="" src="https://sccdn.chosun.com/news/html/2017/09/15/2017091601001341100097718.jpg">
        </div>
        <div class="titleBox"><h2>스쿼시</h2> <a class="dtext">칼로리 태우자!</a> </div>
<div class="noneText">두 명(단식) 또는 네 명(복식)의 선수가 사방이 벽으로 이루어진 코트에서 
작고 속이 빈 고무공으로 경기를 하는 라켓 스포츠이다. 
</div>
         <div class="noneImg">
         https://sccdn.chosun.com/news/html/2017/09/15/2017091601001341100097718.jpg
         </div>
        </div></div>
        
            <div class="slideshow-container"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide"><div class="content">
        <img alt="" src="https://src.hidoc.co.kr/image/lib/2022/10/19/1666163301210_0.jpg">
        </div>
        <div class="titleBox"><h2>테니스</h2> <a class="dtext">취미로 추천해요~</a> </div>
<div class="noneText">1360년경부드러운 테니스공을 이용하여 네트를 사이에 두고 
라켓으로 이를 치고받으며 경쟁하는 스포츠이다. 
라켓을 이용하는 대표적인 종목으로 올림픽 및 세계 대회, 프로 대회가 
활성화되어 있는 대중적인 스포츠이다.
</div>
         <div class="noneImg">
https://src.hidoc.co.kr/image/lib/2022/10/19/1666163301210_0.jpg
         </div>
        </div></div>
        
            <div class="slideshow-container"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide"><div class="content">
        <img alt="" src="https://weekly.chosun.com/news/photo/202201/18666_1.jpg">
        </div>
        <div class="titleBox"><h2>런지</h2><a class="dtext">하체 근육을 강화하세요!</a>
 </div>
        <div class="noneText">런지는 스쿼트와 함께 하체 근력을 키우는 운동입니다.
전방 다리의 대퇴이두, 뒷다리의 넙다리와 종아리 근육을 강화하여 
다리의 안정성을 높이고 평형을 유지할 수 있습니다.
        </div>
         <div class="noneImg">
https://weekly.chosun.com/news/photo/202201/18666_1.jpg
         </div>
        </div>
        </div>
        
            <div class="slideshow-container"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide"><div class="content">
        <img alt="" src="https://src.hidoc.co.kr/image/lib/2021/6/25/1624609766377_0.jpg">
        </div>
        <div class="titleBox"><h2>푸쉬업</h2> <a class="dtext">상체 근력을 강화하세요!</a> </div>
        <div class="noneText">푸쉬업은 팔, 가슴, 어깨 근육을 강화하는 운동으로 유명합니다.
전신 근력 향상과 함께 코어 근육을 강화하여 체형을 유지하는 데 도움이 됩니다.
        </div>
         <div class="noneImg">
https://src.hidoc.co.kr/image/lib/2021/6/25/1624609766377_0.jpg
         </div>
        </div></div>
</div>
</div>
<div class="a"></div>
</div>
<!-- ------------------------- -->
<hr>
<h1>유산소</h1>
<div class="mainOverflowBox">
<div class="overflow">
        <div class="mainTextBox2">hi!!</div>
<div class="sportsAreaBox">

            <div class="slideshow-container2"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide2"><div class="content">
        <img alt="" src="https://cdn.mkhealth.co.kr/news/photo/202107/53962_55641_2245.jpg">
        </div>
        <div class="titleBox"><h2>러닝</h2> <a class="dtext">신진 대사 활성화!</a> </div>
        <div class="noneText">러닝은 유산소 운동의 대표적인 형태 중 하나입니다.
심폐 기능을 향상시키고 신진 대사를 활성화하는 데 효과적입니다.
        </div>
         <div class="noneImg">
https://cdn.mkhealth.co.kr/news/photo/202107/53962_55641_2245.jpg
         </div>
        </div></div>
        
            <div class="slideshow-container2"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide2"><div class="content">
        <img alt="" src="http://bike.chosun.com/site/data/img_dir/2019/09/20/2019092080176_0.jpg">
        </div>
        <div class="titleBox"><h2>사이클링</h2> <a class="dtext">하체 근육 강화와 유연성 향상!</a> </div>
        <div class="noneText">사이클링은 하체 근육을 강화하고 유연성을 향상시키는 운동입니다.
자전거를 타며 실내나 야외에서 즐길 수 있습니다.
        </div>
         <div class="noneImg">
http://bike.chosun.com/site/data/img_dir/2019/09/20/2019092080176_0.jpg
         </div>
        </div></div>
        
            <div class="slideshow-container2"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide2"><div class="content">
        <img alt="" src="https://health.chosun.com/site/data/img_dir/2022/05/09/2022050901783_0.jpg">
        </div>
        <div class="titleBox"><h2>수영</h2> <a class="dtext">전신 근육 강화와 스트레칭 효과!</a> </div>
        <div class="noneText">수영은 전신 근육을 강화하고 심폐 기능을 향상시키는데 효과적입니다.
물 속에서의 저항을 이용하여 운동을 할 수 있습니다.
        </div>
         <div class="noneImg">
https://health.chosun.com/site/data/img_dir/2022/05/09/2022050901783_0.jpg
         </div>
        </div></div>
        	
            <div class="slideshow-container2"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide2"><div class="content">
        <img alt="" src="https://postfiles.pstatic.net/20160202_271/ad1970_1454422485061MmS4h_JPEG/Spin_Cycle_Indoor_Cycling_Class_at_a_Gym.jpg?type=w2">
        </div>
        <div class="titleBox"><h2>스피닝</h2> <a class="dtext">강렬한 탄력과 유연성을 동시에!</a> </div>
<div class="noneText">스피닝은 고강도의 유산소 운동으로, 
전신을 효과적으로 강화하고 체지방을 태우는 데 도움이 됩니다.
또한 심혈관 기능을 향상시키는 데도 효과적입니다.
        </div>
         <div class="noneImg">
https://postfiles.pstatic.net/20160202_271/ad1970_1454422485061MmS4h_JPEG/Spin_Cycle_Indoor_Cycling_Class_at_a_Gym.jpg?type=w2         </div>
        </div></div>
        
            <div class="slideshow-container2"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide2"><div class="content">
        <img alt="" src="https://mblogthumb-phinf.pstatic.net/MjAyMDAzMDRfNyAg/MDAxNTgzMzAyNDc4NzEz.kDSCuKYYcsWIsdzxHYB6HPKfgz4rXFTKFPPgQ6owHCQg.rAfxIsIGnwb1gX3uO1rkKq2UV3qWXBa6fnvYBfXqAksg.JPEG.goodmanjay/rowing-machine.jpg?type=w800">
        </div>
        <div class="titleBox"><h2>로잉</h2> <a class="dtext">자연스럽고 균형잡힌 운동!</a> </div>
<div class="noneText">로잉은 상체와 하체 근육을 균형 있게 
발달시키는 데 도움이 되는 유산소 운동입니다.
또한 심혈관 기능을 향상시키고 체지방을 태우는 데 효과적입니다.
        </div>
         <div class="noneImg">
https://mblogthumb-phinf.pstatic.net/MjAyMDAzMDRfNyAg/MDAxNTgzMzAyNDc4NzEz.kDSCuKYYcsWIsdzxHYB6HPKfgz4rXFTKFPPgQ6owHCQg.rAfxIsIGnwb1gX3uO1rkKq2UV3qWXBa6fnvYBfXqAksg.JPEG.goodmanjay/rowing-machine.jpg?type=w800 
        </div>
        </div></div>
        
</div>
</div>
<div class="a2"></div>
</div>
<!-- ------------------------- -->
<hr>
<h1>근력</h1>
<div class="mainOverflowBox">
<div class="overflow">
        <div class="mainTextBox3">hi!!</div>
<div class="sportsAreaBox">

                  <div class="slideshow-container3"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide3"><div class="content">
        <img alt="" src="https://kr.imboldn.com/wp-content/uploads/2020/02/Fitness-Feb-2020-main.jpg">
        </div>
        <div class="titleBox"><h2>데드리프트</h2> <a class="dtext">전신을 강화하는 최고의 운동!</a> </div>
<div class="noneText">데드리프트는 등, 허벅지, 엉덩이 등 다양한 
근육을 발달시키는 데 효과적인 운동입니다.
올바른 자세를 유지하여 신체를 안전하게 강화하세요.
        </div>
         <div class="noneImg">
https://kr.imboldn.com/wp-content/uploads/2020/02/Fitness-Feb-2020-main.jpg
         </div>
        </div></div>
        
                    <div class="slideshow-container3"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide3"><div class="content">
        <img alt="" src="https://i.namu.wiki/i/hn97VmkI-_HR9BTYYUk2c2_6xGjAtSrq4Np_YFDZc6iCMl2XS0aJHc0biKXisn5CNQk5syOiQsPid7Cm96N9uQ.webp">
        </div>
        <div class="titleBox"><h2>벤치 프레스</h2> <a class="dtext">상체 근육을 강화하는 클래식한 운동!</a> </div>
<div class="noneText">데드리프트는 등, 허벅지, 엉덩이 등 다양한 
근육을 발달시키는 데 효과적인 운동입니다.
올바른 자세를 유지하여 신체를 안전하게 강화하세요.
        </div>
         <div class="noneImg">
https://i.namu.wiki/i/hn97VmkI-_HR9BTYYUk2c2_6xGjAtSrq4Np_YFDZc6iCMl2XS0aJHc0biKXisn5CNQk5syOiQsPid7Cm96N9uQ.webp
         </div>
        </div></div>
        
                    <div class="slideshow-container3"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide3"><div class="content">
        <img alt="" src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/5203688710/B.jpg?578000000">
        </div>
        <div class="titleBox"><h2>풀업</h2> <a class="dtext">등과 팔을 강화하는 운동!</a> </div>
        <div class="noneText" >풀업은 등과 팔근육을 강화하는 데 도움이 되는 운동입니다.
자신의 체중을 사용하여 최대한 높이 올라가는 것이 목표입니다.
        </div>
         <div class="noneImg">
https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/5203688710/B.jpg?578000000
         </div>
        </div></div>
        
                    <div class="slideshow-container3"> <!-- 운동 슬라이드 그룹에 대한 클래스 추가 -->
        <div class="slide3"><div class="content">
        <img alt="" src="https://vungtaulocalguide.com/wp-content/uploads/2023/04/2-2.jpg">
        </div>
        <div class="titleBox"><h2>레그 컬</h2> <a class="dtext">허벅지 후면을 강화하는 운동!</a> </div>
        <div class="noneText">레그 컬은 대퇴사두 후면을 강화하는 데 효과적인 운동입니다.
         안정된 자세로 기구를 사용하여 수행하세요.
        </div>
         <div class="noneImg">
https://vungtaulocalguide.com/wp-content/uploads/2023/04/2-2.jpg
         </div>
        </div></div>
</div>
</div>
<div class="a3"></div>
</div>
<!-- ------------------------- -->
</div><!-- <div id="main"> -->
</div><!-- <div id="warp"> -->
<script type="text/javascript">
$(function() {
    // 변수 초기화
    var isDragging = false; // 드래그 여부를 나타내는 플래그
    var isDragging2 = false;
    var isDragging3 = false;
    var startX, endX; // 드래그 시작과 끝 X 좌표
    var startX2, endX2;
    var startX3, endX3;
    var currentLeft = 0; // 현재 슬라이드 컨테이너의 left 값
    var currentLeft2 = 0;
    var currentLeft3 = 0;

    // 마우스 버튼이 눌렸을 때 이벤트 핸들러
    $(".slideshow-container").mousedown(function(event) {
    	console.log("a들어감");
        isDragging = true; // 드래그 상태 설정
        startX = event.pageX; // 드래그 시작 X 좌표 설정
        currentLeft = parseInt($("this").css("left")) || 0; // 현재 left 값을 가져옴
    });
    
    // 마우스 버튼이 눌렸을 때 이벤트 핸들러
    $(".slideshow-container2").mousedown(function(event) {
    	console.log("b들어감");
        isDragging2 = true; // 드래그 상태 설정
        startX2 = event.pageX; // 드래그 시작 X 좌표 설정
        currentLeft = parseInt($("this").css("left")) || 0; // 현재 left 값을 가져옴
    });
    
    // 마우스 버튼이 눌렸을 때 이벤트 핸들러
    $(".slideshow-container3").mousedown(function(event) {
    	console.log("b들어감");
        isDragging3 = true; // 드래그 상태 설정
        startX3 = event.pageX; // 드래그 시작 X 좌표 설정
        currentLeft = parseInt($("this").css("left")) || 0; // 현재 left 값을 가져옴
    });

    // 문서에서 마우스 버튼이 놓였을 때 이벤트 핸들러
    $(document).mouseup(function() {
        isDragging = false; // 드래그 상태 해제
        isDragging2 = false;
        isDragging3 = false;
    });

    // 문서에서 마우스가 이동할 때 이벤트 핸들러
    $(document).mousemove(function(event) {
        if (isDragging) { // 드래그 중일 때
            endX = event.pageX; // 드래그 끝 X 좌표 설정
            var moveX = endX - startX; // X 좌표 이동량 계산
            var newLeft = currentLeft + moveX; // 새로운 left 값 계산
            var containerWidth = $(".slideshow-container").width(); // 슬라이드 컨테이너의 너비
            var slideWidth =$(this).find(".slide").width(); // 슬라이드의 너비
            var maxLeft = 0; // left 값의 최대값
            var minLeft = -((slideWidth * $(this).find(".slide").length) - containerWidth); // left 값의 최소값
            $(this).css("background-color", "pink"); // 배경색을 파란색으로 변경

            // 새로운 left 값이 최대값과 최소값 사이에 있도록 보정
            newLeft = Math.min(maxLeft, Math.max(minLeft, newLeft));
            
        $(".slideshow-container").css("left", newLeft + "px"); // left 값을 적용하여 슬라이드 이동
        }
    });
    $(document).mousemove(function(event) {
    	if (isDragging2) { // 드래그 중일 때
            endX2 = event.pageX; // 드래그 끝 X 좌표 설정
            var moveX = endX2 - startX2; // X 좌표 이동량 계산
            var newLeft = currentLeft2 + moveX; // 새로운 left 값 계산
            var containerWidth = $(".slideshow-container2").width(); // 슬라이드 컨테이너의 너비
            var slideWidth =$(this).find(".slide2").width(); // 슬라이드의 너비
            var maxLeft = 0; // left 값의 최대값
            var minLeft = -((slideWidth * $(this).find(".slide2").length) - containerWidth); // left 값의 최소값
            $(this).css("background-color", "pink"); // 배경색을 파란색으로 변경

            // 새로운 left 값이 최대값과 최소값 사이에 있도록 보정
            newLeft = Math.min(maxLeft, Math.max(minLeft, newLeft));
        $(".slideshow-container2").css("left", newLeft + "px"); // left 값을 적용하여 슬라이드 이동
        }
    });
    $(document).mousemove(function(event) {
    	if (isDragging3) { // 드래그 중일 때
            endX3 = event.pageX; // 드래그 끝 X 좌표 설정
            var moveX = endX3 - startX3; // X 좌표 이동량 계산
            var newLeft = currentLeft3 + moveX; // 새로운 left 값 계산
            var containerWidth = $(".slideshow-container3").width(); // 슬라이드 컨테이너의 너비
            var slideWidth =$(this).find(".slide3").width(); // 슬라이드의 너비
            var maxLeft = 0; // left 값의 최대값
            var minLeft = -((slideWidth * $(this).find(".slide3").length) - containerWidth); // left 값의 최소값
            $(this).css("background-color", "pink"); // 배경색을 파란색으로 변경

            // 새로운 left 값이 최대값과 최소값 사이에 있도록 보정
            newLeft = Math.min(maxLeft, Math.max(minLeft, newLeft));
        $(".slideshow-container3").css("left", newLeft + "px"); // left 값을 적용하여 슬라이드 이동
        }
    });
});


$(document).ready(function() {
    $(".slideshow-container").click(function() {
        // 이미지 경로
//         var imagePath = '/resources/img/sports.jpg';
        var imagePath = $(this).find('.noneImg').text();
        // 선택된 슬라이드의 제목을 가져옴
        var title = $(this).find('.titleBox h2').text();
        var maintext = $(this).find('.noneText').text();
        
        // mainTextBox의 텍스트를 변경 ★
         var mainTextBox = $('.mainTextBox');
        mainTextBox.html("<h2>"+title + "</h2>" + maintext);
        
        // 배경 이미지 및 그라데이션 설정
        var gradient = 'linear-gradient(to right,  rgba(255,255,255,1), rgba(0,0,0,0)), ';
        var backgroundImage = gradient + 'url(' + imagePath + ')';
        // mainTextBox의 배경 이미지 설정
        $('.mainTextBox').css('background-image', backgroundImage);
        
        // .mainOverflowBox 내에서 mainTextBox와 a의 가시성을 토글
        $(this).closest('.mainOverflowBox').find('.mainTextBox').toggle();
        $(this).closest('.mainOverflowBox').find('.a').toggle();
    });
});
$(document).ready(function() {
    $(".slideshow-container2").click(function() {
        // 이미지 경로
//         var imagePath = '/resources/img/sports.jpg';
        var imagePath = $(this).find('.noneImg').text();
        // 선택된 슬라이드의 제목을 가져옴
        var title = $(this).find('.titleBox h2').text();
        var maintext = $(this).find('.noneText').text();
        
        // mainTextBox의 텍스트를 변경
         var mainTextBox = $('.mainTextBox2');
        mainTextBox.html("<h2>"+title + "</h2>" + maintext);
        
        // 배경 이미지 및 그라데이션 설정
        var gradient = 'linear-gradient(to right,  rgba(255,255,255,1), rgba(0,0,0,0)), ';
        var backgroundImage = gradient + 'url(' + imagePath + ')';
        // mainTextBox의 배경 이미지 설정
        $('.mainTextBox2').css('background-image', backgroundImage);
        
        // .mainOverflowBox 내에서 mainTextBox와 a의 가시성을 토글
        $(this).closest('.mainOverflowBox').find('.mainTextBox2').toggle();
        $(this).closest('.mainOverflowBox').find('.a2').toggle();
    });
});
$(document).ready(function() {
    $(".slideshow-container3").click(function() {
        // 이미지 경로
//         var imagePath = '/resources/img/sports.jpg';
        var imagePath = $(this).find('.noneImg').text();
        // 선택된 슬라이드의 제목을 가져옴
        var title = $(this).find('.titleBox h2').text();
        var maintext = $(this).find('.noneText').text();
        
        // mainTextBox의 텍스트를 변경
         var mainTextBox = $('.mainTextBox3');
        mainTextBox.html("<h2>"+title + "</h2>" + maintext);
        
        // 배경 이미지 및 그라데이션 설정
        var gradient = 'linear-gradient(to right,  rgba(255,255,255,1), rgba(0,0,0,0)), ';
        var backgroundImage = gradient + 'url(' + imagePath + ')';
        // mainTextBox의 배경 이미지 설정
        $('.mainTextBox3').css('background-image', backgroundImage);
        
        // .mainOverflowBox 내에서 mainTextBox와 a의 가시성을 토글
        $(this).closest('.mainOverflowBox').find('.mainTextBox3').toggle();
        $(this).closest('.mainOverflowBox').find('.a3').toggle();
    });
});

</script>
</body>
</html>
