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
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<link rel="stylesheet" href="${cp}/resources/list.css">
<link rel="stylesheet" href="${cp}/resources/writeBoard.css">
<link rel="stylesheet" href="${cp}/resources/noticeBoard.css">
<link rel="stylesheet" href="${cp}/resources/readBoard.css">
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
										<div class="myImg">
											<img class="Profile"
												src="data:image/jpeg;base64,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"
												alt="사용자 프로필">
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
					<textarea id="replyText" name="replyText" class="formControl inputComment"></textarea>
					<button type="button" id="replySubmit" class="writeBoardBtnK mb-20K btnEndPosition">글쓰기</button>
					<div class="titleLineK"></div>
					<span id="reply_area" class="replyAreaK">
						<c:forEach var="replyList" items="${reply}">
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
															<div class="myImg">
																<img class="Profile"
																	src="data:image/jpeg;base64,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"
																	alt="사용자 프로필">
															</div>
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
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</span> ${replyPaging.goReplyToFirstPage()}
					${replyPaging.getReplyPrevPageButton()}
					${replyPaging.getHtmlReplyPageList()}
					${replyPaging.getReplyNextPageButton()}
					${replyPaging.goReplyToLastPage()} <br>


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