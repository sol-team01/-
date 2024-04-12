<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="${cp}/resources/js/MyInfoChange.js"></script>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<link rel="stylesheet" href="${cp}/resources/myInfoChange.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.2.0/chartjs-plugin-datalabels.min.js"
	integrity="sha512-JPcRR8yFa8mmCsfrw4TNte1ZvF1e3+1SdGMslZvmrzDYxS69J7J49vkFL8u6u8PlPJK+H3voElBtUCzaXj+6ig=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body id="BG">
<div id="warp">
<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
<div id="main">
<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>	
<!-- 아래부터 작업하세요 -->
	<form   action="/myInfo/profile" enctype="multipart/form-data"	method="post">
	<div class="mainTitle">나의 정보 수정하기</div>
	<hr>
	<div class="contentIndex">
	<div class="contentText">프로필 이미지</div>
	<div>
		<div class="contentPimgLayout">
			<!-- 현제 나의 img파일이 저장됨 -->
			<div class="contentPimgImgLayout">
			<div class="a">
				<div class="myImg"></div>
			</div>
				<div class="textBox">현재 프로필</div>	
			</div>
			<!--  바꾸고싶은 이미지 파일 임시 출력 -->
			<div class="contentPimgImgLayout">
				<div id="preview"></div>
				<div class="textBox">바뀐 프로필</div>	
			</div>
		</div>
		<!--  이미지 파일 서버로 전송 -->
		<input type="file" name="imageFile" accept="image/*" onchange="previewImage(event)">
	</div>
	</div>
	<div class="contentIndex">
	<div class="contentText">닉네임</div>
		<input name="I_name" value="${myInfo.getI_name()}">
	</div>
	<div class="contentIndex">
	<div class="contentText">이메일</div>
		<div class="contentTEXTLayout">
		<a class="text">${myInfo.getI_email()}</a>
		<input name="I_email" onchange="previewImage(event)">
		</div>
	</div>
	<div class="contentIndex">
	<div class="contentText">비밀번호 재설정</div>
		<a href="${cp}/page/resetPw?U_no=${myInfo.getU_no()}">비밀번호 바꾸기</a>
	</div>
	<div class="contentIndex">
	<div class="contentText">비밀번호 찾기 질의</div>
		<div class="contentTEXTLayout">
		<select	class="passwordQuestion" id="I_pwFinding" name="I_pwFinding">
			<option value="1">질문입니다. 당신의 대답은?</option>
			<option value="2">학원 근처에서 가장 맛있었던 식당은?</option>
			<option value="3">학원에서 처음으로 갔던 단체회식 장소는?</option>
			<option value="4">수강하고 계신 수업에 가장 어려운 과목은?</option>
		</select>
			<a class="text">정답 바꾸기</a>
			<input name="I_hint" onchange="previewImage(event)">
		</div> 
	</div>
<!-- 		<input type="submit" value="이미지 업로드" > -->
	<div class="contentIndex">
	<div class="submitLayout"></div>
		<input id="signUPBt" type="submit" value="수정하기">
	</div>
	</form>
	
<!-- 	위에까지 작업하세요 -->
		</div>
		<!-- <div id="main"> -->
	</div>
	<!-- <div id="warp"> -->
	<script>
	window.onload = function() {
	    var contentTexts = document.querySelectorAll('.contentText');
	    var contentIndexes = document.querySelectorAll('.contentIndex');
	    for (var i = 0; i < contentTexts.length; i++) {
	        contentTexts[i].style.height = getComputedStyle(contentIndexes[i]).height;
	    }
	}

</script>
</body>
</html>