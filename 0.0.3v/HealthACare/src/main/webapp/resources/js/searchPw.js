
	//비활성화 상태로 두다가 조건이 다 맞아야 활성화하는 상태
	$(document).ready(function() {
		
        // 도메인 직접 입력 or domain option 선택 
       const domainListEl = document.querySelector('#domain-list'); 
       const domainInputEl = document.querySelector('#domain'); 
       // select 옵션 변경 시
        domainListEl.addEventListener('change', (event) => {
       // option에 있는 도메인 선택 시
       if(event.target.value !== "") {
        // 선택한 도메인을 input에 입력하고 disabled 
       domainInputEl.value = event.target.value;
       domainInputEl.disabled = true;
       } else { // 직접 입력 시
        // input 내용 초기화 & 입력 가능하도록 변경 
        domainInputEl.value = " "; 
        domainInputEl.disabled = false;
        } 
       });	
       
    });
   