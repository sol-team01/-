<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<form action="${cp}/page/createId" method="post">
아이디 입력: <input id="userId" type="text" maxlength="20" name="U_id">
<br>
<label id="checkText"></label>
<br>
비밀번호 입력: <input id="userPw" type="password" maxlength="20" name="U_pw">
<br>
<label id="checkTextPw"></label>
<br>
비밀번호 확인: <input id="userRePw" type="password" maxlength="20" name="U_repw">
<br>
<label id="checkRePw"></label>
<br>
<input type="submit" value="회원가입">

<script>
//활성화 유지 상태로 조건 안맞으면 비활성화
$(document).ready(function() {
    // 회원가입 버튼
    var signUpBtn = $("input[type='submit']");

    // 아이디 입력 시
    $("#userId").on("focusout", function() {
        var id = $("#userId").val();
        if (id === '' || id.length === 0) {
            $("#checkText").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
            checkSignUpButtonState(); // 회원가입 버튼 비활성화
            return false;
        }
        
        $.ajax({
            url : '/page/ConfirmId',
            data : {
               id : id
            },
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

        // 아이디 중복 확인 및 기타 유효성 검사 코드...

        checkSignUpButtonState(); // 회원가입 버튼 상태 확인
    });

    // 비밀번호 입력 시
    $("#userPw").on("focusout", function() {
        var pw = $("#userPw").val();
        if (pw === '' || pw.length === 0) {
            $("#checkTextPw").css("color", "red").text("공백은 PW로 사용할 수 없습니다.");
            checkSignUpButtonState(); // 회원가입 버튼 상태 확인
            return false;
        }

        if (pw.length < 8) {
            $("#checkTextPw").css("color", "orange").text("8자 미만 비밀번호는 설정할 수 없습니다.");
            checkSignUpButtonState(); // 회원가입 버튼 상태 확인
            return false;
        }

        $("#checkTextPw").css("color", "green").text("사용가능한 비밀번호입니다.");
        checkSignUpButtonState(); // 회원가입 버튼 상태 확인
    });

    // 비밀번호 확인 입력 시
    $("#userRePw").on("focusout", function() {
        var pw = $("#userPw").val();
        var rePw = $("#userRePw").val();
        if (rePw === '' || rePw.length === 0) {
            $("#checkRePw").css("color", "red").text("비밀번호를 다시 입력해주세요.");
            checkSignUpButtonState(); // 회원가입 버튼 상태 확인
            return false;
        }

        if (pw !== rePw) {
            $("#checkRePw").css("color", "red").text("비밀번호가 일치하지 않습니다.");
            checkSignUpButtonState(); // 회원가입 버튼 상태 확인
            return false;
        }

        $("#checkRePw").css("color", "green").text("비밀번호가 일치합니다.")
        checkSignUpButtonState(); // 회원가입 버튼 상태 확인
    });

    // 회원가입 버튼 상태 확인 함수
    function checkSignUpButtonState() {
        var idColor = $("#checkText").css("color");
        var pwColor = $("#checkTextPw").css("color");
        var rePwColor = $("#checkRePw").css("color");

        if (idColor === "rgb(255, 0, 0)" || pwColor === "rgb(255, 0, 0)" || pwColor === "rgb(255, 165, 0)" || rePwColor === "rgb(255, 0, 0)") {
            signUpBtn.prop("disabled", true); // 회원가입 버튼 비활성화
        } else {
            signUpBtn.prop("disabled", false); // 회원가입 버튼 활성화
        }
    }
});

</script>
</form>
</body>
</html>