<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/daterangepicker/daterangepicker.css">
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/moment/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/daterangepicker/daterangepicker.js"></script>
<style>
table {
	border: 2px solid #d2d2d2;
	border-collapse: collapse;
	font-size: 0.9em;
	display: inline-block;
	text-align: center;
}

th, td {
	border: 1px solid #d2d2d2;
	border-collapse: collapse;
}

th {
	height: 5px;
}

td {
	width: 500px;
	height: 30px;
}
.disabledTd{
	background-color: rgb(128, 128, 128, 0.3);
}
.disabledTd:hover{
	cursor: pointer;
	background-color: #fdfbd7;
}
.lessonLine{
	cursor: pointer;
}
.lessonLine:hover{
	cursor: pointer;
	color: #fdfbd7;
	background-color: #55acf0;
	border-color: white;
	box-shadow: none;
}
.selectedLesson{
	cursor: pointer;
	color: #fdfbd7;
	background-color: #55acf0;
	border-color: white;
	box-shadow: none;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }">수강신청</h1>
              <c:if test="${fn:indexOf(favoriteMenuListStr, '수강신청') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               <c:if test="${fn:indexOf(favoriteMenuListStr, '수강신청') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>              
           </div>
           <div class="col-sm-4">
           </div>
<!--            <div class="col-sm-2"> -->
<!--            		<button id="showMyTimeTableBtn" class="btn btn-lg btn-light">시간표 보기</button> -->
<!--            </div> -->
        </div>
   </div>
</section>
<section class="content">
   <div class="card-header">
   		<div class="row">
   			<div id="lessonSelectArea" class="col-sm-6">
				<div class="card card-outline card-light">
					<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
					   <div class="row">
			               <h3 class="card-title">
								<i class="fa-solid fa-person-chalkboard"></i>
								&nbsp;
								현재수업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</h3>
		 						   </div>
			               <div class="card-tools" style="margin: 0;">
			                  <div class="row">
			                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
									<div class="input-group-append">
										<input id="startDate" value="${startDate }" type="date" class="form-control"> <span style="font-size: 20px;">&nbsp;&nbsp;~&nbsp;&nbsp;</span>
									</div>
									<div class="input-group-append">
										<input id="endDate" value="${endDate }" type="date" class="form-control">
									</div>
								</div>
							  </div>
			               </div>
			            </div>
		            <div class="card-body">
		            	<div id="lessonTimeRegistWeekDayForm" class="row">
		            	<table id="lessonTimeRegistWeekDayFormTable" class="table table-bordered">
								<tbody>
									<tr>
										<th class="backgroundTd" style="width: 100px;">
											</th>
										<th class="backgroundTd" >월</th>
										<th class="backgroundTd" >화</th>
										<th class="backgroundTd" >수</th>
										<th class="backgroundTd" >목</th>
										<th class="backgroundTd" >금</th>
										<th class="backgroundTd" >토</th>
										<th class="backgroundTd" >일</th>
									</tr>
									<c:forEach items="${ttMap.weekDayList}" var="wdList">
										<tr>
											<td  class="backgroundTd" style="" >
												${wdList.timetablePeriod}
											</td>
											<td id="mon${wdList.timetablePeriod }" class="notReadyTd"></td>
											<td id="tue${wdList.timetablePeriod }" class="notReadyTd"></td>
											<td id="wed${wdList.timetablePeriod }" class="notReadyTd"></td>
											<td id="thu${wdList.timetablePeriod }" class="notReadyTd"></td>
											<td id="fri${wdList.timetablePeriod }" class="notReadyTd"></td>
											<td id="sat${wdList.timetablePeriod }" class="notReadyTd"></td>
											<td id="sun${wdList.timetablePeriod }" class="notReadyTd"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
		            	</div>
		            </div>
		         </div>
			  </div>
			  <div class="col-sm-6">
				<div class="row">
					<div class="card card-outline card-light">
						<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
 						   <div class="row">
				               <h3 class="card-title">
									<i class="fa-solid fa-person-chalkboard"></i>
									&nbsp;
									기간별 수업list&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</h3>
			 						   </div>
				               <div class="card-tools" style="margin: 0;">
				                  <div class="row">
				                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<input id="searchlessonInput" type="text" class="form-control float-right" placeholder="list내 검색" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<div class="input-group-append">
											<button id="searchlessonBtn" type="submit" class="btn btn-light" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
												<i class="fas fa-search" aria-hidden="true"></i>
											</button>
										</div>
									</div>
								  </div>
				               </div>
				            </div>
			            <div class="card-body">
			            	<div id="" class="row table2">
			            		<table id="lessonListTable" class="table table-bordered">
			            			<tr>
			            				<th>과목</th>
			            				<th>강의명</th>
			            				<th>상세</th>
			            				<th>수강신청</th>
			            			</tr>
			            			<tr>
			            				<td colspan="4">기간을 선택해주세요</td>
			            			</tr>
								</table>
			            	</div>
			            </div>
			         </div>
				</div>
	   		</div>
	   	</div>
   </div>
   <div id="dataSource">
	</div>
   <div id="userId" style="display: none;" >${loginUser.id }</div>
</section>
<script>
let oriStartDate = localStorage.getItem('oriStartDate');
let oriEndDate = localStorage.getItem('oriEndDate');
window.onload = function(){
// 	oriStartDate = $("#startDate").val();
// 	oriEndDate = $("#endDate").val();
	$("#startDate").val(oriStartDate);
	$("#endDate").val(oriEndDate);
	setTimeout(function() {
			getSchedule();
		}, 200);
	
	$("#showMyTimeTableBtn").on("click",function(){
		window.open('/member/lesson/myLessonList.do?from=apply','강의 상세정보',800,700);
	});
	
	$("#startDate").on("change",function(){
		oriStartDate = $(this).val();
		localStorage.setItem('oriStartDate', oriStartDate);
		setTimeout(function() {
			getSchedule($(this));
		}, 500);
	});
	
	$("#endDate").on("change",function(){
		oriEndDate = $(this).val();
		localStorage.setItem('oriEndDate', oriEndDate);
		setTimeout(function() {
			getSchedule($(this));
		}, 500);
	});
	
	$(document).on("click",".disabledTd",function(){
		let lessonAssignmentId = $(this).attr("data-lessonassignmentid"); 
   		OpenWindow('/common/lesson/detail.do?lessonAssignmentId='+lessonAssignmentId,'강의 상세정보',800,700);
	});
	
	$(document).on("click",".viewLessonDetail",function(){
		let lessonAssignmentId = $(this).attr("data-lessonassignmentid"); 
   		OpenWindow('/common/lesson/detail.do?lessonAssignmentId='+lessonAssignmentId,'강의 상세정보',800,700);
	});
	
	$(document).on("click",".lessonLine",function(){
		let lessonTimeTarget = $(this).attr("data-lessonTimeTarget"); 
		$(".selectedLesson").attr("class","lessonLine");
		$(this).attr("class","selectedLesson");
		renderLessonTime(lessonTimeTarget);
	});
	
	$(document).on("click",".lessonApplyBtn",function(){
		let lessonAssignmentId = $(this).attr("data-lessonassignmentid"); 
		lessonApply(lessonAssignmentId,$(this));
	});
}

</script>
<script>
function getSchedule(obj){
	if(oriStartDate==null || oriEndDate==null){
		return;
	}
// 	if(!(oriStartDate==null && oriEndDate==null)){
// 		if(oriStartDate>oriEndDate){
// 			alert("종료일은 시작일 이후여야 합니다");
// 			obj.val("");
// 			return;
// 		}
// 	}
	console.log("나 실행한다!");
	 $(".disabledTd").css("background-color","rgb(128, 128, 128, 0.3)");
	   	$(".disabledTd").css("color","black");
	   	$(".clickableTd").css("background-color","white");
	let userId = $("#userId").text();
	
	let sdataSet = {
			"studentId" : userId
		   ,"startDate" : oriStartDate
		   ,"endDate" : oriEndDate
	};
	
	sdataSet = JSON.stringify(sdataSet);
	
	$.ajax({
        type: "post"
       ,url : "/member/lesson/timeListByPeriod.do"
       ,contentType: 'application/json'
       ,data : sdataSet
       ,success : function (data){
		   console.log(data);
		   printAppendData(data,$('.timedataSourceToLessonInfo'),$('#dataSource'),$('#timeDatasource-template'));
		   printHtmlData(data,$('#lessonListTable'),$('#lessonList-template'));
		   printlessonTimeInfo();
		   
			$(".lessonLine").each(function(){
				let lessontimetarget = $(this).attr("data-lessontimetarget");
				if(calculateApplyAvaliable(lessontimetarget)>0){
					$(this).children().eq(3).children().eq(0).attr("disabled","disabled");	
				}
			});
			$(".disabledTd").css("color","black");
			$(".disabledTd").css("background-color","rgb(128, 128, 128, 0.3)");
		   	$(".clickableTd").css("background-color","white");
        }
       ,error : function(e){
        }
      
	});
   	$(".disabledTd").css("color","black");
	$(".disabledTd").css("background-color","rgb(128, 128, 128, 0.3)");
   	$(".clickableTd").css("background-color","white");
}
</script>
<script>
function printAppendData(data,delArea,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	delArea.remove();
	target.append(html);
}
function printHtmlData(data,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	target.html(html);
}
</script>
<script>
function printlessonTimeInfo(){
	resetTd();
	
	let lessonTimeInfoArr = [];
	
	$(".timedataSourceToLessonInfo").each(function(){
		let lessonTimeInfo = new Object();
		lessonTimeInfo.lRoomId = $(this).attr("data-lRoomId");
		lessonTimeInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월','mon').replaceAll('화','tue').replaceAll('수','wed').replaceAll('목','thu').replaceAll('금','fri').replaceAll('토','sat').replaceAll('일','sun');
		lessonTimeInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
		lessonTimeInfo.lessonAssignmentid = $(this).attr("data-lessonAssignmentid");
		lessonTimeInfo.mngName = $(this).attr("data-mngName");
		lessonTimeInfoArr.push(lessonTimeInfo);
	});
	
	let integratedTimeStr = "";
	for(var i = 0; i < lessonTimeInfoArr.length; i++){
		integratedTimeStr += lessonTimeInfoArr[i].lessonTimeTarget+",";
	}
	integratedTimeStr += ",";
	console.log("integratedTimeStr="+integratedTimeStr);
	
	$(".notReadyTd").each(function(){
		let tdId = $(this).attr("id");
		if(integratedTimeStr.indexOf(tdId+",")>=0){
			$(this).attr("class","disabledTd");
			var cnt = 0;
			for(var i = 0; i < lessonTimeInfoArr.length ; i++){
				if (cnt == 0){
					if (lessonTimeInfoArr[i].lessonTimeTarget.indexOf(tdId)>=0){
						$(this).attr("data-lessonAssignmentId",lessonTimeInfoArr[i].lessonAssignmentid);
						$(this).html(lessonTimeInfoArr[i].subjectTypeName);
						cnt++;
					}
				} else {
					if (lessonTimeInfoArr[i].lessonTimeTarget.indexOf(tdId)>=0){
						$(this).attr("data-lessonAssignmentId",$(this).attr("data-lessonAssignmentId")+","+lessonTimeInfoArr[i].lessonAssignmentid)
						cnt++;
					}
				}
			}
		} else {
			$(this).attr("class","clickableTd")
		}
	 });
}
function resetTd(){
	$(".disabledTd").each(function(){
		$(this).attr("class","notReadyTd");
		$(this).attr("data-lessonAssignmentId","");
		$(this).text("");
	});
	$(".clickableTd").each(function(){
		$(this).attr("class","notReadyTd");
		$(this).attr("data-lessonAssignmentId","");
		$(this).text("");
	});
	$(".selectedTd").each(function(){
		$(this).attr("class","notReadyTd");
		$(this).attr("data-lessonAssignmentId","");
		$(this).text("");
	});
}
function renderLessonTime(lessonTimeTarget){
	let lessonTimeTargetEng = lessonTimeTarget.replaceAll('월','mon').replaceAll('화','tue').replaceAll('수','wed').replaceAll('목','thu').replaceAll('금','fri').replaceAll('토','sat').replaceAll('일','sun');
	lessonTimeTargetEng += ",";
	console.log(lessonTimeTargetEng);
	$(".disabledTd").css("background-color","rgb(128, 128, 128, 0.3)");
	$(".disabledTd").css("color","black");
	$(".clickableTd").css("background-color","white");
	$(".disabledTd").each(function(){
		let tdId = $(this).attr("id");
		if(lessonTimeTargetEng.indexOf(tdId+",")>=0){
			$(this).css("background-color","#FF515D");
			$(this).css("color","white");
		}
	});
	$(".clickableTd").each(function(){
		let tdId = $(this).attr("id");
		if(lessonTimeTargetEng.indexOf(tdId+",")>=0){
			$(this).css("background-color","#55acf0");
		}
	});
}
let overlapCnt = 0;
function calculateApplyAvaliable(lessonTimeTarget){
	overlapCnt = 0;
	let lessonTimeTargetEng = lessonTimeTarget.replaceAll('월','mon').replaceAll('화','tue').replaceAll('수','wed').replaceAll('목','thu').replaceAll('금','fri').replaceAll('토','sat').replaceAll('일','sun');
	$(".disabledTd").each(function(){
		let tdId = $(this).attr("id");
		if(lessonTimeTargetEng.indexOf(tdId)>=0){
			overlapCnt++;
		}
	});
	return overlapCnt;
}
function lessonApply(lessonAssignmentId,obj){
	let userId = $("#userId").text();
	
	let sdataSet = {
			"studentId" : userId
		   ,"lessonAssignmentId" : lessonAssignmentId
	};
	
	sdataSet = JSON.stringify(sdataSet);
	
	$.ajax({
        type: "post"
       ,url : "/member/lesson/lessonApply.do"
       ,contentType: 'application/json'
       ,data : sdataSet
       ,success : function (data){
    	   let startDateToReload = $("#startDate").val();
    	   let endDateToReload = $("#endDate").val();
    	   location.href = "/member/lesson/apply.do?startDate="+startDateToReload+"&endDate="+endDateToReload;
// 		   if(data.result>0){
// 			   let timeInfo = obj.parent().parent().attr("data-lessontimeTarget").replaceAll('월','mon').replaceAll('화','tue').replaceAll('수','wed').replaceAll('목','thu').replaceAll('금','fri').replaceAll('토','sat').replaceAll('일','sun');
// 			   let subjectName = obj.parent().parent().children().eq(0).text();
// 			   $(".clickableTd").each(function(){
// 				   if(timeInfo.indexOf($(this).attr("id"))>-1){
// 					   $(this).text(subjectName);
// 					   $(this).attr("class","dsiabledTd");
// 					   $(this).css("background-color","rgb(128, 128, 128, 0.3)");
// 				   }
// 			   });
// 		   } else {
// 			   alert("실패");
// 		   }
        }
       ,error : function(e){
        }
	});
}
</script>
<script type="text/x-handlebars-template"  id="timeDatasource-template" >
{{#each scheduleList}}
	<div class="timedataSourceToLessonInfo" data-lRoomId="{{lRoomId}}" data-lessonTimeTarget="{{lessonTimeTarget }}" data-subjectTypeName="{{lessonSubjectTypeName }}"
		 data-lessonAssignmentId="{{lessonAssignmentId }}" data-lessonSubjectType="{{lessonSubjectType}} " data-mngName="{{mngName}}"
		data-lessonName="{{lessonName}}" data-lessonStartDate="{{lessonStartDate}}" data-lessonEndDate="{{lessonEndDate}}">
	</div>
{{/each}}
</script>
<script type="text/x-handlebars-template"  id="lessonList-template" >
	<tr>
		<th style="width:15%;">과목</th>
		<th style="width:50%;">강의명</th>
		<th style="width:15%;">상세</th>
		<th style="width:20%;">수강신청</th>
	</tr>
{{#each notIncludeLessonList}}
	<tr class="lessonLine" data-lessonTimeTarget={{lessonTimeTarget}}>
		<td>{{lessonSubjectTypeName}}</td>
		<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{lessonName}}</td>
		<td><button data-lessonassignmentid="{{lessonAssignmentId}}" class="btn btn-sm btn-light viewLessonDetail">상세</button>
		</td>
		<td><button data-lessonassignmentid="{{lessonAssignmentId}}" class="btn btn-sm btn-light lessonApplyBtn">수강신청</button>
		</td>
	</tr>
{{/each}}
</script>