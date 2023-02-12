	`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<title>성적 조회</title>

<head>
	<style>
		* {
			font-size: 14px;
		}
		label {
			margin-bottom: 0;
		}
		div.table1 {
			max-height: 250px;
			overflow-y: scroll;
		}
		div.table2 {
			max-height: 210px;
			overflow-y: scroll;
		}
		div.table3 {
			overflow-y: auto;
		}
		.table-head-fixed th {
			padding-top: 0.3em;
			padding-bottom: 0.3em;
		}
		.table-head-fixed td {
			padding-top: 0.3em;
			padding-bottom: 0.3em;
		}
		
 		.card-body.p-0 .table thead>tr>th:first-of-type {
			padding-left: 12px;
		}
 		.card-body.p-0 .table tbody>tr>td:first-of-type {
			padding-left: 12px;
		}
		.card-body.p-0 .table thead>tr>th:last-of-type {
			padding-right: 12px;
		}
 		.card-body.p-0 .table tbody>tr>td:last-of-type {
			padding-right: 12px;
		}
		th, td {
			text-align: center;
		}
		#tb1 td, #td1 th {
			padding:0;
		}
		.clickableTr {
			cursor: pointer;
		}
		.clickableTr:hover {
			color: #fdfbd7;
		    background-color: #204969;
		    border-color: white;
		    box-shadow: none;
		}
		.selectedTr {
			color: #fdfbd7;
		    background-color: #204969;
		    border-color: white;
		    box-shadow: none;
		}
		.examLine{
			cursor: pointer;
		}
		.examLine:hover {
			color: #fdfbd7;
		    background-color: #204969;
		    border-color: white;
		    box-shadow: none;
		}
		.selectedExam {
			color: #fdfbd7;
		    background-color: #204969;
		    border-color: white;
		    box-shadow: none;
		}
	</style>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
</head>

<body>

<div class="gradeCheck" id="gradeCheck" style="display: block;">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6" style="display: flex;">
					<h1 data-userId="${loginUser.id }">성적조회</h1>
					<c:if test="${fn:indexOf(favoriteMenuListStr, '성적조회') != -1}">
	                  	<i id="star" class="fa-solid fa-star on fa-2x" ></i>
	               	 </c:if>
	               	 <c:if test="${fn:indexOf(favoriteMenuListStr, '성적조회') == -1}">
	                  	<i id="star" class="fa-regular fa-star off fa-2x" ></i>
	               	 </c:if>
				</div>
			</div>
		</div>
	</section>
	
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-5" >
							<div class="card card-dark card-outline" style="height: 100%;">
								<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
    						   <div class="row">  
				               <h3 class="card-title">
									<i class="fas fa-list"></i>
				<!-- 					<i class="fa-solid fa-1"></i> -->
									&nbsp;
									학생 선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   </h3>
    						   </div>
    						   
				               <div class="card-tools" style="margin: 0;">
				                  <div class="row">
				                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<input id="searchStudent" type="text" class="form-control float-right" placeholder="키워드 검색" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<div class="input-group-append">
											<button id="searchStudentBtn" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
												<i class="fas fa-search" aria-hidden="true"></i>
											</button>
										</div>
									</div>
								  </div>
				               </div>
				            </div>

								<div class="card-body" style="padding-top: 5px">
									<br/>
									<div class="row table1">
										<div class="card-body p-0" id="studentListDiv">
												<table id="studentList" class="table table-head-fixed table-bordered">
													<thead>
														<tr>
															<th>학년</th>
															<th>담임교사명</th>
															<th>반</th>
															<th>학생명</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${empty studentList }" >
										            		<tr>
										            			<td colspan="4" class="text-center">
										            				해당내용이 없습니다.
										            			</td>
										            		</tr>
										            	</c:if>
										            	<c:if test="${!empty studentList }" >
						            						<c:forEach items="${studentList }" var="student">
						            							<tr data-id="${student.id }" class="clickableTr" onclick="examCheckByStudent('${student.id }');">
						            								<td>${student.grade }</td>

						            								<td  class="managerDetail" data-id="${student.mngId}"><strong>${student.mngName }</strong></td>

						            							

						            								<td>${student.className }</td>
						            								<td class="memberDetail" data-id="${student.id }" style="cursor: pointer;"><strong>${student.name }</strong></td>
						            							</tr>
						            						</c:forEach>
					            						</c:if>
													</tbody>
												</table>
											</div>
									</div>
								</div>
							</div>
						</div>
					
						<div class="col-sm-7">
							<div class="card card-dark card-outline" style="height: 100%;">
								<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
    						   <div class="row">  
				               <h3 class="card-title">
									<i class="fas fa-check"></i>
				<!-- 					<i class="fa-solid fa-1"></i> -->
									&nbsp;
									시험 선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   </h3>
    						   </div>
    						   
				               <div class="card-tools" style="margin: 0;">
				                  <div class="row">
				                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<input id="keyword" type="text" class="form-control float-right" placeholder="키워드 검색" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<div class="input-group-append">
											<button id="examSearch" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
												<i class="fas fa-search" aria-hidden="true"></i>
											</button>
										</div>
									</div>
								  </div>
				               </div>
				            </div>

								<div class="card-body" style="padding-top: 5px">
									
									<br/>
									<div class="row table2">
										<div class="card-body table p-0" id="examCheckDiv">
											<table class="table table-head-fixed table-bordered" id="examCheckList">
												<thead>
													<tr>
														<th>시험일</th>
														<th>구분</th>
														<th>학년</th>
														<th>학기</th>
														<th>분기</th>
													</tr>
												</thead>
												<tbody>
														<tr>
															<td colspan="5">학생을 선택해주세요</td>
														</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-sm-12" style="padding-top: 15px;">
					<div class="row">
						<div class="col-sm-7">
							<div class="card card-dark card-outline">
								
								<div class="card-header">
									<h3 class="card-title">
										<i class="fas fa-table"></i>
										&nbsp;
										종합 점수
									</h3>
								</div>
								<div class="card-body" style="padding-top: 5px; padding-bottom: 5px;">
									<div class="row table3">
										<div class="card-body table p-0">
											<table class="table table-head-fixed table-bordered">
												<thead>
													<tr>
														<th id="sub1">국어</th>
														<th id="sub2">수학</th>
														<th id="sub3">사회</th>
														<th id="sub4">과학</th>
														<th id="sub5">영어</th>
														<th id="sub6">평균</th>
													</tr>
												</thead>
												<tbody>
													<tr class="tr">
														<td id="korean">-</td>
														<td id="math">-</td>
														<td id="society">-</td>
														<td id="science">-</td>
														<td id="english">-</td>
														<td id="avg">-</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								
							</div>
							
							<div class="card card-dark card-outline">
							
								<div class="card-header">
									<h3 class="card-title">
										<i class="fas fa-comment"></i>
										&nbsp;
										종합 피드백
									</h3>
									<div class="card-tools" style="padding: 3px;">
										<div class="input-group input-group-sm">
											<div class="input-group">
												<button type="button" id="saveFeedback" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5; display: none;">
													저장
												</button>
											</div>
										</div>
									</div>
								</div>
								
								<div class="card-body" style="padding: 0;">
								<div class="direct-chat-messages" style="height: 60%; padding-top: 0px; padding-bottom: 0px;">
										<div class="direct-chat-msg">
											<div class="direct-chat-infos clearfix">
												<span id="teacher" class="direct-chat-name float-left"></span>
												<span style="display: none;" id="feedId"></span>
												<span style="display: none;" id="mngId"></span>
												<span style="display: none;" id="loginId">${loginUser.id }</span>
												<span style="display: none;" id="loginName">${loginUser.mngName }</span>
<%-- 												<span style="display: none;" id="studentId">${studentList.id }</span> --%>
									</div>
									<div class="row" style="margin-left: 5px;">
												<div id="profile2" style="border-radius: 100%; height: 7vh; width: 6vh; border: 1px solid black; margin-right: 5px; padding: 0px; background-position: center center; background-size: cover; background-repeat: no-repeat;"></div>
											
											<div class=" direct-chat-text" style="height: 60px; width: 500px; margin: 0px; padding: 0px;">
												<textarea id="feedbackArea" class="" name="content" rows="10" style="width:100%; height:43px; padding:0px; margin:0px; border: 0px; resize: none; background-color: lightgray;"></textarea>
											</div>
									</div>
										</div>
									</div>

								</div>
								
							</div>
							
						</div>
						<div class="col-sm-5">
							<div class="card card-dark card-outline">
								<div class="card-header">
									<h3 class="card-title">
										<i class="fas fa-chart-pie"></i>
										&nbsp;
										종합 분석 그래프
									</h3>
									<div class="card-tools" style="padding: 3px;">
										<div class="input-group input-group-sm">
											<div class="input-group">
												<button type="button" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;" id="changeGrade">
													성적 분석
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body">
										<canvas id="radar-chart" width="350" height="250" style="padding-left: 20px;"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	</div>
	
<!-- 	성적분석 div -->
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
									<div class="row">
										<div class="col-sm-10">
											<h3 class="card-title">
												<i class="fas fa-chart-column"></i>
												&nbsp;
												종합 점수 - 월별 그래프
											</h3>
										</div>
										<div class="col-sm-2">
<!-- 											<select class="form-control float-right" style="padding: 0; font-size: .8rem; line-height: 1; height: 19px;"> -->
<!-- 												<option>년도</option> -->
<!-- 												<option>국어</option> -->
<!-- 												<option>수학</option> -->
<!-- 												<option>사회</option> -->
<!-- 												<option>과학</option> -->
<!-- 												<option>영어</option> -->
<!-- 											</select> -->
<!-- 											<input id="year" class="form-control float-right"  value="" style="padding: 0; font-size: .8rem; line-height: 1; height: 21px;" /> -->
											<div id="year"></div>
										</div>
									</div>
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
									<div class="col-sm-9">
									<h3 class="card-title">
										<i class="fas fa-chart-column"></i>
										&nbsp;
										과목 점수 - 월별 그래프
									</h3>
									</div>
									<div class="col-sm-3">
										<select name="subject" class="form-control float-right" style="padding: 0; font-size: .8rem; line-height: 1; height: 19px;">
											<option value="" selected>과목 선택</option>
											<option value="국어">국어</option>
											<option value="수학">수학</option>
											<option value="사회">사회</option>
											<option value="과학">과학</option>
											<option value="영어">영어</option>
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
										난이도 별 정답률 <span id="bySubject"></span>
									</h3>
								</div>
								
								<div class="card-body">
									<div class="row">
										<div class="col-sm-12">
											<div class="card-body table p-0" id="bySubjectDiv">
												<table id="bySubjectList" class="table table-head-fixed table-bordered">
													<thead>
														<tr>
															<td>상</td>
															<td>중</td>
															<td>하</td>
															<td>전체</td>
														</tr>
													</thead>
<!-- 													<tbody> -->
<!-- 														<tr> -->
<!-- 															<td></td> -->
<!-- 															<td></td> -->
<!-- 															<td></td> -->
<!-- 															<td></td> -->
<!-- 														</tr> -->
<!-- 													</tbody> -->
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
										영역 별 정답률 <span id="byArea"></span>
									</h3>
								</div>
								
								<div class="card-body">
									<div class="row">
										<div class="col-sm-12">
											<div class="card-body table p-0" id="byAreaDiv">
												<table id="byAreaList" class="table table-head-fixed table-bordered">
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
<!-- 													<tbody> -->
<!-- 														<tr> -->
<!-- 															<td>4 / 4</td> -->
<!-- 															<td>2 / 4</td> -->
<!-- 															<td>3 / 4</td> -->
<!-- 															<td>4 / 4</td> -->
<!-- 															<td>3 / 4</td> -->
<!-- 															<td>16 / 20</td> -->
<!-- 														</tr> -->
<!-- 													</tbody> -->
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
					<button type="submit" class="btn btn-warning" id="changeDetail">
					이전으로 돌아가기
					</button>
<!-- 					<button type="submit" class="btn btn-dark float-right" onclick="location.href='/manager/score/gradeFeedback.do';"> -->
<!-- 					성적 피드백 보기 -->
<!-- 					</button> -->
				</div>
				
			</div>
		</div>
	</section>
	</div>
	
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script>
	
	function printData(dataArr,target,templateObject,removeClass){
		
		var template=Handlebars.compile(templateObject.html());
		
		var html = template(dataArr);
		
		$(removeClass).remove();
		target.append(html);
}
	
	
	function examCheckByStudent(studentId){
// 		console.log(studentId); // 학생 id
		
		$.ajax({
	        type: "post"
	       ,url : "/manager/score/examCheckByStudent.do"
	       ,data : {"studentId" : studentId }
	       ,success : function (data){
	    	   console.log(data);
	    	   printData(data,$('#examCheckDiv'),$('#examCheckList-template'),$('#examCheckList'));
	        }
	       ,error : function(e){
	        }
		});
		
		
	}
	
	let examDate;
	let examGroup;
	let examGrade;
	let examSemester;
	let examQuarter;
	let studentId;
	
	function Overall(obj){
		
		let loginName = $("#loginName").text();
		
		examDate = obj.children[0].textContent;
		examGroup = obj.children[1].textContent;
		examGrade = obj.children[2].textContent;
		examSemester = obj.children[3].textContent;
		examQuarter = obj.children[4].textContent;
		studentId = obj.children[5].textContent;

		$.ajax({
	        type: "post"
	       ,url : "/manager/score/overall.do"
	       ,contentType: 'application/json'
	       ,data : JSON.stringify({
	    	   		"examDate" : examDate,
	    	   		"examGroup" : examGroup,
	    	   		"examGrade" : examGrade,
	    	   		"examSemester" : examSemester,
	    	   		"examQuarter" : examQuarter,
	    	   		"studentId" : studentId
	    	   		})
	       ,success : function (data){
	    	   console.log(data);
	    	   $("#korean").text("-");
	    	   $("#math").text("-");
	    	   $("#society").text("-");
	    	   $("#science").text("-");
	    	   $("#english").text("-");
	    	   $("#avg").text("-");
	    	   
	    	   for(var i=0; i<data.overallScore.length; i++) {
	    		   if(data.overallScore[i].examSeg == "국어") {
		    	  		$("#korean").text(data.overallScore[i].scored);
		    	  		
		    	  } else if(data.overallScore[i].examSeg == "수학") {
		    		  $("#math").text(data.overallScore[i].scored);
		    		  
		    	  } else if(data.overallScore[i].examSeg == "사회") {
		    		  $("#society").text(data.overallScore[i].scored);
		    		  
		    	  }  else if(data.overallScore[i].examSeg == "과학") {
		    		  $("#science").text(data.overallScore[i].scored);
		    		  
		    	  } else if(data.overallScore[i].examSeg == "영어") {
		    		  $("#english").text(data.overallScore[i].scored);
		    	  } 
	    	   }
	    	   		
	    	   	   let length = data.overallScore.length;
	    		   let total = parseInt($("#korean").text().replace('-','0'));
	    		   total +=  parseInt($("#math").text().replace('-','0'));
	    		   total += parseInt($("#society").text().replace('-','0'));
	    		   total += parseInt($("#science").text().replace('-','0'));
	    		   total += parseInt($("#english").text().replace('-','0'));
	    		   
	    		   let avg = total/length;
	    		   
	    		   
	    		   let avgR = avg.toFixed(1);
	    		   
				   $("#avg").text(avgR);
				   
				   
				   chart.data.datasets[0].data = [
					   parseInt($("#korean").text().replace('-','0')),
					   parseInt($("#math").text().replace('-','0')),
					   parseInt($("#society").text().replace('-','0')),
					   parseInt($("#science").text().replace('-','0')),
					   parseInt($("#english").text().replace('-','0'))
				   ];
				   chart.update();
	        }
	       ,error : function(e){
	        }
		});
		
// 		console.log(studentId);
		
// 		피드백 가져오기
		$.ajax({
	        type: "post"
	       ,url : "/manager/score/feedback.do"
	       ,contentType: 'application/json'
	       ,data : JSON.stringify({
	   	   		"examDate" : examDate,
		   		"examGroup" : examGroup,
		   		"examGrade" : examGrade,
		   		"examSemester" : examSemester,
		   		"examQuarter" : examQuarter,
		   		"studentId" : studentId
	   		})
	       ,success : function (data){

	    	   $("#feedbackArea").text(" ");
	    	   $("#teacher").text(" ");
	    	   $("#feedId").text(" ");
	    	   $("#mngId").text(" ");
	    	   document.getElementById("saveFeedback").style.display = "none";
	    	   
	    	   if(data.feedbackList.length != 0){
		    	   for(var i=0; i<data.feedbackList.length; i++) {
		    	   			$("#teacher").text(data.feedbackList[i].mngName + "T");
		    	   		 	$("#feedbackArea").text(data.feedbackList[i].feedContent);
		    	   			$("#feedId").text(data.feedbackList[i].feedId);
		    	   			$("#mngId").text(data.feedbackList[i].mngId);
		    	   			$("#profile2").css({"background-image":"url('/manager/mamagermanagement/getManagerPicture.do?id="+data.feedbackList[i].mngId+"')"});
		    	   }
	    	   } else {
	    		   $("#teacher").text(loginName + "T");
	    		   saveBtnHide();
	    	   }
	    	   

	        }
	       ,error : function(e){
	        }
		});
		






var year = examDate.substr(0, 4);
		// 차트1 
		$.ajax({
	        type: "post"
	       ,url : "/manager/score/selectChart1.do"
	       ,contentType: 'application/json'
	       ,data :  JSON.stringify({
	    	   
		   		"studentId" : studentId,
		   		"year" : year
	   		})
	       ,success : function (data){
// 					alert("차트1 성공");
					
					console.log(data);
					let group;
					let date;
					
					// 차트 data 초기화
					let jan = 0;
					let feb = 0;
					let mar = 0;
					let apr = 0;
					let may = 0;
					let jun = 0;
					let jul = 0;
					let aug = 0;
					let sep = 0;
					let oct = 0;
					let nov = 0;
					let dec = 0;
					
					let jan2 = 0;
					let feb2 = 0;
					let mar2 = 0;
					let apr2 = 0;
					let may2 = 0;
					let jun2 = 0;
					let jul2 = 0;
					let aug2 = 0;
					let sep2 = 0;
					let oct2 = 0;
					let nov2 = 0;
					let dec2 = 0;
					
					
					for(var i=0; i<data.chart1.length; i++){
						 group = data.chart1[i].examGroup;
						 date = data.chart1[i].examDate;
						 score = data.chart1[i].scored;
						
						console.log("g " + group);
						console.log("d " +date);
						console.log("s " +score);
						
						let month = date.substr(5,2);
						
						console.log("m " +month);
						
						if(group == '학교'){
							console.log(i+"test")
							
							if(month == '01'){
								jan =  jan+ score;
							} else if(month == '02'){
								feb = feb + score;
							} else if(month == '03'){
								mar = mar + score;
							} else if(month == '04'){
								apr = apr + score;
							} else if(month == '05'){
								may = may + score;
							} else if(month == '06'){
								jun = jun + score;
							} else if(month == '07'){
								jul = jul + score;
							} else if(month == '08'){
								aug = aug + score;
							} else if(month == '09'){
								sep = sep + score;
							} else if(month == '10'){
								oct = oct + score;
							} else if(month == '11'){
								nov = nov + score;
							} else if(month == '12'){
								dec = dec + score;
							} 
							
							console.log("    "+group  + score);				
						}
						if(group == '학원'){
							
							if(month == '01'){
								jan2 = score;
							} else if(month == '02'){
								feb2 = score;
							} else if(month == '03'){
								mar2 = score;
							} else if(month == '04'){
								apr2 = score;
							} else if(month == '05'){
								may2 = score;
							} else if(month == '06'){
								jun2 = score;
							} else if(month == '07'){
								jul2 = score;
							} else if(month == '08'){
								aug2 = score;
							} else if(month == '09'){
								sep2 = score;
							} else if(month == '10'){
								oct2 = score;
							} else if(month == '11'){
								nov2 = score;
							} else if(month == '12'){
								dec2 = score;
							} 
							console.log("    "+group  + score);
						}
						
					}
				
							myChart1.data.datasets[0].data = [
								 jan, 
								 feb, 
								 mar, 
								 apr, 
								 may, 
								 jun, 
								 jul, 
								 aug, 
								 sep, 
								 oct, 
								 nov, 
								 dec
							   ];
							myChart1.data.datasets[1].data = [
								 jan2, 
								 feb2, 
								 mar2, 
								 apr2, 
								 may2, 
								 jun2, 
								 jul2, 
								 aug2, 
								 sep2, 
								 oct2, 
								 nov2, 
								 dec2
							   ];
							console.log(myChart1.data.datasets[1])
							myChart1.update();
							
						let result = date.substr(0,4);
						$("#year").text(result + "년");
	        }
	       ,error : function(e){
	        }
		});
		
		
		$("select[name=subject]").change(function(){
			
			let subject = $(this).val();

			// 차트 2 - 과목별 점수
			$.ajax({
		        type: "post"
		       ,url : "/manager/score/selectChart2.do"
		       ,contentType: 'application/json'
		       ,data :  JSON.stringify({
		    	   		"subject" : subject,
				   		"studentId" : studentId,
				   		"year" : year
		   		})
		       ,success : function (data){
			    	   console.log(data);
			    	   let date;
			    	   let group;
			    	   let score;
			    	   
			    	// 차트 data 초기화
						let jan = 0;
						let feb = 0;
						let mar = 0;
						let apr = 0;
						let may = 0;
						let jun = 0;
						let jul = 0;
						let aug = 0;
						let sep = 0;
						let oct = 0;
						let nov = 0;
						let dec = 0;
						
						let jan2 = 0;
						let feb2 = 0;
						let mar2 = 0;
						let apr2 = 0;
						let may2 = 0;
						let jun2 = 0;
						let jul2 = 0;
						let aug2 = 0;
						let sep2 = 0;
						let oct2 = 0;
						let nov2 = 0;
						let dec2 = 0;
			    	   
			    	   
			    	   for(var i=0; i<data.chart2.length; i++){
			    		   group = data.chart2[i].examGroup;
						   date = data.chart2[i].examDate;
						   score = data.chart2[i].scored;
							
						   let month = date.substr(5,2);
						   
						   if(group == '학교'){
								console.log(i+"test")
								
								if(month == '01'){
									jan =  jan+ score;
								} else if(month == '02'){
									feb = feb + score;
								} else if(month == '03'){
									mar = mar + score;
								} else if(month == '04'){
									apr = apr + score;
								} else if(month == '05'){
									may = may + score;
								} else if(month == '06'){
									jun = jun + score;
								} else if(month == '07'){
									jul = jul + score;
								} else if(month == '08'){
									aug = aug + score;
								} else if(month == '09'){
									sep = sep + score;
								} else if(month == '10'){
									oct = oct + score;
								} else if(month == '11'){
									nov = nov + score;
								} else if(month == '12'){
									dec = dec + score;
								} 
								 myChart2.data.datasets[0].examId = data.chart2[i].examId;
								 myChart2.data.datasets[0].examSeg = data.chart2[i].examSeg;
								console.log("    "+group  + score);				
							}
						   if(group == '학원'){
								
								if(month == '01'){
									jan2 = score;
								} else if(month == '02'){
									feb2 = score;
								} else if(month == '03'){
									mar2 = score;
								} else if(month == '04'){
									apr2 = score;
								} else if(month == '05'){
									may2 = score;
								} else if(month == '06'){
									jun2 = score;
								} else if(month == '07'){
									jul2 = score;
								} else if(month == '08'){
									aug2 = score;
								} else if(month == '09'){
									sep2 = score;
								} else if(month == '10'){
									oct2 = score;
								} else if(month == '11'){
									nov2 = score;
								} else if(month == '12'){
									dec2 = score;
								} 
								console.log("    "+group  + score);
								myChart2.data.datasets[1].examId = data.chart2[i].examId;
								myChart2.data.datasets[1].examSeg = data.chart2[i].examSeg;
							}
							console.log(data.chart2[i])
							console.log(data.chart2[i].examId)
							console.log( myChart2.data.datasets[0].examId)
						/* 	
						  
						    */
						   
			    	   }
			    	   
			    	   myChart2.data.datasets[0].data = [
							 jan, 
							 feb, 
							 mar, 
							 apr, 
							 may, 
							 jun, 
							 jul, 
							 aug, 
							 sep, 
							 oct, 
							 nov, 
							 dec
						   ];
			    	   
			    	   myChart2.data.datasets[1].data = [
							 jan2, 
							 feb2, 
							 mar2, 
							 apr2, 
							 may2, 
							 jun2, 
							 jul2, 
							 aug2, 
							 sep2, 
							 oct2, 
							 nov2, 
							 dec2
						   ];
			    		
//							console.log(myChart2.data.datasets[i].examSeg);
						myChart2.update();
			    	   
		        }
		       ,error : function(e){
		        }
			});
			
			
			
		});
		
		
		
		
		
		
		
		
	}
	
		function saveBtnHide(){
			 document.getElementById("saveFeedback").style.display = "block";
		}
		
		
		window.onload = function(){
			$(".managerDetail").on("click",function(e){
		        e.stopImmediatePropagation(); 
		        let managerId = $(this).attr("data-id");
		        OpenWindow('/common/totalDetail.do?id='+managerId,'회원상세보기',600,400);
		        console.log(managerId);
		      });
			
			$(".memberDetail").on("click",function(e){
		        e.stopImmediatePropagation(); 
		        let managerId = $(this).attr("data-id");
		        OpenWindow('/common/totalDetail.do?id='+managerId,'회원상세보기',600,400);
		        console.log(managerId);
		      });
			
			
			$(".clickableTr").on("click",function(){
				$(".selectedTr").attr("class","clickableTr");
				$(this).attr("class","selectedTr")
			});
			
			$(document).on("click",".examLine",function(){
				$(".selectedExam").attr("class","examLine");
				$(this).attr("class","selectedExam")
			});
			
			$(document).on("click","#changeGrade",function(){
				$(".gradeCheck").attr("style","display:none;");
				$(".gradeDetail").attr("style","display:block;");
			});
			
			$(document).on("click","#changeDetail",function(){
				$(".gradeCheck").attr("style","display:block;");
				$(".gradeDetail").attr("style","display:none;");
			});
			
			$("#searchStudent").on("keyup",function(key){
				if(key.keyCode==13) {
					let value = $("#searchStudent").val();
					
					$.ajax({
				        type: "post"
				       ,url : "/manager/score/studentSearch.do"
				       ,data : {"value" : value,
				    	   
				    	   		}
				       ,success : function (data){
//	 			    	   console.log(data);
				    	   for(var i = 0 ; i<data.studentList.length;i++){
					    		console.log(typeof data.studentList[i].noteSendUserName);
					    		 data.studentList[i].grade = data.studentList[i].grade.replaceAll(value,"<span class='highlightWord'>"+value+"</span>");
					    		 data.studentList[i].mngName = data.studentList[i].mngName.replaceAll(value,"<span class='highlightWord'>"+value+"</span>");
					    		 data.studentList[i].name = data.studentList[i].name.replaceAll(value,"<span class='highlightWord'>"+value+"</span>");
							}
				    	   printData(data,$('#studentListDiv'),$('#studentList-template'),$('#studentList'));
				        }
				       ,error : function(e){
				        }
					});
		        }
			});
			
			
			
			
			$(document).on("click", "#searchStudentBtn", function(){

				let value = $("#searchStudent").val();
				
				$.ajax({
			        type: "post"
			       ,url : "/manager/score/studentSearch.do"
			       ,data : {"value" : value,
			    	   
			    	   		}
			       ,success : function (data){
			    	   console.log(data);
			    	   for(var i = 0 ; i<data.studentList.length;i++){
				    		console.log(typeof data.studentList[i].noteSendUserName);
				    		 data.studentList[i].grade = data.studentList[i].grade.replaceAll(value,"<span class='highlightWord'>"+value+"</span>");
				    		 data.studentList[i].mngName = data.studentList[i].mngName.replaceAll(value,"<span class='highlightWord'>"+value+"</span>");
				    		 data.studentList[i].name = data.studentList[i].name.replaceAll(value,"<span class='highlightWord'>"+value+"</span>");
// 				    	   data.studentList[i].noteSendUserName = temp;
						}
			    	   printData(data,$('#studentListDiv'),$('#studentList-template'),$('#studentList'));
			        }
			       ,error : function(e){
			        }
				});
				
				
			});
			
			let keyword;
			let studentId;
			
			$(document).on("click", "#examSearch", function(){
				 keyword = $("#keyword").val();
				 studentId = $("#studentId").text();

				
				$.ajax({
			        type: "post"
			       ,url : "/manager/score/searchExam.do"
			       ,contentType: 'application/json'
			       ,data : JSON.stringify({
			    	   			"keyword" : keyword,
			    	   			"studentId" : studentId
			    	   			
			    	   		})
			       ,success : function (data){
// 			    	   alert("성공");
			    	   console.log(data);
			    	   for(var i = 0 ; i < data.examByStudentList.length; i++){
				    		console.log(typeof data.examByStudentList[i]);
				    		
				    		
				    		 data.examByStudentList[i].examDate = data.examByStudentList[i].examDate.replaceAll(keyword,"<span class='highlightWord'>"+keyword+"</span>");
				    		 data.examByStudentList[i].examGrade = data.examByStudentList[i].examGrade.replaceAll(keyword,"<span class='highlightWord'>"+keyword+"</span>");
				    		 data.examByStudentList[i].examGroup = data.examByStudentList[i].examGroup.replaceAll(keyword,"<span class='highlightWord'>"+keyword+"</span>");
				    		 data.examByStudentList[i].examQuarter = data.examByStudentList[i].examQuarter.replaceAll(keyword,"<span class='highlightWord'>"+keyword+"</span>");
				    		 data.examByStudentList[i].examSemester = data.examByStudentList[i].examSemester.replaceAll(keyword,"<span class='highlightWord'>"+keyword+"</span>");
						}
 			    	   printData(data,$('#examCheckDiv'),$('#examSearch-template'),$('#examCheckList'));
			        }
			       ,error : function(e){
			        }
				});
				
			
			});
			
			$("#keyword").on("keyup",function(key){
				if(key.keyCode==13) {
					
					 keyword = $("#keyword").val();
					 studentId = $("#studentId").text();

					
					$.ajax({
				        type: "post"
				       ,url : "/manager/score/searchExam.do"
				       ,contentType: 'application/json'
				       ,data : JSON.stringify({
				    	   			"keyword" : keyword,
				    	   			"studentId" : studentId
				    	   			
				    	   		})
				       ,success : function (data){
				    	   alert("성공");
//	 			    	   console.log(data);
	 			    	   printData(data,$('#examCheckDiv'),$('#examSearch-template'),$('#examCheckList'));
				        }
				       ,error : function(e){
				        }
					});
		        }
			});
			

			
			$("#saveFeedback").on("click", function(){
				
				let feedback = $("#feedbackArea").val();
				let loginId = $("#loginId").text();
				let loginName = $("#loginName").text();
				 studentId = $("#studentId").text();
				console.log(studentId);
				
				let feedBackInfo = new Object();
				feedBackInfo.feedContent = feedback;
				feedBackInfo.examDate = examDate;
				feedBackInfo.examGroup = examGroup;
				feedBackInfo.examGrade = examGrade;
				feedBackInfo.examSemester = examSemester;
				feedBackInfo.examQuarter = examQuarter;
				feedBackInfo.studentId = studentId;
				feedBackInfo.loginId = loginId;
				feedBackInfo.loginName = loginName;
				
				console.log(feedBackInfo);
				
					$.ajax({
				        type: "post"
				       ,url : "/manager/score/saveFeedback.do"
				       ,contentType: 'application/json'
				       ,data : JSON.stringify({
				    	   		 "feedBackInfo" : feedBackInfo
				    	   		})
				       ,success : function(data){
							Swal.fire({
							       icon: 'success',
							       title: '완료!',
							       text: '피드백이 정상적으로 등록되었습니다.',
							   });
				    	  
				        }
				       ,error : function(e){
				        }
					});
			});
		}
	</script>	
	
	
	
	
	<script>
	let chart = new Chart(document.getElementById("radar-chart"), {
	    type: 'radar',
	    data: {
	      labels: ["국어", "수학", "사회", "과학", "영어"],
	      datasets: [
	        {
	          fill: true,
	          backgroundColor: "rgba(179,181,198,0.2)",
	          borderColor: "#6c757d",
	          pointBorderColor: "#6c757d",
	          pointBackgroundColor: "#6c757d",
	          data: [
	        	  
	        	  		0,0,0,0,0
	        	  
	        	  ]
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
	                suggestedMax: 100
	            }
	        }
	    }
	});
	
	var ctx1 = document.getElementById('chart1').getContext('2d');
	var myChart1 = new Chart(ctx1, {
	    type: 'bar',
	    data: {
	        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        datasets: [{
	            label: '학교',
	            data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
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
	            data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
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
	var myChart2 = new Chart(ctx2, {
	    type: 'bar',
	    data: {
	        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        datasets: [{
	            label: '학교',
	            data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
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
	            data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
	            backgroundColor: [
	                'rgba(32, 73, 105, 1)'
	            ],
	            borderColor: [
	                'rgba(32, 73, 105, 1)'
	              
	            ],
	            borderWidth: 1,
	            
	            examId: '',
	            subjectName : ''
	        }
	        ]
	    },
	    options: {
	    	
	    	
	    	 onClick: function(point, event) {
// 	    		  console.log(event);
// 				console.log(event[0].element.$context.dataset.examId); //17 sub exam Id
				let examId = event[0].element.$context.dataset.examId;
				let subjectName = event[0].element.$context.dataset.examSeg;
// 				console.log(studentId);

				$("#bySubject").text("-" + subjectName);
				$("#byArea").text("-" + subjectName);
				
// 				chart3 그리기
				$.ajax({
			        type: "post"
			       ,url : "/manager/score/selectChart3.do"
			   	   ,contentType: 'application/json'
			       ,data : JSON.stringify({
			    	   
			    	   	"examId" : examId,
			    	   	"studentId" : studentId
			    	   
			       })
			       ,success : function (data){
// 			    	   alert("성공");
// 			    	   console.log(data);
						let good = data.chart3.goodNum / data.chart3.goodTotalNum;
						let goodD = good.toFixed(1);
			    	  	
						let fair = data.chart3.fairNum / data.chart3.fairTotalNum;
			    	   	let fairD = fair.toFixed(1);
			    	   	
			    	   	let poor = data.chart3.poorNum / data.chart3.poorTotalNum;
			    	   	let poorD = poor.toFixed(1);
			    	   	
			    	   printData(data,$('#bySubjectDiv'),$('#bySubjectList-template'),$('#bySubjectList'));
			    	   
			    	   myChart3.data.datasets[0].data = [
			    		   goodD, fairD, poorD
			    	   ];
			    	   
			    	   myChart3.update();
			        }
			       ,error : function(e){
			        }
				});
				
// 				chart4 영역 가져오기
				
				
				
				$.ajax({
			        type: "post"
			       ,url : "/manager/score/selectChart4.do"
		     	   ,contentType: 'application/json'
			       ,data : JSON.stringify({
			    	   			"examId" : examId,
			    	   			"studentId" : studentId
			    	   		})
			       ,success : function (data){
// 			    	   alert("성공");
			    	   console.log(data);
			    	   printData(data,$('#byAreaDiv'),$('#byAreaList-template'),$('#byAreaList'));
			    	   let examDateSum = 0;
			    	   let examSemesterSum = 0;
			    	   for(var i = 0; i<data.chart4.length ;i++){
			    		   examDateSum += parseInt(data.chart4[i].examDate);
			    		   examSemesterSum += parseInt(data.chart4[i].examSemester);
			    	   }
			    	   
			    	   
			    	   console.log(examDateSum);
			    	   console.log(examSemesterSum);
			    	   let sumResult = examDateSum + "/" + examSemesterSum;
			    	   $("#sumResult").text(sumResult);
			    	   
			    	   let area;
			    	   let getNum;
			    	   let tot;
		    		   let avg;
		    		   var avgArr = new Array();
					   var areaArr = new Array();
			    	   
			    	   for(var i=0; i<data.chart4.length; i++){
			    		   area = data.chart4[i].examGroup;
			    		   getNum = data.chart4[i].examDate;
			    		   tot = data.chart4[i].examSemester;
			    		   avg = getNum / tot;
			    	   	   avgArr[i] = avg.toFixed(1);
			    	   	   areaArr[i] = area;
			    	   }
			    		  console.log(avgArr);
			    		  console.log(areaArr);
			    		   
			    		   myChart4.data.labels=[
			    			   areaArr[0], areaArr[1], areaArr[2], areaArr[3], areaArr[4]  
			    		   ] 
			    		  
			    		   myChart4.data.datasets[0].data=[
			    			   avgArr[0], avgArr[1], avgArr[2], avgArr[3], avgArr[4]  
			    		   ];
			    		   
			    		   myChart4.update();
			    		   
// 			    		   console.log(area);
// 			    		   console.log(getNum);
// 			    		   console.log(tot);
			    	   
			    	   
			    	   
			        }
			       ,error : function(e){
			        }
				});
				
				
				
				
	    	 },
		        
	        scales: {
	            y: {
	                beginAtZero: true,
	                suggestedMin: 0,
	                suggestedMax: 100
	            }
	        }
	    },
	   
	});
	
	
	
 var myChart3 = new Chart(document.getElementById("chart3"), {
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
	          data: [0, 0, 0]
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
	
 var myChart4 =	new Chart(document.getElementById("chart4"), {
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
	          data: [0, 0, 0, 0, 0]
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
	
<script type="text/x-handlebars-template"  id="bySubjectList-template" >
	<table id="bySubjectList" class="table table-head-fixed table-bordered">
		<thead>
			<tr>
				<td>상</td>
				<td>중</td>
				<td>하</td>
				<td>전체</td>
			</tr>
		</thead>
		<tbody>
        {{#if chart3}}	
			<tr>
				<td>{{chart3.goodNum}}/{{chart3.goodTotalNum}}</td>
				<td>{{chart3.fairNum}}/{{chart3.fairTotalNum}}</td>
				<td>{{chart3.poorNum}}/{{chart3.poorTotalNum}}</td>
				<td>{{chart3.getNum}}/{{chart3.totalNum}}</td>
			</tr>
         {{/if}}
		</tbody>
	</table>           
</script>	

<script type="text/x-handlebars-template"  id="byAreaList-template" >
<table id="byAreaList" class="table table-head-fixed table-bordered">
	<thead>
		<tr>
	{{#each chart4}}
			<td>{{examGroup}}</td>
 {{/each}}
			<td>전체</td>
		</tr>
	</thead>
	<tbody>
		<tr>
	{{#each chart4}}
			<td>{{examDate}} / {{examSemester}}</td>
 {{/each}}
			<td id="sumResult"></td>
		</tr>
	</tbody>
</table>        
</script>
	
	
<script type="text/x-handlebars-template"  id="examCheckList-template" >
<table id="examCheckList" class="table table-head-fixed table-bordered" >
												<thead>
													<tr>
														<th>시험일</th>
														<th>구분</th>
														<th>학년</th>
														<th>학기</th>
														<th>분기</th>
													</tr>
												</thead>
												<tbody>
												{{#if examByStudentList}}	
			
				                                 {{#each examByStudentList}}
				                                 
			                                       		<tr class="examLine" onclick="Overall(this);">
															<td id="examDate">{{examDate }}</td>
															<td id="examGroup">{{examGroup }}</td>
															<td id="examGrade">{{examGrade }}</td>
															<td id="examSemester">{{examSemester }}</td>
															<td id="examQuarter">{{examQuarter }}</td>
															<td style="display : none;" id="studentId">{{studentId }}</td>
														</tr>
			                                       	
			                                       	{{/each}}
                                                   
			                                       	{{else}}
			                                       		<tr>
	    	                                       		<td colspan="7" class="text-center">
	    	                                       			해당내용이 없습니다.
	    	                                       		</td>
	    	                                       	</tr>
			                                       {{/if}}	


												</tbody>
											</table>            
</script>

<script type="text/x-handlebars-template"  id="examSearch-template" >
<table id="examCheckList" class="table table-head-fixed table-bordered" >
												<thead>
													<tr>
														<th>시험일</th>
														<th>구분</th>
														<th>학년</th>
														<th>학기</th>
														<th>분기</th>
													</tr>
												</thead>
												<tbody>
												{{#if exam}}	
			
				                                 {{#each exam}}
				                                 
			                                       		<tr class="examLine" onclick="Overall(this);">
															<td id="examDate">{{{examDate }}}</td>
															<td id="examGroup">{{{examGroup }}}</td>
															<td id="examGrade">{{{examGrade }}}</td>
															<td id="examSemester">{{{examSemester }}}</td>
															<td id="examQuarter">{{{examQuarter }}}</td>
															<td style="display : none;" id="studentId">{{studentId }}</td>
														</tr>
			                                       	
			                                       	{{/each}}
                                                   
			                                       	{{else}}
			                                       		<tr>
	    	                                       		<td colspan="7" class="text-center">
	    	                                       			해당내용이 없습니다.
	    	                                       		</td>
	    	                                       	</tr>
			                                       {{/if}}	


												</tbody>
											</table>            
</script>
	
	
<script type="text/x-handlebars-template"  id="studentList-template">
		<table id="studentList" class="table table-head-fixed table-bordered">
		<thead>
			<tr>
				<th>학년</th>
				<th>담임교사명</th>
				<th>반</th>
				<th>학생명</th>
			</tr>
		</thead>
		<tbody>
				{{#if studentList}}	
			
				{{#each studentList}}
				
					<tr style="cursor:pointer;">
						<td>{{{grade }}}</td>
						<td>{{{mngName }}}</td>
						<td>{{{className }}}</td>
						<td>{{{name }}}</td>
					</tr>
				
				{{/each}}

				{{else}}
					<tr>
	    			<td colspan="4" class="text-center">
	    				해당내용이 없습니다.
	    			</td>
	    		</tr>
			{{/if}}	
			
		</tbody>
	</table>
</script>
	
</body>