// window.onload 이벤트 핸들러는 페이지의 모든 리소스가 로드된 후에 실행됩니다.
window.onload = function () {
    // '#temp' 요소의 내용을 가져와서 '#summernote' 에디터에 설정합니다.
    $('#summernote').summernote('code', document.getElementById('temp').innerHTML)
}

$(document).ready(function () {
    // 썸머노트 에디터를 초기화합니다.
    $('#summernote').summernote({
        // 썸머노트 옵션 설정
        codeviewFilter: false,
        codeviewIframeFilter: false,
        disableXSSProtection: true,
        height: 500,
        minHeight: null,
        maxHeight: null,
        focus: true,
        lang: 'ko-KR',
        toolbar: [
            // 스타일 관련 기능
            ['style', ['style']],
            // 글자 크기 설정
            ['fontsize', ['fontsize']],
            // 글꼴 스타일
            ['font', ['bold', 'underline', 'clear']],
            // 글자 색상
            ['color', ['color']],
            // 테이블 삽입
            ['table', ['table']],
            // 문단 스타일
            ['para', ['paragraph']],
            // 에디터 높이 설정
            ['height', ['height']],
            // 이미지, 링크, 동영상 삽입
            ['insert', ['picture', 'link', 'video']],
            // 코드 보기, 전체화면, 도움말
            ['view', ['codeview', 'fullscreen', 'help']],
        ],
        fontSizes: [
            // 글자 크기 선택 옵션
            '8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'
        ],
        styleTags: [
            // 스타일 태그 옵션
            'p',
            { title: 'Blockquote', tag: 'blockquote', className: 'blockquote', value: 'blockquote' },
            'pre',
            { title: 'code_light', tag: 'pre', className: 'code_light', value: 'pre' },
            { title: 'code_dark', tag: 'pre', className: 'code_dark', value: 'pre' },
            'h1', 'h2', 'h3', 'h4', 'h5', 'h6'
        ],
        callbacks: {
            onImageUpload: function(files) {
                // 파일 업로드(다중업로드를 위해 반복문 사용)
                for (var i = files.length - 1; i >= 0; i--) {
                    uploadSummernoteImageFile(files[i], this);
                }
            }
        }
    });
	//글쓰기 뒤로가기
    	$('#writeBack').click(function(event){
    		event.preventDefault();
    	   window.location.href = "/board/noticeBoard";
    	})
    	
    // 글 쓰기
    
        $('#write').click(function(){
        const B_title = $('#B_title').val();
        if(B_title.length <= 0){
            alert('제목을 입력해야 합니다.');
            $('#B_title').focus();
            return false;
        }

        var markupStr = $('#summernote').summernote('code');
        if(markupStr.length<= 0){
            alert('내용을 입력해야 합니다.');
            return false;
        }
        saveContent();
        var B_category = $('#B_category').val();
        alert(B_category);
        $('#write').prop('disabled', true);
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
    
    	//글수정 뒤로가기
    	$('#fixBack').click(function(event){
    	        var B_no = $('#B_no').val();
    		event.preventDefault();
    	   window.location.href = "/board/readBoard?B_no="+ B_no;
    	})
    // 글 수정
            $('#fix').click(function(){
        
        var B_no = $('#B_no').val();
        const B_title = $('#B_title').val();
        if(B_title.length <= 0){
            alert('제목을 입력해야 합니다.');
            $('#B_title').focus();
            return false;
        }

        var markupStr = $('#summernote').summernote('code');
        if(markupStr.length<= 0){
            alert('내용을 입력해야 합니다.');
            return false;
        }
        saveContent();
        var B_category = $('#B_category').val();
        alert(B_category);
        $('#write').prop('disabled', true);
        $.ajax({
            url: "/board/modify",
            method: "POST",
            data: {
            	B_no : B_no,
                B_category : B_category,
                B_title : B_title,
                B_text : markupStr
            },
            success: function(response){
                alert('글 수정이 완료되었습니다.');
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
    
    
    
    

        
        function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "/RestsController/uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
		
		
		    function saveContent() {
    	
        //값 가져오기
        var summernoteContent = $('#summernote').summernote('code');        //썸머노트(설명)
        console.log("summernoteContent : " + summernoteContent);
		
    }
    
    function deleteSummernoteImageFile(imageName) {
        data = new FormData()
        data.append('file', imageName)
        $.ajax({
            data: data,
            type: 'POST',
            url: 'deleteSummernoteImageFile',
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
        })
    }
    });