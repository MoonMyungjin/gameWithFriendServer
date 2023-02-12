<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<meta charset="UTF-8">
<title></title>
<style>
	.reservationTime{
		background-color: rgb(32 73 105);
	}
	.selectedTd{
		background-color : rgb(32 73 105);
	}
	.disabledTd{
		background-color : gray;
	}
	.backgroundTd{
		background-color : rgb(32 73 105);
		color: white;
	}
	#managerInfo:hover{
		cursor: pointer;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6">
              <h1>수업상세보기</h1>              
           </div>
           <div class="col-sm-6">
           	<div class="row">
           		<div class="col-md-6">
	           	<c:if test="${category eq 'm' }">
					<c:if test="${lessonInfo.mngName eq loginUser.mngName }">
					<div class="row">
						<div class="col-md-6">
							<button id="updateLessonDetailInfo" type="button" class="btn btn-block btn-dark">저장</button>
						</div>
						<div class="col-md-6">
							<button type="button" class="btn btn-block btn-danger">삭제</button>
						</div>
					</div>
					</c:if>
				</c:if>
				</div>
        			<div class="col-md-6">
        				<button id="showLessonTimeInfoBtn" type="button" class="btn btn-block btn-dark">수업시간 보기</button>
        			</div>
        			<div style="display: none;" class="col-md-6">
        				<button id="showLessonDetailInfoBtn" type="button" class="btn btn-block btn-dark">상세정보 보기</button>
        			</div>
           	</div>
           </div>
        </div>
   </div>
