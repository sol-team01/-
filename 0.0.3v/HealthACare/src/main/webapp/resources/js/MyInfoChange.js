$(document).ready(function(){
    $.ajax({
        url: "/RestsController/myImgEncoding",
        method: "POST",
        success: function(response){
            var imageDataURI = 'data:image/jpeg;base64,' + response;
            $('#myImg').html('<img src="' + imageDataURI + '" alt="Image">');
        },
        error: function(xhr, status, error) {
          	$('#myImg').html('<img src="${cp}/resources/img/profile.jsp" alt="image">');
            
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

