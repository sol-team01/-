<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품정보 리스트</title>
<link rel="stylesheet" href="${cp}/resources/list.css">
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>
			<div class="flexK">
				<!-- 왼쪽 -->
				<div class="listLeft">
					<div class="dietTitle">리스트에 없는 것이 궁금하다면 검색해 주세요</div>
					<div class="dietSearch">
						<img src="${cp}/resources/img/salad2.png" class="salad"
							alt="샐러드 이미지">
						<div>
							<h2>음식</h2>
							<div>귀하가 좋아하는 브랜드와 레스토랑의 일반적인 음식과 제품을 탐색합니다.</div>
						</div>
					</div>
					<div class="dietSearchBottom"></div>
					<h3>일반적인 음식 탐색</h3>
					<div class="wrapperK">
						<div class="oneK wrapperKFlex">
							<div>

								<img src="${cp}/resources/img/nuts.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=nuts">견과류</a>
								<div class="dietCategoryDetail">
									<div>아몬드</div>
									<div>땅콩</div>
									<div>피칸</div>
								</div>
							</div>
						</div>
						<div class="twoK wrapperKFlex">
							<img src="${cp}/resources/img/meat1.png"> <a
								href="${cp}/food/detailList?category=meat">고기(육류)</a>
						</div>
						<div class="threeK wrapperKFlex">
							<img src="${cp}/resources/img/fruits.png"> <a
								href="${cp}/food/detailList?category=fruit">과일</a>
						</div>
						<div class="fourK wrapperKFlex">
							<img src="${cp}/resources/img/dessert.png"> <a
								href="${cp}/food/detailList?category=dessert">과자,사탕&디저트</a>
						</div>
						<div class="fiveK wrapperKFlex">
							<img src="${cp}/resources/img/bread.png"> <a
								href="${cp}/food/detailList?category=bread">빵&시리얼</a>
						</div>
						<div class="sixK wrapperKFlex">
							<img src="${cp}/resources/img/seafood.png"> <a
								href="${cp}/food/detailList?category=seafood">해산물</a>
						</div>
						<div class="sevenK wrapperKFlex">
							<img src="${cp}/resources/img/sauce.png"> <a
								href="${cp}/food/detailList?category=sauce">소스,향신료&잼류</a>
						</div>
						<div class="eightK wrapperKFlex">
							<img src="${cp}/resources/img/soup.png"> <a
								href="${cp}/food/detailList?category=soup">수프(국)</a>
						</div>
						<div class="nineK wrapperKFlex">
							<img src="${cp}/resources/img/vegetable.png"> <a
								href="${cp}/food/detailList?category=vegetable">야채</a>
						</div>
						<div class="tenK wrapperKFlex">
							<img src="${cp}/resources/img/drink.png"> <a
								href="${cp}/food/detailList?category=beverage">음료</a>
						</div>
						<div class="elevenK wrapperKFlex">
							<img src="${cp}/resources/img/milk.png"> <a
								href="${cp}/food/detailList?category=milk">우유&유제품</a>
						</div>
						<div class="twelveK wrapperKFlex">
							<img src="${cp}/resources/img/pasta.png"> <a
								href="${cp}/food/detailList?category=pasta">파스타,쌀&국수</a>
						</div>
						<div class="thirdteenK wrapperKFlex">
							<img src="${cp}/resources/img/hamburger.png"> <a
								href="${cp}/food/detailList?category=fastfood">패스트푸드</a>
						</div>
						<div class="forteenK wrapperKFlex">
							<img src="${cp}/resources/img/cart.png"> <a
								href="${cp}/food/detailList?category=etc">기타</a>
						</div>
					</div>
				</div>
				<!-- 왼쪽 끝 -->
				<!-- 오른쪽 -->
				<div>


					<form action="${cp}/food/information">
						<input type="text" name=desc_kor autocomplete="off"
							placeholder="검색어를 입력하세요">
					</form>
				</div>
				<!-- 오른쪽 끝 -->
			</div>




			<a href="#" onclick="goBack()">뒤로가기</a>

			<script>
				function goBack() {
					window.history.back();
				}
			</script>
</body>
</html>