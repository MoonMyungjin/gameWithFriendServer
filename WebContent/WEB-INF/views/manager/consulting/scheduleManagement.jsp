<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="academyScheList" value="${dataMap.academyScheList }" />
<c:set var="academySubScheList" value="${dataMap.academySubScheList }" />

<head>
<meta charset='utf-8' />
<meta charset='UTF-8' />
 <link href='<%=request.getContextPath() %>/resources/js/fullcalendar/main.css' rel='stylesheet' />
    <script src='<%=request.getContextPath() %>/resources/js/fullcalendar/main.js'></script>
    <script src="/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<script src="/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="/resources/bootstrap/plugins/jquery-ui/jquery-ui.min.js"></script>

<script src="/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>

<script src="/resources/bootstrap/plugins/moment/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
* {
	font-size: 14px;
}

label {
	margin-bottom: 0;
}

div.table1 {
	max-height: 180px;
	overflow-y: auto;
}

div.table2 {
	max-height: 180px;
	overflow-y: scroll;
}



th, td {
  padding-top:10px;
	text-align: center;
	 vertical-align : middle;
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

.backgroundTd {
	background-color:rgb(32 73 105);
	color: white;
}

/* body 스타일 */
body {
	font-size: 14px;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
}

/* 드래그 박스의 스타일 */
#external-events {
	left: 20px;
	top: 20px;
	width: 120px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

#external-events .fc-event {
	margin: 3px 0;
	text-align: center;
	cursor: pointer;
}

#icon{
color: black;
}

  #calendar {
	width: 1015px;
	height: 500px;
	padding: 10px;
	margin: 0px;
}  


</style>


<script>  

let CalendarListFor =[
	
	
];

