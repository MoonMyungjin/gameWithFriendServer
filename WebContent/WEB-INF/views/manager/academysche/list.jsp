<!DOCTYPE html>
<html lang="kr">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="academyScheList" value="${dataMap.academyScheList }" />
<c:set var="academySubScheList" value="${dataMap.academySubScheList }" />
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<head>
<meta charset='UTF-8' />
	 <link href='<%=request.getContextPath() %>/resources/js/fullcalendar/main.css' rel='stylesheet' />
    <script src='<%=request.getContextPath() %>/resources/js/fullcalendar/main.js'></script>
    <script src="/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<script src="/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="/resources/bootstrap/plugins/jquery-ui/jquery-ui.min.js"></script>

<script src="/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>

<script src="/resources/bootstrap/plugins/moment/moment.min.js"></script>
<!-- <script src="/resources/bootstrap/plugins/fullcalendar/main.js"></script> -->
<style>

.fc-h-event {
border-color: white;
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
    
    let todayDate = new Date();
    todayDate= todayDate.toISOString().substr(0, 10);
	
    newcalendar2 = {
    	      headerToolbar: {
    	          left: 'prevYear,prev,next,nextYear today',
    	          center: 'title',
    	          right: 'dayGridMonth,dayGridWeek,dayGridDay'
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
	    	    	  let detailId = eventClickInfo.event._def.extendedProps.schid;
	    	    	  let detailStTime = eventClickInfo.event._def.extendedProps.sttime;
	    	    	  let detailFinTime = eventClickInfo.event._def.extendedProps.fintime;
	    	    	  let detailContent = eventClickInfo.event._def.extendedProps.content;
	    	    	  let detailStart = eventClickInfo.event._instance.range.start.toISOString().substr(0, 10);
	    	     	  let detailEnd = eventClickInfo.event._instance.range.end.toISOString().substr(0, 10); 
	    	          let detailTitle = eventClickInfo.event._def.title;
	    	    	
	    	    	  parent.testclick(detailId,detailStTime,detailFinTime,detailContent,detailStart,detailEnd,detailTitle);
	    	    	  console.log(eventClickInfo);
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
$('.fc-event-title-container').attr('onclick="testclick()"');
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
$('#add-new-event').click(function () {
	
	let acatitle = $('#new-event').val();
	let eventSelectColor2 = eventSelectColorArr[0];
	console.log(eventSelectColor2);
	let dataItem = {
			acaUpScheTitle : acatitle,
			acaUpScheColor : eventSelectColor2
		  
	};
	dataItem = JSON.stringify(dataItem);
	console.log(dataItem);
	
	$.ajax({
     type: "post"
    ,url : "/manager/academysche/regist.do"
    ,contentType: 'application/json'
    ,data : dataItem
    ,success : function (data){
 	   console.log(data);
 	  location.reload();
     }
    ,error : function(e){
     }
	});
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
function enterkey() {
	   if (window.event.keyCode == 13) {
	       // 엔터키가 눌렸을 때
	       $('#add-new-event').click();
	    }
	}
</script>

</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }">일정관리</h1>
              <!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '일정관리') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '일정관리') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
                            
           </div>
           <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                 <li class="breadcrumb-item">
                 </li>
               </ol>
           </div>
        </div>
   </div>
</section>
<section class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="card card-dark card-outline">
					<div class="card-header">
						<div class="row">
							
						</div>
					</div>
					<div class="card-body" style="padding-top: 5px;">
						<div class="row">
							<div class="col-md-3">
					            <div class="top mb-3">
					               <div class="card">
					                  <div class="card-header">
					                     <h4 class="card-title">일정 목록</h4>
					                  </div>
					                  <div class="card-body" >
					                     <c:forEach items="${academyScheList }" var="academyScheList" varStatus="i">
					                        <div id="external-events">
					                        	<div style="display: none;">${i.index}</div>
					                        	<div style="display: none;">${academyScheList.acaUpScheId}</div>
					                        	<div id="N" class="external-event" draggable="true" ondrag="drag_handler(event,'${academyScheList.acaUpScheTitle}','${academyScheList.acaUpScheColor}','${academyScheList.acaUpScheId}')" style="color: white; border-color:${academyScheList.acaUpScheColor}; background-color:${academyScheList.acaUpScheColor};" >${academyScheList.acaUpScheTitle}</div>
					                        </div>
					                     </c:forEach>
					                     <div class="checkbox">
					                        <label for="drop-remove">
					                        <button id="deleteUp" type="submit" class="btn btn-danger" >
												삭제
											</button>
					                        </label>
					                     </div>
					                  </div>
					               </div>
					            
					            </div>
			            
					            <div class="card">
					               <div class="card-header">
					                  <h3 class="card-title" >일정 만들기</h3>
					               </div>
					               <div class="card-body">
					                  <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
					                     <ul class="fc-color-picker" id="color-chooser" >
					                        <li><a class="text colorselect" href="#" style="color: #8572EE "><i class="fas fa-square"></i></a></li>
					                        <li><a class="text colorselect" href="#" style="color: #F06E6E  "><i class="fas fa-square" ></i></a></li>
					                        <li><a class="text colorselect" href="#" style="color: #FFB400  "><i class="fas fa-square"></i></a></li>
					                        <li><a class="text colorselect" href="#" style="color: #5CE75C  "><i class="fas fa-square"></i></a></li>
					                        <li><a class="text colorselect" href="#" style="color: #1E90FF  "><i class="fas fa-square"></i></a></li>
					                     </ul>
					                  </div>
					                  
					                  <div class="input-group">
					                     <input id="new-event" type="text" class="form-control" placeholder="Event Title" onkeypress="enterkey();">
					                     <div class="input-group-append">
					                        <button id="add-new-event" type="button" class="btn btn-primary">Add</button>
					                     </div>
					                  
					                  </div>
					               
					               </div>
					            </div>
			         		</div>
			         		
			         
			               <div class="col-md-9">
			                  <div class="card card-primary" >
			                     <div class="card-body p-0" >
			                         <div id='calendar'></div>
			                      </div>
			                   </div>
			                </div>	              
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


</body>



</html>
