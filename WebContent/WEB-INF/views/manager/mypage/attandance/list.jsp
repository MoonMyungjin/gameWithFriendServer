<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="managerList" value="${dataMap.managerList}" />

<title>보낸 메세지 내역</title>

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
				<h1 data-userId="${loginUser.id }">나의출근부</h1>
				
				<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '나의출근부') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '나의출근부') == -1}">
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

					<div class="card card-dark card-outline" >
						
						<div id="attandanceListPrintArea" class="card-body" style="padding-top: 5px">
							<div class="tab-content" id="custom-tabs-one-tabContent">
			<div class="tab-pane fade active show" id="custom-tabs-one-home"
				role="tabpanel" aria-labelledby="custom-tabs-one-home-tab" >
						<div class="row">
							<div class="form-group col-sm-3">
							<input type="month" class="form-control" id="month" onchange="reloadMonth();">
							</div>
							<div class="form-group col-sm-2">
							</div>
							<div class="form-group col-sm-3">
							</div>
							<div class="col-sm-4" style="text-align: right">
									<button id="attandanceListPrintBtn" type="button" class="btn btn-danger btn-sm">
									PDF
									</button>
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
							<td><input type="text" class="form-control form-control-sm" id=""></td>
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
	<input type="hidden" value="${loginUser.id}" id="loginUserId">
	</section>
	
<script>
// 처음 로딩할 때 선택 된 값으로 요일과 날짜 출력
window.onload=function(){
	
	$("#attandanceListPrintBtn").on("click",function(){
		PDFSave($("#attandanceListPrintArea"),'나의 출근부 목록.pdf');
	});
	
	var now = new Date();
	today = now.toISOString().slice(0, 10);
	//console.log("today >>>> " + today);
	month = now.toISOString().slice(0, 7);
	//console.log("month >>>> " + month);
	
	var monthOldVal = $('#month').val();

	if(monthOldVal == ""){
		$('#month').val(month);
	}
		
	var arr = $('#month').val().split('-');
	
	var tr = $('.today').length;
	
	var dayData = "";
	var dayLabel = "";
	
	var mngId = $('#loginUserId').val();
	var goWorkDate1 = $('#selectDay').val();
	//console.log("mngId>>"+mngId);
	//console.log("goWorkDate>>"+goWorkDate1);
			
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
	     //alert("현재 유저(직원) 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
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
	var mngId = $('#loginUserId').val();
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
							<td><span class="badge badge-info badge-pill" >출근</span></td>
							{{else}}
							<td><span class="badge badge-danger badge-pill" >결근</span></td>
							{{/if}}
							
							<td>
							{{goWorkReason}}
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
</body>