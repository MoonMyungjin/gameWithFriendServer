<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
					<h1 data-userId="${loginUser.id }">학습 계획표</h1>
					
<!-- 					즐겨찾기에 존재 -->
					<c:if test="${fn:indexOf(favoriteMenuListStr, '학습 계획표') != -1}">
						<i id="star" class="fa-solid fa-star on fa-2x" ></i>
					</c:if>
					
<!-- 					즐겨찾기에 존재하지 않음 -->
					<c:if test="${fn:indexOf(favoriteMenuListStr, '학습 계획표') == -1}">
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
						<div class="card-header" style="height: 45px; padding: 10px;">
							<div class="row">
			            	<div class="col-md-9">
								<h3 id="clickTest" class="card-title" style="padding-left: 10px; padding-top: 5px;">
										<i class="fas fa-check"></i>
										&nbsp;
										학습 계획표 작성
									</h3>
							</div>
							<div class="col-md-3">
					      <div class="btn-group" style="padding-left: 65px;">
						<button id="showguideBtn" class="fc-prev-button btn btn-light" type="button" style="height: 30px;">작성 방법 안내</button>
						<button id="registBtn" class="fc-prev-button btn btn-light" type="button" style="height: 30px;">저장</button>
					</div>
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
				<th><input class="col-sm-6" type="number" name="text" size="10" min="0" max="168" style="width:100%; border: 0;"  id="target" value="${studyPlanWeek.splanTargettime}"><label class="col-sm-6">시간</label></th> 
				<th style="font-size:14px; width: 20%; vertical-align:center; text-align: center;">실제 공부 시간</th>
				<th><input class="col-sm-6" type="number" name="text" size="10" min="0" max="168" style="width:100%; border: 0;" id="actual" value="${studyPlanWeek.splanActualtime}"><label class="col-sm-6">시간</label></th> 
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
							<c:if test="${not empty dateStudyPlanWeekList }">
                			<c:forEach items="${subjectStudyPlanWeekList }" var="studyPlan">
									 <tr>
										<td style="padding: 0px; margin: 0px;"><input  class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value="${studyPlan.mngSubject}"></td>
										<td style="padding: 0px; margin: 0px;"><textarea class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;">${studyPlan.ssplanDetail}</textarea></td>
										<td style="padding: 0px; margin: 0px;"><input class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value="${studyPlan.ssplanAchievement}"><label class="col-sm-3">%</label></td>
									</tr>
								</c:forEach>	
								</c:if>		
								<c:if test="${empty dateStudyPlanWeekList }" >	
								 <tr>
										<td style="padding: 0px; margin: 0px;"><input id="subject1" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="detail1" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									 <tr>
										<td style="padding: 0px; margin: 0px;"><input id="subject2" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="detail2" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
										 <tr>
										<td style="padding: 0px; margin: 0px;"><input  id="subject3" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="detail3" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
										 <tr>
										<td style="padding: 0px; margin: 0px;"><input id="subject4" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="detail4" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
										 <tr>
										<td style="padding: 0px; margin: 0px;"><input id="subject5" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="detail5" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
										 <tr>
										<td style="padding: 0px; margin: 0px;"><input id="subject6" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="detail6" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
										 <tr>
										<td style="padding: 0px; margin: 0px;"><input id="subject7" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="detail7" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
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
										<td style="padding: 0px; margin: 0px;"><textarea class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" >${studyPlan.dsplanDetail}</textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value="${studyPlan.dsplanAchievement}"><label class="col-sm-3">%</label></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty dateStudyPlanWeekList }" >
									<tr>
										<td class="dayTd" style="padding-top: 22px;"></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="dateDetail1" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td class="dayTd" style="padding-top: 22px;"></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="dateDetail2" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td class="dayTd" style="padding-top: 22px;"></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="dateDetail3" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td class="dayTd" style="padding-top: 22px;"></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="dateDetail4" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td class="dayTd" style="padding-top: 22px;"></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="dateDetail5" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td class="dayTd" style="padding-top: 22px;"></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="dateDetail6" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td class="dayTd" style="padding-top: 22px;"></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="dateDetail7" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
								
							</c:if>
							</tbody>
						</table>
						
								</div>
								</div>		
								
									<div class="card card-light card-outline">
							
								<div class="card-header">
									<h3 class="card-title">
										<i class="fas fa-comment"></i>
										&nbsp;
										선생님 피드백
									</h3>
								</div>
								
								<div class="card-body" style="padding: 0; margin: 0px;">
									<div class="direct-chat-messages" style="height: 60%;">
										<div class="direct-chat-msg">
											<div class="direct-chat-infos clearfix">
												<span id="mngName" class="direct-chat-name float-left" style="font-weight: 900; cursor:pointer;" onclick="OpenWindow('/common/totalDetail.do?id='+'${studyPlanWeek.mngId}','회원상세보기',600,400);">${studyPlanWeek.mngName}T</span>
											<!-- 	<span class="direct-chat-timestamp float-right">2022-03-30</span> -->
											</div>
											<%-- <img class="direct-chat-img" src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/ddabong.jpeg" alt="message user image"> --%>
										
											<div class="row" style="margin-left: 5px;">
												<div  id="profile2" style="border-radius: 100%;  height: 7vh; width: 6vh; border: 1px solid black; margin-right:5px;  padding: 0px;" ></div>
											
											<div id="feedback" class=" direct-chat-text" style="height: 60px; width: 880px; margin: 0px; padding: 0px;">
												<span>${studyPlanWeek.splanFeedback}</span>
											</div>
									</div>
												
												
												
											<%-- 	<div class="direct-chat-text" style="height: 50px; background-color: lightgray;">
												<textarea id="feedback" class="" name="content" rows="10" style="width:100%; height:43px; padding:0px; margin:0px; border: 0px; resize: none; background-color: lightgray;">${studyPlanWeek.splanFeedback}</textarea>
											</div> --%>
										
										
										</div>
									</div>
								</div>
								
							</div>
							</form>
									</div>

								
								
								</div>		
								
				
									</div>
								
							</div>
						</div>
					
					</div>

				<div id="userId" style="display: none;">
                     ${loginUser.id }
               </div>
               <input  type="hidden" name="mngId" id="mngId">

