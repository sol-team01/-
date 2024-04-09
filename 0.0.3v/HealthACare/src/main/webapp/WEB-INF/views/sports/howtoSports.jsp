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
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
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
<h1>운동 어쩌구</h1>
<div class="mainOverflowBox">
<div class="overflow">
		  <div class="mainTextBox">hi!!</div>
<div class="sportsAreaBox">

		<div class="slideshow-container">
		  <div class="slide"><div class="content">
		  <img alt="" src="/resources/img/sports.jpg">
		  </div>
		  <div class="titleBox"><h2>제목</h2> 소개 </div>
		  </div></div>
		  
		<div class="slideshow-container">
		  <div class="slide"><div class="content">
		  <img alt="" src="/resources/img/sports.jpg">
		  </div>
		  <h2>제목</h2>
		  소개
		  </div></div>

		<div class="slideshow-container">
		  <div class="slide"><div class="content">
		  <img alt="" src="/resources/img/sports.jpg">
		  </div>
		  <h2>제목</h2>
		  소개
		  </div></div>
		  
		<div class="slideshow-container">
		  <div class="slide"><div class="content">
		  <img alt="" src="/resources/img/sports.jpg">
		  </div>
		  <h2>제목</h2>
		  소개
		  </div></div>

		<div class="slideshow-container">
		  <div class="slide"><div class="content">
		  <img alt="" src="/resources/img/sports.jpg">
		  </div>
		  <h2>제목</h2>
		  소개
		  </div></div>
		  
		<div class="slideshow-container">
		  <div class="slide"><div class="content">
		  <img alt="" src="/resources/img/sports.jpg">
		  </div>
		  <h2>제목</h2>
		  소개
		  </div></div>
</div>
</div>
<div class="a"></div>
</div>
<!-- ------------------------- -->
<hr>
<h1>운동 어쩌구</h1>
<div class="mainOverflowBox">
<div class="overflow">
		  <div class="mainTextBox">hi!!</div>
<div class="sportsAreaBox">

		<div class="slideshow-container">
		  <div class="slide"><div class="content">
		  <img alt="" src="/resources/img/sports.jpg">
		  </div>
		  <div class="titleBox"><h2>제목</h2> 소개 </div>
		  </div></div>
		  
		<div class="slideshow-container">
		  <div class="slide"><div class="content">
		  <img alt="" src="/resources/img/sports.jpg">
		  </div>
		  <h2>제목</h2>
		  소개
		  </div></div>

		<div class="slideshow-container">
		  <div class="slide"><div class="content">
		  <img alt="" src="/resources/img/sports.jpg">
		  </div>
		  <h2>제목</h2>
		  소개
		  </div></div>
		  
		<div class="slideshow-container">
		  <div class="slide"><div class="content">
		  <img alt="" src="/resources/img/sports.jpg">
		  </div>
		  <h2>제목</h2>
		  소개
		  </div></div>

		<div class="slideshow-container">
		  <div class="slide"><div class="content">
		  <img alt="" src="/resources/img/sports.jpg">
		  </div>
		  <h2>제목</h2>
		  소개
		  </div></div>
		  
		<div class="slideshow-container">
		  <div class="slide"><div class="content">
		  <img alt="" src="/resources/img/sports.jpg">
		  </div>
		  <h2>제목</h2>
		  소개
		  </div></div>
</div>
</div>
<div class="a"></div>
</div>
</div><!-- <div id="main"> -->
</div><!-- <div id="warp"> -->
<script type="text/javascript">
$(function() {
    var isDragging = false;
    var startX, endX;
    var currentLeft = 0;

    $(".slideshow-container").mousedown(function(event) {
        isDragging = true;
        startX = event.pageX;
        currentLeft = parseInt($(".slideshow-container").css("left")) || 0;
    });

    $(document).mouseup(function() {
        isDragging = false;
    });

    $(document).mousemove(function(event) {
        if (isDragging) {
            endX = event.pageX;
            var moveX = endX - startX;
            var newLeft = currentLeft + moveX;
            var containerWidth = $(".slideshow-container").width();
            var slideWidth = $(".slide").width();
            var maxLeft = 0;
            var minLeft = -((slideWidth * $(".slide").length) - containerWidth);

            newLeft = Math.min(maxLeft, Math.max(minLeft, newLeft));
            $(".slideshow-container").css("left", newLeft + "px");
        }
    });
});

// $(document).ready(function() {
//     $(".slideshow-container").click(function() {
//         $(".mainTextBox").toggle();
//         $(".a").toggle();
//     });

$(document).ready(function() {
    $(".slideshow-container").click(function() {
        $(this).closest('.mainOverflowBox').find('.mainTextBox').toggle();
        $(this).closest('.mainOverflowBox').find('.a').toggle();
    });
});
</script>
</body>
</html>
