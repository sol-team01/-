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


.dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;

}


.dropdown {
  display: inline-block;
  position:relative;
}

.dropdown-content1 {
/*   display: none; */
display:none;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content1 a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content1 a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content1 {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: #3e8e41;
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
<a href="${cp}/sign/signIn">로그인</a>
<a href="${cp}/page/mainWeb">마이페이지(로그인 시 노출)</a>
<a href="${cp}/page/mainWeb">커뮤니티(추후에 li 리스트로 변경 건의)</a>
<a href="${cp}/page/mainWeb">공지사항</a>
<a href="${cp}/page/mainWeb">오운완</a>
<a href="${cp}/page/mainWeb">식단추천</a>
<a href="${cp}/page/mainWeb">운동추천</a>
</pre>

<div class="dropdown">
  <button class="dropbtn">Dropdown</button>
  <div class="dropdown-content1">
  <a href="#">Link 1</a>
  <a href="#">Link 2</a>
  <a href="#">Link 3</a>
  </div>
</div>



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
  
  $("#customSelect .select-selected").hover(function(event) {
//    event.stopPropagation(); // 이벤트 전파 방지
   
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

// 내가 어디 버전에 있는 거지?
</script>
</body>
</html>
