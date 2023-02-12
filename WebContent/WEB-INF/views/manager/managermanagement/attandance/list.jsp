<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="managerList" value="${dataMap.managerList}" />

<title>출근부 관리</title>

<head>
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<style>
label {
	margin-bottom: 0;
}

div.table1 {
	max-height: 200px;
	overflow-y: scroll;
}

div.table2 {
	max-height: 180px;
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

thead>tr>th:first-of-type {
	padding-left: 12px;
}

thead>tr>td:first-of-type {
	padding-left: 0;
}

th, td {
	text-align: center;
}

#tb1 td, #td1 th {
	padding: 0;
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

table:hover tbody tr:hover td {
   			 background: #395d83;
   			 color: white;
		} 
</style>
</head>

<body>

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6" style="display: flex;">
					<h1 data-userId="${loginUser.id }">출근부관리</h1>
					
					<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '출근부관리') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
				<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '출근부관리') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
					
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="container-fluid">
			<div class="row">

				<!-- 상단부 영역 -->
				<div class="col-sm-12">

					<div class="card card-dark card-outline card-tabs" >
						<div class="card-header p-0 pt-1" >
							<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="custom-tabs-one-home-tab" data-toggle="pill"
									href="#custom-tabs-one-home" role="tab"
									aria-controls="custom-tabs-one-home" aria-selected="true" >직원별 목록</a></li>
								<li class="nav-item"><a class="nav-link"
									id="custom-tabs-one-profile-tab" data-toggle="pill"
									href="#custom-tabs-one-profile" role="tab"
									aria-controls="custom-tabs-one-profile" aria-selected="false">요일별 목록</a>
								</li>
							</ul>
						</div>
						

						<div id="attandanceListPrintArea" class="card-body" style="padding-top: 5px">
							<div class="tab-content" id="custom-tabs-one-tabContent">
			<div class="tab-pane fade active show" id="custom-tabs-one-home"
				role="tabpanel" aria-labelledby="custom-tabs-one-home-tab" >
						<div class="row">
							<div class="form-group col-sm-2">
								<select id="mngName" class="form-control" style="" onchange="reloadMonth();">
										<option value="">직원선택</option>
									<c:forEach items="${managerList}" var="manager">
										<option value="${manager.id }">${manager.mngName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-sm-3">
							<input type="month" class="form-control" id="month" onchange="reloadMonth();">
							</div>
							<div class="form-group col-sm-3">
							</div>
							<div class="col-sm-4" style="text-align: right">
									<button id="attandanceListPrintBtn" type="button" class="btn btn-danger btn-sm">
									PDF
									</button>
									<button type="button" id="allRegistBtn" style="display: inline-block;" class="btn btn-dark btn-sm" onclick="registAll();">전체등록</button>
							</div>
						</div>
				<div id="divByMonth" style="height:70vh; overflow: auto;">
				<table id="tableByMonth" class="table table-hover table-bordered table-head-fixed text-center" >					
						<thead>
						<tr>
							<th style="width:10%;">일자</th>
							<th style="width:5%;">요일</th>
							<th style="width:8%;">출근시간</th>
							<th style="width:8%;">퇴근시간</th>
							<th style="width:8%;">근무시간</th>
							<th style="width:8%;">출근/결근</th>
							<th style="width:18%;">관리자확인</th>
							<th style="width:20%;">사유</th>
						</tr>
						</thead>
						<tbody>	
						<tr id="">
							<td class="today" ></td>
							<td class="todayLabel"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td><button type="button" class="btn btn-dark btn-xs" id="checkBtn" onclick="modifyCheck();">확인</button></td>
							<td><input type="text" class="form-control form-control-sm" id="reason${j}"></td>
						</tr>
						</tbody>
				</table>
				</div>
			</div>
				<div class="tab-pane fade" id="custom-tabs-one-profile"
					role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
							
							<div class="row">
							<div class="form-group col-sm-2">
							<input type="date" class="form-control" id="selectDay" onchange="reloadDay();">
							</div>
							<div class="col-sm-6"></div>
								<div class="col-sm-4" style="text-align: right">
									<button id="byDayAttandanceListPrintBtn" type="button" class="btn btn-danger btn-sm">
									PDF
									</button>
								</div>
							</div>
							
							<div id="test" style="height:70vh; overflow: auto;">
				<table id="tabletest" class="table table-hover table-bordered table-head-fixed text-center" >					
						<thead>
						<tr>
							<th style="width:10%;">직원명</th>
							<th style="width:10%;">일자</th>
							<th style="width:5%;">요일</th>
							<th style="width:8%;">출근시간</th>
							<th style="width:8%;">퇴근시간</th>
							<th style="width:8%;">근무시간</th>
							<th style="width:15%;">관리자확인</th>
							<th style="width:20%;">사유</th>
						</tr>
						</thead>
						<tbody>	
						<tr>
							<td id=""></td>
							<td class="selectDayResult"></td>
							<td class="selectDayLabel"></td>
							<td class='handlebars'></td>
							<td class='handlebars'></td>
							<td class='handlebars'></td>
							<td><button type="button" class="btn btn-dark btn-xs" id="checkBtn" onclick="modifyCheck();">확인</button></td>
							<td></td>
						</tr>
						</tbody>
				</table>
				</div>
				</div>
						
						</div><!-- card body -->

					</div><!-- card-outline -->

				</div>
			</div>
		</div>
	</div>
	</section>
	
<script>
// 처음 로딩할 때 선택 된 값으로 요일과 날짜 출력
window.onload=function(){
	
	$("#attandanceListPrintBtn").on("click",function(){
		PDFSave($("#attandanceListPrintArea"),'직원별 출근부 목록.pdf');
	});
	
	$("#byDayAttandanceListPrintBtn").on("click",function(){
		PDFSave($("#test"),'요일별 출근부 목록.pdf');
	});
	
	var now = new Date();
	today = now.toISOString().slice(0, 10);
	//console.log("today >>>> " + today);
	month = now.toISOString().slice(0, 7);
	//console.log("month >>>> " + month);
	
	$("#mngName option:eq(1)").prop("selected", true);
	var monthOldVal = $('#month').val();

	if(monthOldVal == ""){
		$('#month').val(month);
	}
	
	// 요일별 목록 탭 기본 날짜 오늘로 선택하고 날짜 출력
	if($('#selectDay').val() == ""){
		$('#selectDay').val(today);
		$('.selectDayResult').html(today);
	}

	var selectdayLabel = getTodayLabel($('#selectDay').val());
	//console.log(selectdayLabel);
	$('.selectDayLabel').html(selectdayLabel);
	
	var arr = $('#month').val().split('-');
	
	var tr = $('.today').length;
	
	var dayData = "";
	var dayLabel = "";
	
	var mngId = $('#mngName option:selected').val();
	var goWorkDate1 = $('#selectDay').val();
	//console.log("mngId>>"+mngId);
	//console.log("goWorkDate>>"+goWorkDate1);
	
	// 요일별 전체 직원 출퇴근 정보 불러오기
	$.ajax({
	  url:"/manager/managermanagement/attandance/workListSelectDay",
	  data:{"goWorkDate" : goWorkDate1},
	  type:'post',
	  success:function(data){
		 console.log(data.workListDay[0].goWorkDate);
		 printData(data,$('#tabletest'),$('#test'),$('#workListSelectDay-template'));
		 if(data.workListDay[0].goWorkDate != ""){
			 $('allRegistBtn').css("display","none");
		 }
	  },
	  error:function(error){
	  }
	});
	
	var goWorkDate = $('#month').val();
	
	var work = {
		"goWorkDate" : goWorkDate,
		"mngId" : mngId
	}
	// 직원별 1달 전체 출퇴근 정보 가져오기
	$.ajax({
	  url:"/manager/managermanagement/attandance/workListById",
	  data:work,
	  type:'post',
	  success:function(data){
		 //console.log(data);
		 printData(data,$('#tableByMonth'),$('#divByMonth'),$('#workListById-template'));
	  },
	  error:function(error){
	  }
	});

}

// 해당 날짜의 요일 구해서 출력
function getTodayLabel(dayData) {
    
    var week = new Array('일', '월', '화', '수', '목', '금', '토');
    
    var today = new Date(dayData).getDay();
    var todayLabel = week[today];
    
    return todayLabel;
}

// 월 선택했을때 날짜와 요일 변경 출력
function reloadMonth(){
	var monthVal = $('#month').val();
	var mngId=$('#mngName option:selected').val();
	//console.log(monthVal);
	var tr = $('.today').length;
	var arr2 = monthVal.split('-');
	//console.log(arr2[1]);
	
	var dayData = "";
	var dayLabel = "";
	
	var work = {
			"goWorkDate" : monthVal,
			"mngId" : mngId
		}
	
		// 직원별 1달 전체 출퇴근 정보 가져오기
		$.ajax({
		  url:"/manager/managermanagement/attandance/workListById",
		  data:work,
		  type:'post',
		  success:function(data){
			 //console.log(data);
			printData(data,$('#tableByMonth'),$('#divByMonth'),$('#workListById-template'));
		  },
		  error:function(error){
		     //alert("현재 유저(직원) 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
		  }
		});
	
}

// 날짜 눌렀을때 리로드(직원 쪽)
function reloadDay(){
	
	var selectDayNow = $('#selectDay').val();
	$('.selectDayResult').html(selectDayNow);
	
	var dayLabel = getTodayLabel(selectDayNow);
	//console.log(selectDayNow);
	$('.selectDayLabel').html(dayLabel);
	
	$.ajax({
		  url:"/manager/managermanagement/attandance/workListSelectDay",
		  data:{"goWorkDate" : selectDayNow},
		  type:'post',
		  success:function(data){
			// console.log(data);
			 printData(data,$('#tabletest'),$('#test'),$('#workListSelectDay-template'));
		  },
		  error:function(error){
		  }
		});
}

function changeGoWorkOut(e){
	
	Swal.fire({
		title: '결근 처리 하시겠습니까?',
		text: '현재 출근 내역이 결근으로 수정됩니다.',
		icon: 'warning',
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		confirmButtonText: '확인', // confirm 버튼 텍스트 지정
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		reverseButtons: false, // 버튼 순서 거꾸로
		}).then(result => {
		// 만약 Promise리턴을 받으면,
		if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			var mngId = $(e).attr("data-id");
			var mngDate = $(e).attr("data-date");
			//alert(mngId+" "+mngDate);
			$.ajax({
				  url:"/manager/managermanagement/attandance/changeGoWorkOutStatus",
				  data:{"mngId" : mngId,"goWorkDate" : mngDate},
				  type:'post',
				  success:function(url){
					  Swal.fire({
					        icon: 'success',
					        title: '변경 되었습니다.',
					        //showConfirmButton: false,
					    });
					  setTimeout(function() {
						  reloadMonth();
						  reloadDay();
						}, 500);
				  },
				  error:function(error){
				  }
				});
		}
		});
	
}

