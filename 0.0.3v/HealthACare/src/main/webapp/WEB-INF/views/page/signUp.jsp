<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${cp}/resources/signCommon.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="signUpBox">
		<a href="/"><img src="${cp}/resources/img/logo.png" alt="로고"
			class="image"></a>

		<div class="textBox">
			<a class="text1">회원가입</a>
			<form action="${cp}/page/createId" method="post">

				<!-- 회원정보 -->
				<div class="textBox">
					<div class="center">
						<a class="text2">회원정보</a> <a class="dot"> ·</a> 
						</div>
						<label for="U_id" class="text3">아이디</label> 
						<input id="userId" type="text" maxlength="20" name="U_id"> 
						<label id="checkText"></label>
						<label for="U_pw" class="text3">비밀번호</label> 
						<input id="userPw" type="password" maxlength="20" name="U_pw"> 
						<label id="checkTextPw"></label> 
						<label for="U_repw" class="text3">비밀번호확인</label>
						<input id="userRePw" type="password" maxlength="20" name="U_repw">
						<label id="checkRePw"></label>
					</div>

					<!-- 개인정보 -->
					<div class="textBox">
						<div class="center">
							<a class="text2">개인정보</a> <a class="dot"> ·</a>
						</div>
						<label for="birth" class="text3">생일</label>
						<div class="info" id="info__birth">
							<select class="box_a" id="birth-year">
								<option disabled selected>출생 연도</option>
							</select> 
							<select class="box_a" id="birth-month">
								<option disabled selected>월</option>
							</select> 
							<select class="box_a" id="birth-day">
								<option disabled selected>일</option>
							</select>
						</div>
						<label for="gender" class="text3">성별</label> 
						<select class="box" name="gender">
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select> 
						<label for="height" class="text3">키</label> 
						<input type="text" name="height"> 
						<label for="weight" class="text3">몸무게</label>
						<input type="text" name="weight"> 
						<label for="nickname" class="text3">닉네임</label> 
						<input type="text" name="nickname">
						<label for="email" class="text3">이메일</label>
						<div>
							<input class="ebox" id="email" type="text" /> 
							<a class="text4"> @ </a> 
							<input class="ebox" id="domain-txt" type="text" /> 
							<select class="ebox" id="domain-list">
								<option value="naver.com">naver.com</option>
								<option value="google.com">google.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="kakao.com">kakao.com</option>
							</select>
						</div>
						<label for="securityQuestion" class="text3">비밀번호찾기 질문</label> 
						<select class="passwordQuestion" id="question">
							<option value="q1">질문을 넣어주세요</option>
							<option value="q2">질문을 넣어주세요2</option>
						</select> 
						<input id="signUPBt" type="submit" value="회원가입">
					</div>
			</form>
		</div>
		<!-- textBox -->
	</div>
	<!-- signUpBox -->

	<script>
	//비활성화 상태로 두다가 조건이 다 맞아야 활성화하는 상태
	$(document).ready(function() {
	    // 회원가입 버튼
	    var signUpBtn = $("#signUPBt");
	    
	    // 초기에 버튼 비활성화
	    signUpBtn.prop("disabled", true);

	    // 아이디 입력 시
	    $("#userId").on("focusout", function() {
	        var id = $(this).val();
	        if (id === '' || id.length === 0) {
	            $("#checkText").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
	            checkSignUpButtonState();
	            return false;
	        }
	        
	        $.ajax({
	            url : '/page/ConfirmId',
	            data : { id : id },
	            type : 'POST',
	            dataType : 'json',
	            success : function(result) {
	                if (result == true) {
	                    $("#checkText").css("color", "green").text("사용 가능한 ID 입니다.");
	                } else {
	                    $("#checkText").css("color", "red").text("사용 불가능한 ID 입니다.");
	                    $("#id").val('');
	                    checkSignUpButtonState();
	                }
	            }
	        });

	        checkSignUpButtonState();
	    });

	    // 비밀번호 입력 시
	    $("#userPw, #userRePw").on("focusout", function() {
	        var pw = $("#userPw").val();
	        var rePw = $("#userRePw").val();
	        
	        if (pw === '' || pw.length === 0) {
	            $("#checkTextPw").css("color", "red").text("공백은 PW로 사용할 수 없습니다.");
	            checkSignUpButtonState();
	            return false;
	        }

	        if (pw.length < 8) {
	            $("#checkTextPw").css("color", "orange").text("8자 미만 비밀번호는 설정할 수 없습니다.");
	            checkSignUpButtonState();
	            return false;
	        }

	        $("#checkTextPw").css("color", "green").text("사용가능한 비밀번호입니다.");
	        checkSignUpButtonState();
	        
	        if (rePw !== '' && rePw.length !== 0) {
	            if (pw !== rePw) {
	                $("#checkRePw").css("color", "red").text("비밀번호가 일치하지 않습니다.");
	                checkSignUpButtonState();
	                return false;
	            }

	            $("#checkRePw").css("color", "green").text("비밀번호가 일치합니다.");
	            checkSignUpButtonState();
	        }
	    });

	    // 회원가입 버튼 상태 확인 함수
	    function checkSignUpButtonState() {
	        var idColor = $("#checkText").css("color");
	        var pwColor = $("#checkTextPw").css("color");
	        var rePwColor = $("#checkRePw").css("color");

	        if (idColor === "rgb(255, 0, 0)" || pwColor === "rgb(255, 0, 0)" || pwColor === "rgb(255, 165, 0)" || rePwColor === "rgb(255, 0, 0)") {
	            signUpBtn.prop("disabled", true);
	        } else {
	            signUpBtn.prop("disabled", false);
	        }
	    }
	});
	</script>

</body>
</html>