<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Display Image</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${cp}/resources/js/MyInfoChange.js"></script>
</head>
<body>
	<!-- 현제 나의 img파일이 저장됨 -->
	<div id="myImg"></div>


	<!--  바꾸고싶은 이미지 파일 임시 출력 -->
	<div id="preview"></div>

	<!--  이미지 파일 서버로 전송 -->
	<form action="/myInfo/profile" enctype="multipart/form-data"	method="post">
		<input type="file" name="imageFile" accept="image/*" onchange="previewImage(event)"><br>
		${myInfo.getI_name()}<input name="I_name"><br>
		${myInfo.getI_email()}<input name="I_email" onchange="previewImage(event)"><br> 
		비밀번호찾기 질문 
		<select	class="passwordQuestion" id="I_pwFinding" name="I_pwFinding">
			<option value="1">질문을 넣어주세요</option>
			<option value="2">질문을 넣어주세요2</option>
			<option value="3">질문을 넣어주세요3</option>
		</select> 
		비밀번호찾기답 <input name="I_hint" onchange="previewImage(event)"><br>
		<input type="submit" value="이미지 업로드">
	</form>


</body>
</html>