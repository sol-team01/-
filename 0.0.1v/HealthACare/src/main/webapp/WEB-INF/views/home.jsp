<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<style>
#customSelect {
  position: relative;
  width: 200px;
  margin: 20px;
}

.select-selected {
  background-color: #f1f1f1;
  padding: 10px;
  border: 1px solid #ccc;
  cursor: pointer;
}

.select-items {
  position: absolute;
  background-color: #fff;
  width: 100%;
  border: 1px solid #ccc;
  border-top: none;
  display:none;
}

.select-items div {
  padding: 10px;
  cursor: pointer;
}

.select-items div:hover {
  background-color: #ddd;
}

.select-show {
  display: block;
}
</style>
</head>
<body>
	<h1></h1>
	<P>서버 열린시간: ${serverTime}.</P>
	<nav class="top-nav">
		<ul>
			<li class="dropdownA"><a href="${cp}/NullMember/BbsFood">식단</a>
				<div class="dropdown-content">
					<!-- 드롭다운 메뉴 항목 -->
					<a href="#">칼로리</a>
					<a href="#">식품 정보</a>
					<a href="#">추천 식단</a>
				</div></li>
			<li class="dropdownB"><a href="${cp}/NullMember/BbsDisease">질병</a>
				<div class="dropdown-content">
					<!-- 드롭다운 메뉴 항목 -->
					<a href="#">서브 메뉴 1</a>
					<a href="#">서브 메뉴 2</a>
					<a href="#">서브 메뉴 3</a>
				</div></li>
			<li class="dropdown3"><a href="${cp}/NullMember/BbsHealth">운동</a>
				<div class="dropdown-content">
					<!-- 드롭다운 메뉴 항목 -->
					<a href="#">서브 메뉴 1</a>
					<a href="#">서브 메뉴 2</a>
					<a href="#">서브 메뉴 3</a>
				</div></li>
			<li class="dropdown4"><a href="${cp}/NullMember/BbsCustomer">고객지원</a>
				<div class="dropdown-content">
					<!-- 드롭다운 메뉴 항목 -->
					<a href="#">서브 메뉴 1</a>
					<a href="#">서브 메뉴 2</a>
					<a href="#">서브 메뉴 3</a>
				</div></li>
		</ul>
	</nav>
	<pre>
<a href="${cp}/page/mainWeb">로그인</a>
<a href="${cp}/page/mainWeb">마이페이지(로그인 시 노출)</a>
<a href="${cp}/page/mainWeb">커뮤니티(추후에 li 리스트로 변경 건의)</a>
<a href="${cp}/page/mainWeb">공지사항</a>
<a href="${cp}/page/mainWeb">오운완</a>
<a href="${cp}/page/mainWeb">식단추천</a>
<a href="${cp}/page/mainWeb">운동추천</a>
</pre>

<div id="customSelect">
  <div class="select-selected">옵션1</div>
  <div class="select-items">
    <div>옵션 1</div>
    <div>옵션 2</div>
    <div>옵션 3</div>
  </div>
</div>

<script>
$(document).ready(function(){
  // 셀렉트 박스를 클릭했을 때 이벤트 처리
  $("#customSelect .select-selected").click(function(event) {
//     event.stopPropagation(); // 이벤트 전파 방지
    
    // 다른 열려 있는 셀렉트 박스들을 닫음
    $(".select-items").toggleClass("select-show");
  });
  
//옵션을 선택했을 때 이벤트 처리
  $("#customSelect .select-items").on("click", "div", function() {
    var selectedOption = $(this).text(); // 선택한 옵션의 텍스트

    // 선택한 옵션을 선택된 옵션으로 표시
    $(this).parent().siblings(".select-selected").text(selectedOption);

    // 셀렉트 박스 닫기
    $(this).parent().removeClass("select-show");
  });
});
</script>
</body>
</html>
