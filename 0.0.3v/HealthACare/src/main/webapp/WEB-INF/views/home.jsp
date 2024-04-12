<!-- --------------------------------------------------------------- -->
<!-- 
0.0.0v - 팀프로젝트 시작
0.0.1v - 기본 jsp, 로그인 백엔드 작업 시작, api 연결
0.0.2v - 상세 jsp css, 로그인 1차 구현
0.0.3v - 게시판, 메인, 로그인 회원가입 CSS 구현 / DB연결 버그 해결
		  	 로그인 및 회원가입 백엔드 기본 구현
		  	 이미지 업로드 및 다운로드 구현 / MY페이지 백엔드 작업 중
 -->
<!-- --------------------------------------------------------------- -->
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ${fn:substring(popular.b_title,0,5)}에 사용하기 위해 필요한 스크립트(제목 글자수 제한 출력) -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<%-- <%@ page errorPage="/error/error404.jsp" %> --%>
<html>
<head>
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<style>
</style>
</head>
<body>
<div id="warp">
<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
<div id="main">
<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>			
<!-- 여기에서 작업하세요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<div id="title">Trending categries</div>
	<div id="buttonZONE">
		<a href="#" class="howToHealth">운동 하는 방법</a>
		<a href="${cp}/board/noticeBoard">게시판</a>
		<a>고객지원</a>
	</div>
	
	<div class="s-container">
    <button class="prev-btn"><img alt="" src="${cp}/resources/img/leftarrow.png"> </button>
    <div class="s">
<%--         <img src="${cp}/resources/img/bell.png" alt="Slide 1"> --%>
	<div class="Banner" onclick="redirectToPage('http://localhost:8080/board/readBoard?B_no=9')">
	<a class="title">웨이트 트레이닝 순서, 근력운동 순서는?</a>
	<a class="text">by hanClass</a>
	</div>
    </div>
    <div class="s">
	<div class="Banner" onclick="redirectToPage('http://localhost:8080/board/readBoard?B_no=9')">
	<a class="title">ghd</a>
	<a class="text">by hanClass</a>
	</div>
    </div>
    <div class="s">
	<div class="Banner" onclick="redirectToPage('http://localhost:8080/board/readBoard?B_no=9')">
	<a class="title">42141412</a>
	<a class="text">by hanClass</a>
	</div>
    </div>
    <button class="next-btn"><img alt="" src="${cp}/resources/img/rightarrow.png"> </button>
