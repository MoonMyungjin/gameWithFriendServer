<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<style>
	div.table1 {
		max-height: 600px;
		overflow-y: auto;
	}
	div.table2 {
		max-height: 230px;
		overflow-y: scroll;
	}
	.targetTd{
		height: 60px;
	}
	.backgroundTd{
	
	}
		.engTime{
		background-color: #683C9E;
		color: white;
		cursor: pointer;
	}
	.korTime{
		background-color: #F06E6E;
		color: white;
		cursor: pointer;
	}
	.mathTime{
		background-color: #FFB400;
		color: white;
		cursor: pointer;
	}
	.sctyTime{
		background-color: #2CE0BC;
		color: white;
		cursor: pointer;
	}
	.scncTime{
		background-color: #1E90FF;
		color: white;
		cursor: pointer;
	}
	.managerDetail:hover{
		cursor: pointer;
	}	
</style>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }">시간표</h1>
              <c:if test="${empty from }">              
	              <c:if test="${fn:indexOf(favoriteMenuListStr, '시간표') != -1}">
	                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
	               </c:if>
	               <c:if test="${fn:indexOf(favoriteMenuListStr, '시간표') == -1}">
	                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
	               </c:if>
               </c:if>
           </div>
           <div class="col-sm-6" style="text-align: right;">
           	<span class="managerDetail" data-id="${classInfo.mngId }" style="font-size: 23px; font: bold;">담임선생님 &nbsp;&nbsp;:&nbsp;&nbsp; ${classInfo.mngName }T</span>
           </div>
        </div>
   </div>
</section>
<section class="content">
   <div class="card-header">
   	<div class="row">
      	<div class="col-sm-12">
   			<div class="card card-outline card-light">
				<div class="card-header">
				<h3 class="card-title">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;<span style="font-size: 27px;" id="startDate"></span>&nbsp;&nbsp;<span style="font-size: 27px;">~</span>&nbsp;&nbsp;  
					<span style="font-size: 27px;" id="endDate"></span>&nbsp;&nbsp;  
			   	</h3>
					<div class="card-tools">
						<div class="input-group-sm row">
								<span class="input-group-append">
									<input id="inputWeek" type="week" class="form-control" value="${dayInfo.week }">
								</span>
							<c:if test="${category eq 'p' }">
								<span class="input-group-append">
									<select id="selectUserBtn" class="form-control">
										<c:forEach items="${studentList}" var="studentList">
											<option id="${studentList.studentId }" ${inStudentId eq studentList.studentId ? "selected":""}>${studentList.studentName }</option>
										</c:forEach>
									</select>
								</span>
							</c:if>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					</div>
				</div>
			</div>
   		</div>
      </div>
   </div>
   <div class="card-body">
   	<div class="card card-light card-tabs card-outline">
		<div class="card-header p-0 pt-1">
			<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
			<li class="nav-item">
				<a class="nav-link active" id="custom-tabs-one-home-tab" data-toggle="pill" href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home" aria-selected="true">시간표</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" id="custom-tabs-one-profile-tab" data-toggle="pill" href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false">수업목록</a>
			</li>
			</ul>
		</div>
		<div class="card-body">
			<div id="mon">
				<c:forEach items="${byDayMap.mondayList}" var="mondayList">
					<div class="monTimedataSource" data-lRoomId="${mondayList.lRoomId }" data-lessonTimeTarget="${mondayList.lessonTimeTarget }" data-subjectTypeName="${mondayList.lessonSubjectTypeName }"
						data-lessonId="${mondayList.lessonAssignmentId }" data-lessonSubjectType="${mondayList.lessonSubjectType} " data-mngName="${mondayList.mngName}"
					></div>
				</c:forEach>
			</div>		
			<div class="tab-content" id="custom-tabs-one-tabContent">
				<div class="tab-pane fade active show" id="custom-tabs-one-home" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
					<table id="example1" class="table table-bordered" style="text-align : center">
						<thead>
							<tr>
								<th class="backgroundTd" style="">
									</th>
								<th class="backgroundTd" >월</th>
								<th class="backgroundTd" >화</th>
								<th class="backgroundTd" >수</th>
								<th class="backgroundTd" >목</th>
								<th class="backgroundTd" >금</th>
								<th class="backgroundTd" >토</th>
								<th class="backgroundTd" >일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ttMap.weekDayList}" var="wdList">
								<tr>
									<td class="backgroundTd" style="width: 17%;" >
										${wdList.timetablePeriod}교시 (${wdList.timetableStartTime }~ ${wdList.timetableEndTime })
									</td>
									<td style="width: 11%;"id="mon${wdList.timetablePeriod }" class="targetTd"></td>
									<td style="width: 11%;"id="tue${wdList.timetablePeriod }" class="targetTd"></td>
									<td style="width: 11%;"id="wed${wdList.timetablePeriod }" class="targetTd"></td>
									<td style="width: 11%;"id="thu${wdList.timetablePeriod }" class="targetTd"></td>
									<td style="width: 11%;"id="fri${wdList.timetablePeriod }" class="targetTd"></td>
									<td style="width: 11%;"id="sat${wdList.timetablePeriod }" class="targetTd"></td>
									<td style="width: 11%;"id="sun${wdList.timetablePeriod }" class="targetTd"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</div>
			<div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
				<div class="row table1">
					<div class="card-body p-0">
						<table class="table table-head-fixed table-bordered">
							<thead>
								<tr>
									<th style="width: 10%">과목</th>
									<th style="width: 40%">수업명</th>
									<th style="width: 10%">강의실</th>
									<th style="width: 10%">선생님</th>
									<th style="width: 20%">강의기간</th>
									<th style="width: 15%">상세보기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${byDayMap.tuesdayList}" var="list">
									<tr>
										<td>${list.lessonSubjectTypeName }</td>
										<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.lessonName }</td>
										<td>${list.lRoomId }</td>
										<td>${list.mngName }T</td>
										<td>${list.lessonStartDate }~${list.lessonEndDate }</td>
										<td>
											<button type="button" class="btn btn-sm btn-light" onclick="OpenWindow('/common/lesson/detail.do?lessonAssignmentId=${list.lessonAssignmentId }','강의 상세정보',800,700);">상세보기</button>
										</td>
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
<form action="/member/lesson/myLessonList.do" id="timeRequestForm">
	<input type="hidden" id="monday" name="monday">
	<input type="hidden" id="tuesday" name="tuesday">
	<input type="hidden" id="wednesday" name="wednesday">
	<input type="hidden" id="thursday" name="thursday">
	<input type="hidden" id="friday" name="friday">
	<input type="hidden" id="saturday" name="saturday">
	<input type="hidden" id="week" name="week">
	<input type="hidden" id="inStudentId" name="inStudentId">
