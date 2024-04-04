<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<%-- <%@ page errorPage="/error/error404.jsp" %> --%>
<html>
<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<style>
</style>
</head>
<body>
<div id="warp">
<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
<div id="main">
<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>

<div>
	<form action="${cp}/food/calorieCounting">
		<input type="text" name=desc_kor autocomplete="off" placeholder="검색어를 입력하세요">
	</form>
	
	<div id="foodDiv" style="overflow: auto; max-height: 200px;">
	
	<table>
	<tr>
		<td> 식품이름 </td>
		<td> 1회제공량 </td>
		<td> 열량 </td>
		<td> 버튼 </td>
	</tr>
	<c:forEach var="i" begin="0" end="19" varStatus="loop">
    <tr>
        <td id="desc_kor_${loop.index}"> ${food.body.items.get(i).DESC_KOR } </td>
        <td id="serving_wt_${loop.index}"> ${food.body.items.get(i).SERVING_WT } g </td>
        <td id="nutr_cont1_${loop.index}"> ${food.body.items.get(i).NUTR_CONT1 } kcal </td>
        <td><button class = "moveButton">이동</button></td>
    </tr>
	</c:forEach>
	</table>
	</div>
</div>

<hr>

<div >
<!-- 장바구니 보이고 오른쪽에 권장 칼로리와 계산된 칼로리가 보이는 곳 -->
	<div id="cartDiv" style="overflow: auto; max-height: 200px;">
		<table>
		<tr>
			<td> 식품이름 </td>
			<td> 1회제공량 </td>
			<td> 열량 </td>
			<td> 버튼 </td>
		</tr>
		<tr>
		</tr>		
		</table>
	</div>
	<button id="clearSessionButton">세션 클리어</button>
	계산된 칼로리 (a+a+a+a+a+a+a+...) -> 권장 칼로리 보다 높으면 빨간색, 낮으면 초록색
	&nbsp;&nbsp;&nbsp;/
	<div>
	선택 
	- 육체활동이 거의 없는 경우
		표준체중 X 30(kcal)
	- 보통의 활동을 하는 경우
		표준체중 X 35(kcal)
	- 심한 육체활동을 하는 경우
		표준체중 X 40(kcal)
		
		표준체중 구하는 법
		- 신장이 150cm 미만 : 신장 -100
		- 신장이 150cm 이상 -160cm 미만인 경우 : (신장-150) /2 +50
		- 신장이 160cm 이상인 경우 : (신장-100)X0.9 
	권장칼로리
	선택 
	</div>
</div>



</div><!-- <div id="main"> -->
</div><!-- <div id="warp"> -->

<script>

window.onload = function() {
    // 세션에서 이동된 정보를 가져옵니다.
    var movedItems = sessionStorage.getItem('movedItems');
    if (movedItems) {
        // 이동된 정보가 있으면 JSON 형식으로 변환하여 파싱합니다.
        var movedItemsArray = JSON.parse(movedItems);

        // cartDiv에 이동된 정보를 표시합니다.
        var cartTable = document.querySelector('#cartDiv table');
        movedItemsArray.forEach(function(item) {
            var newRow = cartTable.insertRow();
            newRow.innerHTML = `
                <td>${item.desc_kor}</td>
                <td>${item.serving_wt}</td>
                <td>${item.nutr_cont1}</td>
                <td><button class="moveButton" data-index="${item.index}">이동</button></td>
            `;
        });
    }

    // 이동 버튼에 클릭 이벤트 리스너를 추가합니다.
    var buttons = document.querySelectorAll('.moveButton');
    buttons.forEach(function(button) {
        button.addEventListener('click', function(event) {
            var row = this.parentNode.parentNode; // 클릭된 버튼의 부모 요소(tr)의 부모 요소(table row)를 찾습니다.
            var cartTable = document.querySelector('#cartDiv table');
            var foodTable = document.querySelector('#foodDiv table');

            // 클릭된 행을 장바구니 또는 음식 목록으로 이동합니다.
            if (row.closest('#foodDiv')) {
                // 음식 목록에서 클릭된 경우, 장바구니로 이동합니다.
                cartTable.appendChild(row);
                
                // 이동된 정보를 세션에 저장합니다.
                var movedItems = sessionStorage.getItem('movedItems');
                var movedItemsArray = [];
                if (movedItems) {
                    movedItemsArray = JSON.parse(movedItems);
                }
                	
                movedItemsArray.push({
                    desc_kor: row.querySelector('td:nth-child(1)').innerText,
                    serving_wt: row.querySelector('td:nth-child(2)').innerText,
                    nutr_cont1: row.querySelector('td:nth-child(3)').innerText,
                    index: Array.from(row.parentNode.children).indexOf(row) - 1 // 인덱스를 0부터 시작하도록 수정
                });
                sessionStorage.setItem('movedItems', JSON.stringify(movedItemsArray));
            } else if (row.closest('#cartDiv')) {
                // 장바구니에서 클릭된 경우, 음식 목록으로 이동합니다.
                foodTable.appendChild(row);
                
                // 세션에서 클릭된 아이템을 삭제합니다.
				var index = Array.from(row.parentNode.children).indexOf(row);
                removeFromSession(index);
            }

            // 이동된 행의 이동 버튼을 비활성화합니다.
            button.disabled = true;

            // 다른 행의 이동 버튼을 활성화합니다.
            var otherButtons = document.querySelectorAll('.moveButton');
            otherButtons.forEach(function(otherButton) {
                otherButton.disabled = false;
            });
        });
    });
};

//클릭된 아이템을 세션에서 삭제하는 함수
function removeFromSession(index) {
    var movedItems = sessionStorage.getItem('movedItems');
    var movedItemsArray = [];
    if (movedItems) {
        movedItemsArray = JSON.parse(movedItems);
        movedItemsArray = movedItemsArray.filter(function(item) {
            return item.index !== index;
        });
        sessionStorage.setItem('movedItems', JSON.stringify(movedItemsArray));
    }
}

document.getElementById('clearSessionButton').addEventListener('click', function() {
    sessionStorage.removeItem('movedItems');
    // 세션 클리어 후 필요한 작업을 수행할 수 있습니다.
});


</script>

</body>
</html>