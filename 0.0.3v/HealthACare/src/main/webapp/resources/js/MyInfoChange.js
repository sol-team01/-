$(document).ready(function(){
    $.ajax({
        url: "/RestsController/myImgEncoding",
        method: "POST",
        success: function(response){
            var imageDataURI = 'data:image/jpeg;base64,' + response;
            $('.myImg').html('<img src="' + imageDataURI + '" alt="Image">');
        },
        error: function(xhr, status, error) {
            
        }
    });
    
    
    
    
});


function previewImage(event) {
    var input = event.target;
    var reader = new FileReader();

    reader.onload = function(){
        var dataURL = reader.result;

        var fileSize = input.files[0].size;
        var fileSizeMB = fileSize / (1024 * 1024);
        var fileSizeLimitMB = 10; // 파일 크기 제한 (10MB)

        if (fileSizeMB > fileSizeLimitMB) {
            // 파일 크기가 제한을 초과하는 경우 사용자에게 알림
            alert("파일 크기가 " + fileSizeLimitMB + "MB를 초과합니다. 다른 파일을 선택해주세요.");
            
            // 파일 입력 요소의 값을 비워서 파일 선택을 취소
            input.value = '';
        } else {
                $('#preview').html('<img src="' + dataURL + '" alt="Image">');
        };
    };
          reader.readAsDataURL(input.files[0]);
}