</div>

	<div id="optionTitle">
	<div class="choiceTitleList">리스트로 보기</div>
	<div class="choiceTitleYotube">영상으로 보기</div>
	</div>
	<div id="midAlign">
	<div id="listBox">
	<!-- 최신 공지사항 출력 2개까지만 -->
 	<div id="notice">
	 	<c:forEach var="board" items="${boardNoticeHomeList}" begin="0" end="1" varStatus="status">
				<div class="list" id="noticeList0${status.count}">
					<form action="${cp}/board/readBoard" method="get">
						<div onclick="location.href='${cp}/board/readBoard?B_no=${board.b_no}'">
						<div class="top">
							<a class="subtext"> ${board.b_datetime}</a>
							<div class="subTextBox">${board.b_category}</div>
						</div>
						<div class="bottom">
							<a class="title">${board.b_title}  </a>
							작성자 : ${board.i_name} &nbsp;&nbsp; 댓글수:[${board.b_replyCount}]
						</div>
						</div>
					</form>
				</div>
		</c:forEach>
	</div>
	
	<!-- 최신 글 출력 4개까지만 -->
			<c:forEach var="board" items="${boardReadHomeList}" begin="0" end="3" varStatus="status">
				<div class="list" id="commonList0${status.count}">
					<form action="${cp}/board/readBoard" method="get">
					    <div onclick="location.href='${cp}/board/readBoard?B_no=${board.b_no}'">
						<div class="top">
							<a class="subtext"> ${board.b_datetime}</a>
							<div class="subTextBox">${board.b_category}</div>
						</div>
						<div class="bottom">
							<a class="title">${board.b_title}  </a>
							작성자 : ${board.i_name} &nbsp;&nbsp; 댓글수:[${board.b_replyCount}]
						</div>
						</div>
					</form> 
				</div>
			</c:forEach>
		
	</div>
	
		<script type="text/javascript">
		function redirectToPage(url) {
		    window.location.href = url;
		}
		
		let currentSlide = 0;
		const slides = document.querySelectorAll('.s');
		const totalSlides = slides.length;
		let intervalId; // 자동 전환을 위한 interval ID

		function showSlide(n) {
		    slides.forEach(slide => {
		        slide.style.display = 'none';
		    });
		    slides[n].style.display = 'block';
		}

		function nextSlide() {
		    currentSlide = (currentSlide + 1) % totalSlides;
		    showSlide(currentSlide);
		}

		function prevSlide() {
		    currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
		    showSlide(currentSlide);
		}

		// 다음 슬라이드 보여주기 함수를 일정 시간 간격으로 호출하는 함수
		function startAutoSlide() {
		    intervalId = setInterval(nextSlide, 5000); // 5초마다 다음 슬라이드로 전환
		}

		// 슬라이드를 수동으로 이동하면 자동 전환을 멈추는 함수
		function stopAutoSlide() {
		    clearInterval(intervalId);
		}

		// 초기 슬라이드 보여주기 및 자동 전환 시작
		showSlide(currentSlide);
		startAutoSlide();

		// 다음 버튼 클릭 시 다음 슬라이드 보여주기
		document.querySelector('.next-btn').addEventListener('click', () => {
		    nextSlide();
		    stopAutoSlide(); // 슬라이드를 수동으로 전환할 때 자동 전환 중지
		});

		// 이전 버튼 클릭 시 이전 슬라이드 보여주기
		document.querySelector('.prev-btn').addEventListener('click', () => {
		    prevSlide();
		    stopAutoSlide(); // 슬라이드를 수동으로 전환할 때 자동 전환 중지
		});
		
		

		$(document).ready(function() {
			var noticeListContent01 = $("#noticeList01").html();
			var noticeListContent02 = $("#noticeList02").html();
			var commonListContent01 = $("#commonList01").html();
			var commonListContent02 = $("#commonList02").html();
			var commonListContent03 = $("#commonList03").html();
			var commonListContent04 = $("#commonList04").html();
			
		    $(".choiceTitleYotube").click(function() {
		        // '영상으로 보기' 버튼이 클릭되었을 때 실행되는 코드

		        // list 영역의 내용을 변경합니다.
		        $("#noticeList01").each(function() {
		        	$(this).html('<c:forEach var="Basic" items="${YoutubeDtoBasic0 }" ><iframe id="ytplayer" type="text/html" width="415" height="190"src="https://www.youtube.com/embed/${Basic}"frameborder="0" allowfullscreen></iframe></c:forEach>');
		        });
		        $("#noticeList02").each(function() {
		        	$(this).html('<c:forEach var="Basic" items="${YoutubeDtoBasic1 }" ><iframe id="ytplayer" type="text/html" width="415" height="190"src="https://www.youtube.com/embed/${Basic}"frameborder="0" allowfullscreen></iframe></c:forEach>');
		        });
		        $("#commonList01").each(function() {
		        	$(this).html('<c:forEach var="Basic" items="${YoutubeDtoBasic2 }" ><iframe id="ytplayer" type="text/html" width="415" height="190"src="https://www.youtube.com/embed/${Basic}"frameborder="0" allowfullscreen></iframe></c:forEach>');
		        });
		        $("#commonList02").each(function() {
		        	$(this).html('<c:forEach var="Basic" items="${YoutubeDtoBasic3 }" ><iframe id="ytplayer" type="text/html" width="415" height="190"src="https://www.youtube.com/embed/${Basic}"frameborder="0" allowfullscreen></iframe></c:forEach>');
		        });
		        $("#commonList03").each(function() {
		        	$(this).html('<c:forEach var="Basic" items="${YoutubeDtoBasic4 }" ><iframe id="ytplayer" type="text/html" width="415" height="190"src="https://www.youtube.com/embed/${Basic}"frameborder="0" allowfullscreen></iframe></c:forEach>');
		        });
		        $("#commonList04").each(function() {
		        	$(this).html('<c:forEach var="Basic" items="${YoutubeDtoBasic5 }" ><iframe id="ytplayer" type="text/html" width="415" height="190"src="https://www.youtube.com/embed/${Basic}"frameborder="0" allowfullscreen></iframe></c:forEach>');
		        });
		        $(".choiceTitleList").each(function() {
		        	$(this).css('color', '#D0D0D2');
		        });
		        $(this).css('color', 'black');
		    });

		    // '리스트로 보기' 버튼 클릭 시 리스트 영역의 내용을 다시 원래대로 보여주는 코드
		    $(".choiceTitleList").click(function() {
		        // '리스트로 보기' 버튼이 클릭되었을 때 실행되는 코드

		        // list 영역의 내용을 기존의 내용으로 변경합니다.
		        $("#noticeList01").each(function() {
		        	$(this).html(noticeListContent01);
		        });
		        
		        $("#noticeList02").each(function() {
		        	$(this).html(noticeListContent02);
		        });
		        
		        $("#commonList01").each(function() {
		        	$(this).html(commonListContent01);
		        });
		        
		        $("#commonList02").each(function() {
		        	$(this).html(commonListContent02);
		        });
		        
		        $("#commonList03").each(function() {
		        	$(this).html(commonListContent03);
		        });
		        
		        $("#commonList04").each(function() {
		        	$(this).html(commonListContent04);
		        });
		        
		        $(".choiceTitleYotube").each(function() {
		        	$(this).css('color', '#D0D0D2');
		        });
		        $(this).css('color', 'black');
		    });
		});
		</script>
	
		<div id="rankingBox">
		
		<div class="realTime">	
		<div class="realTitle">실시간 인기글</div>
			<div class="realTextBox">
			<c:forEach var="popular" items="${boardPopularPost}" begin="0" end="6" varStatus="status">
			    <div class="realText">
			        <div class="numBox">
			            <div class="num">${status.count}</div>
			            <!-- ${fn:substring(popular.b_title,0,5)}🧡 인기글에 제목을 5글자로 만 제한하는 el 명령문 -->
			            <a href="${cp}/board/readBoard?B_no=${popular.b_no}">${fn:substring(popular.b_title,0,5)}</a>
			        </div>
			    </div>
			</c:forEach>
			</div>
		</div>
		
	
		<div class="realTime">	
		<div class="realTitle">실시간 인기 주제</div>
			<div class="realTextBox">
			<c:forEach var="theme" items="${realTime}" begin="0" end="2" varStatus="status">
				<div class="realText">
	  			  <div class="numBox">
	  			  	<div class="num">${status.count}</div>
	  			  	${theme.t_name}
	  			  </div>
				</div>
  			  </c:forEach>
			</div></div>
		</div><!-- 	<div id="rankingBox"> -->
</div>
<div id="store"></div>
</div><!-- <div id="main"> -->
</div><!-- <div id="warp"> -->

<script>
$(document).ready(function()
</script>
</body>
</html>