</section>
<section class="content">
   <div id="lessonDetailInfoCard" class="card-header">
   	<div class="card card-outline card-dark">
            <div class="card-header">
               <h3 class="card-title">
               		<i class="fa-solid fa-chalkboard-user"></i>
					&nbsp;
					상세정보
			   </h3>
               <div class="card-tools" style="width: 50%">
                  <div class="row">
	                  	<div class="col-md-5">
		                  	<c:if test="${lessonInfo.lessonSyllabus ne null }">
								<button id="viewSyllabusBtn" type="button" class="btn btn-block btn-dark">강의계획서 보기</button>
		                  	</c:if>
						</div>
                  <c:if test="${category eq 'm' }">
	                  	<c:if test="${lessonInfo.mngName eq loginUser.mngName }">
		                  	<div class="col-md-5">
								<button id="registSyllabusBtn" type="button" class="btn btn-block btn-dark">강의계획서 작성</button>
							</div>
	                  	</c:if>
                  </c:if>
					<c:if test="${isUserLesson eq 'N' }">
						<div class="col-md-5">
							<button type="button" class="btn btn-block btn-dark lessonCancelBtn">수강 취소</button>
						</div>
					</c:if>
					<c:if test="${isUserLesson eq 'Y' }">
						<div class="col-md-5">
							<button type="button" class="btn btn-block btn-danger">환불 처리중</button>
						</div>
					</c:if>
					<div class="col-md-2 float-right" style="margin : 0px; padding: 0px;">
						<button id="closeBtn" class="btn btn-block btn-secondary" type="button" style="margin : 0px;">닫기</button>
					</div>
				</div>
               </div>
            </div>
            <div class="card-body">
            	<table id="example1" class="table table-bordered dataTable dtr-inline" style="text-align : center">
				<tr>
					<td>수업명</td>
					<td id="lessonId" data-id="${lessonInfo.lessonAssignmentId }" colspan="3">
							${lessonInfo.lessonName }
					</td>
					
				</tr>
				<tr>
					<td>선생님</td>
					<td id="managerInfo" data-mngId="${lessonInfo.mngId }"><Strong>${lessonInfo.mngName }T</Strong></td>
					<td>과목</td>
					<td>
						${lessonInfo.lessonSubjectType }
					</td>
				</tr>
				<tr>
					<td>금액</td>
					<td>${lessonInfo.lessonPrice }</td>
					<td>수업시수</td>
					<td id="lessonHour">${lessonInfo.lessonHours }</td>
				</tr>
				<tr>
					<td>강의실</td>
					<td>
					<c:choose>
						<c:when test="${category eq 'm'}">
							<c:choose>
								<c:when test="${lessonInfo.mngName eq loginUser.mngName }">
										<select id="lessonRoomSel" class="form-control">
											<c:forEach items="${ScodeValues.lessonRoomList}" var="lr">
												<option value="${lr.lRoomId }" ${lr.lRoomId eq lessonInfo.lessonRoom? 'selected' : ''}>${lr.lRoomId }</option>
											</c:forEach>
										</select>
									</c:when>
									<c:otherwise>
										${lessonInfo.lessonRoom }
									</c:otherwise>
							</c:choose>
						
						</c:when>
						
						<c:otherwise>
							${lessonInfo.lessonRoom }
						</c:otherwise>
					</c:choose>
					</td>
					<td>상태</td>
					<td>
							<c:choose>
								
								<c:when test="${category eq 'm'}">
									<c:choose>
										<c:when test="${lessonInfo.mngName eq loginUser.mngName }">
											<select class="form-control">
												<c:forEach items="${ScodeValues.LessonStateList}" var="ls">
													<option id="${ls.scodeKey }" value="${ls.scodeValue }" ${ls.scodeValue eq lessonInfo.lessonStateCode? 'selected' : ''}>${ls.scodeValue }</option>
												</c:forEach>
											</select>
										</c:when>
										
										<c:otherwise>
											${lessonInfo.lessonStateCode }
										</c:otherwise>
									</c:choose>
								</c:when>
								
								<c:otherwise>
									${lessonInfo.lessonStateCode }
								</c:otherwise>
							</c:choose>
					</td>
				</tr>
				<tr>
					<td>시작일</td>
					<td>
							<c:choose>
								<c:when test="${category eq 'm'}">
									<c:choose>
										<c:when test="${lessonInfo.mngName eq loginUser.mngName }">
											<fmt:parseDate var="startDateString" value="${lessonInfo.lessonStartDate}" pattern="yyyyMMdd" />
											<fmt:formatDate value="${startDateString }" var="startDateStr" pattern="yyyy-MM-dd" />
											<input id="startDateInput" class="form-control" type="date" value="${startDateStr }">
										</c:when>
										
										<c:otherwise>
											<fmt:parseDate var="startDateString" value="${lessonInfo.lessonStartDate}" pattern="yyyyMMdd" />
											<fmt:formatDate value="${startDateString }" pattern="yyyy-MM-dd [E]" />
										</c:otherwise>
									</c:choose>
								</c:when>
								
								<c:otherwise>
									<fmt:parseDate var="startDateString" value="${lessonInfo.lessonStartDate}" pattern="yyyyMMdd" />
									<fmt:formatDate value="${startDateString }" pattern="yyyy-MM-dd [E]" />
								</c:otherwise>
							</c:choose>
					</td>
					<td>종료일</td>
					<td>
							<c:choose>
								
								<c:when test="${category eq 'm'}">
									<c:choose>
										<c:when test="${lessonInfo.mngName eq loginUser.mngName }">
											<fmt:parseDate var="endDateString" value="${lessonInfo.lessonEndDate}" pattern="yyyyMMdd" />
											<fmt:formatDate value="${endDateString }" var="endDateStr" pattern="yyyy-MM-dd" />
											<input id="endDateInput" class="form-control" type="date" value="${endDateStr }">
										</c:when>
										
										<c:otherwise>
											<fmt:parseDate var="endDateString" value="${lessonInfo.lessonEndDate}" pattern="yyyyMMdd" />
											<fmt:formatDate value="${endDateString }" pattern="yyyy-MM-dd [E]" />
										</c:otherwise>
									</c:choose>
								</c:when>
								
								<c:otherwise>
									<fmt:parseDate var="endDateString" value="${lessonInfo.lessonEndDate}" pattern="yyyyMMdd" />
									<fmt:formatDate value="${endDateString }" pattern="yyyy-MM-dd [E]" />
								</c:otherwise>
								
							</c:choose>
					</td>
				</tr>
				<tr>
					<td>대상</td>
					<td>
							<c:choose>
								<c:when test="${category eq 'm'}">
									<c:choose>
										<c:when test="${lessonInfo.mngName eq loginUser.mngName }">
											<select class="form-control">
												<c:forEach items="${ScodeValues.StudentGradeCategoryCodeList}" var="sgc">
													<option id="${sgc.scodeKey }" value="${sgc.scodeValue }" ${sgc.scodeValue eq lessonInfo.lessonGradeCategoryCode? 'selected' : ''}>${sgc.scodeValue }</option>
												</c:forEach>
											</select>
											<td>학년</td>
											<td>
											<select class="form-control">
												<c:choose>
									
													<c:when test="${ScodeValues.StudentGradeCategoryCodeList[0].scodeValue eq '초'}">
														<option ${1 eq lessonInfo.lessonGrade? 'selected' : ''}>1</option>
														<option ${2 eq lessonInfo.lessonGrade? 'selected' : ''}>2</option>
														<option ${3 eq lessonInfo.lessonGrade? 'selected' : ''}>3</option>
														<option ${4 eq lessonInfo.lessonGrade? 'selected' : ''}>4</option>
														<option ${5 eq lessonInfo.lessonGrade? 'selected' : ''}>5</option>
														<option ${6 eq lessonInfo.lessonGrade? 'selected' : ''}>6</option>
													</c:when>
													
													<c:otherwise>
														<option ${1 eq lessonInfo.lessonGrade? 'selected' : ''}>1</option>
														<option ${2 eq lessonInfo.lessonGrade? 'selected' : ''}>2</option>
														<option ${3 eq lessonInfo.lessonGrade? 'selected' : ''}>3</option>
													</c:otherwise>
													
												</c:choose>
											</select>
											</td>
										</c:when>
										
										<c:otherwise>
											${lessonInfo.lessonGradeInteGrate }
										</c:otherwise>
									</c:choose>
								</c:when>
								
								
								<c:otherwise>
									${lessonInfo.lessonGradeInteGrate }
								</c:otherwise>
								
							</c:choose>
					</td>
				</tr>
				<tr>
					<td>수강인원</td>
					<td>${fn:length(IncludeList)}/${lessonInfo.lessonMaxNo }</td>
				</tr>
			</table>
            </div>
         </div>
   </div>
   <div id="lessonTimeInfoCard" class="card-body" style="display:none;">
		   		<div class="card card-outline card-dark">
		            <div class="card-header">
		               <h3 class="card-title">
							<i class="fa-solid fa-chalkboard-user"></i>
							&nbsp;
							수업시간표
					   </h3>
						   	<c:if test="${category eq 'm' }">
					   <table>
						   <tr>
						   	 <c:if test="${lessonInfo.mngName eq loginUser.mngName }">
								
							  </c:if>
							</tr>
					   </table>
 					   <c:if test="${lessonInfo.mngName eq loginUser.mngName }"> 
						   <div class="card-tools" style="margin: 0;">
			                  <div class="row">
			                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
			                  		<table id="viewTimeTable" style="display: none;">
									   <tr>
											<td style="width: 100px;">선택수업시수</td>
											<td id="actualHours" ></td>
										</tr>
								   </table>
									<div class="input-group-append">
										<button id="updateFormbtn" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											수정
										</button>
										<button id="updateConfirmbtn" style="display: none;" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											저장
										</button>
										<button id="updateCancelbtn" style="display: none;" type="submit" class="btn btn-secondary" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											수정취소
										</button>
									</div>
								</div>
							  </div>
			               </div>
					   	</c:if>
 						   	</c:if>
		            </div>
		            <div id="viewTimeDiv">
		            <div class="card-body">
						<div class="row table1">
							<div class="card-body p-0">
								 <div id="lessonTimeRegistWeekDayForm" class="row table2">
						           	<table id="lessonTimeRegistWeekDayFormTable" data-id="${lessonTimeInfo }" class="table table-bordered">
										<tbody>
											<tr>
												<th class="backgroundTd" style="width: 100px;">
													</th>
												<th class="backgroundTd">월</th>
												<th class="backgroundTd">화</th>
												<th class="backgroundTd">수</th>
												<th class="backgroundTd">목</th>
												<th class="backgroundTd">금</th>
												<th class="backgroundTd">토</th>
												<th class="backgroundTd">일</th>
											</tr>
											<c:forEach items="${ttMap.weekDayList}" var="wdList">
												<tr>
													<td class="backgroundTd">
														${wdList.timetablePeriod}교시<br>
														${wdList.timetableStartTime }~ ${wdList.timetableEndTime }
													</td>
													<td id="mon${wdList.timetablePeriod }" class="timeTarget"></td>
													<td id="tue${wdList.timetablePeriod }" class="timeTarget"></td>
													<td id="wed${wdList.timetablePeriod }" class="timeTarget"></td>
													<td id="thu${wdList.timetablePeriod }" class="timeTarget"></td>
													<td id="fri${wdList.timetablePeriod }" class="timeTarget"></td>
													<td id="sat${wdList.timetablePeriod }" class="timeTarget"></td>
													<td id="sun${wdList.timetablePeriod }" class="timeTarget"></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
					           	</div>
							</div>
						</div>
					 </div>
					 </div>
         			<div id="updateForm" style="display: none;">
         				<div class="card-body">
						<div class="row table1">
							<div class="card-body p-0">
								 <div id="lessonTimeRegistWeekDayForm" class="row table2">
						           	<table id="lessonTimeRegistWeekDayHiddenFormTable" data-id="${lessonTimeInfo }" data-disableInfo="${disabledScheduleInfo }" class="table table-bordered">
										<tbody>
											<tr>
												<th class="backgroundTd" style="width: 100px;">
													</th>
												<th class="backgroundTd">월</th>
												<th class="backgroundTd">화</th>
												<th class="backgroundTd">수</th>
												<th class="backgroundTd">목</th>
												<th class="backgroundTd">금</th>
												<th class="backgroundTd">토</th>
												<th class="backgroundTd">일</th>
											</tr>
											<c:forEach items="${ttMap.weekDayList}" var="wdList">
												<tr>
													<td class="backgroundTd">
														${wdList.timetablePeriod}교시<br>
														${wdList.timetableStartTime }~ ${wdList.timetableEndTime }
													</td>
													<td id="mon${wdList.timetablePeriod }" class="clickableTd"></td>
													<td id="tue${wdList.timetablePeriod }" class="clickableTd"></td>
													<td id="wed${wdList.timetablePeriod }" class="clickableTd"></td>
													<td id="thu${wdList.timetablePeriod }" class="clickableTd"></td>
													<td id="fri${wdList.timetablePeriod }" class="clickableTd"></td>
													<td id="sat${wdList.timetablePeriod }" class="clickableTd"></td>
													<td id="sun${wdList.timetablePeriod }" class="clickableTd"></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
					           	</div>
							</div>
						</div>
					 </div>
         			</div>
         			</div>
         			
   		</div>
	<div id="loginUser" style="display: none;">
		${loginUser.id }
	</div>   
   
   
