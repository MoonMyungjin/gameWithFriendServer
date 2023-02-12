<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="manager" value="${dataMap.manager }" />
<c:set var="gowork" value="${dataMap.gowork }" />
<c:set var="academySubScheList" value="${dataMap.academySubScheList }" />
<c:set var="noticeForMainList" value="${dataMap.noticeForMainList }" />
<c:set var="noteReceiveList" value="${dataMap.noteReceiveList }" />
<c:set var="noteSendList" value="${dataMap.noteSendList }" />
<c:set var="forMainGetLesson" value="${dataMap.forMainGetLesson }" />
<c:set var="forMainGetLessonEnd" value="${dataMap.forMainGetLessonEnd }" />


<head>
<meta charset="UTF-8">
 <link href='<%=request.getContextPath() %>/resources/js/fullcalendar/main.css' rel='stylesheet' />
    <script src='<%=request.getContextPath() %>/resources/js/fullcalendar/main.js'></script>
    <script src="/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
    <script src="/resources/bootstrap/plugins/moment/moment.min.js"></script>
<title></title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
.fc-toolbar, .fc-toolbar.fc-header-toolbar {
	padding: 0px;	
}

.asd:hover {
  background-color :rgb(223,223,223);  
}
</style>
</head>
<body>

<section class="content">
   <div class="card-header"style="padding:0px; margin:0px; ">
   	  <div class="row" style="padding:0px; margin:0px; height: 39vh;">
	      <div class="card card-dark card-outline col-sm-5" style="height: 38vh;">
	      	<div class="card-header" style="padding-bottom: 0px;">
	      	근태상황 및 프로필
	      	</div>
	      	<div class="card-body" >
	      		<div class="row" style="padding:0px; margin:0px; ">
		      <div class="col-sm-6" style="padding:0px; margin-top:2vh; border: 1px solid white/* rgb(32, 73, 105) */; border-radius:15px; height:220px;">
		      	<div class="col-sm-12" style="border: 1px solid white; height: 20vh;  text-align: center;" >
		      		<div id="profile" style="border-radius: 100%;  height: 20vh; width: 20vh;" ></div>
		      	</div>
		      	
		      </div>
		      <div class="col-sm-6" style="padding:5px; margin:0px; border: 1px solid white; border-radius:15px; height:220px;">
		      	<div class="row">
		      		<div class="col-sm-12" style="border: 1px solid white; height: 12vh; margin-top: 2vh;">		      		
				      	<div class="col-sm-12" >
					      	${manager.deptId}
					      	<span style="margin-left: 1vh;">${manager.mngName}</span>	      		
				      	</div>
				      	<div class="col-sm-12">
				      		담당 과목: 
				      		<span style="margin-left: 1vh;">${manager.mngSubject}</span>			      		
				      	</div>
				      	<div class="col-sm-12">
				      		담당 반: 
				      		<span style="margin-left: 1vh;">${manager.schoolName}</span>
				      	</div>
		      		</div>
		      		<div class="col-sm-12" style="height: 12vh; border: 1px solid white;">
			      		<div class="col-sm-12" id="myDiv" >
					      	
					      	<span style="margin-left: 1vh;"></span>	      		
			      		</div>
				      	<div class="col-sm-12">
				      		출근시간: 
				      		<span style="margin-left: 1vh;">${gowork.goWorkTime}</span>			      		
				      	</div>
				      	<div class="col-sm-12">
				      		퇴근시간: 
				      		<span style="margin-left: 1vh;">${gowork.goWorkOutTime}</span>
				      	</div>
				      	<div class="col-sm-12">
				      		총 업무 시간: 
				      		<span style="margin-left: 1vh;">${gowork.goWorkTotalTime}분</span>
				      	</div>
			      	</div>
		      		<div class="col-sm-12" style="height: 5vh; border: 1px solid white;">
		      			<div class="row">
		      				<div class="col-sm-6" style="text-align: center;">
		      					<div class="row">
		      						<div class="col-sm-2">
		      						</div>
		      						<div class="col-sm-8">
		      							<button id="one" type="button"  class="btn btn-block btn-outline-info btn-xs one go " onclick="update_go_work();">출근</button>
		      						</div>
		      						<div class="col-sm-2">
		      						</div>
		      					</div>
		      					
		      				</div>
		      				<div class="col-sm-6">
		      					<div class="row">
		      						<div class="col-sm-2">
		      						</div>
		      						<div class="col-sm-8">
		      							<button id="two" type="button" class="btn btn-block btn-outline-danger btn-xs two out" onclick="update_go_work_out();">퇴근</button>		
		      						</div>
		      						<div class="col-sm-2">
		      						</div>
		      					</div>
			      				
		      				</div>
		      			</div>
			      	</div>
		      	</div>
		      </div>
		      </div>
	      	</div>
	      </div>
	      
	      <div class="card card-dark card-outline col-sm-7" style="height: 38vh;">
	      	<div class="card-header" style="padding-bottom: 0px;">
	      	나의 수업 현황
	      	</div>
	      	<div class="card-body" style="padding: 0px;">
	      	 <div class="row" style="padding:0px; margin:0px; ">
			      <div class="col-sm-12" style="padding:5px;  margin:0px; margin-bottom:3px; margin-top:3px; border: 0.1px solid white; height:13vh; border-radius:15px;">
				      <c:forEach items="${forMainGetLesson }" var="forMainGetLesson" end="0">
				     
				      <div class="row" style="height: 6vh; border: 0.1px solid rgba(33, 33, 33, 0.1);" >
					      	<div class="col-sm-3" style="height: 12vh; margin-right: 0px; padding: 0px;"> <div id="classOpenSoon" class="d-flex justify-content-center align-items-center" style="height: 12vh; background-color:rgb(179, 0, 35); color: white; text-align: center;">개강임박</div></div>
						    <div class="col-sm-9" style="height: 12vh; margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;">
							     <div class="row">
							      	<div class="col-sm-2" style="height: 6vh; margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;"> <div class="d-flex justify-content-center align-items-center" style=" height: 6vh; background-color:rgb(32 73 105); color: white; ">수업명</div></div>&nbsp;
							      	<div class="col-sm-9" style="height: 6vh; margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px; "><div class="d-flex align-items-center" style=" height: 6vh; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${forMainGetLesson.lessonName }</div></div>
							     </div>
							     <div class="row">
							     	<div class="col-sm-2" style="height: 6vh; padding-left: 0px; margin-right: 0px; padding-right: 0px;"> <div class="d-flex justify-content-center align-items-center" style="text-align:center; vertical-align:middle; height: 6vh; background-color:rgb(32 73 105); color: white;">개강일</div></div>
							      	<div id="changeForMainDate" class="col-sm-2 d-flex justify-content-center align-items-center" style="text-align:center; margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;">${fn:substring(forMainGetLesson.lessonStartDate,0,4)}-${fn:substring(forMainGetLesson.lessonStartDate,4,6)}-${fn:substring(forMainGetLesson.lessonStartDate,6,8)}</div>
							     	<!--  	<div class="col-sm-3" style="height: 6vh; margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;"> <div class="d-flex justify-content-center align-items-center" style="text-align:center; height: 6vh; background-color:rgb(32 73 105); color: white;">개강까지 남은일</div></div>
							      	<div id="restDayForMainDate" class="col-sm-1 d-flex justify-content-center align-items-center" style="text-align:center; vertical-align:center; height: 6vh; margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;"></div> -->
							      	<div class="col-sm-2 " style="height: 6vh; margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;"> <div class="d-flex justify-content-center align-items-center" style="text-align:center; height: 6vh; background-color:rgb(32 73 105); color: white;">수업상태</div></div>
							      	<div id="lessonState" class="col-sm-5 d-flex justify-content-center align-items-center" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px; overflow: hidden;">${forMainGetLesson.lessonStateCode }</div>
						     	 </div>
					     	</div>
				      </div>
				     <!--  <div class="row">
				      		<div class="col-sm-12">
				      		</div>
				      </div> -->
				      <div class="row" style="height: 6vh; border: 0.1px solid rgba(33, 33, 33, 0.1);">
					     
				      </div>
				      <!-- <div class="row">
				       		<div class="col-sm-12">
				      		</div>
				      </div>
				       -->
				      </c:forEach>	
				      <%-- <c:forEach items="${forMainGetLessonEnd }" var="forMainGetLessonEnd" end="0">
				      <div class="asd" style="cursor:pointer; border: 0.1px solid rgba(33, 33, 33, 0.1);">
				      <div class="row" style="">
					      	<div class="col-sm-2" style=" margin-right: 0px; padding-right: 0px;"> <span style="background-color:rgb(179, 0, 35); color: white;">수업종료임박</span></div>
					      	<div class="col-sm-1" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;"></div>
					      	<div class="col-sm-1" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;"> <span style="background-color:rgb(32 73 105); color: white;">수업명</span></div>&nbsp;
					      	<div class="col-sm-7" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${forMainGetLessonEnd.lessonName }</div>
				      </div>
				      <div class="row" style="">
					      	<div class="col-sm-2" style=" margin-right: 0px; padding-right: 0px;"> <span style="background-color:rgb(32 73 105); color: white;">수강종료일</span></div>
					      	<div id="changeForMainDateEnd" class="col-sm-2" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;">${fn:substring(forMainGetLessonEnd.lessonEndDate,0,4)}-${fn:substring(forMainGetLessonEnd.lessonEndDate,4,6)}-${fn:substring(forMainGetLessonEnd.lessonEndDate,6,8)}</div>
					      	<div class="col-sm-3" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;"> <span style="background-color:rgb(32 73 105); color: white;">수업종료까지 남은일</span></div>
					      	<div id="restDayForMainDateEnd" class="col-sm-1" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"></div>
					      	<div class="col-sm-2" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;"> <span style="background-color:rgb(32 73 105); color: white;">수업상태</span></div>
					      	<div id="lessonStateEnd" class="col-sm-2" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${forMainGetLessonEnd.lessonStateCode }</div>
				      </div>
				      </div>
				       </c:forEach> --%>
			      </div>
			      <div class="col-sm-6" style="padding:10px; margin:0px; border: 0.1px solid rgba(33, 33, 33, 0.1); height:20vh; border-radius:15px;">
			      	최근 받은 쪽지<a href="/common/noteForm.do?loginUserId=${loginUser.id }" style="float: right"><i class="fas fa-solid fa-plus"></i></a>
			      	<hr>
			    	<c:forEach items="${noteReceiveList }" var="noteReceive" end="2">
			      
                    <%--  <span>날짜: <fmt:formatDate value="${noteReceive.noteSendDate }" pattern="yy-MM-dd hh:mm:ss" /></span> --%>
                    <div class="row asd"  onclick="window.open('/common/noteDetail.do?noteId=${noteReceive.noteId}','pop_Notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=600,top=200,left=200');" style="cursor:pointer; border: 0.1px solid rgba(33, 33, 33, 0.1); margin-bottom: 5px;">
			      	
			      	<div class="col-sm-3" style=" margin-right: 0px; padding-right: 0px;"> <span style="background-color:rgb(32 73 105); color: white;">받은이</span></div>
			      	<div class="col-sm-3" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;"><strong>${noteReceive.noteSendUserName }</strong></div>
			      	<div class="col-sm-2" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;"> <span style="background-color:rgb(32 73 105); color: white;">제목</span></div>&nbsp;
			      	<div class="col-sm-3" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${noteReceive.noteTitle }</div>
			      	</div>
			      	</c:forEach> 
			     
			      
			      </div>
			      <div class="col-sm-6" style="padding:10px; margin:0px; border: 0.1px solid rgba(33, 33, 33, 0.1); height:20vh; border-radius:15px;">
			      	 최근 보낸 쪽지<a href="/common/noteForm.do?loginUserId=${loginUser.id }" style="float: right"><i class="fas fa-solid fa-plus"></i></a>
			      	<hr>
			      	<c:forEach items="${noteSendList }" var="noteSend" end="2">
			      	<div onclick="window.open('/common/noteDetail.do?noteId=${noteSend.noteId}','pop_Notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=600,top=200,left=200');" class="row asd" style="cursor:pointer; border: 0.1px solid rgba(33, 33, 33, 0.1); margin-bottom: 5px;">
			      	
			      	<div class="col-sm-3" style=" margin-right: 0px; padding-right: 0px;"> <span style="background-color:rgb(32 73 105); color: white;">보낸이</span></div>
			      	<div class="col-sm-3" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;"><strong>${noteSend.noteSendUserName }</strong></div>
			      	<div class="col-sm-2" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px;"> <span style="background-color:rgb(32 73 105); color: white;">제목</span></div>&nbsp;
			      	<div class="col-sm-3" style="margin-left: 0px; padding-left: 0px; margin-right: 0px; padding-right: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;" >${noteSend.noteTitle }</div>
			      
			      	</div>
			      			      	
					<%--  <span>날짜:<fmt:formatDate value="${noteSend.noteSendDate }" pattern="yy-MM-dd hh:mm:ss" /></span>--%>
					 
			      	</c:forEach> 
			      </div>
			 </div>
	      	</div>
	      </div>
	      
      </div>
   </div>

   
   <div class="card-body" style="padding:0px; margin:0px; ">
   	   <div class="row" style="padding:0px; margin:0px; height: 38vh;">
   	   
   	   		<div class="card card-dark card-outline col-sm-6" style="">
		      	<div class="card-header"  style="padding-bottom: 0px;">
		      	학원일정<a href="/manager/academysche/list.do" style="float: right"><i class="fas fa-solid fa-plus"></i></a>
		      	</div>
		      	<div class="card-body" style="padding: 0px;">
				      <div class="col-sm-12" style="border: 1px solid white; border-radius:15px;">
				      	  <div class="card-body p-0" >
			                 <div id='calendar' >
			                 </div>
			              </div>
				      </div>
		      	</div>
	      	</div>
	      	
	      	<div class="card card-dark card-outline col-sm-6">
		      	<div class="card-header" style="padding-bottom: 0px;">
		      	학원 공지사항<a href="/manager/board/notice.do" style="float: right"><i class="fas fa-solid fa-plus"></i></a>
		      	</div>
		      	<div class="card-body" style="padding: 0px; margin-top: 2vh;">
				      <div class="col-sm-12" style="padding:1px; border: 1px solid white; border-radius:15px;">
				      			<table class="table table-hover table-bordered text-nowrap" style="width: 100%; height:100%;">
											<thead>
												<tr>
													<th style="width: 10%; background-color:rgb(32 73 105); color: white;">NO</th>
													<th style="width: 15%; background-color:rgb(32 73 105); color: white;">날짜</th>
													<th style="width: 40%; background-color:rgb(32 73 105); color: white;">작성자</th>
												
													<th style="width: 40%; background-color:rgb(32 73 105); color: white;">제목</th>
												
												</tr>
											</thead>

											<tbody id="searchResultTable">
												<c:if test="${empty noticeForMainList}">
														<tr>
															<td colspan="6" class="text-center">
																해당 내용이 없습니다.
															</td>
														</tr>
													</c:if>
											
												<c:if test="${!empty noticeForMainList}">
												<c:forEach items="${noticeForMainList }" var="noticeForMainList" end="7">
													<tr  style="cursor: pointer">
														<td >${noticeForMainList.noticeId }</td>
														<td><fmt:formatDate value="${noticeForMainList.noticeRegdate }" pattern="yyyy-MM-dd" /></td>
														<td><strong>${noticeForMainList.mngName }</strong></td>
														<td>${noticeForMainList.noticeTitle }</td>
												

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
   <input type="hidden" id="loginId" value="${loginUser.id}">
