<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경하기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/resetPw.css">
</head>
<body>
 <div id="searchPwBox">
   <a href="/"><img src="${cp}/resources/img/logo.png" alt="로고" class="image"></a>
   <div id="inBox">
    <a class="idText">비밀번호 변경</a>
    <a class="cText">**** 변경할 비밀번호를 입력해주세요! ****</a>
      <form action="${cp}/page/pwChange" method="post">
       <input type = "hidden" id="U_no" value="${Uno}" name ="U_no">
        <div>
            <label class="text3" for="newPassword">비밀번호</label>
            <input class="idInput" type="password" maxlength="20" id="userPw" name="U_pw" required>
            <label id="checkTextPw"></label>
        </div>
        <div>
            <label class="text3" for="confirmPassword">비밀변호 확인</label>
            <input class="idInput" type="password" maxlength="20" id="userRePw" name="U_repw" required>
            <label id="checkRePw"></label>
        </div>
        <label id="checkTextPw"></label> 
        <div id="rePwCk">
            <input id="changePwBt" type="submit" value="비밀번호 변경">
        </div>
      </form>
    </div>
   <!-- inBox -->
 </div>
 <!-- searchPwBox -->
 <script>
 // 비밀번호 입력 시
 $(document).ready(function() {
     // 회원가입 버튼
 var changePwBt = $("#changePwBt");
     var item = true;
$("#userPw, #userRePw").on("focusout", function() {
    var pw = $("#userPw").val();
    var rePw = $("#userRePw").val();
    
    if (pw != rePw) {
        $("#checkTextPw").css("color", "red").text("비밀번호가 다릅니다.");
    item = false;
    } else {
          $("#checkTextPw").css("color", "green").text("비밀번호가 일치합니다..");
    item = true;
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
 </script>
</body>
</html>