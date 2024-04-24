$(document).ready(function(){
    $.ajax({
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
});