</form>  
 
</section>

<script>
	window.onload = function(){
		
		setTimeout(function() {
			setInputWeek();
			}, 100);
		
		$("#inputWeek").on("change",function(){
			calculatePeriod($(this).val());
			getClassRoomTimeInfo($(this).val());
		});
		
		printlessonTimeInfo();
		
		$("#selectUserBtn").on("change",function(){
			var studentId = $("#selectUserBtn option:selected").attr("id");
			$("#inStudentId").val(studentId);
			getClassRoomTimeInfo($("#inputWeek").val());
		});
		
		$(document).on("click",".managerDetail",function(e){
    		e.stopImmediatePropagation(); 
    		let managerId = $(this).attr("data-id");
    		OpenWindow('/common/totalDetail.do?id='+managerId,'회원상세보기',600,400);
    	 });
	}

</script>

<script>
	function setInputWeek(){
		let inputWeek = $("#inputWeek").val();
		if(!inputWeek){
			let today = moment();
			let today2 = moment();
			let year = today.isoWeekYear();
			let week = today.isoWeek();
			inputWeek = year + "-W" + week;
			$("#inputWeek").val(inputWeek);
		}
		calculatePeriod(inputWeek);
	}
	
	function calculatePeriod(week){
		let monday = moment(week).day(1);
		let sunday = moment(week).day(7);
		let monDate = monday.format("YYYY-MM-DD (ddd)");
		let sunDate = sunday.format("YYYY-MM-DD (ddd)");
		
		$("#startDate").text(monDate);
		$("#endDate").text(sunDate);
	}
	
	function getClassRoomTimeInfo(week){
		let monday = moment(week).day(1).format("YYYYMMDD");
		let tuesday = moment(week).day(2).format("YYYYMMDD");
		let wednesday = moment(week).day(3).format("YYYYMMDD");
		let thursday = moment(week).day(4).format("YYYYMMDD");
		let friday = moment(week).day(5).format("YYYYMMDD");
		let saturday = moment(week).day(6).format("YYYYMMDD");
		let selectWeek = $("#inputWeek").val().trim();
		
		var timeRequestForm=$('#timeRequestForm');
		
		timeRequestForm.find("[name='monday']").val(monday);
		timeRequestForm.find("[name='tuesday']").val(tuesday);
		timeRequestForm.find("[name='wednesday']").val(wednesday);
		timeRequestForm.find("[name='thursday']").val(thursday);
		timeRequestForm.find("[name='friday']").val(friday);
		timeRequestForm.find("[name='saturday']").val(saturday);
		timeRequestForm.find("[name='week']").val(selectWeek);
	
		timeRequestForm.submit();
	}
