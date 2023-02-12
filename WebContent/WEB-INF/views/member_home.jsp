<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="selectStudentGetMain" value="${dataMap.selectStudentGetMain }" />
<c:set var="selectForMain" value="${dataMap.selectForMain }" />
<c:set var="examList" value="${examByStudentList }"/>
<c:set var="from" value="${from }"/>
<style>
table {
	border: 2px solid #d2d2d2;
	border-collapse: collapse;
	font-size: 0.7em;
	
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
	width: 65px;
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
</style>
 <!-- stylesheet -->     
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/> 
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<section class="content">
	<div class="container-fluid">
		<div class="row">

			<div class="col-md-6">
				<!-- 강의 시간표 -->
				<div class="card card-light card-outline">
					<div class="card-header">
						출결 상황및 프로필
					</div>
					<div class="card-body" >
			      		<div class="row" style="padding:0px; margin:0px; ">
				      <div class="col-sm-6" style="padding:0px;  border: 1px solid white/* rgb(32, 73, 105) */; border-radius:15px; height:280px;">
				      	<div class="col-sm-12" style="border: 1px solid white; height: 20vh;  text-align: center;" >
				      		<div id="profile" style="border-radius: 100%;  height: 24vh; width: 24vh; margin-top: 4vh; margin-left: 1vh;" ></div>
				      	</div>
				      	
				      </div>
				      <div class="col-sm-6" style="padding:5px; margin:0px; border: 1px solid white; border-radius:15px; height:280px;">
				      	<div class="row">
				      		<div class="col-sm-12" style="border: 1px solid white; height: 12vh;">		      		
						      	<div class="col-sm-12" >
							      	
							      	<span style="margin-left: 1vh;"></span>	      		
						      	</div>
						      	<div class="col-sm-12">
						      		학교: ${selectStudentGetMain.schoolName}
						      		<span style="margin-left: 1vh;"></span>			      		
						      	</div>
						      	<div class="col-sm-12">
						      		 ${selectStudentGetMain.grade}학년&nbsp;&nbsp;${selectStudentGetMain.name}
						      		<span style="margin-left: 1vh;"></span>			      		
						      	</div>
						      	<div class="col-sm-12">
						      		 형제 자매: ${selectStudentGetMain.sibling}
						      		<span style="margin-left: 1vh;"></span>			      		
						      	</div>
						      	<div class="col-sm-12">
						      		수강 반: ${selectStudentGetMain.className}
						      		<span style="margin-left: 1vh;"></span>
						      	</div>
						      	<div class="col-sm-12" style="cursor: pointer;" onclick="OpenWindow('/common/managerDetail.do?id='+'${selectStudentGetMain.mngId}','회원상세보기',600,400);">
						      		담임선생님: <strong>${selectStudentGetMain.mngName}</strong>
						      		<span style="margin-left: 1vh;"></span>
						      	</div>
				      		</div>
				      		<div class="col-sm-12" style="height: 12vh; margin-top: 6vh;">
					      		<div class="col-sm-12" >
							      
							      	<span style="margin-left: 1vh;"></span>	      		
					      		</div>
					      		
						      	<div class="col-sm-12" id="myDiv">
						      		
						      		<span  style="margin-left: 1vh;"></span>			      		
						      	</div>
						      	<div class="col-sm-12">
						      		등원 시간: 
						      		<span style="margin-left: 1vh;">${selectForMain.atnGoTime}</span>
						      	</div>
						      	<div class="col-sm-12">
						      		하원 시간:
						      		<span style="margin-left: 1vh;"> ${selectForMain.atnOutTime}</span>
						      	</div>
						      	<div class="col-sm-12" >
						      		등원 상태:
						      		<span style="margin-left: 1vh;" id="mainAttState"></span>
						      	</div>
						      	<div class="col-sm-12" style="display: none;" id="mainAttStateGo">${selectForMain.atnYnManager}</div>
						      	<div class="col-sm-12" style="display: none;" id="mainAttStateOut">${selectForMain.atnStartDeadlineYn}</div>
						      	
					      	</div>
				      		
				      	</div>
				      </div>
				      </div>
			      	</div>
				</div>
			</div>
			<div class="col-sm-6" style="height: 380px">
				<div class="card card-light card-outline">
					<div class="card-header">
						나의 학교 성적<a href="/member/score/gradeCheck.do" style="float: right" ><i class="fas fa-solid fa-plus" style="margin-left: 10px;"></i></a>
						
<!-- 								<select class="form-control float-right"  id="selectExamMember" style="width:100px; padding: 0; font-size: .8rem; line-height: 1; height: 19px;"> -->
<!--  												<option>시험선택</option> -->
<%--  												<c:if test="${not empty examList}"> --%>
<%-- 													<c:forEach items="${examList}" var="exam" varStatus="loop">  --%>
<%-- 														<option value="${exam.examDate },${exam.examGroup },${exam.examGrade },${exam.examSemester },${exam.examQuarter },${exam.studentId }">${exam.examGrade } &nbsp;&nbsp;${exam.examSemester } &nbsp;&nbsp;${exam.examQuarter }</option> --%>
												
<%-- 													</c:forEach> --%>
<%-- 												</c:if>  --%>
<!--  								</select> -->
<!--  								<select id="subjectSelect" name="subject" class="form-control float-right" style="display:none; padding: 0; font-size: .8rem; line-height: 1; height: 19px; width:100px;"> -->
<!-- 											<option value="" selected>과목 선택</option> -->
<!-- 											<option value="국어">국어</option> -->
<!-- 											<option value="수학">수학</option> -->
<!-- 											<option value="사회">사회</option> -->
<!-- 											<option value="과학">과학</option> -->
<!-- 											<option value="영어">영어</option> -->
<!-- 								</select>  -->
								<input id="studentId" value="${loginUser.id }" style="display: none;">
					</div>
						<div class="card-body">
 							<canvas id="chart1" width="400" height="250"></canvas>
						</div>
				</div>
			</div>
	
		</div>

		<div class="row">
			<div class="col-sm-6" style="height: 350px">
				<div class="card card-light card-outline">
					<div class="card-header" ><span id="myTimeTableTitle">나의 시간표</span><a href="/member/lesson/myLessonList.do" style="float: right"><i class="fas fa-solid fa-plus"></i></a> </div>
						<div class="card-body">
 							<div id="mon">
								<c:forEach items="${byDayMap.mondayList}" var="mondayList">
									<div class="monTimedataSource" data-lRoomId="${mondayList.lRoomId }" data-lessonTimeTarget="${mondayList.lessonTimeTarget }" data-subjectTypeName="${mondayList.lessonSubjectTypeName }"
										data-lessonId="${mondayList.lessonAssignmentId }" data-lessonSubjectType="${mondayList.lessonSubjectType} " data-mngName="${mondayList.mngName}"
									></div>
								</c:forEach>
							</div>
								<div class="tab-content" id="custom-tabs-one-tabContent">
				<div class="tab-pane fade active show" id="custom-tabs-one-home" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab" style="height: 39vh;">
					<table id="example1" class="table table-bordered" style="text-align : center; height: 20vh;">
						<thead>
							<tr>
								<th class="backgroundTd" style="">
									</th>
								<th class="backgroundTd" style="padding:0px;">월</th>
								<th class="backgroundTd" style="padding:0px;">화</th>
								<th class="backgroundTd" style="padding:0px;">수</th>
								<th class="backgroundTd" style="padding:0px;">목</th>
								<th class="backgroundTd" style="padding:0px;">금</th>
								<th class="backgroundTd" style="padding:0px;">토</th>
								<th class="backgroundTd" style="padding:0px;">일</th>
							</tr>
						</thead>
						<tbody style="height: 20vh;">
							<c:forEach items="${ttMap.weekDayList}" var="wdList">
								<tr>
									<td class="backgroundTd" style="padding:0px; width: 6%; height: 20px;" >
										${wdList.timetablePeriod}
									</td>
									<td style="font-size: 6px; padding:0px; width: 11%;  height: 20px;"id="mon${wdList.timetablePeriod }" class="targetTd"></td>
									<td style="font-size: 6px; padding:0px; width: 11%; height: 20px;"id="tue${wdList.timetablePeriod }" class="targetTd"></td>
									<td style="font-size: 6px; padding:0px; width: 11%; height: 20px;"id="wed${wdList.timetablePeriod }" class="targetTd"></td>
									<td style="font-size: 6px; padding:0px; width: 11%; height: 20px;"id="thu${wdList.timetablePeriod }" class="targetTd"></td>
									<td style="font-size: 6px; padding:0px; width: 11%; height: 20px;"id="fri${wdList.timetablePeriod }" class="targetTd"></td>
									<td style="font-size: 6px; padding:0px; width: 11%; height: 20px;"id="sat${wdList.timetablePeriod }" class="targetTd"></td>
									<td style=" font-size: 6px; padding:0px; width: 11%; height: 20px;"id="sun${wdList.timetablePeriod }" class="targetTd"></td>
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
			<div class="col-md-6">
				<!-- 학교 공지사항 -->
				<div class="card card-light card-outline">
					<div class="card-header">
						<h3 class="card-title">학교 공지사항</h3>
						<a href="/manager/board/notice.do" style="float: right"><i class="fas fa-solid fa-plus"></i></a>
					</div>
						<div class="card-body" style="height: 43vh; margin-bottom: 0px;">
						<ul class="list-group" style="max-height: 45vh; overflow:auto;">
					      <c:forEach items="${dataMap.schoolNoticeList}" var="schoolNoticeList" end="3">
					        <li class="list-group-item">
								<div class="board_item ellipsis">
									${fn:replace(schoolNoticeList.noticeTitle,'제목','')}</div>
								<span class="date"><fmt:formatDate value="${schoolNoticeList.noticeRegdate }" pattern="yyyy-MM-dd" /></span>
					        </li>
					        </c:forEach>
        				</ul>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>


<!-- 차트 관련 javascript -->     
<script src="https://d3js.org/d3.v3.min.js"></script>     
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>

<script>

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
    },  scales: {
        y: {
            beginAtZero: true,
            suggestedMin: 0,
            suggestedMax: 100
        }
    }


});

