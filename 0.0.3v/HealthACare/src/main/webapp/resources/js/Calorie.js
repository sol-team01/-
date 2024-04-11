$(document).ready(function(){
    var foodList = []; // 음식 목록을 저장할 배열을 선언합니다.
    var storedFoodList = JSON.parse(localStorage.getItem('foodList')); // localStorage에서 이전에 저장된 음식 목록을 가져옵니다.
    if(storedFoodList != null){ // 이전에 저장된 음식 목록이 있다면
        foodList = storedFoodList; // foodList에 저장된 음식 목록을 업데이트합니다.
        updateList(); // 화면에 음식 목록을 업데이트합니다.
    }
        
    $(".moveButton").click(function() { // "이동" 버튼이 클릭되면
        var row = $(this).closest("tr"); // 클릭된 버튼이 속한 행을 가져옵니다.
        addFood(row); // 해당 행의 음식을 음식 목록에 추가합니다.
        saveFood(); // 음식 목록을 localStorage에 저장합니다.
    });
    
    // 이벤트 위임을 사용하여 부모 요소에 클릭 이벤트를 바인딩합니다.
    $('#cartDiv').on('click', '.removeButton', function() { // "삭제" 버튼이 클릭되면
        var row = $(this).closest("tr"); // 클릭된 버튼이 속한 행을 가져옵니다.
        removeFood(row); // 해당 행의 음식을 음식 목록에서 제거합니다.
        saveFood(); // 음식 목록을 localStorage에 저장합니다.
    });

    // "저장" 버튼이 클릭되면
    $('#clearSessionButton').click(function(){
        var meal = $('#C_meal').val(); // 사용자가 선택한 식사 유형을 가져옵니다.
        
        // 서버에 음식 목록을 저장하는 AJAX 요청을 보냅니다.
        $.ajax({
            url:"/foodRest/insertFoodList",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                U_no : '1',
                meal : meal, // 선택한 식사 유형을 전송합니다.
                list : foodList // 음식 목록을 전송합니다.
            }),
            success: function(response){
                alert('음식 목록이 성공적으로 저장되었습니다.');
            },
            error: function(xhr, status, error) {
                alert('음식 목록 저장 중 오류가 발생했습니다.');
                console.error(xhr, status, error);
            }
        });
    });

    // 각 식사 유형에 해당하는 <table>을 보이거나 감춥니다.
    function showMealType(mealType) {
        $('.cartDiv').hide(); // 모든 식사 유형을 숨깁니다.
        $('#' + mealType + 'CartDiv').show(); // 선택한 식사 유형에 해당하는 테이블만 보이도록 합니다.
    }

    $('#C_meal').change(function(){
        var mealType = $(this).val();
        showMealType(mealType);
    });

    function addFood(row){
        var mealType = $('#C_meal').val(); // 현재 선택된 식사 유형을 가져옵니다.
        var food = {
            foodName : row.find("td:nth-child(1)").text(),
            servingAmount : row.find("td:nth-child(2)").text(),
            calorie : row.find("td:nth-child(3)").text() 
        };
        foodList.push(food);
        updateList();
        showMealType(mealType); // 추가된 음식이 해당 식사 유형에 표시되도록 호출합니다.
    }
    // // 선택한 음식을 음식 목록에 추가하는 함수입니다.
    // function addFood(row){
    //     var food = {
    //         foodName : row.find("td:nth-child(1)").text(),
    //         servingAmount : row.find("td:nth-child(2)").text(),
    //         calorie : row.find("td:nth-child(3)").text() 
    //     };
    //     foodList.push(food); // 음식 목록에 음식을 추가합니다.
    //     updateList(); // 화면에 음식 목록을 업데이트합니다.
    // }
            
    // 선택한 음식을 음식 목록에서 제거하는 함수입니다.
    function removeFood(row){
        // 행에서 직접 인덱스를 가져와서 삭제합니다.
        var rowIndex = row.index();
        foodList.splice(rowIndex, 1); // 음식 목록에서 해당 인덱스의 음식을 제거합니다.
        updateList(); // 화면에 음식 목록을 업데이트합니다.
    }
	
    function updateList(){
        $('.cartDiv table tr').remove();
        var calorie = 0;
        foodList.forEach(function(item, index){        
            var newRow = $('#' + $('#C_meal').val() + 'CartDiv table')[0].insertRow(); // 현재 선택된 식사 유형에 맞게 행을 추가합니다.
            newRow.innerHTML = `
                <td>${item.foodName}</td>
                <td>${item.servingAmount}</td>
                <td>${item.calorie}</td>
                <td><button class="removeButton">삭제</button></td>`;
            calorie += parseInt(item.calorie);
        });
        $('#caloriePlus').html(`<p>총 칼로리: ${calorie}</p>`);
    }
    // // 음식 목록을 업데이트하고 화면에 표시하는 함수입니다.
    // function updateList(){
    //     $('#cartDiv table tr').remove(); // 기존의 테이블 행을 모두 제거합니다.
    //     var cartTable = document.querySelector('#cartDiv table'); // 장바구니 테이블을 가져옵니다.
    //     var calorie = 0; // 총 칼로리를 저장할 변수를 초기화합니다.
    //     foodList.forEach(function(item){        
    //         // 새로운 행을 생성하여 음식 정보를 테이블에 추가합니다.
    //         var newRow = cartTable.insertRow();
    //         newRow.innerHTML = `
    //             <td>${item.foodName}</td>
    //             <td>${item.servingAmount}</td>
    //             <td>${item.calorie}</td>
    //             <td><button class="removeButton">삭제</button></td>`;
    //         calorie += parseInt(item.calorie); // 총 칼로리를 계산합니다.
    //     });
    //     $('#caloriePlus').html(`<p>총 칼로리: ${calorie}</p>`); // 총 칼로리를 화면에 표시합니다.
    // }

    // 음식 목록을 localStorage에 저장하는 함수입니다.
    function saveFood() {
        localStorage.setItem('foodList', JSON.stringify(foodList)); // 음식 목록을 localStorage에 저장합니다.
    }
});
