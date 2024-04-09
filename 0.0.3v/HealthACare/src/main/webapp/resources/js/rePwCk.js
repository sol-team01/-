	    // 비밀번호 입력 시
        $(document).ready(function() {
      
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
                checkSignUpButtonState();
                
            });
    
            // 회원가입 버튼 상태 확인 함수
            function checkSignUpButtonState() {
                if (item) {
                    signUpBtn.prop("disabled", true);
                } else {
                    signUpBtn.prop("disabled", false);
                }
            }
        });
    
    