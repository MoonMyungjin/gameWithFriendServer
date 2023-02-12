<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
	<style>
		* {
			font-size: 14px;
		}
		
		label {
			margin-bottom: 0;
		}
		div {
    display: block;
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
		
		
		th, td {
			text-align: center;
		}
		#tb1 td, #td1 th {
			padding:0;
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
		
		img{
		width: 100%;
		height:700px;
		}
	</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6" style="display: flex;">
					<h1 data-userId="${loginUser.id }">학습계획표</h1>
				
				<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '학습계획표') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '학습계획표') == -1}">
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
					<div class="card card-light card-outline">
						<div class="card-header" style="height: 50px;" >
							<div class="row">
			            	<div class="col-md-3">
							<h3 class="card-title">
								<i class="fas fa-check"></i> &nbsp;&nbsp; 학습계획표
							</h3>
							</div>
							<div class="col-md-6"></div>
							
							<div class="form-group col-sm-3">
								<select id="pStudentList" class="form-control" style="">
									<c:forEach items="${pStudentList}" var="student">
									<option id="${student.studentId}" ${student.studentId eq selectedStudentId ? 'selected':'' }>${student.studentName}</option>
									</c:forEach>
								</select>
							</div>
				</div>
						</div>
						
						<div class="card-body" style="padding-top: 10px; padding-bottom: 0px;">
							<div class="tab-content" id="custom-tabs-one-tabContent">
			
						<form role="form" method="post" action="/manager/studyPlan/regist.do" name="registForm">
			
							    
							        	<table class="table table-head-fixed table-bordered">
		<thead>
			<tr>
				<th style="width: 30%;"><input type="week" name="week_year" id="weekBtn"  value="${studyPlanWeek.splanWeek}"></th>
				<th style="font-size:14px; width: 20%; vertical-align:center; text-align: center;">이주의 목표 공부 시간</th>
				<th>${studyPlanWeek.splanTargettime}<label class="col-sm-6">시간</label></th> 
				<th style="font-size:14px; width: 20%; vertical-align:center; text-align: center;">실제 공부 시간</th>
				<th>${studyPlanWeek.splanActualtime}<label class="col-sm-6">시간</label></th> 
			</tr>
			
		</thead>
	</table>
	
	
	<div class="row">

	
	<div class="col-sm-6">
						<table class="table table-head-fixed table-bordered">
							<thead>
								<tr>
									<th style="width: 10%">과목</th>
									<th style="width: 25%">구체적 계획과 방법</th>
									<th style="width: 10%">달성도</th>
							</thead>
							<tbody>
							<c:if test="${not empty subjectStudyPlanWeekList }">
                			<c:forEach items="${subjectStudyPlanWeekList }" var="studyPlan">
									 <tr>
										<td style="padding: 0px; margin: 0px;"><input class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value="${studyPlan.mngSubject}" readonly="readonly"></td>
										<td style="padding: 0px; margin: 0px;"><textarea class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" readonly="readonly">${studyPlan.ssplanDetail}</textarea></td>
										<td style="padding: 0px; margin: 0px;"><input class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value="${studyPlan.ssplanAchievement}" readonly="readonly"><label class="col-sm-3">%</label></td>
									</tr>
								</c:forEach>	
								</c:if>		
								<c:if test="${empty subjectStudyPlanWeekList }" >	
								 <tr>
										<td style="height:60px; text-align: center;"></td>
										<td style="height:60px; text-align:left;  resize: none;"></td>
										<td style="height:60px; text-align: center;"><label class="col-sm-3">%</label></td>
									</tr>
									 <tr>
										<td style="height:60px; text-align: center;"></td>
										<td style="height:60px; text-align:left;  resize: none;"></td>
										<td style="height:60px; text-align: center;"><label class="col-sm-3">%</label></td>
									</tr>
									 <tr>
										<td style="height:60px; text-align: center;"></td>
										<td style="height:60px; text-align:left;  resize: none;"></td>
										<td style="height:60px; text-align: center;"><label class="col-sm-3">%</label></td>
									</tr>
									 <tr>
										<td style="height:60px; text-align: center;"></td>
										<td style="height:60px; text-align:left;  resize: none;"></td>
										<td style="height:60px; text-align: center;"><label class="col-sm-3">%</label></td>
									</tr>
									 <tr>
										<td style="height:60px; text-align: center;"></td>
										<td style="height:60px; text-align:left;  resize: none;"></td>
										<td style="height:60px; text-align: center;"><label class="col-sm-3">%</label></td>
									</tr>
									 <tr>
										<td style="height:60px; text-align: center;"></td>
										<td style="height:60px; text-align:left;  resize: none;"></td>
										<td style="height:60px; text-align: center;"><label class="col-sm-3">%</label></td>
									</tr>
									 <tr>
										<td style="height:60px; text-align: center;"></td>
										<td style="height:60px; text-align:left;  resize: none;"></td>
										<td style="height:60px; text-align: center;"><label class="col-sm-3">%</label></td>
									</tr>
								</c:if>
											
							</tbody>
						</table>
						
								</div>
								
								
					
	                    <div class="col-sm-6">
						<table class="table table-head-fixed table-bordered">
							<thead>
								<tr>
									<th style="width: 10%">Date</th>
									<th style="width: 25%">학습내용</th>
									<th style="width: 10%">달성도</th>
							</thead>
							<tbody>
							<c:if test="${not empty dateStudyPlanWeekList }">
						        <c:forEach items="${dateStudyPlanWeekList }" var="studyPlan">
									<tr>
										<td class="dayTd" style="padding-top: 22px;">${studyPlan.dsplanDay}</td>
										<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;padding: 0px; margin: 0px;"><textarea class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" readonly="readonly" >${studyPlan.dsplanDetail}</textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value="${studyPlan.dsplanAchievement}" readonly="readonly" ><label class="col-sm-3">%</label></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty dateStudyPlanWeekList }" >
									<tr>
										<td id="day1" class="dayTd" style="padding-top: 22px;"></td>
										<td style="height:60px; text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"></td>
								        <td style="height:60px;"><label class="col-sm-3">%</label></td>
									</tr>
								<tr>
										<td id="day1" class="dayTd" style="padding-top: 22px;"></td>
										<td style="height:60px; text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"></td>
								        <td style="height:60px;"><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td id="day1" class="dayTd" style="padding-top: 22px;"></td>
										<td style="height:60px; text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"></td>
								        <td style="height:60px;"><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td id="day1" class="dayTd" style="padding-top: 22px;"></td>
										<td style="height:60px; text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"></td>
								        <td style="height:60px;"><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td id="day1" class="dayTd" style="padding-top: 22px;"></td>
										<td style="height:60px; text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"></td>
								        <td style="height:60px;"><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td id="day1" class="dayTd" style="padding-top: 22px;"></td>
										<td style="height:60px; text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"></td>
								        <td style="height:60px;"><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td id="day1" class="dayTd" style="padding-top: 22px;"></td>
										<td style="height:60px; text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"></td>
								        <td style="height:60px;"><label class="col-sm-3">%</label></td>
									</tr>

							</c:if>
							</tbody>
						</table>
						
								</div>
								</div>		
								</form>
								
								
									<div class="card card-light card-outline">
							
								<div class="card-header">
									<h3 class="card-title">
										<i class="fas fa-comment"></i>
										&nbsp;
										선생님 피드백
									</h3>
								</div>
								
								<div class="card-body" style="padding: 0; margin: 0px;">
									<div class="direct-chat-messages" style="height: 60%; padding-bottom: 0px; padding-top: 0px;">
										<div class="direct-chat-msg">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-left" style="font-weight: 900; cursor:pointer;"onclick="OpenWindow('/common/totalDetail.do?id='+'${studyPlanWeek.mngId}','회원상세보기',600,400);">${studyPlanWeek.mngName}T</span>
											<!-- 	<span class="direct-chat-timestamp float-right">2022-03-30</span> -->
											</div>
											<%-- <img class="direct-chat-img" src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/ddabong.jpeg" alt="message user image"> --%>
										
											<div class="row" style="margin-left: 5px;">
												<div  id="profile2" style="border-radius: 100%;  height: 7vh; width: 6vh; border: 1px solid black; margin-right:5px;  padding: 0px;" ></div>
											
											<div id="feedback" class=" direct-chat-text" style="height: 60px; width: 880px; margin: 0px; padding: 0px;">
												<span>${studyPlanWeek.splanFeedback}</span>
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
					
					</div>
		
				<div id="userId" style="display: none;">
                     ${loginUser.id }
               </div>
			
