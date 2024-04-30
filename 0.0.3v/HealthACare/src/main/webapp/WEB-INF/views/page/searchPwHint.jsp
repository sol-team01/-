<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
    <link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
    <link rel="stylesheet" href="${cp}/resources/searchPwHint.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<div id="searchPwHintBox">
<a href="/"><img src="${cp}/resources/img/logo.png" alt="로고" class="image"></a>
 
    <form action="${cp}/page/searchHint" method="post">
       <c:choose>
          <c:when test="${pwFinding.getI_pwFinding() == '1'}">
          <p class="cText">**** 질문입니다. 당신의 대답은? ****</p>
          </c:when>
          <c:when test="${pwFinding.getI_pwFinding() == '2'}">
          <p class="cText">**** 학원 근처에서 가장 맛있었던 식당은? ****</p>
          </c:when>
          <c:when test="${pwFinding.getI_pwFinding() == '3'}">
          <p class="cText">**** 학원에서 처음으로 갔던 단체회식 장소는? ****</p>
          </c:when>
          <c:when test="${pwFinding.getI_pwFinding() == '4'}">
          <p class="cText">**** 수강하고 계신 수업에 가장 어려운 과목은? ****</p>
          </c:when>
       </c:choose>
       <div>
 		<label class="text3" for="confirmPassword">답변</label>
 	
    	<input id="I_hint" name="I_hint" type="text" placeholder="답변을 입력해주세요">
    	<input id="U_no" name="U_no" type="hidden" value="${pwFinding.getU_no()}">
       </div>
    <input id="searchPwHint" type="submit" value="비밀번호재설정">
 
    </form>
</div><!-- searchPwHintBox -->
 <script>
 $(document).ready(function() {
       $('form').submit(function(e) {
           e.preventDefault(); // 폼 전송 방지
           
           // 폼 데이터 가져오기
           var hintData = {
               I_hint: $('#I_hint').val(),
               U_no: $('#U_no').val()
           };
           
           // Ajax 요청 보내기
           $.ajax({
               type: 'POST',
               url: '/page/searchHint',
               data: hintData,
               dataType: 'xml', // 응답 데이터의 형식을 XML로 지정
               success: function(response) {
                   // 서버로부터 성공적인 응답을 받았을 때 실행되는 함수
                   var xmlResponse = $(response); // XML을 jQuery 객체로 변환
                   var valid = xmlResponse.find('valid').text(); // valid 요소의 내용 가져오기
                   var U_no = xmlResponse.find('U_no').text(); // U_no 요소의 내용 가져오기

                   // 힌트가 맞는 경우 비밀번호 재설정 페이지로 이동
                   if (valid === 'true') {
                       window.location.href = '/page/resetPw?U_no='+U_no;
                      
                   } else {
                       // 힌트가 틀린 경우 팝업 창에 메시지 표시
                       alert('힌트가 잘못되었습니다.');
                   }
               },
               error: function(xhr, status, error) {
                   // Ajax 요청 실패 시 실행되는 함수
                   console.error(xhr.responseText);
               }
           });
       });
   });
</script>
</body>
</html>