<c:forEach items="${scheduleList }" var="scheduleList" varStatus="i">
		var managerScheduleInfo = new Object();
		
		managerScheduleInfo.cnsltId = '${scheduleList.cnsltId}';
		managerScheduleInfo.cnsltSchDate = '${scheduleList.cnsltSchDate}';
		var originDate = managerScheduleInfo.cnsltSchDate;
		var year = originDate.substr(24,4);
		var day = originDate.substr(8,2);
		var month = originDate.split(" ")[1];
		
		var monthArr = ['Jan', 'Feb', 'Mar', 'Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
		var monthInt = monthArr.indexOf(month)+1;
		if(monthInt < 10){
			monthInt = "0"+monthInt;
		}
		managerScheduleInfo.cnsltSchDate = year + "-"+monthInt+"-" + day;
		
		
		managerScheduleInfo.cnsltSchTime = '${scheduleList.cnsltSchTime}';
		var cnsltConfirmYn = '${scheduleList.cnsltConfirmYn}';
		
		if (cnsltConfirmYn == 'W'){
			managerScheduleInfo.cnsltConfirmYn = ' 상담 신청';
		}
		if (cnsltConfirmYn == 'Y'){
			managerScheduleInfo.cnsltConfirmYn = ' 상담 확정';
		}
		if (cnsltConfirmYn == 'N'){
			managerScheduleInfo.cnsltConfirmYn = ' 상담 취소';
		}
		
		ObjectSche${i.index} = {
			id : managerScheduleInfo.cnsltId,
			title : managerScheduleInfo.cnsltSchTime + managerScheduleInfo.cnsltConfirmYn,
			start : managerScheduleInfo.cnsltSchDate
		}
		
		CalendarListFor.push(ObjectSche${i.index});
// 	if( CheckTimeif${i.index} !== 'Y'){
		
// 		let tempStartDate${i.index} ='${academySubScheList.start }';
// 		console.log(tempStartDate${i.index});
// 		let tempStartTime${i.index} = '${academySubScheList.acaScheStTime }';
// 		console.log(tempStartTime${i.index});
// 		let totalDate${i.index} = tempStartDate${i.index}+"T"+tempStartTime${i.index};
// 		console.log(totalDate${i.index});
// 		ObjectSche${i.index} = {
// 			title :	'${academySubScheList.title }',
// 			start : totalDate${i.index},
// 			backgroundColor : '${academySubScheList.acaScheFntCol }',
// 			end : '${academySubScheList.end }',
// 			schid : '${academySubScheList.acaScheId }',
// 			sttime : '${academySubScheList.acaScheStTime }',
// 			fintime : '${academySubScheList.acaScheFinTime }',
// 			content : '${academySubScheList.acaScheContent }'
// 		};
// 	}else{
// 		ObjectSche${i.index} = {
// 				title :	'${academySubScheList.title }',
// 				start : '${academySubScheList.start }',
// 				backgroundColor : '${academySubScheList.acaScheFntCol }',
// 				end : '${academySubScheList.end }',
// 				schid : '${academySubScheList.acaScheId }',
// 				sttime : '${academySubScheList.acaScheStTime }',
// 				fintime : '${academySubScheList.acaScheFinTime }',
// 				content : '${academySubScheList.acaScheContent }'
// 			};
// 	}
	
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
    
    let todayDate = new Date();
    todayDate= todayDate.toISOString().substr(0, 10);
	
    newcalendar2 = {
    	      headerToolbar: {
    	          left: 'prevYear,prev',
    	          center: 'title',
    	          right: 'today next,nextYear'
    	        },
    	        initialDate: todayDate,
    	        navLinks: true, // can click day/week names to navigate views
    	        editable: true,
    	        dayMaxEvents: true, // allow "more" link when too many events
    	        events: [
    	        	],
    	        droppable : true,
    	        eventDragStart:function( info ) {
    	        	let updateDate = $(this);
    	        	
    	        	console.log(updateDate[0]);
    	        	console.log(info.event._def.title);
    	        	console.log(info);
    	        	console.log(info.event.extendedProps.schid);
    	        	innerId =info.event.extendedProps.schid;
    	        	innerTitle =info.event._def.title;
    	        	console.log(info.event._instance.range.start.toISOString().substr(0, 10));
    	        	innerStart = info.event._instance.range.start.toISOString().substr(0, 10);
    	        	
    	        },
				eventDrop : function (info) {
					
					console.log("test");
					console.log(innerTitle);
					console.log(innerStart);
					let afterDate = info.event._instance.range.start.toISOString().substr(0, 10);
					let innerEnd = info.event._instance.range.end.toISOString().substr(0, 10);
					
					let dataItem4 = {
							title : innerTitle,
							start : afterDate,
							acaScheId : innerId,
							end: innerEnd
					};
					dataItem4 = JSON.stringify(dataItem4);
					console.log(dataItem4);
					 $.ajax({
					     type: "post"
					    ,url : "/manager/academysche/updatecal.do"
					    ,contentType: 'application/json'
					    ,data : dataItem4
					    ,success : function (data){
					 	   console.log(data);
					 	 /*  location.reload(); */
					     }
					    ,error : function(e){
					     }
					}); 
				},
    	        
    	        eventResizeStart : function( info ) { 
    	        	console.log("test");
    	        	console.log(info.event.extendedProps.schid);
    	        	innerResizeId = info.event.extendedProps.schid;
    	        },
    	        eventResize : function( eventResizeInfo ) { 
    	        	console.log(eventResizeInfo.event._instance.range.end.toISOString().substr(0, 10));
    	        	innerResizedEnd = eventResizeInfo.event._instance.range.end.toISOString().substr(0, 10);
    	        	
	    	        let dataItem5 = {
							
							acaScheId : innerResizeId,
							end : innerResizedEnd
							
					};
					dataItem5 = JSON.stringify(dataItem5);
					console.log(dataItem5);
					 $.ajax({
					     type: "post"
					    ,url : "/manager/academysche/updateResize.do"
					    ,contentType: 'application/json'
					    ,data : dataItem5
					    ,success : function (data){
					 	   console.log(data);
					 	 /*  location.reload(); */
					     }
					    ,error : function(e){
					     }
					}); 
	    	      },
	    	      eventClick : function( eventClickInfo ) {
	    	    	  let detailId = eventClickInfo.event._def.publicId;
	    	    	  let detailStTime = eventClickInfo.event._def.extendedProps.sttime;
	    	    	  let detailFinTime = eventClickInfo.event._def.extendedProps.fintime;
	    	    	  let detailContent = eventClickInfo.event._def.extendedProps.content;
	    	    	  let detailStart = eventClickInfo.event._instance.range.start.toISOString().substr(0, 10);
	    	     	  let detailEnd = eventClickInfo.event._instance.range.end.toISOString().substr(0, 10); 
	    	          let detailTitle = eventClickInfo.event._def.title;
	    	    	
	    	          scheduleClick(detailId,detailStTime,detailFinTime,detailContent,detailStart,detailEnd,detailTitle);
// 	    	    	  console.log(eventClickInfo);
	    	      }
    	        
    	      }
    	newcalendar2.events = CalendarListFor;
    calendar = new FullCalendar.Calendar(calendarEl, newcalendar2);
   
	
    calendar.render();
    
  
    
  });

  
