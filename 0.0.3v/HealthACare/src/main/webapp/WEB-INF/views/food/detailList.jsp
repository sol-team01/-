<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품정보 세부리스트</title>
</head>
<body>

<a>리스트에 없는 것이 궁금하다면 검색해 주세요</a>
	<form id="foodForm" action="${cp}/food/information">
		<c:choose>
			<c:when test="desc_kor == null">
				<input type="text" name="desc_kor" autocomplete="off" placeholder="검색어를 입력하세요">
			</c:when>
			<c:otherwise>
				<input type="text" id="desc_kor" placeholder="검색어를 입력하세요" name="desc_kor" value="">
			</c:otherwise>
		</c:choose>
	</form>

	<c:set var="category" value="${param.category}" />

<c:choose>
    <c:when test="${category eq 'nuts'}">
    	<a href="#" onclick="setDescAndSubmit('땅콩')">땅콩</a>
    	<a href="#" onclick="setDescAndSubmit('마카다미아')">마카다미아</a>
    	<a href="#" onclick="setDescAndSubmit('아몬드')">아몬드</a>
    	<a href="#" onclick="setDescAndSubmit('잣')">잣</a>
    	<a href="#" onclick="setDescAndSubmit('캐슈')">캐슈</a>
    	<a href="#" onclick="setDescAndSubmit('피스타치오')">피스타치오</a>
    	<a href="#" onclick="setDescAndSubmit('피칸')">피칸</a>
    	<a href="#" onclick="setDescAndSubmit('호두')">호두</a>
    </c:when>
    <c:when test="${category eq 'meat'}">
    	<a href="#" onclick="setDescAndSubmit('소고기')">소고기</a>
    	<a href="#" onclick="setDescAndSubmit('쇠고기')">쇠고기</a>
    	<a href="#" onclick="setDescAndSubmit('닭고기')">닭고기</a>
    	<a href="#" onclick="setDescAndSubmit('돼지고기')">돼지고기</a>
    	<a href="#" onclick="setDescAndSubmit('가슴살')">가슴살</a>
    	<a href="#" onclick="setDescAndSubmit('갈비')">갈비</a>
    	<a href="#" onclick="setDescAndSubmit('베이컨')">베이컨</a>
    	<a href="#" onclick="setDescAndSubmit('양고기')">양고기</a>
    	<a href="#" onclick="setDescAndSubmit('후라이드')">후라이드치킨</a>
    </c:when>
	<c:when test="${category eq 'fruit'}">
        <a href="#" onclick="setDescAndSubmit('건포도')">건포도</a>
    	<a href="#" onclick="setDescAndSubmit('대추')">대추</a>
    	<a href="#" onclick="setDescAndSubmit('딸기')">딸기</a>
    	<a href="#" onclick="setDescAndSubmit('오렌지')">오렌지</a>
    	<a href="#" onclick="setDescAndSubmit('망고')">망고</a>
    	<a href="#" onclick="setDescAndSubmit('매실')">매실</a>
    	<a href="#" onclick="setDescAndSubmit('멜론')">멜론</a>
    	<a href="#" onclick="setDescAndSubmit('복숭아')">복숭아</a>
    	<a href="#" onclick="setDescAndSubmit('바나나')">바나나</a>
    </c:when>
    <c:when test="${category eq 'dessert'}">
        <a href="#" onclick="setDescAndSubmit('초콜릿')">초콜릿</a>
    	<a href="#" onclick="setDescAndSubmit('도넛')">도넛</a>
    	<a href="#" onclick="setDescAndSubmit('머핀')">머핀</a>
    	<a href="#" onclick="setDescAndSubmit('브라우니')">브라우니</a>
    	<a href="#" onclick="setDescAndSubmit('사탕')">사탕</a>
    	<a href="#" onclick="setDescAndSubmit('아이스크림')">아이스크림</a>
    	<a href="#" onclick="setDescAndSubmit('와플')">와플</a>
    	<a href="#" onclick="setDescAndSubmit('치즈케이크')">치즈케이크</a>
    	<a href="#" onclick="setDescAndSubmit('푸딩')">푸딩</a>
    </c:when>
    <c:when test="${category eq 'bread'}">
        <a href="#" onclick="setDescAndSubmit('그래놀라')">그래놀라</a>
    	<a href="#" onclick="setDescAndSubmit('마늘빵')">마늘빵</a>
    	<a href="#" onclick="setDescAndSubmit('베이글')">베이글</a>
    	<a href="#" onclick="setDescAndSubmit('오트밀')">오트밀</a>
    	<a href="#" onclick="setDescAndSubmit('토스트')">토스트</a>
    </c:when>
    <c:when test="${category eq 'seafood'}">
        <a href="#" onclick="setDescAndSubmit('가리비')">가리비</a>
    	<a href="#" onclick="setDescAndSubmit('가재')">가재</a>
    	<a href="#" onclick="setDescAndSubmit('게')">게</a>
    	<a href="#" onclick="setDescAndSubmit('고등어')">고등어</a>
    	<a href="#" onclick="setDescAndSubmit('굴')">굴</a>
    	<a href="#" onclick="setDescAndSubmit('오징어')">오징어</a>
    	<a href="#" onclick="setDescAndSubmit('문어')">문어</a>
    </c:when>
    <c:when test="${category eq 'sauce'}">
        <a href="#" onclick="setDescAndSubmit('간장')">간장</a>
    	<a href="#" onclick="setDescAndSubmit('꿀')">꿀</a>
    	<a href="#" onclick="setDescAndSubmit('마요네즈')">마요네즈</a>
    	<a href="#" onclick="setDescAndSubmit('설탕')">설탕</a>
    	<a href="#" onclick="setDescAndSubmit('소금')">소금</a>
    </c:when>
    <c:when test="${category eq 'soup'}">
    	<a href="#" onclick="setDescAndSubmit('된장국')">된장국</a>
    	<a href="#" onclick="setDescAndSubmit('죽')">죽</a>
    	<a href="#" onclick="setDescAndSubmit('스튜')">스튜</a>
    	<a href="#" onclick="setDescAndSubmit('김치찌개')">김치찌개</a>
    </c:when>
    <c:when test="${category eq 'vegetable'}">
        <a href="#" onclick="setDescAndSubmit('가지')">가지</a>
    	<a href="#" onclick="setDescAndSubmit('감자')">감자</a>
    	<a href="#" onclick="setDescAndSubmit('고구마')">고구마</a>
    	<a href="#" onclick="setDescAndSubmit('당근')">당근</a>
    	<a href="#" onclick="setDescAndSubmit('마늘')">마늘</a>
    	<a href="#" onclick="setDescAndSubmit('토마토')">토마토</a>
    	<a href="#" onclick="setDescAndSubmit('브로콜리')">브로콜리</a>
    	<a href="#" onclick="setDescAndSubmit('상추')">상추</a>
    	<a href="#" onclick="setDescAndSubmit('시금치')">시금치</a>
    </c:when>
    <c:when test="${category eq 'beverage'}">
    	<a href="#" onclick="setDescAndSubmit('아메리카노')">아메리카노</a>
    	<a href="#" onclick="setDescAndSubmit('아이스티')">아이스티</a>
    	<a href="#" onclick="setDescAndSubmit('칵테일')">칵테일</a>
    	<a href="#" onclick="setDescAndSubmit('오렌지주스')">오렌지주스</a>
    	<a href="#" onclick="setDescAndSubmit('포도주스')">포도주스</a>
    </c:when>
    <c:when test="${category eq 'milk'}">
    	<a href="#" onclick="setDescAndSubmit('마가린')">마가린</a>
    	<a href="#" onclick="setDescAndSubmit('모짜렐라')">모짜렐라</a>
    	<a href="#" onclick="setDescAndSubmit('버터')">버터</a>
    	<a href="#" onclick="setDescAndSubmit('두유')">두유</a>
    	<a href="#" onclick="setDescAndSubmit('요거트')">요거트</a>
    	<a href="#" onclick="setDescAndSubmit('그릭요거트')">그릭요거트</a>
    	<a href="#" onclick="setDescAndSubmit('사워크림')">사워크림</a>
    </c:when>
     <c:when test="${category eq 'pasta'}">
        <a href="#" onclick="setDescAndSubmit('마카로니')">마카로니</a>
    	<a href="#" onclick="setDescAndSubmit('볶음밥')">볶음밥</a>
    	<a href="#" onclick="setDescAndSubmit('스파게티')">스파게티</a>
    	<a href="#" onclick="setDescAndSubmit('국수')">국수</a>
    </c:when>
     <c:when test="${category eq 'fastfood'}">
    	<a href="#" onclick="setDescAndSubmit('나초')">나초</a>
    	<a href="#" onclick="setDescAndSubmit('치즈버거')">치즈버거</a>
    	<a href="#" onclick="setDescAndSubmit('피자')">피자</a>
    	<a href="#" onclick="setDescAndSubmit('햄버거')">햄버거</a>
    	<a href="#" onclick="setDescAndSubmit('핫도그')">핫도그</a>
    	<a href="#" onclick="setDescAndSubmit('양파링')">양파링</a>
    </c:when>
    <c:when test="${category eq 'etc'}">
        <a href="#" onclick="setDescAndSubmit('팝콘')">팝콘</a>
    	<a href="#" onclick="setDescAndSubmit('만두')">만두</a>
    	<a href="#" onclick="setDescAndSubmit('밀가루')">밀가루</a>
    </c:when>
    <c:otherwise>
        <h2>세부 정보를 찾을 수 없습니다.</h2>
    </c:otherwise>
</c:choose>

<script>
function setDescAndSubmit(desc) {
    document.getElementById("desc_kor").value = desc; // desc_kor 값을 설정합니다.
    document.getElementById("foodForm").submit(); // 폼을 제출하여 information.jsp로 이동합니다.
}

</script>

<a href="#" onclick="goBack()">뒤로가기</a>

<script>
function goBack() {
  window.history.back();
}
</script>

</body>
</html>