function changeGoWork(e){
	
	Swal.fire({
		title: '출근 처리 하시겠습니까?',
		text: '현재 출근 내역이 출근으로 수정됩니다.',
		icon: 'warning',
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		confirmButtonText: '확인', // confirm 버튼 텍스트 지정
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		reverseButtons: false, // 버튼 순서 거꾸로
		}).then(result => {
		// 만약 Promise리턴을 받으면,
		if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			var mngId = $(e).attr("data-id");
			var mngDate = $(e).attr("data-date");
			//alert(mngId+" "+mngDate);
			$.ajax({
				  url:"/manager/managermanagement/attandance/changeGoWorkStatus",
				  data:{"mngId" : mngId,"goWorkDate" : mngDate},
				  type:'post',
				  success:function(){
					  Swal.fire({
					        icon: 'success',
					        title: '변경 되었습니다.',
					        //showConfirmButton: false,
					    }).then(function(){
						  reloadMonth();
						  reloadDay();
	      				});
				  },
				  error:function(error){
				  }
				});
		}
		});
}

function changeGoWorkReason(e){
	var mngId = $(e).attr("data-id");
	var mngDate = $(e).attr("data-date");
	var goWorkReason = $(e).parent().children('input:eq(0)').val();
	//alert(mngId+" "+mngDate);
	//alert(goWorkReason);
	$.ajax({
		  url:"/manager/managermanagement/attandance/changeGoWorkReason",
		  data:{"mngId" : mngId,"goWorkDate" : mngDate,"goWorkReason":goWorkReason},
		  type:'post',
		  success:function(url){
			  Swal.fire({
			        icon: 'success',
			        title: '변경 되었습니다.',
			        //showConfirmButton: false,
			    }).then(function(){
				  reloadMonth();
				  reloadDay();
  				});
		  },
		  error:function(error){
			  Swal.fire({
			        icon: 'error',
			        title: '오류로 인해 변경 되지 않았습니다.',
			        //showConfirmButton: false,
			    });
		  }
	});
}
</script>

	
<script>
// handlebars 관련
function printData(data,delArea,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	delArea.remove();
	target.append(html);
}

