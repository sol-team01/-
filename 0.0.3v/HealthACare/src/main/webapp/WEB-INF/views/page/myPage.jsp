<!-- [최] 컨트롤러 연결은 임의로 MyPageController에 있습니다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<link rel="stylesheet" href="/resources/myPage.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
										<c:forEach var="graph" items="${graph}">
											<option value="${graph.no}">
												일자: ${graph.datetime} / 체중: ${graph.weight} kg / 신장: ${graph.height} cm
											</option>
										</c:forEach>
									</select>
									<button type="button" id="delBtn">삭제</button>
								<div id="weightWrite">
									<input type="number" name="weight" placeholder="몸무게" maxlength="5">
									<input type="number" name="height" placeholder="신장" maxlength="5">
									<button type="button" id="weightSubmit">입력</button>
								</div>
							</div>
							</div><!-- <div id="chartLayout"> -->
				</div>
				<!-- 그래프 -->
				<div id="secondPage">
						<div id="myFood">
							<div id="myFoodText">
								당신의 권장 칼로리
								<div>
								<div class="kaclBox">150,00</div>
								<a class="textKcal"> kcal</a>
								</div> 
							</div>
							<div id="foodd">
								<div id="foodList">
									<c:forEach var="test" begin="0" end="100" step="1">
									음식이름 칼로리량 영양정보<br>
									</c:forEach>
								</div>
								<div id="week">
									<div id="mon" class="weekDay">
									월요일 식단
									</div>
									<div id="tue" class="weekDay">
									화요일 식단
									</div>
									<div id="wed" class="weekDay">
									수요일 식단
									</div>
									<div id="thu" class="weekDay">
									목요일 식단
									</div>
									<div id="fri" class="weekDay">
									금요일 식단
									</div>
									<div id="sat" class="weekDay">
									토요일 식단
									</div>
									<div id="sun" class="weekDay">
									일요일 식단
									</div>
								</div>
							</div>
						</div>
					<div id="rightPage">
						<div id="rightBottom">
							<div id="calender">
								<img src="https://img.freepik.com/free-vector/simple-calendar-2017-template_1057-1892.jpg?w=740&t=st=1711696973~exp=1711697573~hmac=e43835881b4a67cab0ca8eddbe6941b40b317bfa57b9b378182f9481e3403697">
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
					
					$('#delBtn').click(function(){
						var selectedId = $('#graphSelect').val();
						console.log(selectedId);
						if (!selectedId) {
							alert('삭제할 항목을 선택해주세요.');
							return;
						}
						
						$.ajax({
							url: '/page/delete/' + selectedId,
							type: 'DELETE',
							success: function(response) {
								console.log('데이터 삭제 완료');
								window.location.reload();
							},
							error: function(xhr, status, error) {
								console.error("데이터 삭제 오류");
							}
						});
					});
					
					$('#weightSubmit').click(function(){
						var id = $('sessionId').val();
						var weight = $('input[name="weight"]').val();
						var height = $('input[name="height"]').val();
						
						$.ajax({
							url: '/page/weight',
							method: 'POST',
							data: { id: id, weight: weight, height: height},
							success: function(response){
								console.log("데이터 들어감")
								window.location.reload();
							},
							error: function(xhr, status, error) {
								console.log("데이터 안들어감")
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
        
        
        <c:forEach var="graph" items="${graph}">
            dates.push('${graph.datetime}');
            weights.push('${graph.weight}');
            heights.push('${graph.height}');
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
        			ctx.font='bold 12px sans-serif';
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
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1,
//                     yAxisID: 'left-y-axis',
                    barThickness: 15,
                    datalabels: {
                        color: 'red',
                        align: 'end',
                        anchor: 'end',
                        font: { weight: 'bold' },
                      }
                }, 
                {
                    label: 'BMI',
                    data: bmis,
                    type: 'line',
                    fill: false,
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 2,
                    segment: {
                        borderColor: ctx => skipped(ctx, 'rgb(0,0,0,0.2)') || down(ctx, 'rgb(192,71,75)'),
                        borderDash: ctx => skipped(ctx, [6, 6]),
                      },
                      datalabels: {
                          color: 'blue',
                          align: 'end',
                          anchor: 'end',
                          font: { weight: 'bold' },
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