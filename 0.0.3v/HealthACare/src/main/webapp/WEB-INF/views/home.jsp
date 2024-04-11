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
	<div class="Banner">
	<a class="title">웨이트 트레이닝 순서, 근력운동 순서는?</a>
	<a class="text">by hanClass</a>
	</div>
	<div id="optionTitle">
	<div class="choiceTitleList">리스트로 보기</div>
	<div class="choiceTitleYotube">영상으로 보기</div>
	</div>
	<div id="midAlign">
	<div id="listBox">
	<!-- 최신 공지사항 출력 2개까지만 -->
<<<<<<< HEAD
 	<c:forEach var="board" items="${boardNoticeHomeList}" begin="0" end="1" varStatus="status">
		<div class="list" id="noticeList0${status.count}">
=======
 	<div id="notice">
 	<c:forEach var="board" items="${boardNoticeHomeList}" begin="0" end="1">
		<div class="list">
>>>>>>> 72d67c75a2adedf4c36c89dd7eb06bd42e44e0c8
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
			<c:forEach var="popular" items="${boardPopularPost}" begin="1" end="10" varStatus="status">
			    <div class="realText">
			        <div class="numBox">
			            <div class="num">${status.count}</div>
			            ${popular.b_title} 🧡
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
	  			  	${theme.t_name}🧡
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
	
</script>
</body>
</html>
