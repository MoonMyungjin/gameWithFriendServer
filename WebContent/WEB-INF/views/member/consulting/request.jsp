<!DOCTYPE html>
<html lang="kr">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="academyScheList" value="${dataMap.academyScheList }" />
<c:set var="academySubScheList" value="${dataMap.academySubScheList }" />
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<head>
<meta charset='UTF-8' />
<link
	href='<%=request.getContextPath()%>/resources/js/fullcalendar/main.css'
	rel='stylesheet' />
<script
	src='<%=request.getContextPath()%>/resources/js/fullcalendar/main.js'></script>
<script src="/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="/resources/bootstrap/plugins/jquery-ui/jquery-ui.min.js"></script>

<script src="/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>

<script src="/resources/bootstrap/plugins/moment/moment.min.js"></script>
<!-- <script src="/resources/bootstrap/plugins/fullcalendar/main.js"></script> -->

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>


.fc-daygrid-day-number{
	color : black;
}
.fc-daygrid-body-unbalanced{
	overflow: none;
}
.fc-prev-button fc-button fc-button-primary{
	background-color: skyblue;
}
fc-daygrid-day-frame fc-scrollgrid-sync-inner{
	height: 40px;
}
#calendar{
 height: 540px;
}
</style>


<script>

let CalendarListFor =[
	
	
];

<c:forEach items="${academySubScheList }" var="academySubScheList" varStatus="i">
		let CheckTimeif${i.index} = '${academySubScheList.acaScheStTime }';
		let ObjectSche${i.index};
	if( CheckTimeif${i.index} !== 'Y'){
		
		let tempStartDate${i.index} ='${academySubScheList.start }';
		console.log(tempStartDate${i.index});
		let tempStartTime${i.index} = '${academySubScheList.acaScheStTime }';
		console.log(tempStartTime${i.index});
		let totalDate${i.index} = tempStartDate${i.index}+"T"+tempStartTime${i.index};
		console.log(totalDate${i.index});
		ObjectSche${i.index} = {
			title :	'${academySubScheList.title }',
			start : totalDate${i.index},
			backgroundColor : '${academySubScheList.acaScheFntCol }',
			end : '${academySubScheList.end }',
			schid : '${academySubScheList.acaScheId }',
			sttime : '${academySubScheList.acaScheStTime }',
			fintime : '${academySubScheList.acaScheFinTime }',
			content : '${academySubScheList.acaScheContent }'
		};
	}else{
		ObjectSche${i.index} = {
				title :	'${academySubScheList.title }',
				start : '${academySubScheList.start }',
				backgroundColor : '${academySubScheList.acaScheFntCol }',
				end : '${academySubScheList.end }',
				schid : '${academySubScheList.acaScheId }',
				sttime : '${academySubScheList.acaScheStTime }',
				fintime : '${academySubScheList.acaScheFinTime }',
				content : '${academySubScheList.acaScheContent }'
			};
	}
	
	CalendarListFor.push(ObjectSche${i.index});
	
</c:forEach>
console.log(CalendarListFor);		
var calendar;
var newcalendar2;
let innerTitle;
let innerStart;
let innerId;
let innerResizeId;
let innerResizedEnd;

document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    headerToolbar: {
	      left: 'prev',
	      center: 'title',
	      right: 'today,next'
	    },
	    selectable: true,
	    height : '50%',
	    contentHeight : "auto",
		stickyFooterScrollbar : false,
	    dateClick: function(info) {
	      checkSchedules(info);
	      
	    },
	  });

	  calendar.render();
	});

  
