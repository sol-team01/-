<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품정보 리스트</title>
</head>
<body>
<a>리스트에 없는 것이 궁금하다면 검색해 주세요</a>
<form action="${cp}/food/information">
 <input type="text" name=desc_kor autocomplete="off" placeholder="검색어를 입력하세요">
</form>
<div><a href="${cp}/food/detailList?category=nuts">견과류</a></div>
<div><a href="${cp}/food/detailList?category=meat">고기(육류)</a></div>
<div><a href="${cp}/food/detailList?category=fruit">과일</a></div>
<div><a href="${cp}/food/detailList?category=dessert">과자,사탕&디저트</a></div>
<div><a href="${cp}/food/detailList?category=bread">빵&시리얼</a></div>
<div><a href="${cp}/food/detailList?category=seafood">해산물</a></div>
<div><a href="${cp}/food/detailList?category=sauce">소스,향신료&잼류</a></div>
<div><a href="${cp}/food/detailList?category=soup">수프(국)</a></div>
<div><a href="${cp}/food/detailList?category=vegetable">야채</a></div>
<div><a href="${cp}/food/detailList?category=beverage">음료</a></div>
<div><a href="${cp}/food/detailList?category=milk">우유&유제품</a></div>
<div><a href="${cp}/food/detailList?category=pasta">파스타,쌀&국수</a></div>
<div><a href="${cp}/food/detailList?category=fastfood">패스트푸드</a></div>
<div><a href="${cp}/food/detailList?category=etc">기타</a></div>
 	
<a href="#" onclick="goBack()">뒤로가기</a>

<script>
function goBack() {
  window.history.back();
}
</script>

</body>
</html>