</script>
<script>

window.onload=function(){
	
	
	let from = '${from}'
	console.log(from)
	if(from =="from"){
		OpenWindow('/member/attandance/inmodify.do','등원',700,400);
	}
	
	let id = '${loginUser.id}';
	//alert('get picture 실행 테스트');
	 $('div#profile').css({'background-image':'url('+"/manager/membermanagement/getPicture.do?id="+id+')',
	     'background-position':'center',
	     'background-size':'cover',
	     'background-repeat':'no-repeat'
	     });
	 
	 
	let mainGoState = $('#mainAttStateGo').text()
	let mainOutState = $('#mainAttStateOut').text()
	console.log(mainGoState)
	console.log(mainOutState)
	
	
	if(mainGoState == 'N'){
		$('#mainAttState').text('미등원')
	}else if(mainGoState == 'Y'){
		$('#mainAttState').text('등원')
	}else if(mainOutState = 'YY'){
		$('#mainAttState').text('하원')
	}
	
	
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
//			timeRequestForm.submit();
	});
	
	
	let tiemWeekMain =  '${dayInfo.week }';
	console.log(tiemWeekMain)
	
	moment(tiemWeekMain).day(1);
	moment(tiemWeekMain).day(7);
	let monday = moment(tiemWeekMain).day(1).format("YYYY-MM-DD (ddd)");
	let sunday = moment(tiemWeekMain).day(7).format("YYYY-MM-DD (ddd)");
	let titleStr = $('#myTimeTableTitle').text();
	console.log(monday)
	console.log(sunday)
	console.log(titleStr)
	let blackSide = "     ";
	let renewStr = titleStr+blackSide+" "+monday+"  ~  "+sunday
	$('#myTimeTableTitle').text(renewStr);

	let examDate;
	let examGroup;
	let examGrade;
	let examSemester;
	let examQuarter;
	let studentId;
	

	$("#selectExamMember").on("change",function(){
	    let ChangedTemp = $("#selectExamMember option:selected").val();
	   	let arrChangedTemp = ChangedTemp.split(",");
	   	console.log(arrChangedTemp)
	   	examDate = arrChangedTemp[0];
	   	studentId = arrChangedTemp[5];
	 
	   	
	   	$("#selectExamMember").attr('style','display:none;');
	   	$("#subjectSelect").attr('style','display:block; padding: 0; font-size: .8rem; line-height: 1; height: 19px; width:100px;');
	   	
	   	
	   	
	  
	 });
		let prevYear = moment().format("YYYY");
	