window.onload=function(){
	$("#registBtn").click(function(){
		let division = $("#divisionList option:selected").attr("id");
		$('#cnsltType').val(division);
		let teacher = $("#teacherList option:selected").attr("id");
		$('#mngId').val(teacher);
		
//	 	console.log();
//	 	console.log();
//	 	console.log();
//	 	console.log();
//	 	console.log();
		
//	 	console.log();
//	 	console.log();
//	 	console.log();
//	 	console.log();
//	 	console.log();
		
//	 	console.log();
//	 	console.log();
//	 	console.log();
//	 	console.log();
//	 	console.log();
		
//	 	console.log();
//	 	console.log();
//	 	console.log();
//	 	console.log();
//	 	console.log();
//	 	console.log();
//	 	console.log();
//	 	console.log();
		
		let delimiter2 = $("#applyer").attr("data-category");
		if(delimiter2 == 's'){
			let userId = $("#applyer").attr("data-id");
			$('#cnsltApplyer').val(userId);
			console.log(userId);
		}
		if(delimiter2 == 'p'){
			let userId = $("#applyer").attr("data-id");
			$('#cnsltApplyer').val(userId);
			console.log(userId);
		}
		console.log(delimiter2);
		
		
		let delimiter = $("#studentList").attr("data-category");
		if(delimiter == 's'){
			let student = $("#studentList").attr("data-id");
			$('#cnsltTarget').val(student);
		}
		if(delimiter == 'p'){
			let student = $("#studentList option:selected").attr("id");
			$('#cnsltTarget').val(student);
		}
		
		
		
		
       
		
		
		
		
		
		
		
		
	/* 	
	 	let studentUserId = $('#loginUser.parentName').attr("id");
	 	$('#studentId').val(studentUserId);
		let parentUserId = $('#loginUser.name').attr("id");
	 	$('#parentId').val(parentUserId);
	 	
	 	let cnsltSchDate = $('#cnsltSchDate').attr("id");
	 	$('#cnsltSchDate').val(cnsltSchDate);
	 	let cnsltSchTime = $('#cnsltSchTime').attr("id");
	 	$('#cnsltSchTime').val(cnsltSchTime);
	 	
	 	let cnsltApplyContent = $('#cnsltApplyContent').attr("id");
	 	$('#cnsltApplyContent').val(cnsltApplyContent);
	 	 */
	  	 $("form[role='form']").submit()  
	});
	
	$(".time").on("click",function(){
		$("#cnsltSchTime").val($(this).parent().text().substr(0,5));
	});
	
}

	function enterkey() {
	   if (window.event.keyCode == 13) {
	       // 엔터키가 눌렸을 때
	       $('#add-new-event').click();
	    }
	}

</script>

<script>
	function isEmpty(str){
		if(typeof str == "undefined" || str == null || str == "")
			return true;
		else
			return false ;
	}
	
	function checkSchedules(info){
		let managerId = $("#teacherList option:selected").attr("id");
		if (isEmpty(managerId)){
			
		    Swal.fire({
		        icon: 'warning',
		        title: '선생님을 선택해주세요!'
		    });
			return;
		}
		
		let dayInfo = ['sun','mon','tue','wed','thu','fri','sat'];
		let day = dayInfo[info.date.getDay()]; //요일
		let date = info.dateStr; // 날짜
		
		$("#cnsltSchDate").val(date);
		
		let dateInfo = {
				"managerId" : managerId,
				"day" : day,
				"date" : date
		};
		dateInfo = JSON.stringify(dateInfo);
		
		$.ajax({
		     type: "post"
		    ,url : "/member/consulting/getSchedule.do"
		    ,contentType: 'application/json'
		    ,data : dateInfo
		    ,success : function (data){
		    	renderDisableBtn(data.managerScheduleList);
		     }
		    ,error : function(e){
		     }
		}); 
	}
	
	function renderDisableBtn(data){
		
		let disableTimeArr = [];
		for(let i=0;i<data.length;i++){
			disableTimeArr.push(data[i].disableTime);
		}
		let disableTimeArrStr = disableTimeArr.toString();
		
		
		$(".time").each(function(){
			$(this).removeAttr("disabled");
			$(this).text("예약 선택");
			$("#cnsltSchTime").val("");
			let thisTime = $(this).parent().text();
			thisTime = thisTime.substr(0,5);
			if(disableTimeArrStr.indexOf(thisTime)>=0){
				$(this).attr("disabled","disabled");
				console.log($(this).text());
				$(this).text("예약 불가");
			}
		});
		
	}
	
	
</script>