</section>

<script>
	
window.onload=function(){
	
	
	$("#clickTest").on("click",function(){
		let timeValue =70;
		$("#target").val(timeValue);
		
		let subjecttext1 = "국어";
		
		$("#subject1").val(subjecttext1);
		$("#detail1").val("1. 비 문학 5 지문 공부 ");
		$("#subject2").val("영어");
		$("#detail2").val("1. 영 단어 100개 외우기");
		$("#subject3").val("수학");
		$("#detail3").val("1. 수학 문제집 10쪽 풀기");
		$("#subject4").val("사회");
		$("#detail4").val("1. 르네상스 시기 복습");
		$("#subject5").val("과학");
		$("#detail5").val("1. 원소 외우기");
		$("#subject6").val("한국사");
		$("#detail6").val("1. 조선 시대 왕 순서 외우기");
		$("#subject7").val("음악");
		$("#detail7").val("1. 실기 시험 연습 하기");
		
		$("#dateDetail1").val("1. 영 단어 20개 외우기");
		$("#dateDetail2").val("1. 영어 인터넷 강의 10개 듣기");
		$("#dateDetail3").val("1. 영 단어 20개 외우기");
		$("#dateDetail4").val("1. 사회 학원 수업 복습");
		$("#dateDetail5").val("1. 학원 특강 듣고 복습");
		$("#dateDetail6").val("1. 월~일 못한 부분 하기");
		$("#dateDetail7").val("1. 영 단어 20개 외우기");
		
	});
	
	
	
	let id = '${studyPlanWeek.mngId}';
	console.log(id);
	//alert('get picture 실행 테스트');
	 $('div#profile2').css({'background-image':'url('+"/manager/mamagermanagement/getManagerPicture.do?id="+id+')',
	     'background-position':'center',
	     'background-size':'cover',
	     'background-repeat':'no-repeat'
	     });
	 console.log('test');
	
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
	/* 	window.history.pushState(null, null, '/member/studyPlan/registForm?week='+selectValue); */

    	
		window.location.href='/member/studyPlan/registForm.do?week='+selectValue;
/* 		
		function changeUrl(title, '/member/studyPlan/registForm?week='+selectValue, state) {
			if (typeof (history.pushState) != "undefined") { //브라우저가 지원하는 경우 
				history.pushState(state, title, /member/studyPlan/registForm?week='+selectValue'); 
			} 
			else { location.href = url; //브라우저가 지원하지 않는 경우 페이지 이동처리 
			} 
			  }

		 */
		/* history.pushState(null, null,'/member/studyPlan/registForm?week='+selectValue) */

	    /*	renewURL = '/member/studyPlan/registForm?week='+selectValue */
	});
	
/* 	showguideBtn */
	
	
	$("#showguideBtn").on("click",function(){
		/*  window.open('/member/studyPlan/registFormGuide.do','사용 방법 안내',1000,970);  */
		 window.open('/member/studyPlan/registFormGuide.do','pop_Notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=1000,height=970,top=0,left=200');

	});
	
	
	
	
	$("#registBtn").click(function(){
		let week = $("#weekBtn").val();
		let target = $("#target").val();
		let actual = $("#actual").val();
 		let feedback = $("#feedback").val();
		let mngId = $("#mngId").text().trim();  
		let mngName = $("#mngName").text().trim().replace("T",""); 
		
		
		
		let studyPlan = new Object();
		studyPlan.week = week;
		studyPlan.target = target;
		studyPlan.actual = actual;
 		studyPlan.feedback = feedback;
		studyPlan.mngId = mngId; 
		studyPlan.mngName = mngName; 
		
		let subjectstudyPlanArr =[];
		let datestudyPlanArr =[];
		
/* 		let subject = $(".subject").val();
		let SDetail = $(".SDetail").val();
		let SAchieve = $(".SAchieve").val(); */
		$(".subject").each(function(i){
			let subjectstudyPlan = new Object();
			
			subjectstudyPlan.subject = $(this).val();
			subjectstudyPlan.SDetail = $(".SDetail")[i].value;
			subjectstudyPlan.SAchieve = $(".SAchieve")[i].value;
			
			subjectstudyPlanArr.push(subjectstudyPlan);
		});
		
		
		$(".dayTd").each(function(i){
			let datestudyPlan = new Object();
			
			console.log(this);
			datestudyPlan.dayTd = $(this).text();
			datestudyPlan.DDetail = $(".DDetail")[i].value;
			datestudyPlan.DAchieve = $(".DAchieve")[i].value;
			
			datestudyPlanArr.push(datestudyPlan);
		});
		
		let userId = $("#userId").text().trim();
		
		console.log(userId)
		let dataItem = {
				userId : userId,
				studyPlan : studyPlan,
				subjectstudyPlan : subjectstudyPlanArr,
		    	 datestudyPlan : datestudyPlanArr
			};
		console.log(dataItem);
		dataItem = JSON.stringify(dataItem);
		
		
  		 $.ajax({
          type: "post"
         ,url : "/member/studyPlan/regist.do"
         ,contentType: 'application/json'
         ,data : dataItem
         ,success : function (data){
        	 Swal.fire({
			        icon: 'success',
			        title: '저장이 완료 되었습니다.'
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


</script>

</body>

