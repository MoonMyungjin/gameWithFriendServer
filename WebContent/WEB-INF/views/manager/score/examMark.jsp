<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>성적입력</title>

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
			overflow-y: auto;
		}
		
		div.table2 {
			max-height: 250px;
			overflow-y: scroll;
		}
		
		div.table3 {
			max-height: 568px;
			overflow-y: scroll;  
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
		
		
		.alert {
			text-align: center;
		}
		.alert {
			font-size: 15px;
		}
		
		.alert-dismissible {
	    	padding-right: 0;
	    	padding-left: 0;
		}
		.examInfo:hover{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
		
		.selectedExam{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
		.clickableStudent:hover{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
		
		.selectedStudent{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
		
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
</head>

<body>

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6" style="display: flex;">
					<h1 data-userId="${loginUser.id }">성적입력</h1>
					<c:if test="${fn:indexOf(favoriteMenuListStr, '성적입력') != -1}">
	                  	<i id="star" class="fa-solid fa-star on fa-2x" ></i>
	               	 </c:if>
	               	 <c:if test="${fn:indexOf(favoriteMenuListStr, '성적입력') == -1}">
	                  	<i id="star" class="fa-regular fa-star off fa-2x" ></i>
	               	 </c:if>
				</div>
			</div>
		</div>
	</section>
	
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				
				<!-- 좌측 영역 -->
				<div class="col-sm-8">
						
						<div class="card card-dark card-outline" style="height: 50%;">
						
							<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
    						   <div class="row">  
				               <h3 class="card-title">
									<i class="fas fa-check"></i>
				<!-- 					<i class="fa-solid fa-1"></i> -->
									&nbsp;
									시험선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
								
							   </h3>
    						   </div>
    						   
				               <div class="card-tools" style="margin: 0;">
				                  <div class="row">
				                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<input id="examSearch" type="text" class="form-control float-right" placeholder="검색어를 입력해주세요" style="width: 200px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<div class="input-group-append">
											<button id="examSearchBtn" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
												<i class="fas fa-search" aria-hidden="true"></i>
											</button>
										</div>
									</div>
								  </div>
				               </div>
				            </div>
							
							<div class="card-body" style="padding-top: 5px;">

								<br/>
								
								<div class="row table1">
									<div class="card-body table p-0" id="examListDiv">
										<table id="examList" class="table table-head-fixed table-bordered">
											<thead>
												<tr>
													<th>시험일</th>
													<th>구분</th>
													<th>학년</th>
													<th>학기</th>
													<th>분기</th>
													<th>과목</th>
													<th>시험명</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty examList }" >
								            		<tr>
								            			<td colspan="7" class="text-center">
								            				해당내용이 없습니다.
								            			</td>
								            		</tr>
								            	</c:if>
								            	<c:if test="${!empty examList }" >
				            						<c:forEach items="${examList }" var="exam">
				            							<tr class="examInfo" style="cursor:pointer;" onclick="questionSelect('${exam.examId}');" ondblclick="examDetail('${exam.examId}');">
				            								<td>${exam.examDate }</td>
				            								<td>${exam.examGroup }</td>
				            								<td>${exam.examGrade }</td>
				            								<td>${exam.examSemester }</td>
				            								<td>${exam.examQuarter }</td>
				            								<td>${exam.examSeg }</td>
				            								<td>${exam.examName }</td>
				            							</tr>
				            						</c:forEach>
			            						</c:if>
											</tbody>
										</table>
									</div>
								</div>
								
							</div> <!-- card body -->
							
						</div> <!-- card-outline -->
						
						<!-- 좌측 하단 영역 -->
						<div class="row" style="height: 50%;">
							<div class="col-sm-8">
								<div class="card card-dark card-outline" style="height: 96%;">
								
								
								
								
								
							<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
    						   <div class="row">  
				               <h3 class="card-title">
									<i class="fas fa-check"></i>
				<!-- 					<i class="fa-solid fa-1"></i> -->
									&nbsp;
									학생선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;
									
								
							   </h3>
    						   </div>
    						   
				               <div class="card-tools" style="margin: 0;">
				                  <div class="row">
				                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<input id="searchStudent" type="text" class="form-control float-right" placeholder="학년,이름" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
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
										
										<div class="row table2">
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
						            							<tr class="clickableStudent" style="cursor:pointer;" onclick="studentSelect('${student.id}');">
						            								<td>${student.grade }</td>
						            								<td><strong>${student.mngName }</strong></td>
						            								<td>${student.className }</td>
						            								<td><strong>${student.name }</strong></td>
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
							
							<div class="col-sm-4">
								<div class="card card-dark card-outline" style="height: 96%;">
									<div class="card-header">
										<h3 class="card-title">
											<i class="fas fa-info"></i>
											&nbsp;&nbsp;
											채점 정보
										</h3>
									</div>
									<div class="card-body" style="padding-bottom: 5px;">
										<div class="alert alert-warning alert-dismissible" style="height: 105px;">
											<strong>시험 정보</strong><br/>
											<!-- <span id="examDate"></span> <br/>
											<span id="examInfo01">시험을 선택해주세요.</span> <br/>
											<span id="examInfo02"></span> -->
											<div id="selectedExamInfo">
												<br/>
												<span id="examInfo01">시험을 선택해주세요.</span>
											</div>
											
										</div>
										<div class="alert alert-success alert-dismissible">
											<strong>학생 정보</strong><br/>
											<span id="studentInfo">학생을 선택해주세요.</span>
										</div>
										<div class="row testList">
											<div id="onlyScoreForm" class="input-group test">
												<label style="font-size: 13px;padding-right: 7px;">점수<br/>입력</label>
												<input id="onlyScore" type="number" class="form-control" max="100" min="0">
												<div class="input-group-append">
													<button type="button" class="btn btn-dark" style="height: 38px;" onclick="updateScore();">
														저장
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					
				</div>
				
				<div class="col-sm-4">
					<div class="card card-dark card-outline" style="height: 100%;">
						<div class="card-header">
							<h3 class="card-title">
								<i class="fas fa-marker"></i>
								&nbsp;&nbsp;
								채점
							</h3>
						</div>
						<div class="card-body">
							<div class="row table3">
								<div class="card-body p-0">
									<table id="tb1" class="table table-head-fixed table-bordered">
										<thead>
											<tr>
												<th style="width:20%">번호</th>
												<th>영역</th>
												<th style="width:20%">점수</th>
												<th>정답여부</th>
											</tr>
										</thead>
										<tbody id="tblShow" class="markList">
						                     <tr id="noQuestion" class="mark">
						            			<td id="selectCheck" colspan="4" class="text-center">
						            				시험 또는 학생을 선택해주세요.
						            			</td>
						            		</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row" style="margin-top: 1em;">
								<div class="col-sm-4"></div>
								<div class="col-sm-4">
									<button type="submit" class="btn btn-dark" onclick="saveMarkList();">
									저장
									</button>
								</div>
								<div class="col-sm-4"></div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
	<script>
		var examIdF = "";
		var studentIdF = "";
		
		var isExamCheck = false;
		var isStudentCheck = false;
		
		// 시험 선택시 실행되는 메서드
		function questionSelect(examId) {
			
			examIdF = parseInt(examId);
			isExamCheck = true;
			
			if(isExamCheck == true && isStudentCheck == false) {
				$("#selectCheck").text("학생을 선택해주세요.");
				return;
			}
			
			$.getJSON("<%=request.getContextPath()%>/manager/score/markList.do?examId="+examIdF+"&studentId="+studentIdF, function(data) {
				printData(data,$('.markList'),$('#mark-list-template'),'.mark');
				printData(data,$('.testList'),$('#test-template'),'.test');
			});
		}
		
		// 학생 선택시 실행되는 메서드
		function studentSelect(studentId) {
			
			isStudentCheck = true;
			studentIdF = studentId;
			
			if(isStudentCheck == true && isExamCheck == false) {
				$("#selectCheck").text("시험을 선택해주세요.");
				return;
			}
			
			$.getJSON("<%=request.getContextPath()%>/manager/score/markList.do?examId="+examIdF+"&studentId="+studentIdF, function(data) {
				printData(data,$('.markList'),$('#mark-list-template'),'.mark');
				printData(data,$('.testList'),$('#test-template'),'.test');
			});
		}
		
		// 시험 상세정보 메서드
		function examDetail(examId) {
			OpenWindow('/manager/score/examDetail.do?examId='+examId,'시험 상세정보',800,700);
		}
		
		function printData(dataArr, target, templateObject, removeClass){
					
			var template=Handlebars.compile(templateObject.html());
			
			var html = template(dataArr);
			
			$(removeClass).remove();
			target.append(html);
		}
		
		function markingList() {
			console.log(examIdF);
			$.getJSON("<%=request.getContextPath()%>/manager/score/markingList.do?examId="+examIdF, function(data) {
				
				console.log(data);
				printData(data,$('.markList'),$('#marking-list-template'),'.mark');
			});
		}
		
	function saveMarkList() {
			
			if(examIdF == "") {
				alert("시험을 선택해주세요.");
				return;
			}
			
			if(studentIdF == "") {
				alert("학생을 선택해주세요.");
				return;
			}
			
			//alert(examIdF + "저장 버튼 클릭");
			
			let newQuesId = [];
			let newIsCorrect = [];
			
			let sumScore = 0;
			let multipleNum = 0;
			
			let questionArr = new Array();
			
			
			$(".questionValue").each(function(i) {
				let questionInfo = new Object();
				
				let quesScore = 0;
				
				newQuesId = parseInt($(this).children().eq(0).val());
				newQuesScore = parseInt($(this).children().eq(3).text());
				newIsCorrect = $(this).children().eq(4).children().eq(0).is(":checked");
				
				if(newIsCorrect) {
					newIsCorrect = "Y";
					multipleNum = 1;
				} else {
					newIsCorrect = "N";
					multipleNum = 0;
				}
				
				quesScore = newQuesScore * multipleNum;
				
				sumScore += quesScore;
				
				
				questionInfo.quesId = newQuesId;
				questionInfo.isCorrect = newIsCorrect;
				questionInfo.quesScore = newQuesScore;
				questionInfo.examId = examIdF;
				questionInfo.studentId = studentIdF;
				
				
				questionArr.push(questionInfo);
			});
			
			
			let dataItem = {
					examId : examIdF,
					sumScore : sumScore,
					studentId : studentIdF,
					markList : questionArr
			}
			
			dataItem = JSON.stringify(dataItem);
			
			$.ajax({
		        type: "post"
		       ,url : "/manager/score/updateMark.do"
		       ,contentType: 'application/json'
		       ,data : dataItem
		       ,success : function (data){
		    	   Swal.fire({
		    	       icon: 'success',
		    	       title: '완료!',
		    	       text: '채점 정보가 저장되었습니다.',
		    	   });
		    	   setTimeout(function() {
// 		    		 	window.opener.location.reload(true);
		    		 	location.href="<%=request.getContextPath()%>/manager/score/examMark.do";
		    		}, 1300);
		        }
		       ,error : function(e){
		        }
			});
		}
	
	
	function updateScore() {
		var onlyScore = parseInt($("#onlyScore").val());
		
		if(onlyScore < 0 || onlyScore > 100) {
			alert("0~100 사이의 점수를 입력해주세요.");
			return;
		}
		
		let dataItem = {
				examId : examIdF,
				sumScore : onlyScore,
				studentId : studentIdF
		}
		
		dataItem = JSON.stringify(dataItem);
		
		$.ajax({
	        type: "post"
	       ,url : "/manager/score/updateScore.do"
	       ,contentType: 'application/json'
	       ,data : dataItem
	       ,success : function (data){
	    	   Swal.fire({
	    	       icon: 'success',
	    	       title: '완료!',
	    	       text: '점수 정보가 저장되었습니다.',
	    	   });
	    	   setTimeout(function() {
	    		 	location.href="<%=request.getContextPath()%>/manager/score/examMark.do";
	    		}, 1300);
	        }
	       ,error : function(e){
	        }
		});
		
		
		
	}
		
		
		window.onload = function() {
			$(document).on("click",".examInfo",function(){
				$(".selectedExam").attr("class","examInfo");
				$(this).attr("class","selectedExam");
			});
			$(document).on("click",".clickableStudent",function(){
				$(".selectedStudent").attr("class","clickableStudent");
				$(this).attr("class","selectedStudent");
			});
			
			$('#examList tr').click(function() {
				var examtr = $(this);
				examDate = examtr.children().eq(0).text();
				examGroup = examtr.children().eq(1).text();
				examGrade = examtr.children().eq(2).text();
				examSemester = examtr.children().eq(3).text();
				examQuarter = examtr.children().eq(4).text();
				examSeg = examtr.children().eq(5).text();
				examName = examtr.children().eq(6).text();
				
				$("#selectedExamInfo").html("");
				
				var span1 = "<span id='examDate'></span> <br/>";
				var span2 = "<span id='examInfo02'></span> <br/>";
				var span3 = "<span id='examInfo03'></span>";
				
				
				$("#selectedExamInfo").append(span1);
				$("#selectedExamInfo").append(span2);
				$("#selectedExamInfo").append(span3);
				
				
				$("#examDate").text(examDate);
				$("#examInfo02").text(examGrade + " / " + examSemester + " / " + examQuarter);
				$("#examInfo03").text(examSeg + " / " + examName);
			});
			
			$("#studentList tr").click(function() {
				var studenttr = $(this);
				studentGrade = studenttr.children().eq(0).text();
				className = studenttr.children().eq(2).text();
				studentName = studenttr.children().eq(3).text();
				
				$("#studentInfo").text(studentGrade + " / " + className + " / " + studentName);
				
			});
			
			
				
			
			
			
			$(document).on("click", "#examSearchBtn", function(){

				let value = $("#examSearch").val();
				
				$.ajax({
			        type: "post"
			       ,url : "/manager/score/examSearch.do"
			       ,data : {"value" : value,
			    	   
			    	   		}
			       ,success : function (data){
			    	   console.log(data);
			    	   printData(data,$('#examListDiv'),$('#examList-template'),$('#examList'));
			        }
			       ,error : function(e){
			        }
				});
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
			    	   printData(data,$('#studentListDiv'),$('#studentList-template'),$('#studentList'));
			        }
			       ,error : function(e){
			        }
				});
			});
			
		}
		
	</script>
	
	<script type="text/x-handlebars-template"  id="examList-template">
		<table id="examList" class="table table-head-fixed table-bordered table-hover">
			<thead>
				<tr>
					<th>시험일</th>
					<th>구분</th>
					<th>학년</th>
					<th>학기</th>
					<th>분기</th>
					<th>과목</th>
					<th>시험명</th>
				</tr>
			</thead>
			<tbody>
	       					{{#if examList}}	
									
								{{#each examList}}

	       							<tr class="examInfo" style="cursor:pointer;" onclick="questionList_go('{{examId}}');" ondblclick="examDetail('{{examId}}');">
	       								<td>{{examDate }}</td>
	       								<td>{{examGroup }}</td>
	       								<td>{{examGrade }}</td>
	       								<td>{{examSemester }}</td>
	       								<td>{{examQuarter }}</td>
	       								<td>{{examSeg }}</td>
	       								<td>{{examName }}</td>
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
		<table id="studentList" class="table table-head-fixed table-hover table-bordered">
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
						<td>{{grade }}</td>
						<td>{{mngName }}</td>
						<td>{{className }}</td>
						<td>{{name }}</td>
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
	
	<script>
		Handlebars.registerHelper('checked', function(isCorrect) {
		    return isCorrect == 'Y' ? 'checked' : '';
		});
	
	</script>
	
	<script type="text/x-handlebars-template"  id="mark-list-template">
		{{#if markList}}
			{{#each markList}}
				<tr class="mark questionValue">
					<input type="hidden" value="{{quesId}}">
					<td>{{quesNo}}</td>
					<td>{{quesArea}}</td>
					<td>{{quesScore}}</td>
					<td>
						<input type="checkbox" {{checked isCorrect}}/>
					</td>
				</tr>
				{{/each}}
		{{else}}
			<tr id="noQuestion" class="mark">
				<td colspan="4" class="text-center">
					채점 정보가 없습니다.
					<button type="button" class="btn btn-dark" onclick="markingList();">
						채점정보 불러오기
					</button>
				</td>
			</tr>
			</tr>
		{{/if}}
	</script>
	
	<script type="text/x-handlebars-template"  id="test-template">
		{{#if result}}
			<div id="onlyScoreForm" class="input-group test">
				<label style="font-size: 13px;padding-right: 7px;">점수<br/>정보</label>
				<input id="onlyScore" type="number" class="form-control" max="100" min="0" value="{{result.scoreScored}}" readonly>
				</div>
			</div>
		{{else}}
			<div id="onlyScoreForm" class="input-group test">
				<label style="font-size: 13px;padding-right: 7px;">점수<br/>입력</label>
				<input id="onlyScore" type="number" class="form-control" max="100" min="0" >
				<div class="input-group-append">
					<button type="button" class="btn btn-dark" style="height: 38px;" onclick="updateScore();">
						저장
					</button>
				</div>
			</div>
		{{/if}}
	</script>
	
	<script type="text/x-handlebars-template"  id="marking-list-template">
		{{#if markingList}}
			{{#each markingList}}
				<tr class="mark questionValue">
					<input type="hidden" value="{{quesId}}">
					<td>{{quesNo}}</td>
					<td>{{quesArea}}</td>
					<td>{{quesScore}}</td>
					<td>
						<input class='selectObj' name="isCorrect" type='checkbox' checked>
					</td>
				</tr>
			{{/each}}
		{{else}}
			<tr id="noQuestion" class="mark">
				<td colspan="4" class="text-center">
					문항 정보가 없습니다.</br>
					문항을 등록해주세요.
				</td>
			</tr>
			</tr>
		{{/if}}
	</script>
	
	
</body>