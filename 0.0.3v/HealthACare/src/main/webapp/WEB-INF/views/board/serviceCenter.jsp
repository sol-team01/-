<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<%-- <%@ page errorPage="/error/error404.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css"><!-- 기본 CSS -->
<link rel="stylesheet" href="${cp}/resources/serviceCenter.css">
<style>
</style>
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>

			<div class="topBox">
				<h1 class="title">
				문의하기
			</h1>
			</div>
			<!--div class="topBox"-->
			
		<div class="serviceCenterBackground">
			<div class="innerBox">
			<div class="textBox">
				<a class="text"> 문의유형 </a>
				<select id="question">
        		<option value="0">운동관련</option>
        		<option value="1">칼로리관련</option>
       			<option value="2">게시판관련</option>
        		<option value="3">졸려요</option>
  		 	 </select>
			</div>
            <!-- <div class="textBox"> -->
            
			<div class="textBoxa">
			    <a class="texta">**** 제목은 50자 이내로 써주세요 ****</a>
			</div>
			<!-- <div class="textBoxa"> -->
			
			<div class="textBox">
				<a class="text"> 문의제목 </a>
				<input type="text" placeholder="제목을 작성해주세요" maxlength="50">
			</div>
			<!-- <div class="textBox"> -->
			<div class="textBox">
				<a class="text"> 문의내용 </a>
				<textarea placeholder="문의하실 내용과 답변 받으실 연락처도 적어주세요"></textarea>
			</div>
  		 	<!-- <div class="textBox"> --> 
  		 	<div class="buttonBox">
  		 	<button id="button">문의하기</button>
  		 	</div>
  		 	<!-- <div class="buttonBox"> -->
  		 	
			</div>
			<!--<div class="innerBox">-->
		</div>
		<!--div class="serviceCenterBackground"-->
</div>
<!-- <div id="main"> -->
</div>
<!-- <div id="warp"> -->

<script>
    $(document).ready(function() {
        $("#button").click(function() {
            // 여기에 문의하기 버튼 클릭 시의 동작을 추가합니다.
            // 예시로는 홈페이지로 돌아가고 알림창을 띄우는 기능을 구현했습니다.
            alert("등록되었습니다.");
            window.location.href = "/"; // 홈페이지로 돌아가는 코드
        });
    });
</script>

</body>
</html>