</section>
   
   
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
	   
	    
	    calendar.setOption('height', 420);
	 	calendar.setOption('contentHeight', 120);
	    
	    calendar.render();
	 	$('.fc-header-toolbar fc-toolbar ').attr('style','padding:0px;')
	  	
	   	console.log(calendar)
	  });


window.onload=function(){
	
	
	let goWorkYn = '${gowork.goWorkStartDeadlineYn}';
	console.log(goWorkYn)
	if(goWorkYn =='Y'){
		console.log("test")
		$('#one').attr('style','display: none;')
	}
	let id = '${loginUser.id}';
	//alert('get picture 실행 테스트');
	 $('div#profile').css({'background-image':'url('+"/manager/mamagermanagement/getManagerPicture.do?id="+id+')',
	     'background-position':'center',
	     'background-size':'cover',
	     'background-repeat':'no-repeat'
	     });
	
	 let chaNowSoon = $('#changeForMainDate').text();
	 let nowSoon = moment(chaNowSoon);
	 let nowdate = moment();
	console.log(nowSoon);
	console.log(nowdate);
	
	let duration = nowSoon.diff(nowdate, 'days');
	console.log(duration);
	let plusSoon = $('#classOpenSoon').text();
	console.log($('#classOpenSoon').text());
	
	$('#classOpenSoon').text(plusSoon+" D- "+duration);
	console.log($('#lessonState').text());
	if($('#lessonState').text() == "NOSYL"){
		$('#lessonState').text('계획서없음');
	}else if($('#lessonState').text() == "WAIT"){
		$('#lessonState').text('개강 대기중');
	}
	
	
	let chaNowSoonEnd =$('#changeForMainDateEnd').text();
	let nowSoonEnd = moment(chaNowSoonEnd);
	let nowdateEnd = moment();
	
	let durationEnd = nowSoonEnd.diff(nowdateEnd, 'days');
	
	$('#restDayForMainDateEnd').text("D- "+durationEnd);
	console.log($('#lessonStateEnd').text());
	if($('#lessonStateEnd').text() == "GOING"){
		$('#lessonStateEnd').text('진행중');
	}
}






