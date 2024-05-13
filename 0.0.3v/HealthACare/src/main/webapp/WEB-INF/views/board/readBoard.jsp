<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png"
	type="image/png">
<!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css">
<!-- 기본 CSS -->
<link rel="stylesheet" href="${cp}/resources/list.css">
<link rel="stylesheet" href="${cp}/resources/noticeBoard.css">
<link rel="stylesheet" href="${cp}/resources/readBoard.css">
<link rel="stylesheet" href="${cp}/resources/writeBoard.css">
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>
			<!-- 			내가 한 거 -->
			<div class="test">
				<div class="readBoardWrap">
					<div class="readBoardFlexWrap">
						<div class="boardFlexK">
							<div id="boardImgWrap">
								<div id="user">
									<div class="box">
										<div class="boardImg" id="boardImg">
											<script type="text/javascript">
									   $.ajax({ // 다른사람 인코딩 정보
							        url: "/RestsController/ImgEncoding",
							        method: "POST",
							        data:{U_no: "${read.u_no}" }, // 추후 포문을 돌릴때 사용하게된다면 myInfo.U_no 를 사용하면 안됩니다.
							        success: function(response){
							        	if(response != null){
							            var imageDataURI = 'data:image/jpeg;base64,' + response;
							            $('#boardImg').html('<img class="Profile" src="' + imageDataURI + '" alt="사용자 프로필">');
							            }
							        },
							        error: function(xhr, status, error) {
							            
							        }
							    }); 
									</script>

										</div>
									</div>
								</div>
							</div>
							<div class="boardFlexKCol">
								<div class="boardReadTitle">${read.i_name}</div>
								<div class="boardFlexK">
									<div class="postInner">
										<img src="${cp}/resources/img/time.svg">
										<div>${read.b_datetime}</div>
									</div>
									<div class="postInnerMl">
										<img src="${cp}/resources/img/eye.svg">
										<div>${read.b_hit}</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 안녕 -->
					</div>
					<h3 class="boardPostTitle">${read.b_title}</h3>
					<div class="boardPostText">${read.b_text}</div>
					<c:choose>
						<c:when test="${read.u_no eq user.u_no}">
							<div class="editDelWrap">
								<form action="${cp}/board/modifyBoard">
									<input type="hidden" name="B_no" value="${read.b_no}">
									<input type="submit" value="글 수정" class="writeBoardBtnK">
								</form>
								<form action="${cp}/board/del" style="margin-left: 10px;">
									<input type="hidden" name="B_no" value="${read.b_no}">
									<input type="submit" value="글 삭제" class="writeBoardBtnKBorder">
								</form>
							</div>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
					<!-- 안녕 -->
					<div class="commentFlex">
						<img src="${cp}/resources/img/comment.svg">
						<p>댓글목록</p>
					</div>
					<!-- 				<label id="reply">댓글목록</label> -->
					<!-- 					<input type="text" id="replyText" name="replyText" class="formControl inputComment"> -->
					<textarea id="replyText" name="replyText"
						class="formControl inputComment"></textarea>
					<button type="button" id="replySubmit"
						class="writeBoardBtnK mb-20K btnEndPosition">댓글 달기</button>
					<div class="titleLineK"></div>
					<span id="reply_area" class="replyAreaK"> <c:forEach
							var="replyList" items="${reply}">
							<c:choose>
								<c:when test="${replyList eq null or empty replyList}">>
								댓글이 비어있습니다.
								</c:when>
								<c:otherwise>
									<div class="boardFlexK">
										<div class="mr-30K mt-30K">
											<div class="boardFlexK">
												<div id="boardImgWrap">
													<div id="user">
														<div class="box">
															<div class="boardImg" id="img${replyList.r_no}"></div>
														</div>
													</div>
												</div>
												<div class="boardFlexKCol">
													<div>${replyList.i_name}</div>
													<div class="postInner mt-10K">
														<img src="${cp}/resources/img/time.svg">
														<div>${replyList.r_datetime}</div>
													</div>

												</div>
											</div>
											<!-- 안녕 -->
										</div>
										<div class="mt-30K btnEndPosition">
											<c:if test="${replyList.u_no eq user.u_no}">
												<button type="button" data-reply-id="${replyList.r_no}"
													class="writeBoardBtnKBorder deleteBtn CommentDelete">삭제</button>
											</c:if>
										</div>
									</div>
									<div class="mt-30K colComment wordBreak">${replyList.r_text}</div>
									<div class="titleBottomLineK"></div>

									<script type="text/javascript">
									if(${replyList.u_no} != 0){
										console.log("회원임");
										$.ajax({ // 다른사람 인코딩 정보
							        url: "/RestsController/ImgEncoding",
							        method: "POST",
							        data:{U_no: "${replyList.u_no}" }, // 추후 포문을 돌릴때 사용하게된다면 myInfo.U_no 를 사용하면 안됩니다.
							        success: function(response){
							        	if(response != null){
							            var imageDataURI = 'data:image/jpeg;base64,' + response;
							            $('#img${replyList.r_no}').html('<img class="Profile" src="' + imageDataURI + '" alt="사용자 프로필">');
							            } 
							        }
							        });
									} else {
										console.log("비회원임");
							            $('#img${replyList.r_no}').html("<img class='Profile' src='${cp}/resources/baseImg/baseImg.jpg'>");
									}
									</script>

								</c:otherwise>
							</c:choose>
						</c:forEach>
					</span>
					<div class="pagingBlock">
						<div class="arrowBoxFirst">
							${replyPaging.goReplyToFirstPage()}</div>
						<div class="arrowBoxPrev">
							${replyPaging.getReplyPrevPageButton()}</div>
						<div class="pageBox">${replyPaging.getHtmlReplyPageList()}</div>
						<div class="arrowBoxNext">
							${replyPaging.getReplyNextPageButton()}</div>
						<div class="arrowBoxLast">
							${replyPaging.goReplyToLastPage()}</div>
					</div>
				</div>

			</div>
			<!-- 			내가 한 거 끝남 -->
		</div>
		<!-- 	<div id="top"> -->
	</div>

	<script>
		$(document).ready(function() {
			console.log("ajax 사용중");
			var B_no = "${read.b_no}";
			$('#replySubmit').click(function() {
				var textValue = $('#replyText').val(); // 댓글창 입력값 설정
				var U_no = "${user.u_no}";
				var I_name = "${user.i_name}";
				if (I_name === "" || I_name === null) {
					var random = Math.floor(Math.random() * 1000) + 1;
					I_name = '비회원' + random;
				}
				if (U_no === "" || U_no === null) {
					U_no = 0;
				}
				console.log(textValue);
				/* 		        console.log(U_no);
				 console.log(U_id);
				 console.log(B_no); */
				// 현재 페이지 변수를 사용하여 AJAX 요청 전달
				$.ajax({
					type : 'GET',
					url : '/board/replyWrite',
					data : {
						textValue : textValue, // 선택한 정렬 순서를 매개변수로 전달
						U_no : U_no, // 현재 페이지 정보를 함께 전달
						I_name : I_name,
						B_no : B_no
					},
					success : function(data) {
						// Ajax 요청으로 받은 응답을 사용하여 페이지 일부 업데이트
						// 예를 들어, 게시글 목록을 업데이트하는 등의 작업 수행
						// data 변수에는 서버에서 전달한 HTML 또는 JSON 데이터가 포함됩니다.
						// 아래는 간단한 예시
						window.location.reload();
					},
					error : function(xhr, status, error) {
						console.log('AJAX 요청 실패');
					}
				});
			});

			$('.deleteBtn').click(function() {
				var replyNo = $(this).data('reply-id');
				console.log(replyNo);
				$.ajax({
					type : 'POST',
					url : '/board/delReply',
					data : {
						R_no : replyNo,
						B_no : B_no
					},
					success : function(response) {
						window.location.reload();
					},
					error : function(xhr, status, error) {

					}
				});
			});
		});
	</script>
</body>
</html>