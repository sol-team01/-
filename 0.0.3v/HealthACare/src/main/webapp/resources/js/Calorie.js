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
        foodList.forEach(function(item){        
            // 새로운 행을 생성하여 이동된 정보를 추가합니다.
            var newRow = cartTable.insertRow();
            newRow.innerHTML = `
                <td>${item.foodName}</td>
                <td>${item.servingAmount}</td>
                <td>${item.calorie}</td>
                <td><button class="removeButton">삭제</button></td>`;
        });
	}


            
    function saveFood() {
        // localStorage에 변경된 foodList 저장
        localStorage.setItem('foodList', JSON.stringify(foodList));
    }
});