</section>
<script>
	window.onload=function(){
		
		$("#showLessonTimeInfoBtn").on("click",function(){
			$("#lessonTimeInfoCard").css("display","block");
			$("#showLessonDetailInfoBtn").parent().css("display","block");
			$("#showLessonTimeInfoBtn").parent().css("display","none");
			$("#lessonDetailInfoCard").css("display","none");
		});
		
		$("#showLessonDetailInfoBtn").on("click",function(){
			$("#lessonTimeInfoCard").css("display","none");
			$("#showLessonDetailInfoBtn").parent().css("display","none");
			$("#showLessonTimeInfoBtn").parent().css("display","block");
			$("#lessonDetailInfoCard").css("display","block");
		});
		
		$("#closeBtn").on("click",function(){
			CloseWindow();
		});
		$("#managerInfo").on("click",function(){
    		let managerId = $(this).attr("data-mngId");
    		OpenWindow('/common/totalDetail.do?id='+managerId,'회원상세보기',600,400);
		});
		
		let comparisonVal =  $("#lessonTimeRegistWeekDayFormTable").attr("data-id");
		comparisonVal = comparisonVal.replace("]",",]");
		console.log(comparisonVal);
		console.log(typeof comparisonVal);
		$(".timeTarget").each(function(){
			console.log($(this).attr("id"))
			console.log(comparisonVal.indexOf($(this).attr("id")+","));
			if(comparisonVal.indexOf($(this).attr("id")+",")>-1){
				$(this).attr("class","reservationTime");
			}
		});
		
		let comparisonVal2 =  $("#lessonTimeRegistWeekDayFormTable").attr("data-id");
		comparisonVal2 = comparisonVal.replace("]",",]");
		let comparisonVal3 =  $("#lessonTimeRegistWeekDayHiddenFormTable").attr("data-disableInfo");
		comparisonVal3 = comparisonVal.replace("]",",]");
		let startDate = $("#startDateInput").val();
		let endDate = $("#endDateInput").val();
		
		$(".clickableTd").each(function(){
			if(comparisonVal3.indexOf($(this).attr("id")+",")>-1){
				$(this).attr("class","disabledTd");
			}
		});
		$(".disabledTd").each(function(){
			if(comparisonVal2.indexOf($(this).attr("id")+",")>-1){
				$(this).attr("class","selectedTd");
			}
		});
		
		$(".lessonCancelBtn").on("click",function(){
			lessonAssignmentId = $("#lessonId").attr("data-id");
			studentId = $("#loginUser").text().trim();
			let sdataSet = {
				"lessonAssignmentId" : lessonAssignmentId
			   ,"studentId" : studentId
			};
			sdataSet = JSON.stringify(sdataSet);
			console.log(sdataSet);
			Swal.fire({
				title: '수강취소 하시겠습니까??',
				text: '결제이력이 있을경우, 자동으로 환불 신청되며, 환불까지 3일 소요됩니다.',
				icon: 'warning',
				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				confirmButtonText: '수강취소', // confirm 버튼 텍스트 지정
				cancelButtonText: '닫기', // cancel 버튼 텍스트 지정
				reverseButtons: false, // 버튼 순서 거꾸로
				}).then(result => {
				// 만약 Promise리턴을 받으면,
				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					$.ajax({
				        type: "post"
				       ,url : "/member/lesson/cancellation.do"
				 	   ,contentType: 'application/json'
				       ,data : sdataSet
				       ,success : function (data){
				    	   console.log(data);
					    	   if(data.result == 10){
					    		   Swal.fire({
					    			   title: '수강취소 되었습니다!',
										text: '결제하신 이력이 없어 즉시 취소되었습니다.',
						   				icon: 'success',
					    		   }).then(result => {
						    		   location.reload();
					    		   })
					    	   } else {
					    		   Swal.fire({
					    			   title: '수강취소 되었습니다!',
										text: '결제하신 이력이 있어 환불 처리 후 취소 완료됩니다.',
						   				icon: 'success',
					    		   }).then(result => {
						    		   location.reload();
					    		   })
					    	   }
				    	   }
				       ,error : function(e){
				        }
					});
					
				}
				});
			
			
		});
		
		comparisonVal2 = comparisonVal2.replaceAll("[","").replaceAll("]","");
		let comparisonValKor = comparisonVal2.replaceAll('mon','월').replaceAll('tue','화').replaceAll('wed','수').replaceAll('thu','목').replaceAll('fri','금').replaceAll('sat','토');
		let timeArr = comparisonVal2.split(',');
		for(i=0; i<timeArr.length; i++){
			timeArr[i] = timeArr[i].trim();
		}
		timeArr.splice(timeArr.indexOf(""),1);
		timeArr.splice(timeArr.indexOf(""),1);
		let timeKorArr = comparisonValKor.split(',');
		for(i=0; i<timeKorArr.length; i++){
			timeKorArr[i] = timeKorArr[i].trim();
		}
		timeKorArr.splice(timeKorArr.indexOf(""),1);
		timeKorArr.splice(timeKorArr.indexOf(""),1);
		console.log(comparisonVal2);
		console.log(timeArr);
		
		let timeKor; 
		let time;
		
		$(document).on("click",".clickableTd",function(){
			$(this).css("background-color","rgb(32 73 105)");
			$(this).attr("class","selectedTd");
			
			timeKor = $(this).attr("id").replace('mon','월').replace('tue','화').replace('wed','수').replace('thu','목').replace('fri','금').replace('sat','토').trim();
			time = $(this).attr("id").trim();
			
			timeKorArr.push(timeKor);
			timeArr.push(time);
			CalculateTime();
		});
		
		$(document).on("click",".selectedTd",function(){
			$(this).css("background-color","white");
			$(this).attr("class","clickableTd");
			
			timeKor = $(this).attr("id").replace('mon','월').replace('tue','화').replace('wed','수').replace('thu','목').replace('fri','금').replace('sat','토').trim();
			console.log(timeKor);
			console.log(timeKorArr.indexOf(timeKor));
			time = $(this).attr("id").trim();
			
			timeKorArr.splice(timeKorArr.indexOf(timeKor),1);
			timeArr.splice(timeArr.indexOf(time),1);
			CalculateTime();
		});
		
		let dayCalArr = [];
		let startDate2 = new Date(startDate);
		let endDate2 = new Date(endDate);
		let period = endDate2 - startDate2;
		let DayArr = ["sun","mon","tue","wed","thu","fri","sat"];
		let periodDay = period/(1000*60*60*24);
		let periodWeek = Math.floor(period/(1000*60*60*24*7));
		let reminderDay = (periodDay % 7)+1;
		
		for(var i = 0; i<7; i++){
			dayCalArr[i] = periodWeek;
		}
		for(var i = 0; i<reminderDay;i++){
			var abc = startDate2.getDay()+i;
			if(abc>=7){
				abc=abc-7;
			}
			dayCalArr[abc]++;
		}
		
		
		function CalculateTime(){
			let timeCalArr = [0,0,0,0,0,0,0];
			console.log(timeArr);
			console.log(timeKorArr);
			for(var i = 0 ; i<timeArr.length;i++){
				
				if(timeArr[i].indexOf("mon")>-1){
					timeCalArr[1]++;
				}
				if(timeArr[i].indexOf("tue")>-1){
					timeCalArr[2]++;
				}
				if(timeArr[i].indexOf("wed")>-1){
					timeCalArr[3]++;
				}
				if(timeArr[i].indexOf("thu")>-1){
					timeCalArr[4]++;
				}
				if(timeArr[i].indexOf("fri")>-1){
					timeCalArr[5]++;
				}
				if(timeArr[i].indexOf("sat")>-1){
					timeCalArr[6]++;
				}
				if(timeArr[i].indexOf("sun")>-1){
					timeCalArr[0]++;
				}
			}
			
			let dayHours = 0;
			console.log(timeCalArr);
			console.log(dayCalArr);
			
			for(var i = 0 ; i<7; i++){
				let a = parseInt(dayCalArr[i]);
				let b = parseInt(timeCalArr[i]);
				dayHours += (a*b);
			}
			
			$("#actualHours").text(dayHours);
			
		}
		
		$("#updateFormbtn").on("click",function(){
			CalculateTime();
			$("#viewTimeDiv").css("display","none");
			$("#updateFormbtn").css("display","none");
			$("#updateForm").css("display","block");
			$("#viewTimeTable").css("display","block");
			$("#updateCancelbtn").css("display","block");
			$("#updateConfirmbtn").css("display","block");
		});
		$("#updateCancelbtn").on("click",function(){
			$("#viewTimeDiv").css("display","block");
			$("#updateFormbtn").css("display","block");
			$("#updateCancelbtn").css("display","none");
			$("#updateForm").css("display","none");
			$("#viewTimeTable").css("display","none");
			$("#updateConfirmbtn").css("display","none");
		});
		$("#updateConfirmbtn").on("click",function(){
			let timeResult = "";
			let timeResultEng = []
			for(i=0; i<timeKorArr.length; i++){
				timeResult += timeKorArr[i].trim()
				if(!(i==timeKorArr.length-1)){
				timeResult+=",";
				}
			}
			for(i=0; i<timeArr.length; i++){
				timeResultEng.push(timeArr[i].trim());
			}
			let targetLessonHours = $("#lessonHour").text();
			let targetActualHours = $("#actualHours").text();
			if(!(targetLessonHours == targetActualHours)){
				Swal.fire({
	    			   title: '수업시수가 일치 하지 않습니다!',
		   				icon: 'warning'
	    		   });
				return;
			}
			let lessonAssignmentId = "${lessonInfo.lessonAssignmentId}";
			let sdataSet = {
					"timeResult" : timeResult
				   ,"timeTableArr" : timeResultEng
				   ,"lessonAssignmentId" : lessonAssignmentId
				};
			sdataSet = JSON.stringify(sdataSet);
			console.log(sdataSet);
			$.ajax({
		        type: "post"
		       ,url : "/manager/lesson/updateLessonTimeInfo.do"
		 	   ,contentType: 'application/json'
		       ,data : sdataSet
		       ,success : function (data){
		    	   Swal.fire({
	    			   title: '수업시간 수정에 성공하였습니다!',
		   				icon: 'success'
	    		   });
		    	   setTimeout(function() {
			    	   location.reload();
		    		 }, 2000);
		    	}
		       ,error : function(e){
		        }
			});
		});
		$("#startDateInput").on("change",function(){
			startDate = $("#startDateInput").val();
			dayCalArr = [];
			startDate2 = new Date(startDate);
			endDate2 = new Date(endDate);
			period = endDate2 - startDate2;
			DayArr = ["sun","mon","tue","wed","thu","fri","sat"];
			periodDay = period/(1000*60*60*24);
			periodWeek = Math.floor(period/(1000*60*60*24*7));
			reminderDay = (periodDay % 7)+1;
			
			for(var i = 0; i<7; i++){
				dayCalArr[i] = periodWeek;
			}
			for(var i = 0; i<reminderDay;i++){
				var abc = startDate2.getDay()+i;
				if(abc>=7){
					abc=abc-7;
				}
				dayCalArr[abc]++;
			}
			CalculateTime();
			checkSchuedule();
		});	
		$("#endDateInput").on("change",function(){
			endDate = $("#endDateInput").val();
			dayCalArr = [];
			startDate2 = new Date(startDate);
			endDate2 = new Date(endDate);
			period = endDate2 - startDate2;
			DayArr = ["sun","mon","tue","wed","thu","fri","sat"];
			periodDay = period/(1000*60*60*24);
			periodWeek = Math.floor(period/(1000*60*60*24*7));
			reminderDay = (periodDay % 7)+1;
			
			for(var i = 0; i<7; i++){
				dayCalArr[i] = periodWeek;
			}
			for(var i = 0; i<reminderDay;i++){
				var abc = startDate2.getDay()+i;
				if(abc>=7){
					abc=abc-7;
				}
				dayCalArr[abc]++;
			}
			CalculateTime();
			checkSchuedule();
		});	
		
		function checkSchuedule(){
			let sendStartDate = startDate.replaceAll("-","");
			let sendEndDate = endDate.replaceAll("-","");
			let managerId = $("#managerInfo").attr("data-mngId");
			
			let sdataSet = {
					"managerId" : managerId
				   ,"startDate" : sendStartDate
				   ,"endDate" : sendEndDate
			};
			
			sdataSet = JSON.stringify(sdataSet);
			console.log(sdataSet);
			
			$.ajax({
		        type: "post"
		       ,url : "/manager/lesson/getSchudule.do"
		       ,contentType: 'application/json'
		       ,data : sdataSet
		       ,success : function (data){
		    	   	console.log(data);
		    	   data = data.teacherSchedule.toString();
		    	   	console.log(data);
			   		$(".disabledTd").each(function(){
			   			if(data.indexOf($(this).attr("id")+",")==-1){
			   				$(this).attr("class","clickableTd");
			   			}
			   		});
			   		$(".clickableTd").each(function(){
			   			if(data.indexOf($(this).attr("id")+",")>-1){
			   				$(this).attr("class","disabledTd");
			   			}
			   		});
			   		CalculateTime();
		        }
		       ,error : function(e){
		        }
			});
		}
		
		$("#updateLessonDetailInfo").on("click",function(){
			let targetHours = $("#lessonHour").text();
			let dayHours = $("#actualHours").text();
			console.log(targetHours);
			console.log(dayHours);
			if(targetHours != dayHours){
				Swal.fire({
	    			   title: '수업시수가 일치 하지 않습니다!',
		   				icon: 'warning'
	    		   });
			}
			let dataArr = [];
			$(".form-control").each(function(){
				dataArr.push(this);
			});
			
			let dataSet = {
					"lessonRoom" : dataArr[0].options[dataArr[0].selectedIndex].text
				   ,"lessonStateCode" : dataArr[1].options[dataArr[1].selectedIndex].id
				   ,"lessonStartDate" : dataArr[2].value.replaceAll("-","")
				   ,"lessonEndDate" : dataArr[3].value.replaceAll("-","")
				   ,"lessonGradeCategoryCode" : dataArr[4].options[dataArr[4].selectedIndex].text
				   ,"lessonGrade" : dataArr[5].options[dataArr[5].selectedIndex].text
				   ,"lessonAssignmentId" : $("#lessonId").attr("data-id")
			}
			console.log(dataSet);
			
			
			$.ajax({
		        type: "post"
		       ,anyne:true
		       ,url : "/manager/detail/regist.do"
		       ,contentType: "application/json; charset=UTF-8"
		       ,data : JSON.stringify(dataSet)
		       ,success : function (data){
		    	   Swal.fire({
	    			   title: '수정에 성공했습니다!',
		   				icon: 'success'
	    		   });
		    	   window.location.reload();
		        }
		       ,error : function(e){
		        }
			});
		});
		
		
		$(".form-control").on("change",function(){
			$(this).css("border-color","red");
		});
		$(".form-control").on("keyup",function(){
			$(this).css("border-color","red");
		});
		CalculateTime();
		
		$("#viewSyllabusBtn").on("click",function(){
			let lessonAssignmentId = $("#lessonId").attr("data-id");
			window.open('/manager/lesson/viewSyllabus.do?lessonAssignmentId='+lessonAssignmentId,'pop_Notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=440,height=610,top=200,left=200');
		});
		$("#registSyllabusBtn").on("click",function(){
			let lessonAssignmentId = $("#lessonId").attr("data-id");
			window.open('/manager/lesson/registSyllabus.do?lessonAssignmentId='+lessonAssignmentId,'pop_Notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=520,height=720,top=200,left=200');
		});
	}
</script>
</body>

</html>