</div>
</section>

<script>

window.onload=function(){
	
	
	
	
	
	let id = '${studyPlanWeek.mngId}';
	console.log(id);
	//alert('get picture 실행 테스트');
	 $('div#profile2').css({'background-image':'url('+"/manager/mamagermanagement/getManagerPicture.do?id="+id+')',
	     'background-position':'center',
	     'background-size':'cover',
	     'background-repeat':'no-repeat'
	     });
	 console.log('test');
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	$("#pStudentList").on("change",function(){
	    var week = $("#weekBtn").val();
		var pStudentId =  $("#pStudentList option:selected").attr("id");
		
		
		console.log(week);
		
		
	window.location.href='/member/studyPlan/list.do?week='+week+'&studentId='+pStudentId;
	
     
	});

	Date.prototype.getWeek = function (dowOffset) {
		  /*getWeek() was developed by Nick Baicoianu at MeanFreePath: http://www.meanfreepath.com */

		  dowOffset = typeof(dowOffset) == 'number' ? dowOffset : 0; // dowOffset이 숫자면 넣고 아니면 0
		  var newYear = new Date(this.getFullYear(),0,1);
		  var day = newYear.getDay() - dowOffset; //the day of week the year begins on
		  day = (day >= 0 ? day : day + 7);
		  var daynum = Math.floor((this.getTime() - newYear.getTime() -
		    (this.getTimezoneOffset()-newYear.getTimezoneOffset())*60000)/86400000) + 1;
		  var weeknum;
		  //if the year starts before the middle of a week
		  if(day < 4) {
		    weeknum = Math.floor((daynum+day-1)/7) + 1;
		    if(weeknum > 52) {
		      let nYear = new Date(this.getFullYear() + 1,0,1);
		      let nday = nYear.getDay() - dowOffset;
		      nday = nday >= 0 ? nday : nday + 7;
		      /*if the next year starts before the middle of
		        the week, it is week #1 of that year*/
		      weeknum = nday < 4 ? 1 : 53;
		    }
		  }
		  else {
		    weeknum = Math.floor((daynum+day-1)/7);
		  }
		  return weeknum;
		};
	
	var date = $("#weekBtn").val();
	console.log(date.substr(0,4));
	console.log(date.substr(6,2));
// 	var sysyear = date.getFullYear();
// 	var sysweek = date.getWeek();
// 	var result = sysyear +"-W" + sysweek;
// 	document.getElementById('weekBtn').value= date;
	var dayArr2 = getWeekDaysByWeekNumber(date.substr(6,2))	
	dayArr2[0]=parseInt(dayArr2[0].substr(8,2))+1;
	dayArr2[1]=parseInt(dayArr2[1].substr(8,2))+1;
	dayArr2[2]=parseInt(dayArr2[2].substr(8,2))+1;
	dayArr2[3]=parseInt(dayArr2[3].substr(8,2))+1;
	dayArr2[4]=parseInt(dayArr2[4].substr(8,2))+1;
	dayArr2[5]=parseInt(dayArr2[5].substr(8,2))+1;
	dayArr2[6]=parseInt(dayArr2[6].substr(8,2))+1;
	
	var dayTd2 = $(".dayTd");
	dayTd2[0].innerHTML=dayArr2[0]+"일/MON";	
	dayTd2[1].innerHTML=dayArr2[1]+"일/TUE";	
	dayTd2[2].innerHTML=dayArr2[2]+"일/WED";	
	dayTd2[3].innerHTML=dayArr2[3]+"일/THU";	
	dayTd2[4].innerHTML=dayArr2[4]+"일/FRI";	
	dayTd2[5].innerHTML=dayArr2[5]+"일/SAT";	
	dayTd2[6].innerHTML=dayArr2[6]+"일/SUN";
	
	var dateformat = "YYYY/MM/DD";
	function getWeekDaysByWeekNumber(weeknumber)
	{
	    var date = moment().isoWeek(weeknumber||1).startOf("week"), weeklength=7, result=[];
	    while(weeklength--)
	    {
	        result.push(date.format(dateformat));
	        date.add(1,"day")
	    }
	    return result;
	}
	
	   $("#weekBtn").on("change",function(){
	      var selectValue = $(this).val();
	      var studentId = $("#pStudentList option:selected").attr("id");

	      
	      var year = selectValue.substr(0,4);
	      var week = selectValue.substr(6,7);
	      
	      var dayArr = getWeekDaysByWeekNumber(week);      
	      
	      var dayTd = $(".dayTd");
	      
	      dayTd[0].innerHTML=dayArr[0].substr(8,2)+"일/MON";   
	      dayTd[1].innerHTML=dayArr[1].substr(8,2)+"일/TUE";   
	      dayTd[2].innerHTML=dayArr[2].substr(8,2)+"일/WED";   
	      dayTd[3].innerHTML=dayArr[3].substr(8,2)+"일/THU";   
	      dayTd[4].innerHTML=dayArr[4].substr(8,2)+"일/FRI";   
	      dayTd[5].innerHTML=dayArr[5].substr(8,2)+"일/SAT";   
	      dayTd[6].innerHTML=dayArr[6].substr(8,2)+"일/SUN";
	      console.log(dayTd);



	      window.location.href='/member/studyPlan/list.do?week='+selectValue+'&studentId='+studentId;

	
	});
	
	
	
	
	
	   

}
</script>

<!-- <script>
	var button = document.querySelector("#lastpay");
	button.addEventListener("mouseover", hovered, false);
	function hovered(e) {
	    console.log("Hovered!");
	}
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
	
</script>	
 -->

