$(document).ready(function(){
 

    $.ajax({ // 내꺼 이미지 정보
        url: "/RestsController/myImgEncoding",
        method: "POST",
        success: function(response){
        	if(response != null){
            var imageDataURI = 'data:image/jpeg;base64,' + response;
            $('.myImg').html('<img class="Profile" src="' + imageDataURI + '" alt="사용자 프로필">');
            } else {
            //$('.myImg').html('	<img class="Profile"  alt="사용자 프로필" src="${cp}/resources/img/profile.jpg">');
            }
        },
        error: function(xhr, status, error) {
            
        }
    });
 

 /*   $.ajax({ // 다른사람 인코딩 정보
        url: "/RestsController/ImgEncoding",
        method: "POST",
        data:{U_no: "${myInfo.U_no}" }, // 추후 포문을 돌릴때 사용하게된다면 myInfo.U_no 를 사용하면 안됩니다.
        success: function(response){
        	if(response != null){
            var imageDataURI = 'data:image/jpeg;base64,' + response;
            $('#img').html('<img class="Profile" src="' + imageDataURI + '" alt="사용자 프로필">');
            } else {
            $('#img').html('	<img class="Profile"  alt="사용자 프로필" src="${cp}/resources/img/profile.jpg">');
            }
        },
        error: function(xhr, status, error) {
          	$('#img').html('	<img class="Profile"  alt="사용자 프로필" src="${cp}/resources/img/profile.jpg">');
            
        }
    }); */
    
});