</script>
<script>
function printlessonTimeInfo(){
	let mondayInfoArr = [];
	let tuesdayInfoArr = [];
	let wednesdayInfoArr = [];
	let thursdayInfoArr = [];
	let fridayInfoArr = [];
	let saturdayInfoArr = [];
	let byDayInfo = new Object();
	
	$(".monTimedataSource").each(function(){
		let mondayInfo = new Object();
		mondayInfo.lRoomId = $(this).attr("data-lRoomId");
		mondayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',mondayInfo.lRoomId+'/mon').replaceAll('화',mondayInfo.lRoomId+'/tue').replaceAll('수',mondayInfo.lRoomId+'/wed').replaceAll('목',mondayInfo.lRoomId+'/thu').replaceAll('금',mondayInfo.lRoomId+'/fri').replaceAll('토',mondayInfo.lRoomId+'/sat')+",";
		mondayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
		mondayInfo.lessonId = $(this).attr("data-lessonId");
		mondayInfo.mngName = $(this).attr("data-mngName");
		mondayInfoArr.push(mondayInfo);
	});
	
	$(".tueTimedataSource").each(function(){
		let tuesdayInfo = new Object();
		tuesdayInfo.lRoomId = $(this).attr("data-lRoomId");
		tuesdayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',tuesdayInfo.lRoomId+'/mon').replaceAll('화',tuesdayInfo.lRoomId+'/tue').replaceAll('수',tuesdayInfo.lRoomId+'/wed').replaceAll('목',tuesdayInfo.lRoomId+'/thu').replaceAll('금',tuesdayInfo.lRoomId+'/fri').replaceAll('토',tuesdayInfo.lRoomId+'/sat')+",";
		tuesdayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
		tuesdayInfo.lessonId = $(this).attr("data-lessonId");
		tuesdayInfo.mngName = $(this).attr("data-mngName");
		tuesdayInfoArr.push(tuesdayInfo);
	});
	
	$(".wedTimedataSource").each(function(){
		let wednesdayInfo = new Object();
		wednesdayInfo.lRoomId = $(this).attr("data-lRoomId");
		wednesdayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',wednesdayInfo.lRoomId+'/mon').replaceAll('화',wednesdayInfo.lRoomId+'/tue').replaceAll('수',wednesdayInfo.lRoomId+'/wed').replaceAll('목',wednesdayInfo.lRoomId+'/thu').replaceAll('금',wednesdayInfo.lRoomId+'/fri').replaceAll('토',wednesdayInfo.lRoomId+'/sat')+",";
		wednesdayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
		wednesdayInfo.lessonId = $(this).attr("data-lessonId");
		wednesdayInfo.mngName = $(this).attr("data-mngName");
		wednesdayInfoArr.push(wednesdayInfo);
	});
	
	$(".thuTimedataSource").each(function(){
		let thursdayInfo = new Object();
		thursdayInfo.lRoomId = $(this).attr("data-lRoomId");
		thursdayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',thursdayInfo.lRoomId+'/mon').replaceAll('화',thursdayInfo.lRoomId+'/tue').replaceAll('수',thursdayInfo.lRoomId+'/wed').replaceAll('목',thursdayInfo.lRoomId+'/thu').replaceAll('금',thursdayInfo.lRoomId+'/fri').replaceAll('토',thursdayInfo.lRoomId+'/sat')+",";
		thursdayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
		thursdayInfo.lessonId = $(this).attr("data-lessonId");
		thursdayInfo.mngName = $(this).attr("data-mngName");
		thursdayInfoArr.push(thursdayInfo);
	});
	
	$(".friTimedataSource").each(function(){
		let fridayInfo = new Object();
		fridayInfo.lRoomId = $(this).attr("data-lRoomId");
		fridayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',fridayInfo.lRoomId+'/mon').replaceAll('화',fridayInfo.lRoomId+'/tue').replaceAll('수',fridayInfo.lRoomId+'/wed').replaceAll('목',fridayInfo.lRoomId+'/thu').replaceAll('금',fridayInfo.lRoomId+'/fri').replaceAll('토',fridayInfo.lRoomId+'/sat')+",";
		fridayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
		fridayInfo.lessonId = $(this).attr("data-lessonId");
		fridayInfo.mngName = $(this).attr("data-mngName");
		fridayInfoArr.push(fridayInfo);
	});
	
	$(".satTimedataSource").each(function(){
		let saturdayInfo = new Object();
		saturdayInfo.lRoomId = $(this).attr("data-lRoomId");
		saturdayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',saturdayInfo.lRoomId+'/mon').replaceAll('화',saturdayInfo.lRoomId+'/tue').replaceAll('수',saturdayInfo.lRoomId+'/wed').replaceAll('목',saturdayInfo.lRoomId+'/thu').replaceAll('금',saturdayInfo.lRoomId+'/fri').replaceAll('토',saturdayInfo.lRoomId+'/sat')+",";
		saturdayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
		saturdayInfo.lessonId = $(this).attr("data-lessonId");
		saturdayInfo.mngName = $(this).attr("data-mngName");
		saturdayInfoArr.push(saturdayInfo);
	});
	
	byDayInfo.monday = mondayInfoArr;
	byDayInfo.tuesday = tuesdayInfoArr;
	byDayInfo.wednesday = wednesdayInfoArr;
	byDayInfo.thursday = thursdayInfoArr;
	byDayInfo.friday = fridayInfoArr;
	byDayInfo.saturday = saturdayInfoArr;
	console.log(mondayInfoArr);
	
	$(".targetTd").each(function(){
		let tdId = $(this).attr("id");
		for(var i = 0; i < byDayInfo.monday.length ; i++){
			console.log(byDayInfo.monday[i].lessonTimeTarget);
			if(byDayInfo.monday[i].lessonTimeTarget.indexOf(tdId+",")>=0){
				if(byDayInfo.monday[i].subjectTypeName == '국어'){
					$(this).attr("class","korTime");
					$(this).attr("data-lessonId",byDayInfo.monday[i].lessonId);
					$(this).text(byDayInfo.monday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.monday[i].mngName);
				}
				
				if(byDayInfo.monday[i].subjectTypeName == '영어'){
					$(this).attr("class","engTime");	
					$(this).attr("data-lessonId",byDayInfo.monday[i].lessonId);
					$(this).text(byDayInfo.monday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.monday[i].mngName);
				}
				
				if(byDayInfo.monday[i].subjectTypeName == '수학'){
					$(this).attr("class","mathTime");	
					$(this).attr("data-lessonId",byDayInfo.monday[i].lessonId);
					$(this).text(byDayInfo.monday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.monday[i].mngName);
				}
				
				if(byDayInfo.monday[i].subjectTypeName == '과학'){
					$(this).attr("class","sctyTime");	
					$(this).attr("data-lessonId",byDayInfo.monday[i].lessonId);
					$(this).text(byDayInfo.monday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.monday[i].mngName);
				}
				
				if(byDayInfo.monday[i].subjectTypeName == '사회'){
					$(this).attr("class","scncTime");	
					$(this).attr("data-lessonId",byDayInfo.monday[i].lessonId);
					$(this).text(byDayInfo.monday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.monday[i].mngName);
				}
				
			}
		}
		for(var i = 0; i < byDayInfo.tuesday.length ; i++){
			if(byDayInfo.tuesday[i].lessonTimeTarget.indexOf(tdId)>=0){
				if(byDayInfo.tuesday[i].subjectTypeName == '국어'){
					$(this).attr("class","korTime");
					$(this).attr("data-lessonId",byDayInfo.tuesday[i].lessonId);
					$(this).text(byDayInfo.tuesday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.tuesday[i].mngName);
				}
				
				if(byDayInfo.tuesday[i].subjectTypeName == '영어'){
					$(this).attr("class","engTime");	
					$(this).attr("data-lessonId",byDayInfo.tuesday[i].lessonId);
					$(this).text(byDayInfo.tuesday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.tuesday[i].mngName);
				}
				
				if(byDayInfo.tuesday[i].subjectTypeName == '수학'){
					$(this).attr("class","mathTime");	
					$(this).attr("data-lessonId",byDayInfo.tuesday[i].lessonId);
					$(this).text(byDayInfo.tuesday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.tuesday[i].mngName);
				}
				
				if(byDayInfo.tuesday[i].subjectTypeName == '과학'){
					$(this).attr("class","sctyTime");	
					$(this).attr("data-lessonId",byDayInfo.tuesday[i].lessonId);
					$(this).text(byDayInfo.tuesday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.tuesday[i].mngName);
				}
				
				if(byDayInfo.tuesday[i].subjectTypeName == '사회'){
					$(this).attr("class","scncTime");	
					$(this).attr("data-lessonId",byDayInfo.tuesday[i].lessonId);
					$(this).text(byDayInfo.tuesday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.tuesday[i].mngName);
				}
				
			}
		}
		for(var i = 0; i < byDayInfo.wednesday.length ; i++){
			if(byDayInfo.wednesday[i].lessonTimeTarget.indexOf(tdId)>=0){
				if(byDayInfo.wednesday[i].subjectTypeName == '국어'){
					$(this).attr("class","korTime");
					$(this).attr("data-lessonId",byDayInfo.wednesday[i].lessonId);
					$(this).text(byDayInfo.wednesday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.wednesday[i].mngName);
				}
				
				if(byDayInfo.wednesday[i].subjectTypeName == '영어'){
					$(this).attr("class","engTime");	
					$(this).attr("data-lessonId",byDayInfo.wednesday[i].lessonId);
					$(this).text(byDayInfo.wednesday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.wednesday[i].mngName);
				}
				
				if(byDayInfo.wednesday[i].subjectTypeName == '수학'){
					$(this).attr("class","mathTime");	
					$(this).attr("data-lessonId",byDayInfo.wednesday[i].lessonId);
					$(this).text(byDayInfo.wednesday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.wednesday[i].mngName);
				}
				
				if(byDayInfo.wednesday[i].subjectTypeName == '과학'){
					$(this).attr("class","sctyTime");	
					$(this).attr("data-lessonId",byDayInfo.wednesday[i].lessonId);
					$(this).text(byDayInfo.wednesday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.wednesday[i].mngName);
				}
				
				if(byDayInfo.wednesday[i].subjectTypeName == '사회'){
					$(this).attr("class","scncTime");	
					$(this).attr("data-lessonId",byDayInfo.wednesday[i].lessonId);
					$(this).text(byDayInfo.wednesday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.wednesday[i].mngName);
				}
				
			}
		}
		for(var i = 0; i < byDayInfo.thursday.length ; i++){
			if(byDayInfo.thursday[i].lessonTimeTarget.indexOf(tdId)>=0){
				if(byDayInfo.thursday[i].subjectTypeName == '국어'){
					$(this).attr("class","korTime");
					$(this).attr("data-lessonId",byDayInfo.thursday[i].lessonId);
					$(this).text(byDayInfo.thursday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.thursday[i].mngName);
				}
				
				if(byDayInfo.thursday[i].subjectTypeName == '영어'){
					$(this).attr("class","engTime");	
					$(this).attr("data-lessonId",byDayInfo.thursday[i].lessonId);
					$(this).text(byDayInfo.thursday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.thursday[i].mngName);
				}
				
				if(byDayInfo.thursday[i].subjectTypeName == '수학'){
					$(this).attr("class","mathTime");	
					$(this).attr("data-lessonId",byDayInfo.thursday[i].lessonId);
					$(this).text(byDayInfo.thursday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.thursday[i].mngName);
				}
				
				if(byDayInfo.thursday[i].subjectTypeName == '과학'){
					$(this).attr("class","sctyTime");	
					$(this).attr("data-lessonId",byDayInfo.thursday[i].lessonId);
					$(this).text(byDayInfo.thursday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.thursday[i].mngName);
				}
				
				if(byDayInfo.thursday[i].subjectTypeName == '사회'){
					$(this).attr("class","scncTime");	
					$(this).attr("data-lessonId",byDayInfo.thursday[i].lessonId);
					$(this).text(byDayInfo.thursday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.thursday[i].mngName);
				}
				
			}
		}
		for(var i = 0; i < byDayInfo.friday.length ; i++){
			if(byDayInfo.friday[i].lessonTimeTarget.indexOf(tdId)>=0){
				if(byDayInfo.friday[i].subjectTypeName == '국어'){
					$(this).attr("class","korTime");
					$(this).attr("data-lessonId",byDayInfo.friday[i].lessonId);
					$(this).text(byDayInfo.friday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.friday[i].mngName);
				}
				
				if(byDayInfo.friday[i].subjectTypeName == '영어'){
					$(this).attr("class","engTime");	
					$(this).attr("data-lessonId",byDayInfo.friday[i].lessonId);
					$(this).text(byDayInfo.friday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.friday[i].mngName);
				}
				
				if(byDayInfo.friday[i].subjectTypeName == '수학'){
					$(this).attr("class","mathTime");	
					$(this).attr("data-lessonId",byDayInfo.friday[i].lessonId);
					$(this).text(byDayInfo.friday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.friday[i].mngName);
				}
				
				if(byDayInfo.friday[i].subjectTypeName == '과학'){
					$(this).attr("class","sctyTime");	
					$(this).attr("data-lessonId",byDayInfo.friday[i].lessonId);
					$(this).text(byDayInfo.friday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.friday[i].mngName);
				}
				
				if(byDayInfo.friday[i].subjectTypeName == '사회'){
					$(this).attr("class","scncTime");	
					$(this).attr("data-lessonId",byDayInfo.friday[i].lessonId);
					$(this).text(byDayInfo.friday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.friday[i].mngName);
				}
				
			}
		}
		for(var i = 0; i < byDayInfo.saturday.length ; i++){
			if(byDayInfo.saturday[i].lessonTimeTarget.indexOf(tdId)>=0){
				if(byDayInfo.saturday[i].subjectTypeName == '국어'){
					$(this).attr("class","korTime");
					$(this).attr("data-lessonId",byDayInfo.saturday[i].lessonId);
					$(this).text(byDayInfo.saturday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.saturday[i].mngName);
				}
				
				if(byDayInfo.saturday[i].subjectTypeName == '영어'){
					$(this).attr("class","engTime");	
					$(this).attr("data-lessonId",byDayInfo.saturday[i].lessonId);
					$(this).text(byDayInfo.saturday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.saturday[i].mngName);
				}
				
				if(byDayInfo.saturday[i].subjectTypeName == '수학'){
					$(this).attr("class","mathTime");	
					$(this).attr("data-lessonId",byDayInfo.saturday[i].lessonId);
					$(this).text(byDayInfo.saturday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.saturday[i].mngName);
				}
				
				if(byDayInfo.saturday[i].subjectTypeName == '과학'){
					$(this).attr("class","sctyTime");	
					$(this).attr("data-lessonId",byDayInfo.saturday[i].lessonId);
					$(this).text(byDayInfo.saturday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.saturday[i].mngName);
				}
				
				if(byDayInfo.saturday[i].subjectTypeName == '사회'){
					$(this).attr("class","scncTime");	
					$(this).attr("data-lessonId",byDayInfo.saturday[i].lessonId);
					$(this).text(byDayInfo.saturday[i].subjectTypeName);
					$(this).append("<br/>");
					$(this).append(byDayInfo.saturday[i].mngName);
				}
				
			}
		}
	});
	
	 $(".korTime").on("click",function(){
		let lessonAssignmentId = $(this).attr("data-lessonId");
	 	window.open('/common/lesson/detail.do?lessonAssignmentId='+lessonAssignmentId,'pop_Notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=800,height=700,top=200,left=200');
     });
	 $(".engTime").on("click",function(){
		let lessonAssignmentId = $(this).attr("data-lessonId");
	 	window.open('/common/lesson/detail.do?lessonAssignmentId='+lessonAssignmentId,'pop_Notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=800,height=700,top=200,left=200');
     });
	 $(".mathTime").on("click",function(){
		let lessonAssignmentId = $(this).attr("data-lessonId");
	 	window.open('/common/lesson/detail.do?lessonAssignmentId='+lessonAssignmentId,'pop_Notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=800,height=700,top=200,left=200');
     });
	 $(".sctyTime").on("click",function(){
		let lessonAssignmentId = $(this).attr("data-lessonId");
	 	window.open('/common/lesson/detail.do?lessonAssignmentId='+lessonAssignmentId,'pop_Notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=800,height=700,top=200,left=200');
     });
	 $(".scncTime").on("click",function(){
		let lessonAssignmentId = $(this).attr("data-lessonId");
	 	window.open('/common/lesson/detail.do?lessonAssignmentId='+lessonAssignmentId,'pop_Notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=800,height=700,top=200,left=200');
     });
	
}

</script>
