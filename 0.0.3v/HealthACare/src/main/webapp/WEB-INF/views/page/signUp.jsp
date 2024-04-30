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
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
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
							<select class="box_a" id="I_birthDate_y" name="I_birthDate_y">
								<option disabled selected>출생 연도</option>
							</select> 
							<select class="box_a" id="I_birthDate_m" name="I_birthDate_m">
								<option disabled selected>월</option>
							</select> 
							<select class="box_a" id="I_birthDate_d" name="I_birthDate_d">
								<option disabled selected>일</option>
							</select>
						</div>
						<label for="gender" class="text3">성별</label> 
						<select class="box" name="I_gender">
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select> 
						<label for="height" class="text3">키</label> 
						<input type="text" name="P_heightLog"> 
						<label for="weight" class="text3">몸무게</label>
						<input type="text" name="P_weightLog"> 
						<label for="nickname" class="text3">닉네임</label> 
						<input id="nickname" type="text" name="I_name">
						<label id="checkName"></label>
						<label for="email" class="text3">이메일</label>
						<div>
							<input class="ebox" id="email" name="email" type="text" /> 
							<a class="text4"><span id="middle">@</span></a> 
							<input class="ebox" id="domain-txt" type="text" /> 
							<select class="ebox" id="domain-list">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="google.com">google.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="kakao.com">kakao.com</option>
							</select>
							<!-- 타입 히든으로 넣고 앞에 인풋으로 들어간 입력들을 제이커리에서 합치는 기능 -->
							<input type="hidden" id="totalemail" name="I_email" value="">
							<br>
							<label id="checkEmail"></label>
						</div>
						<label for="securityQuestion" class="text3">비밀번호 찾기 질문</label> 
						<select class="passwordQuestion" id="I_pwFinding" name="I_pwFinding">
							<option value="1">질문입니다. 당신의 대답은?</option>
							<option value="2">학원 근처에서 가장 맛있었던 식당은?</option>
							<option value="3">학원에서 처음으로 갔던 단체회식 장소는?</option>
							<option value="4">수강하고 계신 수업에 가장 어려운 과목은?</option>
						</select> 
						<label for="QuestionAnswer" class="text3">비밀번호 찾기 답변</label>
						<input id="I_hint" name="I_hint" type="text" placeholder="답을 입력해주세요.">
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
	    // 회원가입 버튼(현재는 비활성화 상태)
	    var signUpBtn = $("#signUPBt");
	    
	    // 아이디 입력 시
	    $("#userId").on("focusout", function() {
	        var id = $(this).val();
	        if (id === '' || id.length === 0) {
	            $("#checkText").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
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
	                    $("#userId").val('');
	                }
	            }
	        });

	    });
	    
	    //닉네임 입력시
	    $("#nickname").on("focusout", function() {
	        var name = $(this).val();
	        console.log(name);
	        if (name === '' || name.length === 0) {
	            $("#checkName").css("color", "red").text("공백은 닉네임으로 사용할 수 없습니다.");
	            return false;
	        }
	        
	        $.ajax({
	            url : '/page/ConfirmName',
	            data : { name : name },
	            type : 'POST',
	            dataType : 'json',
	            success : function(result) {
	                if (result == true) {
	                    $("#checkName").css("color", "green").text("사용 가능한 닉네임 입니다.");
	                } else {
	                    $("#checkName").css("color", "red").text("사용 불가능한 닉네임 입니다.");
	                    $("#nickname").val('');
	                }
	            }
	        });
	     });

	    // 비밀번호 입력 시
	    $("#userPw, #userRePw").on("focusout", function() {
	        var pw = $("#userPw").val();
	        var rePw = $("#userRePw").val();
	        
	        if (pw === '' || pw.length === 0) {
	            $("#checkTextPw").css("color", "red").text("공백은 PW로 사용할 수 없습니다.");
	            return false;
	        }

	        if (pw.length < 8) {
	            $("#checkTextPw").css("color", "orange").text("8자 미만 비밀번호는 설정할 수 없습니다.");
	            return false;
	        }

	        $("#checkTextPw").css("color", "green").text("사용가능한 비밀번호입니다.");
	        
	        if (rePw !== '' && rePw.length !== 0) {
	            if (pw !== rePw) {
	                $("#checkRePw").css("color", "red").text("비밀번호가 일치하지 않습니다.");
	                return false;
	            }

	            $("#checkRePw").css("color", "green").text("비밀번호가 일치합니다.");
	        }
	    });

        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }

        // error 파라미터에서 오류 메시지 가져오기
        var errorMessage = getParameterByName('error');

        // 오류 메시지가 존재하면 알림창으로 표시
        if (errorMessage) {
            alert(errorMessage);
        }

	});
	
	// '출생 연도' 셀렉트 박스 option 목록 동적 생성 
	const birthYearEl = document.querySelector('#I_birthDate_y'); 
	// option 목록 생성 여부 확인
	isYearOptionExisted = false;
	birthYearEl.addEventListener('focus', function () {
	// year 목록 생성되지 않았을 때 (최초 클릭 시)
	if(!isYearOptionExisted) {
	isYearOptionExisted = true;
	for(var i = 1940; i <= 2023; i++) {
	// option element 생성
	const YearOption = document.createElement('option');
	YearOption.setAttribute('value', i);
	YearOption.innerText = i;
	// birthYearEl의 자식 요소로 추가 
	this.appendChild(YearOption); 
	} 
	} 
	 });
	 
	//'출생 월' 셀렉트 박스 option 목록 동적 생성 
	const birthMonthEl = document.querySelector('#I_birthDate_m'); 
	// option 목록 생성 여부 확인
	isMonthOptionExisted = false;
	birthMonthEl.addEventListener('focus', function () {
	// Month 목록 생성되지 않았을 때 (최초 클릭 시)
	if(!isMonthOptionExisted) {
	isMonthOptionExisted = true;
	for(var i = 1; i <= 12; i++) {
	// option element 생성
	const MonthOption = document.createElement('option');
	MonthOption.setAttribute('value', i);
	MonthOption.innerText = i;
	// birthMonthEl의 자식 요소로 추가 
	this.appendChild(MonthOption); 
	} 
	} 
	 });
	 
	//'출생 월' 셀렉트 박스 option 목록 동적 생성 
	const birthDayEl = document.querySelector('#I_birthDate_d'); 
	// option 목록 생성 여부 확인
	isDayOptionExisted = false;
	birthDayEl.addEventListener('focus', function () {
	// Day 목록 생성되지 않았을 때 (최초 클릭 시)
	if(!isDayOptionExisted) {
	isDayOptionExisted = true;
	for(var i = 1; i <= 31; i++) {
	// option element 생성
	const DayOption = document.createElement('option');
	DayOption.setAttribute('value', i);
	DayOption.innerText = i;
	// birthDayEl의 자식 요소로 추가 
	this.appendChild(DayOption); 
	} 
	} 
	 });

	 // 도메인 직접 입력 or domain option 선택 
	const domainListEl = document.querySelector('#domain-list');
	const domainInputEl = document.querySelector('#domain-txt');
	// select 옵션 변경 시
	 domainListEl.addEventListener('change', (event) => {
	// option에 있는 도메인 선택 시
	if(event.target.value !== "") {
	 // 선택한 도메인을 input에 입력하고 disabled 
	domainInputEl.value = event.target.value;
	domainInputEl.disabled = true;
	} else { // 직접 입력 시
	 // input 내용 초기화 & 입력 가능하도록 변경 
	 domainInputEl.value = " "; 
	 domainInputEl.disabled = false;
	 } 
	});	
	//db에 이메일 @ 도메인까지 전부 들어가게 만들어주는 에이젝스
	 $(document).ready(function() {
		    $("#email").blur(function(){
		        updateEmail();    
		    });

		    $("#domain-txt").change(function(){
		        updateEmail();    
		    });

		    $("#domain-list").change(function(){
		        updateEmail();    
		    });

		    function updateEmail() {
		        const email = $("#email").val();
		        const middle = $("#middle").text();
		        const address = $("#domain-txt").val();
		        if(email != "" && address != "") {
		            $("#totalemail").val(email + middle + address);
		            const totalemail =  email + middle + address
		            console.log(totalemail);
			        $.ajax({
			            url : '/page/ConfirmEmail',
			            data : { email : totalemail },
			            type : 'POST',
			            dataType : 'json',
			            success : function(result) {
			                if (result == true) {
			                    $("#checkEmail").css("color", "green").text("사용 가능한 이메일 입니다.");
			                } else {
			                    $("#checkEmail").css("color", "red").text("사용 불가능한 이메일 입니다.");
			                    $("#email").val('');
			                }
			            }
			        });
		        }
		    }
		});

	</script>

</body>
</html>