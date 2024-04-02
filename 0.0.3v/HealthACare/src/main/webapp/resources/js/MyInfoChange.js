$(document).ready(function(){
    $.ajax({
        url: "/RestsController/ImgEncoding",
        method: "POST",
        success: function(response){
            var imageDataURI = 'data:image/jpeg;base64,' + response;
            $('#myImg').html('<img src="' + imageDataURI + '" alt="Image">');
        },
        error: function(xhr, status, error) {
            console.error("AJAX 요청 실패:", error,status,xhr);
            
        }
    });
    
    
    
    
});


function previewImage(event) {
    var input = event.target;
    var reader = new FileReader();

    reader.onload = function(){
        var dataURL = reader.result;
        $('#preview').html('<img src="' + dataURL + '" alt="Image">');
    };

    reader.readAsDataURL(input.files[0]);
}

