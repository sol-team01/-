$(document).ready(function(){
  // 셀렉트 박스를 클릭했을 때 이벤트 처리
  $("#customSelect .select-selected").click(function(event) {
    event.stopPropagation(); // 이벤트 전파 방지
    
    // 다른 열려 있는 셀렉트 박스들을 닫음
    $(".select-items").toggleClass("select-show");
  });
  
  
//옵션을 선택했을 때 이벤트 처리
  $("#customSelect .select-items").on("click", "div", function() {
    var selectedOption = $(this).text(); // 선택한 옵션의 텍스트

    // 선택한 옵션을 선택된 옵션으로 표시
    $(this).parent().siblings(".select-selected").text(selectedOption);

    // 셀렉트 박스 닫기
    $(this).parent().removeClass("select-show");
  });
});