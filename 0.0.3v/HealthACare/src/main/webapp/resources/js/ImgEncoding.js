$(document).ready(function(){
    var bay
    $.ajax({
        url: "/RestsController/myImgEncoding",
        method: "POST",
        data:{I_profileImg(): "${myInfo.getI_profileImg()}" },
        success: function(response){
            var imageDataURI = 'data:image/jpeg;base64,' + response;
            $('#myImg').html('<img class="Profile" src="' + imageDataURI + '" alt="사용자 프로필">');
        },
        error: function(xhr, status, error) {
          	$('#myImg').html('	<img class="Profile"  alt="사용자 프로필" src="${cp}/resources/img/profile.jpg">');
            
        }
    });
    
});