// 	  	let year = examDate.substr(0, 4);
	   studentId = $("#studentId").val();
	 	console.log(studentId);
	 	
	 // 차트1 
		$.ajax({
	        type: "post"
	       ,url : "/manager/score/selectChart1.do"
	       ,contentType: 'application/json'
	       ,data :  JSON.stringify({
	    	   
		   		"studentId" : studentId,
		   		"year" : prevYear
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


<!-- 차트 스크립트  -->
<script>
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




var chart = c3.generate({
	  bindto: "#combochart",
	  data: {
	    x: "학교 시험",
	    columns: [
	      ["학교 시험", "1학기 중간", "1학기 기말", "2학기 중간", "2학기 기말"],
	      ["국어", 99, 85, 80, 90],
	      ["영어", 80, 70, 75, 90],
	      ["수학", 70, 75, 60, 80],
	      ["사회", 90, 85, 85, 80],
	      ["과학", 90, 85, 85, 80],
	      ["평균", 86, 80, 77, 84],
	    ],
	    types: {
	   		국어: "line",
	      	영어: "line",
	      	수학: "line",
	      	사회: "line",
	      	과학: "line",
	      	평균: "bar",
	    },
	    colors: {
	      평균: "rgb(180, 180, 180)",
	      국어: "rgb(179, 0, 35)",
	      영어: "#2E64FE",
	      수학: "#58FA82",
	      사회: "#F3F781",
	      과학: "#D358F7"
	    },
	  },
	  bar: {
	    width: {
	      ratio: 0.2,
	    },
	  },
	  axis: {
	    x: {
	      type: "category",
	    },
	  },
	});








setInterval(function(){
    var today = new Date()  // 날짜 객체 생성
        // ok
    // HTML의 특정 위치를 지정!
    var my_div = document.getElementById("myDiv")
    my_div.innerText = today.toLocaleString()
}, 1000)  




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
		mondayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',mondayInfo.lRoomId+'/mon').replaceAll('화',mondayInfo.lRoomId+'/tue').replaceAll('수',mondayInfo.lRoomId+'/wed').replaceAll('목',mondayInfo.lRoomId+'/thu').replaceAll('금',mondayInfo.lRoomId+'/fri').replaceAll('토',mondayInfo.lRoomId+'/sat');
		mondayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
		mondayInfo.lessonId = $(this).attr("data-lessonId");
		mondayInfo.mngName = $(this).attr("data-mngName");
		mondayInfoArr.push(mondayInfo);
	});
	
	$(".tueTimedataSource").each(function(){
		let tuesdayInfo = new Object();
		tuesdayInfo.lRoomId = $(this).attr("data-lRoomId");
		tuesdayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',tuesdayInfo.lRoomId+'/mon').replaceAll('화',tuesdayInfo.lRoomId+'/tue').replaceAll('수',tuesdayInfo.lRoomId+'/wed').replaceAll('목',tuesdayInfo.lRoomId+'/thu').replaceAll('금',tuesdayInfo.lRoomId+'/fri').replaceAll('토',tuesdayInfo.lRoomId+'/sat');
		tuesdayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
		tuesdayInfo.lessonId = $(this).attr("data-lessonId");
		tuesdayInfo.mngName = $(this).attr("data-mngName");
		tuesdayInfoArr.push(tuesdayInfo);
	});
	
	$(".wedTimedataSource").each(function(){
		let wednesdayInfo = new Object();
		wednesdayInfo.lRoomId = $(this).attr("data-lRoomId");
		wednesdayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',wednesdayInfo.lRoomId+'/mon').replaceAll('화',wednesdayInfo.lRoomId+'/tue').replaceAll('수',wednesdayInfo.lRoomId+'/wed').replaceAll('목',wednesdayInfo.lRoomId+'/thu').replaceAll('금',wednesdayInfo.lRoomId+'/fri').replaceAll('토',wednesdayInfo.lRoomId+'/sat');
		wednesdayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
		wednesdayInfo.lessonId = $(this).attr("data-lessonId");
		wednesdayInfo.mngName = $(this).attr("data-mngName");
		wednesdayInfoArr.push(wednesdayInfo);
	});
	
	$(".thuTimedataSource").each(function(){
		let thursdayInfo = new Object();
		thursdayInfo.lRoomId = $(this).attr("data-lRoomId");
		thursdayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',thursdayInfo.lRoomId+'/mon').replaceAll('화',thursdayInfo.lRoomId+'/tue').replaceAll('수',thursdayInfo.lRoomId+'/wed').replaceAll('목',thursdayInfo.lRoomId+'/thu').replaceAll('금',thursdayInfo.lRoomId+'/fri').replaceAll('토',thursdayInfo.lRoomId+'/sat');
		thursdayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
		thursdayInfo.lessonId = $(this).attr("data-lessonId");
		thursdayInfo.mngName = $(this).attr("data-mngName");
		thursdayInfoArr.push(thursdayInfo);
	});
	
	$(".friTimedataSource").each(function(){
		let fridayInfo = new Object();
		fridayInfo.lRoomId = $(this).attr("data-lRoomId");
		fridayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',fridayInfo.lRoomId+'/mon').replaceAll('화',fridayInfo.lRoomId+'/tue').replaceAll('수',fridayInfo.lRoomId+'/wed').replaceAll('목',fridayInfo.lRoomId+'/thu').replaceAll('금',fridayInfo.lRoomId+'/fri').replaceAll('토',fridayInfo.lRoomId+'/sat');
		fridayInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
		fridayInfo.lessonId = $(this).attr("data-lessonId");
		fridayInfo.mngName = $(this).attr("data-mngName");
		fridayInfoArr.push(fridayInfo);
	});
	
	$(".satTimedataSource").each(function(){
		let saturdayInfo = new Object();
		saturdayInfo.lRoomId = $(this).attr("data-lRoomId");
		saturdayInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월',saturdayInfo.lRoomId+'/mon').replaceAll('화',saturdayInfo.lRoomId+'/tue').replaceAll('수',saturdayInfo.lRoomId+'/wed').replaceAll('목',saturdayInfo.lRoomId+'/thu').replaceAll('금',saturdayInfo.lRoomId+'/fri').replaceAll('토',saturdayInfo.lRoomId+'/sat');
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
			if(byDayInfo.monday[i].lessonTimeTarget.indexOf(tdId)>=0){
				if(byDayInfo.monday[i].subjectTypeName == '국어'){
					$(this).attr("class","korTime");
					$(this).attr("data-lessonId",byDayInfo.monday[i].lessonId);
					$(this).text(byDayInfo.monday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.monday[i].subjectTypeName == '영어'){
					$(this).attr("class","engTime");	
					$(this).attr("data-lessonId",byDayInfo.monday[i].lessonId);
					$(this).text(byDayInfo.monday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.monday[i].subjectTypeName == '수학'){
					$(this).attr("class","mathTime");	
					$(this).attr("data-lessonId",byDayInfo.monday[i].lessonId);
					$(this).text(byDayInfo.monday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.monday[i].subjectTypeName == '과학'){
					$(this).attr("class","sctyTime");	
					$(this).attr("data-lessonId",byDayInfo.monday[i].lessonId);
					$(this).text(byDayInfo.monday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.monday[i].subjectTypeName == '사회'){
					$(this).attr("class","scncTime");	
					$(this).attr("data-lessonId",byDayInfo.monday[i].lessonId);
					$(this).text(byDayInfo.monday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
			}
		}
		for(var i = 0; i < byDayInfo.tuesday.length ; i++){
			if(byDayInfo.tuesday[i].lessonTimeTarget.indexOf(tdId)>=0){
				if(byDayInfo.tuesday[i].subjectTypeName == '국어'){
					$(this).attr("class","korTime");
					$(this).attr("data-lessonId",byDayInfo.tuesday[i].lessonId);
					$(this).text(byDayInfo.tuesday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.tuesday[i].subjectTypeName == '영어'){
					$(this).attr("class","engTime");	
					$(this).attr("data-lessonId",byDayInfo.tuesday[i].lessonId);
					$(this).text(byDayInfo.tuesday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.tuesday[i].subjectTypeName == '수학'){
					$(this).attr("class","mathTime");	
					$(this).attr("data-lessonId",byDayInfo.tuesday[i].lessonId);
					$(this).text(byDayInfo.tuesday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.tuesday[i].subjectTypeName == '과학'){
					$(this).attr("class","sctyTime");	
					$(this).attr("data-lessonId",byDayInfo.tuesday[i].lessonId);
					$(this).text(byDayInfo.tuesday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.tuesday[i].subjectTypeName == '사회'){
					$(this).attr("class","scncTime");	
					$(this).attr("data-lessonId",byDayInfo.tuesday[i].lessonId);
					$(this).text(byDayInfo.tuesday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
			}
		}
		for(var i = 0; i < byDayInfo.wednesday.length ; i++){
			if(byDayInfo.wednesday[i].lessonTimeTarget.indexOf(tdId)>=0){
				if(byDayInfo.wednesday[i].subjectTypeName == '국어'){
					$(this).attr("class","korTime");
					$(this).attr("data-lessonId",byDayInfo.wednesday[i].lessonId);
					$(this).text(byDayInfo.wednesday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.wednesday[i].subjectTypeName == '영어'){
					$(this).attr("class","engTime");	
					$(this).attr("data-lessonId",byDayInfo.wednesday[i].lessonId);
					$(this).text(byDayInfo.wednesday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.wednesday[i].subjectTypeName == '수학'){
					$(this).attr("class","mathTime");	
					$(this).attr("data-lessonId",byDayInfo.wednesday[i].lessonId);
					$(this).text(byDayInfo.wednesday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.wednesday[i].subjectTypeName == '과학'){
					$(this).attr("class","sctyTime");	
					$(this).attr("data-lessonId",byDayInfo.wednesday[i].lessonId);
					$(this).text(byDayInfo.wednesday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.wednesday[i].subjectTypeName == '사회'){
					$(this).attr("class","scncTime");	
					$(this).attr("data-lessonId",byDayInfo.wednesday[i].lessonId);
					$(this).text(byDayInfo.wednesday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
			}
		}
		for(var i = 0; i < byDayInfo.thursday.length ; i++){
			if(byDayInfo.thursday[i].lessonTimeTarget.indexOf(tdId)>=0){
				if(byDayInfo.thursday[i].subjectTypeName == '국어'){
					$(this).attr("class","korTime");
					$(this).attr("data-lessonId",byDayInfo.thursday[i].lessonId);
					$(this).text(byDayInfo.thursday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.thursday[i].subjectTypeName == '영어'){
					$(this).attr("class","engTime");	
					$(this).attr("data-lessonId",byDayInfo.thursday[i].lessonId);
					$(this).text(byDayInfo.thursday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.thursday[i].subjectTypeName == '수학'){
					$(this).attr("class","mathTime");	
					$(this).attr("data-lessonId",byDayInfo.thursday[i].lessonId);
					$(this).text(byDayInfo.thursday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.thursday[i].subjectTypeName == '과학'){
					$(this).attr("class","sctyTime");	
					$(this).attr("data-lessonId",byDayInfo.thursday[i].lessonId);
					$(this).text(byDayInfo.thursday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.thursday[i].subjectTypeName == '사회'){
					$(this).attr("class","scncTime");	
					$(this).attr("data-lessonId",byDayInfo.thursday[i].lessonId);
					$(this).text(byDayInfo.thursday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
			}
		}
		for(var i = 0; i < byDayInfo.friday.length ; i++){
			if(byDayInfo.friday[i].lessonTimeTarget.indexOf(tdId)>=0){
				if(byDayInfo.friday[i].subjectTypeName == '국어'){
					$(this).attr("class","korTime");
					$(this).attr("data-lessonId",byDayInfo.friday[i].lessonId);
					$(this).text(byDayInfo.friday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.friday[i].subjectTypeName == '영어'){
					$(this).attr("class","engTime");	
					$(this).attr("data-lessonId",byDayInfo.friday[i].lessonId);
					$(this).text(byDayInfo.friday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.friday[i].subjectTypeName == '수학'){
					$(this).attr("class","mathTime");	
					$(this).attr("data-lessonId",byDayInfo.friday[i].lessonId);
					$(this).text(byDayInfo.friday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.friday[i].subjectTypeName == '과학'){
					$(this).attr("class","sctyTime");	
					$(this).attr("data-lessonId",byDayInfo.friday[i].lessonId);
					$(this).text(byDayInfo.friday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.friday[i].subjectTypeName == '사회'){
					$(this).attr("class","scncTime");	
					$(this).attr("data-lessonId",byDayInfo.friday[i].lessonId);
					$(this).text(byDayInfo.friday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
			}
		}
		for(var i = 0; i < byDayInfo.saturday.length ; i++){
			if(byDayInfo.saturday[i].lessonTimeTarget.indexOf(tdId)>=0){
				if(byDayInfo.saturday[i].subjectTypeName == '국어'){
					$(this).attr("class","korTime");
					$(this).attr("data-lessonId",byDayInfo.saturday[i].lessonId);
					$(this).text(byDayInfo.saturday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.saturday[i].subjectTypeName == '영어'){
					$(this).attr("class","engTime");	
					$(this).attr("data-lessonId",byDayInfo.saturday[i].lessonId);
					$(this).text(byDayInfo.saturday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.saturday[i].subjectTypeName == '수학'){
					$(this).attr("class","mathTime");	
					$(this).attr("data-lessonId",byDayInfo.saturday[i].lessonId);
					$(this).text(byDayInfo.saturday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.saturday[i].subjectTypeName == '과학'){
					$(this).attr("class","sctyTime");	
					$(this).attr("data-lessonId",byDayInfo.saturday[i].lessonId);
					$(this).text(byDayInfo.saturday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
				if(byDayInfo.saturday[i].subjectTypeName == '사회'){
					$(this).attr("class","scncTime");	
					$(this).attr("data-lessonId",byDayInfo.saturday[i].lessonId);
					$(this).text(byDayInfo.saturday[i].subjectTypeName);
					/* $(this).append("<br/>"); */
					/* $(this).append(byDayInfo.tuesday[i].mngName); */
				}
				
			}
		}
	});
	$("#one").on("click",function(){
		OpenWindow('/member/attandance/inmodify.do','등원',800,500);
     });
	$("#two").on("click",function(){
		OpenWindow('/member/attandance/outmodify.do','하원',800,500);
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

<script>

</script>