let insertTitle ="";
let insertColor = "";
let insertUpId = "";
function drag_handler(event, id,color,upId) {
//  ondrag =  드래그할때 동작 
	insertTitle = id;
	insertColor = color;
	insertUpId = upId;
    console.log(id);
    console.log("Drag");
   
}
function dragover_handler(event) {
  //ondragover = draggable 엘리먼트가 drop영역위에 올라가면 
  
  
   console.log("dragOver");
   event.preventDefault();
}
        
function drop_handler(event) {
  //ondrop = draggable 엘리먼트를 drop영역위에 떨어트리면
  	
  console.log("droooop!");
   document.getElementsByClassName("fc-daygrid-day-events")[0].style.top=event.layerY+"px";
   document.getElementsByClassName("fc-daygrid-day-events")[0].style.left=event.layerX+"px";
    event.preventDefault();
}
window.onload=function(){
/* $(document).delegate('.fc-event-title-container', 'click', function () {
	console.log($(this).parent().parent());
	console.log("test");
	parent.testclick();
	console.log(parent.testclick());
});	 */
/* $('.external-event').attr('draggable','true');
$('.external-event').attr('ondrag','drag_handler(event);');
$('.external-event').css('style','absolute;'); */
$('.fc-daygrid-day-events').attr('ondragover','dragover_handler(event);');
$('.fc-daygrid-day-events').attr('ondrop','drop_handler(event);');
$('.fc-daygrid-day-events').css('style','absolute;');
$('.fc-event-title-container').attr('onclick="scheduleClick(this)"');
$(document).delegate('#add-new-event', 'click', function () {
	    // From the other examples
/* $('.external-event').attr('draggable','true');
$('.external-event').attr('ondrag','drag_handler(event);');
$('.external-event').css('style','absolute;'); */
$('.fc-daygrid-day-events').attr('ondragover','dragover_handler(event);');
$('.fc-daygrid-day-events').attr('ondrop','drop_handler(event);');
$('.fc-daygrid-day-events').css('style','absolute;');

});
$(document).delegate('.fc-daygrid-day-events', 'drop', function () {
	let mydate = $(this).parent().parent().attr('data-date');
	console.log("잘돌아감"+insertTitle);
	console.log("잘돌아감"+insertColor);
	console.log(mydate);
	
	let dataItem3 = {
			title : insertTitle,
			start : mydate,
			acaScheFntCol : insertColor,
			acaUpScheId : insertUpId
	};
	dataItem3 = JSON.stringify(dataItem3);
	
	$.ajax({
	     type: "post"
	    ,url : "/manager/academysche/registmain.do"
	    ,contentType: 'application/json'
	    ,data : dataItem3
	    ,success : function (data){
	 	   console.log(data);
	 	  location.reload();
	     }
	    ,error : function(e){
	     }
	});
	
});



let eventSelectColor = '#007bff';
let eventSelectColorArr = [];
	eventSelectColorArr[0] = eventSelectColor;
$('.colorselect').click(function () {
	eventSelectColor = $(this).css('color');
	eventSelectColorArr.unshift(eventSelectColor);
});	

let idForDelete ="";
let titleForCheck = "";

let deleteList= [];
$(document).delegate('.external-event', 'click', function () {
	
	idForDelete = $(this).prev().text();
	titleForCheck = $(this).text();
	deleteforindex = $(this).prev().prev().text();
	let clickCheck = $(this).attr("id");
	console.log(clickCheck);
	if(clickCheck === "N"){
		
		$(this).append('<i class="fa-solid fa-check" style="margin-left: 10px;"></i>');
		deleteList[deleteforindex] = idForDelete;
		clickCheck = $(this).attr("id","Y");
	}else{
		
		$(this).text(titleForCheck);
		titleForCheck="";
		deleteList[deleteforindex] = 0;
		clickCheck = $(this).attr("id","N");
	}
	
	
	console.log(idForDelete);
	console.log(titleForCheck);
	console.log(deleteList);
});
$(document).delegate('#deleteUp', 'click', function () {
	
	console.log(deleteList);
	console.log(idForDelete);
	console.log(titleForCheck);
	let tempList =[];
	for(let i = 0; i < deleteList.length; i++) {
			console.log(deleteList[i]);
			if(deleteList !== ""){
				
				tempList.push(deleteList[i]);
			}
		}
	tempList  = tempList.filter(function(item) {
		  return item !== null && item !== undefined && item !== '';
		});
		
	let dataItem2 = {
			deleteIdList : tempList		  
	};
	dataItem2 = JSON.stringify(dataItem2);
	
	console.log(dataItem2);
	$.ajax({
	     type: "post"
	    ,url : "/manager/academysche/delete.do"
	    ,contentType: 'application/json'
	    ,data : dataItem2
	    ,success : function (data){
	 	   console.log(data);
	 	  location.reload();
	     }
	    ,error : function(e){
	     }
		});
});



}

