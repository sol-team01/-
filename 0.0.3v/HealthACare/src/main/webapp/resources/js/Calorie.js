$(document).ready(function(){
    var foodList = [];
var storedFoodList = JSON.parse(localStorage.getItem('foodList'));
    if(storedFoodList != null){
        foodList = storedFoodList;
        updateList();
    }
        
    $(".moveButton").click(function() {
        var row = $(this).closest("tr");
        addFood(row);
        saveFood();
    });
    
    // 이벤트 위임을 사용하여 부모 요소에 클릭 이벤트를 바인딩합니다.
    $('#cartDiv').on('click', '.removeButton', function() {
        var row = $(this).closest("tr");
        removeFood(row);
        saveFood();
    });
    
        $('#clearSessionButton').click(function(){
       	var meal = $('#C_meal').val();
   		console.log(meal);
        $.ajax({
            url:"/foodRest/insertFoodList",
            method: "POST",
            contentType: "application/json",
            data:   JSON.stringify({
            meal : meal,
            list : foodList
            }),
            success: function(response){
                alert('음식 목록이 성공적으로 저장되었습니다.');
                localStorage.removeItem('foodList');
                foodList = [];
                updateList();
                
            },
            error: function(xhr, status, error) {
                alert('음식 목록 저장 중 오류가 발생했습니다.');
                console.error(xhr, status, error);
            }
        });
    });

    function addFood(row){
        var food = {
            foodName : row.find("td:nth-child(1)").text(),
            servingAmount : row.find("td:nth-child(2)").text(),
            calorie : row.find("td:nth-child(3)").text() 
        };
        foodList.push(food);
        updateList();
    }
            
    function removeFood(row){
        // 행에서 직접 인덱스를 가져와서 삭제
        var rowIndex = row.index();
        foodList.splice(rowIndex, 1);
        updateList();
    }
	
	function updateList(){
	
	        $('#cartDiv table tr').remove();
        // cartDiv에 이동된 정보를 표시합니다.
        var cartTable = document.querySelector('#cartDiv table');
        var calorie = 0;
        foodList.forEach(function(item){        
            // 새로운 행을 생성하여 이동된 정보를 추가합니다.
            var newRow = cartTable.insertRow();
            newRow.innerHTML = `
                <td class="testFS">${item.foodName}</td>
                <td class="testFS">${item.servingAmount}</td>
                <td class="testFS">${item.calorie}</td>
                <td class="testFS"><button class="removeButton">삭제</button></td>`;
calorie += parseInt(item.calorie);
        });
	$('#caloriePlus').html(`<p id="answer"> ${calorie}</p>`);
	
	 // 권장 칼로리와 비교하여 텍스트 색상 변경
        var recommendedCalories = parseInt($('.recommendedCalories').text());
        if (calorie > recommendedCalories) {
            $('#answer').css('color', 'red');
        } else {
            $('#answer').css('color', '#03BDFF'); // 원래 색상으로 되돌리기
        }
	}
	
	
    function saveFood() {
        // localStorage에 변경된 foodList 저장
        localStorage.setItem('foodList', JSON.stringify(foodList));
    }
});
