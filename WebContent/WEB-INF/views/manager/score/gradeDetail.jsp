<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>성적 분석</title>

<head>
	<style>
		* {
			font-size: 1gr4px;
		}
	</style>
</head>

<body>

<div class="gradeDetail" id="gradeDetail" style="display: none;">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>성적 분석</h1>
				</div>
			</div>
		</div>
	</section>
	
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				
				<!-- 상단 -->
				<div class="col-sm-12">
					<div class="row">
					
						<!-- 상단 좌측 -->
						<div class="col-sm-6">
						
							<div class="card card-dark card-outline">
							
								<div class="card-header">
									<h3 class="card-title">
										<i class="fas fa-chart-column"></i>
										&nbsp;
										종합 점수 - 월별 그래프
									</h3>
								</div>
								
								<div class="card-body">
									<canvas id="chart1" width="400" height="200"></canvas>
								</div>
								
							</div>
							
						</div>
						
						<!-- 상단 우측 -->
						<div class="col-sm-6">
							<div class="card card-dark card-outline">
							
								<div class="card-header">
									<div class="row">
									<div class="col-sm-10">
									<h3 class="card-title">
										<i class="fas fa-chart-column"></i>
										&nbsp;
										과목 점수 - 월별 그래프
									</h3>
									</div>
									<div class="col-sm-2">
									<select class="form-control float-right" style="padding: 0; font-size: .8rem; line-height: 1; height: 19px;">
										<option>과목 선택</option>
										<option>국어</option>
										<option>수학</option>
										<option>사회</option>
										<option>과학</option>
										<option>영어</option>
									</select>
									</div>
									</div>
									
								</div>
								
								<div class="card-body">
									<canvas id="chart2" width="400" height="200"></canvas>
								</div>
								
							</div>
						</div>
					</div>
				</div>
				
				<!-- 하단 -->
				<div class="col-sm-12">
					<div class="row">
					
						<!-- 하단 좌측 -->
						<div class="col-sm-6">
							<div class="card card-dark card-outline">
							
								<div class="card-header">
									<h3 class="card-title">
										<i class="fa-solid fa-list-check"></i>
										&nbsp;
										난이도 별 정답률 - 대덕중 중1 국어
									</h3>
								</div>
								
								<div class="card-body">
									<div class="row">
										<div class="col-sm-12">
											<div class="card-body table p-0">
												<table class="table table-head-fixed table-bordered table-hover">
													<thead>
														<tr>
															<td>상</td>
															<td>중</td>
															<td>하</td>
															<td>전체</td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>3 / 5</td>
															<td>3 / 5</td>
															<td>10 / 10</td>
															<td>16 / 20</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="col-sm-12">
											<canvas id="chart3" width="400" height="230" style="padding-left: 30px;"></canvas>
										</div>
									</div>
								</div>
								
							</div>
						</div>
						
						<!-- 하단 우측 -->
						<div class="col-sm-6">
							<div class="card card-dark card-outline">
							
								<div class="card-header">
									<h3 class="card-title">
										<i class="fa-solid fa-list-check"></i>
										&nbsp;
										영역 별 정답률 - 대덕중 중1 국어
									</h3>
								</div>
								
								<div class="card-body">
									<div class="row">
										<div class="col-sm-12">
											<div class="card-body table p-0">
												<table class="table table-head-fixed table-bordered table-hover">
													<thead>
														<tr>
															<td>영역1</td>
															<td>영역2</td>
															<td>영역3</td>
															<td>영역4</td>
															<td>영역5</td>
															<td>전체</td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>4 / 4</td>
															<td>2 / 4</td>
															<td>3 / 4</td>
															<td>4 / 4</td>
															<td>3 / 4</td>
															<td>16 / 20</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="col-sm-12">
											<canvas id="chart4" width="400" height="230" style="padding-left: 50px;"></canvas>
										</div>
									</div>
								</div>
								
							</div>
						</div>
						
					</div>
				</div>
				
				<div class="col-sm-12">
					<button type="submit" class="btn btn-warning" onclick="history.go(-1);">
					이전으로 돌아가기
					</button>
					<button type="submit" class="btn btn-dark float-right" onclick="location.href='/manager/score/gradeFeedback.do';">
					성적 피드백 보기
					</button>
				</div>
				
			</div>
		</div>
	</section>
	</div>
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
	<script>

	var ctx1 = document.getElementById('chart1').getContext('2d');
	var myChart = new Chart(ctx1, {
	    type: 'bar',
	    data: {
	        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        datasets: [{
	            label: '학교',
	            data: [0, 0, 0, 0, 90, 0, 60, 0, 0, 70, 0, 50],
	            backgroundColor: [
	                'rgba(255, 99, 132, 1)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)'
	              
	            ],
	            borderWidth: 1
	        },
	        {
	            label: '학원',
	            data: [50, 70, 50, 80, 80, 30, 40, 100, 70, 80, 55, 70],
	            backgroundColor: [
	                'rgba(32, 73, 105, 1)'
	            ],
	            borderColor: [
	                'rgba(32, 73, 105, 1)'
	              
	            ],
	            borderWidth: 1
	        }
	        ]
	    },
	    options: {
	        scales: {
	            y: {
	                beginAtZero: true,
	                suggestedMin: 0,
	                suggestedMax: 100
	            }
	        }
	    }
	});
	
	var ctx2 = document.getElementById('chart2').getContext('2d');
	var myChart = new Chart(ctx2, {
	    type: 'bar',
	    data: {
	        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        datasets: [{
	            label: '학교',
	            data: [0, 0, 0, 0, 90, 0, 60, 0, 0, 70, 0, 50],
	            backgroundColor: [
	                'rgba(255, 99, 132, 1)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)'
	              
	            ],
	            borderWidth: 1
	        },
	        {
	            label: '학원',
	            data: [50, 70, 50, 80, 80, 30, 40, 100, 70, 80, 55, 70],
	            backgroundColor: [
	                'rgba(32, 73, 105, 1)'
	            ],
	            borderColor: [
	                'rgba(32, 73, 105, 1)'
	              
	            ],
	            borderWidth: 1
	        }
	        ]
	    },
	    options: {
	        scales: {
	            y: {
	                beginAtZero: true,
	                suggestedMin: 0,
	                suggestedMax: 100
	            }
	        }
	    }
	});
	
	new Chart(document.getElementById("chart3"), {
	    type: 'radar',
	    data: {
	      labels: ["상", "중", "하"],
	      datasets: [
	        {
	          fill: true,
	          backgroundColor: "rgba(179,181,198,0.2)",
	          borderColor: "rgba(179,181,198,1)",
	          pointBorderColor: "#fff",
	          pointBackgroundColor: "rgba(179,181,198,1)",
	          data: [0.6, 0.6, 1]
	        }
	      ]
	    },
	    options: {
	    	plugins: {
	    	    legend: {
	    	      display: false,
	    	    }
	    	},
	      	responsive: false,
	      	scales: {
	            r: {
/* 	                angleLines: {
	                    display: false
	                }, */
	                suggestedMin: 0,
	                suggestedMax: 1
	            }
	        }
	    }
	});
	
	new Chart(document.getElementById("chart4"), {
	    type: 'radar',
	    data: {
	      labels: ["영역1", "영역2", "영역3", "영역4", "영역5"],
	      datasets: [
	        {
	          fill: true,
	          backgroundColor: "rgba(179,181,198,0.2)",
	          borderColor: "rgba(179,181,198,1)",
	          pointBorderColor: "#fff",
	          pointBackgroundColor: "rgba(179,181,198,1)",
	          data: [1, 0.5, 0.75, 1, 0.75]
	        }
	      ]
	    },
	    options: {
	    	plugins: {
	    	    legend: {
	    	      display: false,
	    	    }
	    	},
	      	responsive: false,
	      	scales: {
	            r: {
/* 	                angleLines: {
	                    display: false
	                }, */
	                suggestedMin: 0,
	                suggestedMax: 1
	            }
	        }
	    }
	});
	
	</script>
</body>