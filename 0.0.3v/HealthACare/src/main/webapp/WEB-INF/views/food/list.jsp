<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식품정보 리스트</title>
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/list.css">
</head>
<body>
	<div id="warp">
		<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>
			<div class="dietList">
				<!-- 왼쪽 -->
				<div class="listLeft">
					<div class="dietTitle">
						<div class="dietTitleImg">
							<img src="${cp}/resources/img/rightarrow.png">
						</div>
						<p class="dietTitleText">리스트에 없는 것이 궁금하다면 오른쪽의 검색창을 통해 검색해 주세요</p>
					</div>
					<div class="dietSearch">
						<img src="${cp}/resources/img/salad2.png" class="salad"
							alt="샐러드 이미지">
						<div class="dietSearchText">
							<h2>음식</h2>
							<div>귀하가 좋아하는 브랜드와 레스토랑의 일반적인 음식과 제품을 탐색합니다.</div>
						</div>
					</div>
					<div class="dietSearchBottom"></div>
					<h3>일반적인 음식 탐색</h3>
					<div class="wrapperK">
						<div class="oneK wrapperKFlex">
							<div class="wrapperKImage">

								<img src="${cp}/resources/img/nuts.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=nuts">견과류</a>
								<div class="dietCategoryDetail">
									<div>아몬드</div>
									<div>땅콩</div>
									<div>피칸</div>
									<div>피스타치오</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=nuts"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
						<div class="twoK wrapperKFlex">
							<div class="wrapperKImage">
								<img src="${cp}/resources/img/meat1.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=meat">고기(육류)</a>
								<div class="dietCategoryDetail">
									<div>돼지고기</div>
									<div>소고기</div>
									<div>닭고기</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=meat"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
						<div class="threeK wrapperKFlex">
							<div class="wrapperKImage">
								<img src="${cp}/resources/img/fruits.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=fruit">과일</a>
								<div class="dietCategoryDetail">
									<div>사과</div>
									<div>바나나</div>
									<div>딸기</div>
									<div>오렌지</div>
									<div>포도</div>
									<div>자몽</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=fruit"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
						<div class="fourK wrapperKFlex">
							<div class="wrapperKImage">
								<img src="${cp}/resources/img/dessert.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=dessert">과자,사탕&디저트</a>
								<div class="dietCategoryDetail">
									<div>초콜릿</div>
									<div>케이크</div>
									<div>아이스크림</div>
									<div>파이</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=dessert"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
						<div class="fiveK wrapperKFlex">
							<div class="wrapperKImage">
								<img src="${cp}/resources/img/bread.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=bread">빵&시리얼</a>
								<div class="dietCategoryDetail">
									<div>식빵</div>
									<div>통밀빵</div>
									<div>베이글</div>
									<div>시리얼</div>
									<div>오트밀</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=bread"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
						<div class="sixK wrapperKFlex">
							<div class="wrapperKImage">
								<img src="${cp}/resources/img/seafood.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=seafood">해산물</a>
								<div class="dietCategoryDetail">
									<div>새우</div>
									<div>랍스타</div>
									<div>참치</div>
									<div>연어</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=seafood"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
						<div class="sevenK wrapperKFlex">
							<div class="wrapperKImage">
								<img src="${cp}/resources/img/sauce.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=sauce">향신료&잼류</a>
								<div class="dietCategoryDetail">
									<div>케첩</div>
									<div>머스터드</div>
									<div>딸기잼</div>
									<div>마멀레이드</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=sauce"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
						<div class="eightK wrapperKFlex">
							<div class="wrapperKImage">
								<img src="${cp}/resources/img/soup.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=soup">수프(국)</a>
								<div class="dietCategoryDetail">
									<div>치킨수프</div>
									<div>야채스튜</div>
									<div>비프스톡</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=soup"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
						<div class="nineK wrapperKFlex">
							<div class="wrapperKImage">
								<img src="${cp}/resources/img/vegetable.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=vegetable">야채</a>
								<div class="dietCategoryDetail">
									<div>버섯</div>
									<div>당근</div>
									<div>오이</div>
									<div>상추</div>
									<div>토마토</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=vegetable"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
						<div class="tenK wrapperKFlex">
							<div class="wrapperKImage">
								<img src="${cp}/resources/img/drink.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=beverage">음료</a>
								<div class="dietCategoryDetail">
									<div>과일쥬스</div>
									<div>탄산음료</div>
									<div>에너지음료</div>
									<div>커피</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=beverage"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
						<div class="elevenK wrapperKFlex">
							<div class="wrapperKImage">
								<img src="${cp}/resources/img/milk1.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=milk">우유&유제품</a>
								<div class="dietCategoryDetail">
									<div>우유</div>
									<div>두유</div>
									<div>치즈</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=milk"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
						<div class="twelveK wrapperKFlex">
							<div class="wrapperKImage">
								<img src="${cp}/resources/img/pasta.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=pasta">파스타,쌀&국수</a>
								<div class="dietCategoryDetail">
									<div>스파게티</div>
									<div>볶음밥</div>
									<div>국수</div>
									<div>쌀귀리</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=pasta"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
						<div class="thirdteenK wrapperKFlex">
							<div class="wrapperKImage">
								<img src="${cp}/resources/img/hamburger.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=fastfood">패스트푸드</a>
								<div class="dietCategoryDetail">
									<div>햄버거</div>
									<div>감자튀김</div>
									<div>부리토</div>
									<div>타코</div>
									<div>핫도그</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=fastfood"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
						<div class="forteenK wrapperKFlex">
							<div class="wrapperKImage">
								<img src="${cp}/resources/img/cart.png">
							</div>
							<div class="wrapperKText">
								<a href="${cp}/food/detailList?category=etc">기타</a>
								<div class="dietCategoryDetail">
									<div>만두</div>
									<div>단백질 파우더</div>
									<div>튀김</div>
								</div>
							</div>
							<div class="wrapperKArrow">
								<a href="${cp}/food/detailList?category=etc"> <img
									src="${cp}/resources/img/rightarrow.png">
								</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 왼쪽 끝 -->
				<!-- 오른쪽 -->
				<div class="middle">
					<div class="dietForm">
						<h3>음식 검색</h3>
						<form action="${cp}/food/information">
							<input type="text" name=desc_kor autocomplete="off"
								placeholder="검색어를 입력하세요">
						</form>
					</div>
					<div class="dietFormBottom">
						<img src="${cp}/resources/img/phisicalchalange.png">
					</div>
				</div>
				<!-- 오른쪽 끝 -->
				<div class="ListRight">
					<div class="rightBannerTextK">
						건강한 식단 관리에 <br>관심이 있으신가요?
					</div>
					<div class="dietBanner">
						<img src="${cp}/resources/img/unsplash.jpg">
					</div>
					<div class="videoWrapK">
						<iframe width="200" height="420"
							src="${cp}/resources/img/diet.mp4" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
						<!-- 						<video width="220" height="428" controls autoplay> -->
						<%-- 							<source src="${cp}/resources/img/diet.mp4" type="video/mp4"> --%>
						<!-- 							</source> -->
						<!-- 							대체 내용 -->
						<!-- 						</video> -->
					</div>
				</div>
			</div>

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