Handlebars.registerHelper('ifWorkTotalTime', function(v1, v2, options) {
	  if(v1 < v2) {
	    return options.fn(this);
	  }
	  return options.inverse(this);
	});
		
</script>
<script type="text/x-handlebars-template"  id="workListSelectDay-template" >
			<table id="tabletest" class="table table-hover table-bordered table-head-fixed text-center" >					
						<thead>
						<tr>
							<th style="width:10%;">직원명</th>
							<th style="width:10%;">일자</th>
							<th style="width:5%;">요일</th>
							<th style="width:8%;">출근시간</th>
							<th style="width:8%;">퇴근시간</th>
							<th style="width:8%;">근무시간</th>
							<th style="width:8%;">출근/결근</th>
							<th style="width:10%;">관리자수정</th>
							<th style="width:20%;">사유</th>
						</tr>
						</thead>
						<tbody>	
							{{#each workListDay}}
						<tr>
							<td>{{goWorkRandomNumber}}</td>
							<td class="selectDayResult">{{goWorkDate}}</td>
							<td class="selectDayLabel">{{goWorkDayLabel}}</td>

							{{#if goWorkTime}}
							<td>{{goWorkTime}}</td>
							{{else}}
							<td>-</td>
							{{/if}}
							
							{{#if goWorkOutTime}}
							<td>{{goWorkOutTime}}</td>
							{{else}}
							<td>-</td>
							{{/if}}

							{{#if goWorkTotalTime}}
							{{#ifWorkTotalTime goWorkTotalTime 480}}
							<td class='handlebars'>{{goWorkTotalTime}}분</td>
							{{else}}
   							 <td class='handlebars'>480분</td>
							{{/ifWorkTotalTime}}
							{{else}}
							<td>-</td>
							{{/if}}

							{{#if goWorkTime}}
							<td><span class="badge badge-info">출근</span></td>
							{{else}}
							<td><span class="badge badge-danger">결근</span></td>
							{{/if}}
							
							{{#if goWorkTime}}
							<td id="{{mngId}}">
							<button type="button" class="btn btn-danger btn-xs" data-id="{{mngId}}" data-date="{{goWorkDate}}" onclick="changeGoWorkOut(this);">결근처리</button>
							</td>
							{{else}}
							<td id="{{mngId}}">
							<button type="button" class="btn btn-info btn-xs" data-id="{{mngId}}" data-date="{{goWorkDate}}" onclick="changeGoWork(this);">출근처리</button>
							</td>
							{{/if}}

							<td>
							<div class="row">
							<input type="text" class="form-control form-control-sm" style="width:80%;" value="{{goWorkReason}}">&nbsp;&nbsp;
							<button type="button" class="btn btn-dark btn-xs" data-id="{{mngId}}" data-date="{{goWorkDate}}" onclick="changeGoWorkReason(this);">저장</button>
							</div>
							</td>

						</tr>
						{{else}}
						<tr>
							<td colspan="8" style="background: white; color: black;">해당 내용이 없습니다.</td>
						</tr>
							{{/each}}
						</tbody>
				</table>
</script>   
<script type="text/x-handlebars-template"  id="workListById-template" >
			<table id="tableByMonth" class="table table-hover table-bordered table-head-fixed text-center" >					
						<thead>
						<tr>
							<th style="width:10%;">일자</th>
							<th style="width:5%;">요일</th>
							<th style="width:8%;">출근시간</th>
							<th style="width:8%;">퇴근시간</th>
							<th style="width:8%;">근무시간</th>
							<th style="width:8%;">출근/결근</th>
							<th style="width:10%;">관리자수정</th>
							<th style="width:20%;">사유</th>
						</tr>
						</thead>
						<tbody>	
						
						{{#each workListById}}
						<tr>
							<td class="today">{{goWorkDate}}</td>
							<td class="todayLabel">{{goWorkDayLabel}}</td>

							{{#if goWorkTime}}
							<td>{{goWorkTime}}</td>
							{{else}}
							<td>-</td>
							{{/if}}
							
							{{#if goWorkOutTime}}
							<td>{{goWorkOutTime}}</td>
							{{else}}
							<td>-</td>
							{{/if}}
							
							{{#if goWorkTotalTime}}
							{{#ifWorkTotalTime goWorkTotalTime 480}}
							<td class='handlebars'>{{goWorkTotalTime}}분</td>
							{{else}}
   							 <td class='handlebars'>480분</td>
							{{/ifWorkTotalTime}}
							{{else}}
							<td>-</td>
							{{/if}}

							{{#if goWorkTime}}
							<td><span class="badge badge-info">출근</span></td>
							{{else}}
							<td><span class="badge badge-danger">결근</span></td>
							{{/if}}
							
							{{#if goWorkTime}}
							<td id="{{mngId}}">
							<button type="button" class="btn btn-danger btn-xs checkBtn" data-id="{{mngId}}" data-date="{{goWorkDate}}" onclick="changeGoWorkOut(this);">결근처리</button>
							</td>
							{{else}}
							<td id="{{mngId}}">
							<button type="button" class="btn btn-info btn-xs checkBtn" data-id="{{mngId}}" data-date="{{goWorkDate}}" onclick="changeGoWork(this);">출근처리</button>
							</td>
							{{/if}}

							<td>
							<div class="row">
							<input type="text" class="form-control form-control-sm" style="width:80%;" value="{{goWorkReason}}">&nbsp;&nbsp;
							<button type="button" class="btn btn-dark btn-xs" data-id="{{mngId}}" data-date="{{goWorkDate}}" onclick="changeGoWorkReason(this);">저장</button>
							</div>
							</td>
							
						</tr>
						{{else}}
						<tr>
							<td colspan="8" style="background: white; color: black;">해당 내용이 없습니다.</td>
						</tr>
						{{/each}}			
						</tbody>
				</table>
</script>
<script>
function registAll() {
	//alert('click!!!');
	$.ajax({
	  url:"/manager/managermanagement/attandance/registDayWorkList",
	  type:'post',
	  success:function(){
		  Swal.fire({
		        icon: 'success',
		        title: '성공 했습니다.',
		    });
	  },
	  error:function(error){
	  }
	});
}

</script>
</body>