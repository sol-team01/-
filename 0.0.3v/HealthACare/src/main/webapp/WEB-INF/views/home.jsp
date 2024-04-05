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
	<div class="list" id="list00">
		<div class="top">
			<a class="subtext"> 18, Thursday</a>
			<div class="subTextBox">Few tickets </div>
		</div>
		<div class="bottom">
			<a class="title">Memory day of Boris Ryzhiy  </a>
			Octover 18, Thursday
		</div>  
	</div>
	 <div class="list" id="list01">
			<div class="top">
			<a class="subtext"> 18, Thursday</a>
			<div class="subTextBox">Few tickets </div>
		</div>
		<div class="bottom">
			<a class="title">Memory day of Boris Ryzhiy  </a>
			Octover 18, Thursday
		</div>  
	</div>
	 <div class="list" id="list02">
			<div class="top">
			<a class="subtext"> 18, Thursday</a>
			<div class="subTextBox">Few tickets </div>
		</div>
		<div class="bottom">
			<a class="title">Memory day of Boris Ryzhiy  </a>
			Octover 18, Thursday
		</div>  
	</div>
	 <div class="list" id="list03">
			<div class="top">
			<a class="subtext"> 18, Thursday</a>
			<div class="subTextBox">Few tickets </div>
		</div>
		<div class="bottom">
			<a class="title">Memory day of Boris Ryzhiy  </a>
			Octover 18, Thursday
		</div>  
	</div>
	 <div class="list" id="list04">
			<div class="top">
			<a class="subtext"> 18, Thursday</a>
			<div class="subTextBox">Few tickets </div>
		</div>
		<div class="bottom">
			<a class="title">Memory day of Boris Ryzhiy  </a>
			Octover 18, Thursday
		</div>  
	</div>
	 <div class="list" id="list05">
			<div class="top">
			<a class="subtext"> 18, Thursday</a>
			<div class="subTextBox">Few tickets </div>
		</div>
		<div class="bottom">
			<a class="title">Memory day of Boris Ryzhiy  </a>
			Octover 18, Thursday
		</div>  
	</div>
	</div>
	
		<script type="text/javascript">
		$(document).ready(function() {
		    $(".choiceTitleYotube").click(function() {
		        // '영상으로 보기' 버튼이 클릭되었을 때 실행되는 코드

		        // list 영역의 내용을 변경합니다.
		        $("#list00").each(function() {
		        	$(this).html('<c:forEach var="Basic" items="${YoutubeDtoBasic0 }" ><iframe id="ytplayer" type="text/html" width="415" height="190"src="https://www.youtube.com/embed/${Basic}"frameborder="0" allowfullscreen></iframe></c:forEach>');
		        });
		        $("#list01").each(function() {
		        	$(this).html('<c:forEach var="Basic" items="${YoutubeDtoBasic1 }" ><iframe id="ytplayer" type="text/html" width="415" height="190"src="https://www.youtube.com/embed/${Basic}"frameborder="0" allowfullscreen></iframe></c:forEach>');
		        });
		        $("#list02").each(function() {
		        	$(this).html('<c:forEach var="Basic" items="${YoutubeDtoBasic2 }" ><iframe id="ytplayer" type="text/html" width="415" height="190"src="https://www.youtube.com/embed/${Basic}"frameborder="0" allowfullscreen></iframe></c:forEach>');
		        });
		        $("#list03").each(function() {
		        	$(this).html('<c:forEach var="Basic" items="${YoutubeDtoBasic3 }" ><iframe id="ytplayer" type="text/html" width="415" height="190"src="https://www.youtube.com/embed/${Basic}"frameborder="0" allowfullscreen></iframe></c:forEach>');
		        });
		        $("#list04").each(function() {
		        	$(this).html('<c:forEach var="Basic" items="${YoutubeDtoBasic4 }" ><iframe id="ytplayer" type="text/html" width="415" height="190"src="https://www.youtube.com/embed/${Basic}"frameborder="0" allowfullscreen></iframe></c:forEach>');
		        });
		        $("#list05").each(function() {
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
		        $(".list").each(function() {
		            $(this).html('<div class="top"><a class="subtext"> 18, Thursday</a><div class="subTextBox">Few tickets </div></div><div class="bottom"><a class="title">Memory day of Boris Ryzhiy  </a>Octover 18, Thursday</div>');
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
		<div class="realTitle">실시간 인기 주제</div>
			<div class="realTextBox">
			<c:forEach var="i" begin="1" end="10">
  			  <div class="realText">
  			  <div class="numBox"><div class="num">${i}</div> 가나다</div>🧡
  			  </div>
  			  </c:forEach>
			</div>
		</div>
		<div class="realTime">	
		<div class="realTitle">실시간 인기글</div>
			<div class="realTextBox">
			<c:forEach var="i" begin="1" end="3">
  			  <div class="realText">
  			  <div class="numBox"><div class="num">${i}</div> 가나다</div>🧡
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