function scheduleClick(cnsltId,detailStTime,detailFinTime,detailContent,detailStart,detailEnd,detailTitle){
	console.log("cnsltId : "+cnsltId);
	
	$.ajax({
	     type: "post"
	    ,url : "/manager/consulting/scheduleDetail.do"
	    ,data : {"cnsltId" : cnsltId}
	    ,success : function (data){
	    	console.log(data);
	 	   console.log(data.scheduleDetailParentVer.parentName);
	 	   console.log(data.scheduleDetailParentVer);
	 	   console.log(data);
	 	   
	 	   
	 	   let studentHpStr = data.scheduleDetailParentVer.studentHp
	 	   studentHpStr = studentHpStr.substr(0,3)+"-"+studentHpStr.substr(3,4)+"-"+studentHpStr.substr(7,4);
	 		console.log(studentHpStr);
	 		let modifyDay = data.scheduleDetailParentVer.cnsltSchDate
	 		let modifiedDay = parseInt(modifyDay.split("-")[2])+1;
	 		if(modifiedDay < 10){
	 			modifiedDay = "0"+modifiedDay;
	 		}
 	 		modifyDay = modifyDay.split("-")[0]+"-"+modifyDay.split("-")[1]+"-"+modifiedDay;
	 		console.log(modifyDay);
	 		
	 		
	    	if(data.scheduleDetailParentVer.parentName == null ){
	    	
 		$("#cnsltSchDate").text(modifyDay);
 			$("#scodeValue").attr("data-id",cnsltId);
	 		$("#scodeValue").text(data.scheduleDetailParentVer.scodeValue);
	 		$("#cnsltSchTime").text(data.scheduleDetailParentVer.cnsltSchTime);
	 		$("#parentName").text(data.scheduleDetailParentVer.studentName);
	 		$("#parentHp").text(studentHpStr);
	 		$("#cnsltApplyContent").text(data.scheduleDetailParentVer.cnsltApplyContent);
	 		$("#studentName").text(data.scheduleDetailParentVer.studentName);
	 		$("#studentHp").text(studentHpStr);
	 		$("#schoolName").text(data.scheduleDetailParentVer.schoolName);
	 		$("#grade").text(data.scheduleDetailParentVer.grade);
	 		$("#className").text(data.scheduleDetailParentVer.className); 
	    }else{ 
	 		let parentHpStr = data.scheduleDetailParentVer.parentHp
	 		parentHpStr = parentHpStr.substr(0,3)+"-"+parentHpStr.substr(3,4)+"-"+parentHpStr.substr(7,4);
	 		console.log(parentHpStr);
	 		
	 		$("#cnsltSchDate").text(modifyDay);
	 		$("#scodeValue").attr("data-id",cnsltId);
	 		$("#scodeValue").text(data.scheduleDetailParentVer.scodeValue);
	 		$("#cnsltSchTime").text(data.scheduleDetailParentVer.cnsltSchTime);
	 		$("#parentName").text(data.scheduleDetailParentVer.parentName);
	 		$("#parentHp").text(parentHpStr);
	 		$("#cnsltApplyContent").text(data.scheduleDetailParentVer.cnsltApplyContent);
	 		$("#studentName").text(data.scheduleDetailParentVer.studentName);
	 		$("#studentHp").text(studentHpStr);
	 		$("#schoolName").text(data.scheduleDetailParentVer.schoolName);
	 		$("#grade").text(data.scheduleDetailParentVer.grade);
	 		$("#className").text(data.scheduleDetailParentVer.className);
	    }
	    }
	    ,error : function(e){
	     }
		});
	
	
	

	$("#confirmY").click(function(){
		let cnsltId = $("#scodeValue").attr("data-id");
		console.log(cnsltId);

		
		
		$.ajax({
		     type: "post"
		    ,url : "/manager/consulting/updateConfirmY.do"
		    ,data : {"cnsltId" : cnsltId}
		    ,success : function (data){
		    	Swal.fire({
			        icon: 'success',
			        title: '승인 완료 되었습니다!'
			    });
		    	setTimeout(function() {
			    	location.reload();
		    		}, 2000);
		     }
		    ,error : function(e){
		     }
			});
	});
	
	$("#confirmN").click(function(){
		let cnsltId = $("#scodeValue").attr("data-id");
		console.log(cnsltId);
		
		$.ajax({
		     type: "post"
		    ,url : "/manager/consulting/updateConfirmN.do"
		    ,data : {"cnsltId" : cnsltId}
		    ,success : function (data){
		    	Swal.fire({
			        icon: 'success',
			        title: '승인 취소 되었습니다!'
			    });
		    	setTimeout(function() {
			    	location.reload();
		    		}, 2000);
		     }
		    ,error : function(e){
		     }
			});
	});



}

