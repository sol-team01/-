<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품정보 세부리스트</title>
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css"><!-- 기본 CSS -->
<link rel="stylesheet" href="${cp}/resources/list.css">
<link rel="stylesheet" href="${cp}/resources/detailList.css">
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>
			<h1 class="detailFoodTitle">
				<span>어떤 음식</span>을 찾으세요?
			</h1>
			<form id="foodForm" action="${cp}/food/information">
				<c:choose>
					<c:when test="desc_kor == null">
						<input type="text" name="desc_kor" autocomplete="off"
							placeholder="검색어를 입력하세요">
					</c:when>
					<c:otherwise>
						<div class="detailListSearchWrap">
							<input type="text" id="desc_kor" placeholder="음식명으로 검색"
								name="desc_kor" value="" class="detailListSearch">
							<button class="searhBoxK">
								<img src="${cp}/resources/img/search.svg">
							</button>
						</div>
					</c:otherwise>
				</c:choose>
			</form>

			<c:set var="category" value="${param.category}" />
			<div class="detailListCategory">
				<c:choose>
					<c:when test="${category eq 'nuts'}">
						<a href="#" onclick="setDescAndSubmit('땅콩')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>땅콩</h5>
									<p>1인분 (25g)</p>
								</div>
								<div class="categoryCalorie">139Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('마카다미아')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>마카다미아</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">718Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('아몬드')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>아몬드</h5>
									<p>1회분 (25g)</p>
								</div>
								<div class="categoryCalorie">142Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('잣')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>잣</h5>
									<p>1인분 (20g)</p>
								</div>
								<div class="categoryCalorie">126Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('캐슈')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>캐슈넛</h5>
									<p>1주먹 한 줌 (20g)</p>
								</div>
								<div class="categoryCalorie">110Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('피스타치오')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>피스타치오</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">610Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('피칸')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>피칸</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">740Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('호두')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>호두</h5>
									<p>1주먹 한 줌 (20g)</p>
								</div>
								<div class="categoryCalorie">130Kcal</div>
							</div>
						</a>
					</c:when>
					<c:when test="${category eq 'meat'}">
						<a href="#" onclick="setDescAndSubmit('소고기')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>소고기</h5>
									<p>1인분 (100g)</p>
								</div>
								<div class="categoryCalorie">250.5Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('닭고기')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>닭고기</h5>
									<p>1인분 (100g)</p>
								</div>
								<div class="categoryCalorie">239Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('돼지고기')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>돼지고기</h5>
									<p>1인분 (100g)</p>
								</div>
								<div class="categoryCalorie">242.1Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('가슴살')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>닭가슴살</h5>
									<p>1인분 (100g)</p>
								</div>
								<div class="categoryCalorie">164.9Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('돼지갈비')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>돼지갈비</h5>
									<p>1인분 (25g)</p>
								</div>
								<div class="categoryCalorie">249Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('베이컨')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>베이컨</h5>
									<p>1인분 (25g)</p>
								</div>
								<div class="categoryCalorie">241Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('양고기')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>양고기</h5>
									<p>1인분 (60g)</p>
								</div>
								<div class="categoryCalorie">86.40Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('후라이드')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>후라이드 치킨</h5>
									<p>1인분 (30g)</p>
								</div>
								<div class="categoryCalorie">155.45Kcal</div>
							</div>
						</a>
					</c:when>
					<c:when test="${category eq 'fruit'}">
						<a href="#" onclick="setDescAndSubmit('건포도')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>건포도</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">269Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('대추')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>대추</h5>
									<p>8개 (80g)</p>
								</div>
								<div class="categoryCalorie">83.2Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('딸기')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>딸기</h5>
									<p>중형 10개 (220g)</p>
								</div>
								<div class="categoryCalorie">31.2Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('오렌지')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>오렌지</h5>
									<p>1개 (252g)</p>
								</div>
								<div class="categoryCalorie">120Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('망고')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>망고</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">64Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('매실')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>매실</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">34Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('멜론')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>멜론</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">36Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('복숭아')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>복숭아</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">48Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('바나나')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>바나나</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">80Kcal</div>
							</div>
						</a>
					</c:when>
					<c:when test="${category eq 'dessert'}">
						<a href="#" onclick="setDescAndSubmit('초콜렛')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>초콜렛</h5>
									<p>1회분 (15g)</p>
								</div>
								<div class="categoryCalorie">81.45Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('도넛')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>도넛</h5>
									<p>1인분 (70g)</p>
								</div>
								<div class="categoryCalorie">296Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('머핀')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>머핀</h5>
									<p>1개 (110g)</p>
								</div>
								<div class="categoryCalorie">422Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('브라우니')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>브라우니</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">379Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('사탕')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>브라우니</h5>
									<p>1개 (10g)</p>
								</div>
								<div class="categoryCalorie">38Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('아이스크림')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>아이스크림</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">212Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('와플')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>와플</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">291Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('치즈케이크')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>치즈케이크</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">321Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('푸딩')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>푸딩</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">126Kcal</div>
							</div>
						</a>
					</c:when>
					<c:when test="${category eq 'bread'}">
						<a href="#" onclick="setDescAndSubmit('그래놀라')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>그래놀라</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">490Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('마늘빵')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>마늘빵</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">500Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('베이글')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>베이글</h5>
									<p>1회분 (120g)</p>
								</div>
								<div class="categoryCalorie">335.48Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('오트밀')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>오트밀</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">382Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('토스트')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>토스트</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">293Kcal</div>
							</div>
						</a>
					</c:when>
					<c:when test="${category eq 'seafood'}">
						<a href="#" onclick="setDescAndSubmit('가리비')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>가리비</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">74Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('가재')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>갯가재</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">87Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('대게')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>대게(삶은것)</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">69Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('고등어')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>고등어(생것)</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">183Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('굴')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>석굴</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">61Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('오징어,생것')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>오징어(생것)</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">95Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('문어')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>문어(생것)</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">74Kcal</div>
							</div>
						</a>
					</c:when>
					<c:when test="${category eq 'sauce'}">
						<a href="#" onclick="setDescAndSubmit('간장')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>개량간장</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">39Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('꿀')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>꿀</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">294Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('마요네즈')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>마요네즈(난황)</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">172Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('설탕')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>설탕</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">387Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('소금')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>소금</h5>
									<p>1회분(1/3작은술) (1g)</p>
								</div>
								<div class="categoryCalorie">0Kcal</div>
							</div>
						</a>
					</c:when>
					<c:when test="${category eq 'soup'}">
						<a href="#" onclick="setDescAndSubmit('된장국')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>된장국</h5>
									<p>1회분 (166g)</p>
								</div>
								<div class="categoryCalorie">139Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('죽')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>죽</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">71Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('스튜')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>스튜</h5>
									<p>1인분 (25g)</p>
								</div>
								<div class="categoryCalorie">139Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('김치찌개')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>김치찌개</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">61Kcal</div>
							</div>
						</a>
					</c:when>
					<c:when test="${category eq 'vegetable'}">
						<a href="#" onclick="setDescAndSubmit('가지')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>가지</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">17Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('감자')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>감자</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">63Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('고구마')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>고구마</h5>
									<p>1회분 (75g)</p>
								</div>
								<div class="categoryCalorie">98.25Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('당근')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>당근</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">41.3Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('마늘')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>마늘</h5>
									<p>1쪽 (5g)</p>
								</div>
								<div class="categoryCalorie">4Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('토마토')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>토마토</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">18Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('브로콜리')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>브로콜리</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">33Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('상추')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>상추</h5>
									<p>1회분 (70g)</p>
								</div>
								<div class="categoryCalorie">8.4Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('시금치')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>시금치</h5>
									<p>1회분 (40g)</p>
								</div>
								<div class="categoryCalorie">8Kcal</div>
							</div>
						</a>
					</c:when>
					<c:when test="${category eq 'beverage'}">
						<a href="#" onclick="setDescAndSubmit('아메리카노')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>아메리카노</h5>
									<p>1회분 (180ml)</p>
								</div>
								<div class="categoryCalorie">20Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('아이스티')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>아이스티</h5>
									<p>1캔 (355ml)</p>
								</div>
								<div class="categoryCalorie">70Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('칵테일')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>칵테일</h5>
									<p>1회분 (100ml)</p>
								</div>
								<div class="categoryCalorie">185.7Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('오렌지주스')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>오렌지주스</h5>
									<p>1회분 (100ml)</p>
								</div>
								<div class="categoryCalorie">42Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('포도주스')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>포도주스</h5>
									<p>1회분 (100ml)</p>
								</div>
								<div class="categoryCalorie">40Kcal</div>
							</div>
						</a>
					</c:when>
					<c:when test="${category eq 'milk'}">
						<a href="#" onclick="setDescAndSubmit('마가린')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>마가린</h5>
									<p>1회분 (100ml)</p>
								</div>
								<div class="categoryCalorie">721Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('모짜렐라')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>모짜렐라</h5>
									<p>1회분 (100ml)</p>
								</div>
								<div class="categoryCalorie">215Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('버터')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>버터</h5>
									<p>1회분 (100ml)</p>
								</div>
								<div class="categoryCalorie">716.8Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('버터')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>두유</h5>
									<p>1회분 (100ml)</p>
								</div>
								<div class="categoryCalorie">70Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('요거트')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>요거트</h5>
									<p>1회분 (100ml)</p>
								</div>
								<div class="categoryCalorie">65Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('그릭요거트')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>그릭요거트</h5>
									<p>1회분 (100ml)</p>
								</div>
								<div class="categoryCalorie">150Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('사워크림')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>사워크림</h5>
									<p>1회분 (100ml)</p>
								</div>
								<div class="categoryCalorie">195Kcal</div>
							</div>
						</a>
					</c:when>
					<c:when test="${category eq 'pasta'}">
						<a href="#" onclick="setDescAndSubmit('스파게티')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>스파게티</h5>
									<p>1회분 (100ml)</p>
								</div>
								<div class="categoryCalorie">363Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('볶음밥')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>볶음밥</h5>
									<p>1인분 (400g)</p>
								</div>
								<div class="categoryCalorie">773.30Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('국수')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>국수</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">374Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('귀리')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>쌀귀리</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">371Kcal</div>
							</div>
						</a>
					</c:when>
					<c:when test="${category eq 'fastfood'}">
						<a href="#" onclick="setDescAndSubmit('나초')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>나초</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">305Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('치즈버거')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>치즈버거</h5>
									<p>1회분 (150g)</p>
								</div>
								<div class="categoryCalorie">454.5Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('피자')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>피자</h5>
									<p>1회분 (150g)</p>
								</div>
								<div class="categoryCalorie">403.5Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('햄버거')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>햄버거</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">271Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('핫도그')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>핫도그</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">284Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('양파링')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>양파링튀김</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">332Kcal</div>
							</div>
						</a>
					</c:when>
					<c:when test="${category eq 'etc'}">
						<a href="#" onclick="setDescAndSubmit('팝콘')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>팝콘</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">536Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('만두')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>만두</h5>
									<p>1인분 (220g)</p>
								</div>
								<div class="categoryCalorie">379Kcal</div>
							</div>
						</a>
						<a href="#" onclick="setDescAndSubmit('밀가루')">
							<div class="categoryBox">
								<div class="categoryGram">
									<h5>밀가루</h5>
									<p>1회분 (100g)</p>
								</div>
								<div class="categoryCalorie">364Kcal</div>
							</div>
						</a>
					</c:when>
					<c:otherwise>
						<h2>세부 정보를 찾을 수 없습니다.</h2>
					</c:otherwise>
				</c:choose>
			</div>
			<script>
				function setDescAndSubmit(desc) {
					document.getElementById("desc_kor").value = desc; // desc_kor 값을 설정합니다.
					document.getElementById("foodForm").submit(); // 폼을 제출하여 information.jsp로 이동합니다.
				}
			</script>

			<a href="#" onclick="goBack()">
				<div class="backArrowWrap">
					<img src="${cp}/resources/img/leftarrow.png" class="backArrowK">
					<p>뒤로가기</p>
				</div>
			</a>

			<script>
				function goBack() {
					window.history.back();
				}
			</script>
</body>
</html>