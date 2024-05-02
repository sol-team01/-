<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${cp}/resources/img/salad1.png" type="image/png"><!-- 파비콘 -->
<link rel="stylesheet" href="${cp}/resources/common.css"><!-- 기본 CSS -->
<link rel="stylesheet" href="/resources/myPage.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.2.0/chartjs-plugin-datalabels.min.js"
	integrity="sha512-JPcRR8yFa8mmCsfrw4TNte1ZvF1e3+1SdGMslZvmrzDYxS69J7J49vkFL8u6u8PlPJK+H3voElBtUCzaXj+6ig=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>${login.getI_name()}님의페이지</title>
</head>
<body>
<div id="warp">
<jsp:include page="/WEB-INF/views/homeDesign/category.jsp"></jsp:include>
<div id="main">
<jsp:include page="/WEB-INF/views/homeDesign/homeTop.jsp"></jsp:include>			
<!-- 상단 및 네비 고정 이후 메인 페이지 -->
<!-- 상단 및 네비 고정 이후 메인 페이지 -->
<!-- 상단 및 네비 고정 이후 메인 페이지 -->
					<!-- 상단 내정보 -->
					<div id="myInfo">
						<div id="infoName">
							<a class="nameColor">${login.getI_name()}</a> 님! 어서오세요.
						</div>
									<a href="${cp}/myInfo/myInfoChange" >
										<button>개인정보 수정</button>	
									</a>
					</div>
					<!-- 상단 내정보 -->
				<!-- 그래프 -->
				<div id="graphLayout">
					<div id="infoName">
					체중변화를 그래프로 알아볼까요?
					</div>
				<div id="chartLayout">
				<div id="chart">
					<div id="chartContainer" style="position: relative; width: 900px; height: 400px;">
						<canvas id="myChart" width="600" height="430"></canvas>
					</div>
				</div>
					<div id="chartInfoTextBox">
					<div class="chartText">
						체중변화 그래프
					</div>
						<select id="graphSelect">
							<c:forEach var="graph" items="${physical}">
								<option value="${graph.p_no}">
									일자: ${graph.p_updatedAt} / 체중: ${graph.p_weightLog} kg / 신장: ${graph.p_heightLog} cm
								</option>
							</c:forEach>
						</select>
					<div id="weightWrite">
						<input type="hidden" id="sessionUno" value="${login.u_no}">
						<div class="flex"><input type="number" name="weight" placeholder="몸무게" maxlength="5"> kg</div>
						<div class="flex"><input type="number" name="height" placeholder="신장" maxlength="5" value="${physical[0].p_heightLog}"> cm</div>
						<br>
						<button type="button" id="weightSubmit">입력</button>
					</div>
				</div>
				</div><!-- <div id="chartLayout"> -->
			</div>
<!-- 그래프 -->
				<div id="secondPage">
<!-- 칼로리 jsp 따로 뺴놓았슴다~ (최) -->
<jsp:include page="/WEB-INF/views/page/myPageDesign/myFoodKcal.jsp"></jsp:include>						
<div id="rightPage">
							<div id="myActivity">나의 활동</div>
							<div id="myActivityListBox">
							<div id="myActivityList">
<!-- 내가 작성한 글  -->
<c:forEach var="list" items="${myBoardList}" begin="0" end="19" varStatus="status">
<a href="${cp}/board/readBoard?B_no=${list.b_no}">
<div class="num">	
<div class="box">[${status.count}] [${list.b_category}]</div>
<div class="title">${list.b_title} </div>
<div class="box"><img src="${cp}/resources/img/eye.svg"> ${list.b_hit }</div>
</div>
</a>
</c:forEach>
							</div>
							</div>
