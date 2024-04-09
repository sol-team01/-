$(document).ready(function(){
    $('#btnSubmit').click(function(){
        const B_title = $('#B_title').val();
        if(B_title.length <= 0){
            alert('제목을 입력해야 합니다.');
            $('#B_title').focus();
            return false;
        }

        var markupStr = $('#summernote').summernote('code');
        if(markupStr == '<p><br></p>'){
            alert('내용을 입력해야 합니다.');
            return false;
        }
        var B_category = $('#B_category').val();
        alert(B_category);
        $('#btnSubmit').prop('disabled', true);
        $.ajax({
            url: "/board/write",
            method: "POST",
            data: {
                B_category : B_category,
                B_title : B_title,
                B_text : markupStr
            },
            success: function(response){
                alert('글 작성이 완료되었습니다.');
                window.location.href = "/board/noticeBoard";
                },
                error: function(xhr, status, error) {
                    alert('글 등록 중 오류가 발생했습니다.');
                    console.error(xhr, status, error);
                    $('#btnSubmit').prop('disabled', false);
                }

        });
        return false;
    });
});