function update_go_work(){
	var mngId = $('#loginId').val();
	//console.log("test>>>" + mngId);
	$.ajax({
	  url:"/manager/managermanagement/attandance/updateGoWorkTime",
	  data:{"id" : mngId},
	  type:'post',
	  success:function(){
		    Swal.fire({
		        icon: 'success',
		        title: '출근 완료 되었습니다.',
		        text: '오늘도 즐거운 하루 보내세요 ^^',
		    });
		    
		    window.location.href="/manager/main.do"
// 		 	$('#goWorkClick').css("display","none");
// 		 	$('#goWorkComplite').css("display","inline");
	  },
	  error:function(error){
	     //alert("현재 출근이 불가합니다.\n 관리자에게 연락바랍니다.");
	  }
	});
	

}

function update_go_work_out() {
	Swal.fire({
		title: '퇴근 처리 하시겠습니까?',
		text: '한번 체크 하면 변경이 불가합니다. 신중히 결정하시기 바랍니다.',
		icon: 'warning',
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		confirmButtonText: '승인', // confirm 버튼 텍스트 지정
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		reverseButtons: false, // 버튼 순서 거꾸로
		}).then(result => {
		// 만약 Promise리턴을 받으면,
		if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			var mngId = $('#loginId').val();
			//console.log("test>>>" + mngId);
			$.ajax({
			  url:"/manager/managermanagement/attandance/updateGoWorkOutTime",
			  data:{"id" : mngId},
			  type:'post',
			  success:function(){
				    Swal.fire({
				        icon: 'success',
				        title: '퇴근 완료 되었습니다.',
				        text: '오늘도 고생 많으셨습니다 ^^',
				    });
				    
				    window.location.href="/manager/main.do"
//		 		    $('#goWorkOutClick').css("display","none");
//		 			$('#goWorkOutComplite').css("display","inline");
			  },
			  error:function(error){
			     //alert("현재 퇴근이 불가합니다.\n 관리자에게 연락바랍니다.");
			  }
			});
			
		}
		});


	
	
}

setInterval(function(){
	let nowWeek ='${gowork.goWorkDayLabel}';
    var today = new Date()  // 날짜 객체 생성
        // ok
    // HTML의 특정 위치를 지정!
    var my_div = document.getElementById("myDiv")
    my_div.innerText = today.toLocaleString()
}, 1000)   

</script>
   
</body>
</html>