</div>
			</div>
		</div>
		<!-- <div id="main"> -->
	</div>
	<!-- <div id="warp"> -->

	<script>
		$(document).ready(
				function() {
					// 셀렉트 박스를 클릭했을 때 이벤트 처리
					$("#customSelect .select-selected").click(function(event) {
						//     event.stopPropagation(); // 이벤트 전파 방지

						// 다른 열려 있는 셀렉트 박스들을 닫음
						$(".select-items").toggleClass("select-show");
					});

					$("#customSelect .select-selected").hover(function(event) {
						//    event.stopPropagation(); // 이벤트 전파 방지

						// 다른 열려 있는 셀렉트 박스들을 닫음
						$(".select-items").toggleClass("select-show");
					});

					//옵션을 선택했을 때 이벤트 처리
					$("#customSelect .select-items").on(
							"click",
							"div",
							function() {
								var selectedOption = $(this).text(); // 선택한 옵션의 텍스트

								// 선택한 옵션을 선택된 옵션으로 표시
								$(this).parent().siblings(".select-selected")
										.text(selectedOption);

								// 셀렉트 박스 닫기
								$(this).parent().removeClass("select-show");
							});
					

					
					$('#weightSubmit').click(function() {
					    var uno = $('#sessionUno').val();
					    var weight = $('input[name="weight"]').val();
					    var height = $('input[name="height"]').val();
					    console.log(uno); // 변수명을 U_no에서 uno로 변경
					    console.log(weight);
					    console.log(height);
					    
					    
					    $.ajax({
					        url: '/myPage/physicalSumbit',
					        method: 'POST',
					        data: {
					            'U_no': uno,
					            'weight': weight,
					            'height': height
					        },
					        success: function(response){
					            console.log("데이터들어감");
					            location.reload();
					        },
					        error: function(xhr, status, error) {
					            console.log("데이터안들어감");
					        }
					    });
					});
				});
		

        var ctx = document.getElementById('myChart').getContext('2d');
        
        var dates = [];
        var weights = [];
        var heights = [];
        var bmis = [];

        const skipped = (ctx, value) => ctx.p0.skip || ctx.p1.skip ? value : undefined;
        const down = (ctx, value) => ctx.p0.parsed.y > ctx.p1.parsed.y ? value : undefined;
        
        
        <c:forEach var="graph" items="${physical}">
            dates.push('${graph.p_createdAt}');
            weights.push('${graph.p_weightLog}');
            heights.push('${graph.p_heightLog}');
        </c:forEach>

        function calculateBMI(weight, height) {
            var heightInMeter = height / 100;
            var bmi = weight / (heightInMeter * heightInMeter);
            return Math.round(bmi * 10) / 10;
        }

        for (var i = 0; i < weights.length; i++) {
            var bmi = calculateBMI(parseFloat(weights[i]), parseFloat(heights[i]));
            bmis.push(bmi);
        }

        const topLabels={
        		id: 'topLabels',
        		afterDatasetsDraw(chart, args, pluinOptions){
        			const {ctx, scales:{x,y}}=chart; 
        			chart.data.datasets[0].data.forEach((datapoint, index)=>{
        				const datasetArray=[];
        				chart.data.datasets.forEach((dataset)=>{
        					datasetArray.push(dataset.data[index])
        				})
        			})
        			ctx.font='bold 20px sans-serif';
        			ctx.fillStyle='blue';
        			ctx.textAlign='end';
        		}
        }
        
        
        
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: dates,
                datasets: [{
                    label: 'Weight (kg)',
                    data: weights,
                    backgroundColor: 'rgba(3, 189, 255, 0.2)', // #03BDFF 색상에 30%의 투명도
                    borderColor: 'rgba(3, 189, 255, 0.5)', // 막대 테두리 색상을 #03BDFF로 설정
                    borderWidth: 1,
//                     yAxisID: 'left-y-axis',
                    barThickness: 15,
                    datalabels: {
                        color: '#03BDFF',
                        align: 'start',
                        anchor: 'end',
                        font: {
                            size: 20, // 이 부분을 추가하여 폰트 크기를 설정합니다.
                            weight: 'bold'
                        }
                      }
                }, 
                {
                    label: 'BMI',
                    data: bmis,
                    type: 'line',
                    fill: false,
                    backgroundColor: 'blue', // 막대 배경색을 #03BDFF로 설정
                    borderColor:'blue',
                    borderWidth: 2,
                    segment: {
                        borderColor: ctx => skipped(ctx, 'rgb(0,0,0,0.2)') || down(ctx, 'rgb(192,71,75)'),
                        borderDash: ctx => skipped(ctx, [6, 6]),
                      },
                      datalabels: {
                          color: 'blue',
                          align: 'end',
                          anchor: 'end',
                          font: {
                              size: 20, // 이 부분을 추가하여 폰트 크기를 설정합니다.
                              weight: 'bold'
                          }
                        }
//                     yAxisID: 'right-y-axis'
                }]
            },            
//             plugins:[ChartDataLabels],
            plugins:[ChartDataLabels, topLabels],

            options: {
                maintainAspectRatio: false,
                aspectRatio: 1,
                scales: {
                    yAxes: [{
//                         id: 'left-y-axis',
                        type: 'linear',
                        position: 'left',
                        ticks: {
                            beginAtZero: true
                        }
                    }, {
//                         id: 'right-y-axis',
                        type: 'linear',
                        position: 'right',
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
            }
        });
	</script>
</body>
</html>