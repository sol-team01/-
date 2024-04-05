<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<link rel="stylesheet" href="${cp}/resources/writeBoard.css">
</head>
<body>
<div id="warp">
<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
<div id="main">
<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>			
			<!-- 			내가 한 거 -->
			<div>
				<fieldset>
					<legend>글제목: :${read.b_TITLE}</legend>
					<label for="id">작성자: </label>
					${read.b_ID}
					<br>
					<label for="content">내용: </label>
					${read.b_TEXT}
					<br>
					<label for="date">작성일: </label>
					${read.b_DATETIME}
					<br>
					<label for="hit">조회수: </label>
					${read.b_HIT}
				</fieldset>
				<c:choose>
					<c:when test="${read.u_NO eq user.u_no}">
						<form action="${cp}/board/del">
							<input type="hidden" name="b_NO" value="${read.b_NO}">
							<input type="submit" value="글 삭제">
						</form>
						<form action="${cp}/board/modifyBoard">
							<input type="hidden" name="b_NO" value="${read.b_NO}">
							<input type="submit" value="글 수정">
						</form>
					</c:when>
					<c:otherwise>
						
					</c:otherwise>
				</c:choose>
				
				<label id="reply">댓글목록</label>
				<hr>
				<span id="reply_area">
					<c:forEach var="replyList" items="${reply}">
						<c:choose>
							<c:when test="${replyList eq null or empty replyList}">>
								댓글이 비어있습니다.
							</c:when>
							<c:otherwise>
								작성자: ${replyList.r_ID} 작성시간: ${replyList.r_DATETIME}
								&nbsp;
								<c:if test="${replyList.u_NO eq user.u_no}">
									<button type="button" class="deleteBtn" data-reply-id="${replyList.r_NO}">삭제</button>
								</c:if>
								<br>
								내용: ${replyList.r_TEXT}								
								<hr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</span>
				${replyPaging.goReplyToFirstPage()}
				${replyPaging.getReplyPrevPageButton()}
				${replyPaging.getHtmlReplyPageList()}
				${replyPaging.getReplyNextPageButton()}
				${replyPaging.goReplyToLastPage()}
				<br>
				<input type="text" style="width: 200px" id="replyText" name="replyText">
				<button type="button" id="replySubmit">등록</button>
				
			</div>
			<!-- 			내가 한 거 끝남 -->
		</div>
		<!-- 	<div id="top"> -->
	</div>
	
	<script>
		$(document).ready(function() {
		    console.log("ajax 사용중");
		    var b_no = "${read.b_NO}";
		    $('#replySubmit').click(function() {
		        var textValue = $('#replyText').val(); // 댓글창 입력값 설정
		        var u_no = "${user.u_no}";
		        var u_id = "${user.i_name}";
		        if(u_id === "" || u_id === null){
		            var random = Math.floor(Math.random() * 1000) + 1;
		            u_id = '비회원' + random;
		        }
		        if(u_no === "" || u_no === null){
		            u_no = 0;
		        }
		        console.log(textValue);
		        console.log(u_no);
		        console.log(u_id);
		        console.log(b_no);
		        // 현재 페이지 변수를 사용하여 AJAX 요청 전달
		        $.ajax({
		            type: 'GET',
		            url: '/board/replyWrite',
		            data: {
		                textValue: textValue, // 선택한 정렬 순서를 매개변수로 전달
		                uno: u_no, // 현재 페이지 정보를 함께 전달
		                uid: u_id,
		                bno: b_no
		            },
		            success: function(data) {
		                // Ajax 요청으로 받은 응답을 사용하여 페이지 일부 업데이트
		                // 예를 들어, 게시글 목록을 업데이트하는 등의 작업 수행
		                // data 변수에는 서버에서 전달한 HTML 또는 JSON 데이터가 포함됩니다.
		                // 아래는 간단한 예시
		            	window.location.reload();
		            },
		            error: function(xhr, status, error) {
		                console.log('AJAX 요청 실패');
		            }
		        });
		    });
		    
		    $('.deleteBtn').click(function() {
		        var replyNo = $(this).data('reply-id');
		        console.log(replyNo);
		        $.ajax({
		            type: 'POST',
		            url: '/board/delReply',
		            data: { 
		            	rno: replyNo,
		            	bno: b_no	
		            },
		            success: function(response) {
		                window.location.reload();
		            },
		            error: function(xhr, status, error){
		                
		            }
		        });
		    });
		});
	</script>
</body>
</html>