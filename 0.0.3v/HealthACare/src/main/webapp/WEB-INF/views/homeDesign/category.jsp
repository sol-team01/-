<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css"><!-- 기본 CSS -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="Category">
	<a href="/">
	
	<div id="imgbox">
	<img  src="${cp}/resources/img/logo.png" alt="로고">
	</div>
	</a>
	<div id="customSelect">
  <div class="SelectHealth">운동</div>
  <div class="select-itemsHealth">
    <div><a href="#" class="howToHealth">운동 하는 방법</a></div>
    <div><a href="${cp}/board/challengeBoard">오늘 운동 완료</a></div>
    <div><a href="${cp}/board/eventBoard">이벤트</a></div>
  </div>
  </div>
  	<div id="customSelect">
    <div class="SelectFood">식단</div>
  	<div class="select-itemsFood">
    <div><a href="${cp}/food/calorieCounting">칼로리 계산</a></div>
    <div><a href="${cp}/food/list">식품 영양 정보</a></div>
    <div><a href="${cp}/board/bestFoodBoard">질병 당 추천 음식</a></div>
  	</div>
	</div>
  	<div id="customSelect">
    <div class="SelectDisease">질병</div>
  	<div class="select-itemsDisease">
  	<div><a href="https://www.kdca.go.kr/">질병관리청 바로가기</a></div>
  	</div>
	</div>
  	<div class="SelecNone"><a href="${cp}/board/serviceCenter">고객지원</a></div> 
<script>
	$(document).ready(function(){ //운동 카테고리 버튼
	  // 셀렉트 박스를 클릭했을 때 이벤트 처리
	  $("#customSelect .SelectHealth").click(function(event) {
	    // 다른 열려 있는 셀렉트 박스들을 닫음
	    $(".select-itemsHealth").toggleClass("select-show");
	  });
	  // 문서의 어느 곳을 클릭하든 셀렉트 박스가 닫히지 않도록 설정
	  $(document).on("click", function(event) {
	    if (!$(event.target).closest("#customSelect").length) {
	//       $(".select-itemsHealth").removeClass("select-show");
	    }
	  });
	});
	
	$(document).ready(function(){ //식단 카테고리 버튼
		  // 셀렉트 박스를 클릭했을 때 이벤트 처리
		  $("#customSelect .SelectFood").click(function(event) {
		    // 다른 열려 있는 셀렉트 박스들을 닫음
		    $(".select-itemsFood").toggleClass("select-show");
		  });
		  // 문서의 어느 곳을 클릭하든 셀렉트 박스가 닫히지 않도록 설정
		  $(document).on("click", function(event) {
		    if (!$(event.target).closest("#customSelect").length) {
		    }
		  });
		});
	$(document).ready(function(){ //질병 카테고리 버튼
		  // 셀렉트 박스를 클릭했을 때 이벤트 처리
		  $("#customSelect .SelectDisease").click(function(event) {
		    // 다른 열려 있는 셀렉트 박스들을 닫음
		    $(".select-itemsDisease").toggleClass("select-show");
		  });
		  // 문서의 어느 곳을 클릭하든 셀렉트 박스가 닫히지 않도록 설정
		  $(document).on("click", function(event) {
		    if (!$(event.target).closest("#customSelect").length) {
		    }
		  });
		
	});

	$(document).ready(function() {
	    console.log("ajax 사용중");
	    
	    $('.howToHealth').click(function() {
	       const options = 'width=700, height=600, top=50, left=50, scrollbars=yes';
	       var cp = "${cp}";
	       $.ajax({
	          type: 'GET',
	          url: '/checkSession',
	          success: function(data){
	             console.log(data);
	             var isSessionValid = $(data).find('Boolean').text();
	             console.log(isSessionValid);
	             if (isSessionValid === 'true') {
	                window.location.href = cp + "/sports/howtoSports";
	             } else {
	                window.open(cp + '/page/login','_blank',options);
	             }
	          },
	          error: function(xhr, status, error) {
	             console.log('AJAX 요청 실패')   
	          }
	       });
	    });
	 });
</script>

</div><!-- <div id="Category"> -->
</body>
</html>