</head>
<body>
	<section class="content-header" style="padding: 5px;">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6" style="display: flex;">
					<h1 data-userId="${loginUser.id }" style="padding: 0px; margin: 0px;">상담신청</h1>
					<!--                즐겨찾기에 존재 -->
					<c:if test="${fn:indexOf(favoriteMenuListStr, '상담신청') != -1}">
						<i id="star" class="fa-solid fa-star on fa-2x"></i>
					</c:if>

					<!--                즐겨찾기에 존재하지 않음 -->
					<c:if test="${fn:indexOf(favoriteMenuListStr, '상담신청') == -1}">
						<i id="star" class="fa-regular fa-star off fa-2x"></i>
					</c:if>

				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"></li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<div class="card card-light card-outline">
						<div class="card-header" style="height: 40px; padding: 5px; padding-left: 10px;">
							<div class="row">
								<div class="col-sm-5" style="height: 6vh;">
									<h1 class="card-title"
										style="font-size: 16px; margin-top: 4px;">
										<i class="fas fa-check"></i> &nbsp;&nbsp; 상담 신청
									</h1>
								</div>
							</div>
						</div>
						<div class="card-body" style="padding-top: 5px; height: 720px;">
							<form role="form" method="post"
								action="/member/consulting/regist.do" name="registForm">
								<div class="row">
									<div class="col-md-6">
										<table style="margin :0px; margin-top:40px; padding:0px; border-color: white; height: 130px;">
											<tbody>
												<tr style="border-color: white;">
													<td class=""
														style="text-align: left; width: 230px; padding: 5px;"><label
														class="">상담 구분</label><label style="color: red;">&nbsp;&nbsp;*</label>
														<select id="divisionList" class="form-control">
															<option value="">선택하세요</option>
															<c:forEach items="${divisionList}" var="division">
																<option id="${division.scodeKey}">${division.scodeValue}</option>
															</c:forEach>

													</select></td>
													<td class="" style="text-align: left; width: 230px;">
														<label for="c" class="">상담 선생님</label><label
														style="color: red;">&nbsp;&nbsp;*</label> <select
														id="teacherList" class="form-control">
															<option>선택하세요</option>
															<c:forEach items="${teacherList}" var="teacher">
																<option id="${teacher.mngId}">${teacher.mngName}</option>
															</c:forEach>
													</select>
													</td>

												</tr>
												<tr>
													<td colspan="2"><hr></td>
												</tr>

												<tr>
													<c:if test="${category eq 'p' }">
														<td class="" style="text-align: left;"><label for=""
															class="">신청자</label> <input data-category="${category }"
															type="text" name="" id="applyer"
															value="${loginUser.parentName}" data-id="${loginUser.id}"
															class="form-control" size="8" maxlength="8"
															placeholder="이름" readonly="readonly"></td>
													</c:if>

													<c:if test="${category eq 's' }">
														<td class="" style="text-align: left;"><label for=""
															class="">신청자</label> <input data-category="${category }"
															type="text" name="" id="applyer"
															value="${loginUser.name}"
															data-id="${loginUser.id}" class="form-control" size="8"
															maxlength="8" placeholder="이름" readonly="readonly"></td>
													</c:if>




													<c:if test="${category eq 'p' }">
														<td class="" style="text-align: left;"><label for=""
															class="">상담대상자</label><label style="color: red;">&nbsp;&nbsp;*</label>
															<select data-category="${category }" name=""
															id="studentList" class="form-control">
																<c:forEach items="${studentList}" var="student">
																	<option id="${student.studentId}">${student.studentName}</option>
																</c:forEach>
														</select></td>
													</c:if>

													<c:if test="${category eq 's' }">
														<td class="" style="text-align: left;"><label for=""
															class="">상담대상자</label><label style="color: red;">&nbsp;&nbsp;*</label>
															<input data-category="${category }" id="studentList"
															type="text" name="" value="${loginUser.name}"
															data-id="${loginUser.id}" class="form-control" size="8"
															maxlength="8" placeholder="이름" readonly="readonly">
														</td>
													</c:if>


												</tr>


												<tr>
													<td colspan="2"><hr></td>
												</tr>


												<tr>
													<td class="" style="text-align: left;"><label for=""
														class="">예약일자</label> <input type="text"
														name="cnsltSchDate" readonly value="" id="cnsltSchDate"
														class="form-control" size="8" maxlength="8"
														placeholder="예약일"></td>

													<td class="" style="text-align: left;"><label for=""
														class="">예약시간</label> <input type="text"
														name="cnsltSchTime" readonly value="" id="cnsltSchTime"
														class="form-control" size="8" maxlength="8"
														placeholder="예약시간"></td>
												</tr>


												<tr>
													<td colspan="2"><hr></td>
												</tr>


												<tr>
													<td colspan="2" class="" style="text-align: left;"><label
														for="" class="">내용</label><label style="color: red;">&nbsp;&nbsp;*</label>
														<textarea id="cnsltApplyContent" name="cnsltApplyContent"
															class="form-control" style="width: 100%; height: 200px"
															placeholder="원하시는 상담 내용을 간략하게 적어주세요."></textarea></td>
												</tr>

												<tr>
													<td style="height: 60px;"></td>
													<td></td>
												</tr>
											</tbody>
										</table>
										<div class="row">
											<div class="col-md-4"></div>
											<div class="col-md-4">

												<button id="registBtn" class="fc-prev-button btn btn-light"
													type="button">예약 신청</button>
												<button class="fc-prev-button btn btn-secondary"
													type="button" onclick="history.go(-1);">취소</button>
											</div>

											<div class="col-md-4"></div>

										</div>
									</div>

									<div class="col-md-6">
										<div class="card card-primary">
											<div class="card-body p-0">
												<div id='calendar'></div>
											</div>
											<div>

												<table 
													style="height: 160px; padding: 0px; border: 10px solid white;">
													<tr>
														<td style="border: 1px solid lightgray; width: 230px; padding: 0px;">10:00&nbsp;&nbsp;&nbsp;&nbsp;
															<button type="button"
																class="fc-prev-button btn btn-light time">예약 선택</button>
														</td>
														<td style="border: 1px solid lightgray; width: 230px; padding: 0px;">11:00&nbsp;&nbsp;&nbsp;&nbsp;
															<button type="button"
																class="fc-prev-button btn btn-light time">예약 선택</button>
														</td>
													</tr>

													<tr>
														<td style="border: 1px solid lightgray; width: 230px; padding: 0px;">14:00&nbsp;&nbsp;&nbsp;&nbsp;
															<button type="button"
																class="fc-prev-button btn btn-light time">예약 선택</button>
														</td>
														<td style="border: 1px solid lightgray; width: 230px; padding: 0px;">15:00&nbsp;&nbsp;&nbsp;&nbsp;
															<button type="button"
																class="fc-prev-button btn btn-light time">예약 선택</button>
														</td>
													</tr>

													<tr>
														<td style="border: 1px solid lightgray; width: 230px; padding: 0px;">16:00&nbsp;&nbsp;&nbsp;&nbsp;
															<button type="button"
																class="fc-prev-button btn btn-light time">예약 선택</button>
														</td>
														<td style="border: 1px solid lightgray; width: 230px; padding: 0px;">17:00&nbsp;&nbsp;&nbsp;&nbsp;
															<button type="button"
																class="fc-prev-button btn btn-light time">예약 선택</button>
														</td>
													</tr>

													<tr>
														<td style="border: 1px solid lightgray; width: 230px; padding: 0px;">19:00&nbsp;&nbsp;&nbsp;&nbsp;
															<button type="button"
																class="fc-prev-button btn btn-light time">예약 선택</button>
														</td>
														<td style="border: 1px solid lightgray; width: 230px; padding: 0px;">20:00&nbsp;&nbsp;&nbsp;&nbsp;
															<button type="button"
																class="fc-prev-button btn btn-light time">예약 선택</button>
														</td>
													</tr>

												</table>

											</div>
										</div>
									</div>
								</div>
								<input type="hidden" name="cnsltType" id="cnsltType"> 
								<input type="hidden" name="mngId" id="mngId"> 
								<input type="hidden" name="cnsltTarget" id="cnsltTarget" value="${loginUser.id}">
								<input type="hidden" name="cnsltApplyer" id="cnsltApplyer">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div id="userId" style="display: none;">${loginUser.id }</div>

	<c:if test="${category eq 'p' }">
		<div id="parentName" style="display: none;">
			${loginUser.parentName }</div>
	</c:if>
	<c:if test="${category eq 's' }">
		<div id="studentName" style="display: none;">${loginUser.name }
		</div>
	</c:if>

</body>













</html>