function enterkey() {
	   if (window.event.keyCode == 13) {
	       // 엔터키가 눌렸을 때
	       $('#add-new-event').click();
	    }
	}


</script>




<meta charset="UTF-8">
<title></title>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6" style="display: flex;">
					<h1 data-userId="${loginUser.id }">상담일정관리</h1>
										<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '상담일정관리') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '상담일정관리') == -1}">
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
					<div class="card card-dark card-outline" style="margin: 0px; padding: 0px;">
					<div class="card-header">
							<h3 class="card-title">
								<i class="fas fa-check"></i> &nbsp;&nbsp; 스케줄
							</h3>
						</div>

					<div class="card-body" style="padding : 0px; margin: 0px;">

							<div class="row">
						
								<div class="col-sm-12">
								<div class="card card-primary">
											<div class="card-body p-0">
			                         <div id='calendar'></div>
			                   </div>
											<div>
							</div>
					
									
						</div>
					
					</div>

				</div>
					
	
</div>
		
		
		
		
          <div class="row">
			<div class="col-sm-12">
				<div class="card card-dark card-outline">
					<div class="card-header" style="padding: 5px; padding-left: 20px;">
						<div class="row">
							<div class="col-sm-6" style="height: 20px;">
								<h3 class="card-title">
									<i class="fas fa-regular fa-address-card"></i> &nbsp;&nbsp; 상담 신청 상세 정보
								</h3>
							</div>
							<div class="col-sm-6" style="text-align: right">
								<button id="confirmY" type="button" class="btn btn-dark btn-sm">신청 승인</button>
								<button id="confirmN" type="button" class="btn btn-dark btn-sm">신청 취소</button>
							</div>
						</div>
					</div>
			
						<div class="card-body" style="margin: 3px; padding : 7px; padding-bottom: 0px;">
						<form role="form" method="post" action="/manager/consulting/scheduleDetail.do" name="scheduleDetail">
						
						      <div class="row" style="margin: 0px;">
						      
						      <table class="table table-bordered" style="height: 130px; margin: 0px;">
						      
						      <tr>
						      <td class="backgroundTd" style="width: 10%; margin: 0px; padding:0px;  vertical-align : middle;">상담구분</td>
						      <td id="scodeValue" style="margin: 0px; padding:0px; vertical-align : middle;"></td>
						      <td class="backgroundTd" style="width: 10%; margin: 0px; padding:0px; vertical-align : middle;">신청일</td>
						      <td id="cnsltSchDate" style="margin: 0px; padding:0px; vertical-align : middle;"></td>
						      <td class="backgroundTd" style="width: 10%; margin: 0px; padding:0px; vertical-align : middle;">신청시간</td>
						      <td id="cnsltSchTime" style="width: 10%; margin: 0px; padding:0px; vertical-align : middle;"></td>
						      <td class="backgroundTd" style="width: 40%; margin: 0px; padding:0px; vertical-align : middle;">상담 신청 내용</td>
						      </tr>
						      
						      <tr>
						      <td class="backgroundTd" style="width: 10%; margin: 0px; padding:0px; vertical-align : middle;">신청자</td>
						      <td id="parentName" style="margin: 0px; padding:0px; vertical-align : middle;"></td>
						      <td class="backgroundTd" style="width: 10%; margin: 0px; padding:0px; vertical-align : middle;">연락처</td>
						      <td colspan="3" id="parentHp" style="margin: 0px; padding:0px; vertical-align : middle;"></td>
						      <td rowspan="3" id="cnsltApplyContent" style="width: 40%; margin: 0px; padding:0px; text-align: left;"></td>
						      </tr>
						      
						      <tr>
						      <td class="backgroundTd" style="width: 10%; margin: 0px; padding:0px; vertical-align : middle;">신청 대상자</td>
						      <td id="studentName" style=" font-weight: 900; cursor:pointer; margin: 0px; padding:0px; vertical-align : middle;" onclick="OpenWindow('/common/memberDetail.do?id='+'${studentId}+','회원상세보기',600,400);"></td>
						      <td class="backgroundTd" style="width: 10%; margin: 0px; padding:0px; vertical-align : middle;">연락처</td>
						      <td id="studentHp" colspan="3" style="margin: 0px; padding:0px; vertical-align : middle;"></td>
						      </tr>
						      
						      <tr>
						      <td class="backgroundTd" style="width: 10%; margin: 0px; padding:0px; vertical-align : middle;">학교</td>
						      <td id="schoolName" style="margin: 0px; padding:0px; vertical-align : middle;"></td>
						      <td class="backgroundTd" style="width: 10%; margin: 0px; padding:0px; vertical-align : middle;">학년</td>
						      <td id="grade" style="margin: 0px; padding:0px; vertical-align : middle;"></td>
						      <td class="backgroundTd" style="width: 10%; margin: 0px; padding:0px; vertical-align : middle;">반</td>
						      <td id="className" style="width: 10%; margin: 0px; padding:0px; vertical-align : middle;"></td>
						      </tr>
						      </table>
						      

						
							</div>
										

						</form>
						</div>
						</div>
						</div>
						</div>
						

				</div>
		</div>
					
					</div>
				
				
		</div>

	</section>
	<input type="hidden" name="mngId" id="mngId">
	<input type="hidden" name="cnsltSchDate" id="cnsltSchDate">
	<input type="hidden" name="cnsltSchTime" id="cnsltSchTime">
	<input type="hidden" name="cnsltApplyContent" id="cnsltApplyContent">
	<input type="hidden" name="cnsltApplyer" id="cnsltApplyer">
	<input type="hidden" name="cnsltTarget" id="cnsltTarget">
	<input type="hidden" name="parentHp" id="parentHp">
	<input type="hidden" name="studentHp" id="studentHp">
	<input type="hidden" name="studentId" id="studentId">
	<input type="hidden" name="schoolName" id="schoolName">
	<input type="hidden" name="grade" id="grade">
	<input type="hidden" name="className" id="className">
	<input type="hidden" name="cnsltType" id="cnsltType">
	<input type="hidden" name="applyerId" id="applyerId">
	<input type="hidden" name="tarketId" id="tarketId">
	
	<div id="userId" style="display: none;">${loginUser.id }</div>
	
	

</body>







</html>