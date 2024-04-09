<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품정보 세부리스트</title>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
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
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('땅콩')">땅콩</a>
								<p>1인분 (25g)</p>
							</div>
							<div class="categoryCalorie">139Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('마카다미아')">마카다미아</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">718Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('아몬드')">아몬드</a>
								<p>1회분 (25g)</p>
							</div>
							<div class="categoryCalorie">142Kcal</div>
						</div>

						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('잣')">잣</a>
								<p>1인분 (20g)</p>
							</div>
							<div class="categoryCalorie">126Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('캐슈')">캐슈넛</a>
								<p>1주먹 한 줌 (20g)</p>
							</div>
							<div class="categoryCalorie">110Kcal</div>
						</div>
						
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('피스타치오')">피스타치오</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">610Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('피칸')">피칸</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">740Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('호두')">호두</a>
								<p>1주먹 한 줌 (20g)</p>
							</div>
							<div class="categoryCalorie">130Kcal</div>
						</div>
					</c:when>
					<c:when test="${category eq 'meat'}">
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('소고기')">소고기</a>
								<p>1인분 (100g)</p>
							</div>
							<div class="categoryCalorie">250.5Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('닭고기')">닭고기</a>
								<p>1인분 (100g)</p>
							</div>
							<div class="categoryCalorie">239Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('돼지고기')">돼지고기</a>
								<p>1인분 (100g)</p>
							</div>
							<div class="categoryCalorie">242.1Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('가슴살')">닭가슴살</a>
								<p>1인분 (100g)</p>
							</div>
							<div class="categoryCalorie">164.9Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('돼지갈비')">돼지갈비</a>
								<p>1인분 (25g)</p>
							</div>
							<div class="categoryCalorie">249Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('베이컨')">베이컨</a>
								<p>1인분 (25g)</p>
							</div>
							<div class="categoryCalorie">241Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('양고기')">양고기</a>
								<p>1인분 (60g)</p>
							</div>
							<div class="categoryCalorie">86.40Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('후라이드')">후라이드 치킨</a>
								<p>1인분 (30g)</p>
							</div>
							<div class="categoryCalorie">155.45Kcal</div>
						</div>
					</c:when>
					<c:when test="${category eq 'fruit'}">
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('건포도')">건포도</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">269Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('대추')">대추</a>
								<p>8개 (80g)</p>
							</div>
							<div class="categoryCalorie">83.2Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('딸기')">딸기</a>
								<p>중형 10개 (220g)</p>
							</div>
							<div class="categoryCalorie">31.2Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('오렌지')">오렌지</a>
								<p>1개 (252g)</p>
							</div>
							<div class="categoryCalorie">120Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('망고')">망고</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">64Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('매실')">매실</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">34Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('멜론')">멜론</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">36Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('복숭아')">복숭아</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">48Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('바나나')">바나나</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">80Kcal</div>
						</div>
					</c:when>
					<c:when test="${category eq 'dessert'}">
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('초콜렛')">초콜렛</a>
								<p>1회분 (15g)</p>
							</div>
							<div class="categoryCalorie">81.45Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('도넛')">도넛</a>
								<p>1인분 (70g)</p>
							</div>
							<div class="categoryCalorie">296Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('머핀')">머핀</a>
								<p>1개 (110g)</p>
							</div>
							<div class="categoryCalorie">422Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('브라우니')">브라우니</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">379Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('사탕')">사탕</a>
								<p>1개 (10g)</p>
							</div>
							<div class="categoryCalorie">38Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('아이스크림')">아이스크림</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">212Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('와플')">와플</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">291Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('치즈케이크')">치즈케이크</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">321Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('푸딩')">푸딩</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">126Kcal</div>
						</div>
					</c:when>
					<c:when test="${category eq 'bread'}">
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('그래놀라')">그래놀라</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">490Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('마늘빵')">마늘빵</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">500Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('베이글')">베이글</a>
								<p>1회분 (120g)</p>
							</div>
							<div class="categoryCalorie">335.48Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('오트밀')">오트밀</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">382Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('토스트')">토스트</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">293Kcal</div>
						</div>
					</c:when>
					<c:when test="${category eq 'seafood'}">
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('가리비')">가리비</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">74Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('가재')">갯가재</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">87Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('대게')">대게(삶은것)</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">69Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('고등어')">고등어(생것)</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">183Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('굴')">석굴</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">61Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('오징어,생것')">오징어(생것)</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">95Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('문어')">문어(생것)</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">74Kcal</div>
						</div>
					</c:when>
					<c:when test="${category eq 'sauce'}">
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('간장')">개량간장</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">39Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('꿀')">꿀</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">294Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('마요네즈')">마요네즈(난황)</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">172Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('설탕')">설탕</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">387Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('소금')">소금</a>
								<p>1회분(1/3작은술) (1g)</p>
							</div>
							<div class="categoryCalorie">0Kcal</div>
						</div>
					</c:when>
					<c:when test="${category eq 'soup'}">
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('된장국')">된장국</a>
								<p>1회분 (166g)</p>
							</div>
							<div class="categoryCalorie">139Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('죽')">죽</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">71Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('스튜')">스튜</a>
								<p>1인분 (25g)</p>
							</div>
							<div class="categoryCalorie">139Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('김치찌개')">김치찌개</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">61Kcal</div>
						</div>
					</c:when>
					<c:when test="${category eq 'vegetable'}">
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('가지')">가지</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">17Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('감자')">감자</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">63Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('고구마')">고구마</a>
								<p>1회분 (75g)</p>
							</div>
							<div class="categoryCalorie">98.25Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('당근')">당근</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">41.3Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('마늘')">마늘</a>
								<p>1쪽 (5g)</p>
							</div>
							<div class="categoryCalorie">4Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('토마토')">토마토</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">18Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('브로콜리')">브로콜리</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">33Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('상추')">상추</a>
								<p>1회분 (70g)</p>
							</div>
							<div class="categoryCalorie">8.4Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('시금치')">시금치</a>
								<p>1회분 (40g)</p>
							</div>
							<div class="categoryCalorie">8Kcal</div>
						</div>
					</c:when>
					<c:when test="${category eq 'beverage'}">
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('아메리카노')">아메리카노</a>
								<p>1회분 (180ml)</p>
							</div>
							<div class="categoryCalorie">20Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('아이스티')">아이스티</a>
								<p>1캔 (355ml)</p>
							</div>
							<div class="categoryCalorie">70Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('칵테일')">칵테일</a>
								<p>1회분 (100ml)</p>
							</div>
							<div class="categoryCalorie">185.7Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('오렌지주스')">오렌지주스</a>
								<p>1회분 (100ml)</p>
							</div>
							<div class="categoryCalorie">42Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('포도주스')">포도주스</a>
								<p>1회분 (100ml)</p>
							</div>
							<div class="categoryCalorie">40Kcal</div>
						</div>
					</c:when>
					<c:when test="${category eq 'milk'}">
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('마가린')">마가린</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">721Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('모짜렐라')">모짜렐라</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">215Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('버터')">버터</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">716.8Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('두유')">두유</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">70Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('요거트')">요거트</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">65Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('그릭요거트')">그릭요거트</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">150Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('사워크림')">사워크림</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">195Kcal</div>
						</div>
					</c:when>
					<c:when test="${category eq 'pasta'}">
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('스파게티')">스파게티</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">363Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('볶음밥')">볶음밥</a>
								<p>1인분 (400g)</p>
							</div>
							<div class="categoryCalorie">773.30Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('국수')">국수</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">374Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('귀리')">쌀귀리</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">371Kcal</div>
						</div>
					</c:when>
					<c:when test="${category eq 'fastfood'}">
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('나초')">나초</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">305Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('치즈버거')">치즈버거</a>
								<p>1회분 (150g)</p>
							</div>
							<div class="categoryCalorie">454.5Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('피자')">피자</a>
								<p>1회분 (150g)</p>
							</div>
							<div class="categoryCalorie">403.5Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('햄버거')">햄버거</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">271Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('핫도그')">핫도그</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">284Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('양파링')">양파링튀김</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">332Kcal</div>
						</div>
					</c:when>
					<c:when test="${category eq 'etc'}">
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('팝콘')">팝콘</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">536Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('만두')">만두</a>
								<p>1인분 (220g)</p>
							</div>
							<div class="categoryCalorie">379Kcal</div>
						</div>
						<div class="categoryBox">
							<div class="categoryGram">
								<a href="#" onclick="setDescAndSubmit('밀가루')">밀가루</a>
								<p>1회분 (100g)</p>
							</div>
							<div class="categoryCalorie">364Kcal</div>
						</div>
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