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
					<h1 data-userId="${loginUser.id }">학습계획표 확인</h1>
					<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '학습계획표 확인') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '학습계획표 확인') == -1}">
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
					<div class="card card-dark card-outline">
						<div class="card-header" style="height: 50px;" >
							<div class="row">
			            	<div class="col-md-3">
							<h3 class="card-title">
								<i class="fas fa-check"></i> &nbsp;&nbsp; 학습계획표 확인
							</h3>
							</div>
							<div class="col-md-5"></div>
							
							<div class="form-group col-sm-3">
								<select id="studentList" class="form-control" style="">
									<option>학생선택</option>
									<c:forEach items="${studentList}" var="student">
									<option id="${student.studentId}">${student.studentName}</option>
									</c:forEach>
								</select>
							</div>
							
							
							<div class="col-md-1">
					      <div class="btn-group">
						<button id="registBtn" class="fc-prev-button btn btn-dark" type="button" style="height: 35px;">저장</button>
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
							<c:if test="${not empty subjectStudyPlanWeekList }">
                			<c:forEach items="${subjectStudyPlanWeekList }" var="studyPlan">
									 <tr>
										<td style="padding: 0px; margin: 0px;"><input class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value="${studyPlan.mngSubject}"></td>
										<td style="padding: 0px; margin: 0px;"><textarea class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;">${studyPlan.ssplanDetail}</textarea></td>
										<td style="padding: 0px; margin: 0px;"><input class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value="${studyPlan.ssplanAchievement}"><label class="col-sm-3">%</label></td>
									</tr>
								</c:forEach>	
								</c:if>		
								<c:if test="${empty subjectStudyPlanWeekList }" >	
								 <tr>
										<td style="padding: 0px; margin: 0px;"><input  id="subject1" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="sDetail1" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input id="sAchieve1" class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td style="padding: 0px; margin: 0px;"><input  id="subject2" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="sDetail2" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input id="sAchieve2" class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td style="padding: 0px; margin: 0px;"><input  id="subject3" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="sDetail3" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input id="sAchieve3" class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td style="padding: 0px; margin: 0px;"><input  id="subject4" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="sDetail4" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input id="sAchieve4" class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td style="padding: 0px; margin: 0px;"><input  id="subject5" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="sDetail5" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input id="sAchieve5" class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td style="padding: 0px; margin: 0px;"><input  id="subject6" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="sDetail6" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input id="sAchieve6" class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td style="padding: 0px; margin: 0px;"><input  id="subject7" class="subject" type="text" name="text" size="20" style="width:100%; height:53px; border: 0; text-align: center;" value=""></td>
										<td style="padding: 0px; margin: 0px;"><textarea id="sDetail7" class="SDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;"></textarea></td>
										<td style="padding: 0px; margin: 0px;"><input id="sAchieve7" class="col-sm-9 SAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
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
										<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;padding: 0px; margin: 0px;"><textarea class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" >${studyPlan.dsplanDetail}</textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value="${studyPlan.dsplanAchievement}"><label class="col-sm-3">%</label></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty dateStudyPlanWeekList }" >
									<tr>
										<td id="day1" class="dayTd" style="padding-top: 22px;"></td>
										<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; padding: 0px; margin: 0px;"><textarea id="dDetail1" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input id="dAchieve1" class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
								<tr>
										<td id="day2" class="dayTd" style="padding-top: 22px;"></td>
										<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; padding: 0px; margin: 0px;"><textarea id="dDetail2" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input id="dAchieve2" class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td id="day3" class="dayTd" style="padding-top: 22px;"></td>
										<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; padding: 0px; margin: 0px;"><textarea id="dDetail3" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input id="dAchieve3" class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td id="day4" class="dayTd" style="padding-top: 22px;"></td>
										<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; padding: 0px; margin: 0px;"><textarea id="dDetail4" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input id="dAchieve4" class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td id="day5" class="dayTd" style="padding-top: 22px;"></td>
										<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; padding: 0px; margin: 0px;"><textarea id="dDetail5" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input id="dAchieve5" class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td id="day6" class="dayTd" style="padding-top: 22px;"></td>
										<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; padding: 0px; margin: 0px;"><textarea id="dDetail6" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input id="dAchieve6" class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>
									<tr>
										<td id="day7" class="dayTd" style="padding-top: 22px;"></td>
										<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; padding: 0px; margin: 0px;"><textarea id="dDetail7" class="DDetail" name="content" rows="10" style="width:100%; height:53px; border: 0; resize: none;" ></textarea></td>
								        <td style="padding: 0px; margin: 0px;"><input id="dAchieve7" class="col-sm-9 DAchieve" type="number" name="text" size="20" min="0" max="100" style="width:100%; height:53px; border: 0; text-align: center;" value=""><label class="col-sm-3">%</label></td>
									</tr>

							</c:if>
							</tbody>
						</table>
						
								</div>
								</div>		
								</form>
								
								
									<div class="card card-dark card-outline">
							
								<div class="card-header">
									<h3 class="card-title">
										<i class="fas fa-comment"></i>
										&nbsp;
										선생님 피드백
									</h3>
								</div>
								
								<div class="card-body" style="padding: 0; margin: 0px;">
									<div class="direct-chat-messages" style="height: 60%; padding-top: 0px; padding-bottom: 0px;">
										<div class="direct-chat-msg">
											<div class="direct-chat-infos clearfix">
											<span id="mngName"  class="direct-chat-name float-left"  >

												${loginUser.mngName}T
											
											</span>
									</div>
									<%-- <img class="direct-chat-img" src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/ddabong.jpeg" alt="message user image"> --%>
									<div class="row" style="margin-left: 5px;">
												<div  id="profile2" style="border-radius: 100%;  height: 7vh; width: 6vh; border: 1px solid black; margin-right:5px;  padding: 0px;" ></div>
											
											<div class=" direct-chat-text" style="height: 60px; width: 880px; margin: 0px; padding: 0px;">
												<textarea id="feedback" class="" name="content" rows="10" style="width:100%; height:43px; padding:0px; margin:0px; border: 0px; resize: none; background-color: lightgray;">${studyPlanWeek.splanFeedback}</textarea>
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
					
					</div>
		
				<div id="userId" style="display: none;">
                     ${loginUser.id }
               </div>

</section>

<script>
	
window.onload=function(){

	
	
	let id = '${loginUser.id }';
	console.log(id);
	//alert('get picture 실행 테스트');
	 $('div#profile2').css({'background-image':'url('+"/manager/mamagermanagement/getManagerPicture.do?id="+id+')',
	     'background-position':'center',
	     'background-size':'cover',
	     'background-repeat':'no-repeat'
	     });
	 console.log('test');
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/* 	let Tname = $(".direct-chat-name float-left").attr("id"); */
	
	
	$("#studentList").on("change",function(){
		let week = $("#weekBtn").val();
		let mStudentId = $("#studentList option:selected").attr("id");
		//console.log(studentId);
		console.log(week);
		
		let dataItem = {
				"week" : week
			   ,"studentId" : mStudentId 
		}
		dataItem = JSON.stringify(dataItem)
		
		 $.ajax({
	          type: "post"
	         ,url : "/manager/studyPlan/studentRegistForm.do"
	         ,contentType: 'application/json'
	         ,data : dataItem
	         ,success : function (data){
	          	console.log(data);
	          	if(data.dateStudyPlanWeekList?.length){
	 	          	$("#day1").text(data.dateStudyPlanWeekList[0].dsplanDay);
	 	          	$("#dDetail1").val(data.dateStudyPlanWeekList[0].dsplanDetail);
	 	          	$("#dAchieve1").val(data.dateStudyPlanWeekList[0].dsplanAchievement);
	 	          	$("#day2").text(data.dateStudyPlanWeekList[1].dsplanDay);
	 	          	$("#dDetail2").val(data.dateStudyPlanWeekList[1].dsplanDetail);
	 	          	$("#dAchieve2").val(data.dateStudyPlanWeekList[1].dsplanAchievement);
	 	          	$("#day3").text(data.dateStudyPlanWeekList[2].dsplanDay);
	 	          	$("#dDetail3").val(data.dateStudyPlanWeekList[2].dsplanDetail);
	 	          	$("#dAchieve3").val(data.dateStudyPlanWeekList[2].dsplanAchievement);
	 	          	$("#day4").text(data.dateStudyPlanWeekList[3].dsplanDay);
	 	          	$("#dDetail4").val(data.dateStudyPlanWeekList[3].dsplanDetail);
	 	          	$("#dAchieve4").val(data.dateStudyPlanWeekList[3].dsplanAchievement);
	 	          	$("#day5").text(data.dateStudyPlanWeekList[4].dsplanDay);
	 	          	$("#dDetail5").val(data.dateStudyPlanWeekList[4].dsplanDetail);
	 	          	$("#dAchieve5").val(data.dateStudyPlanWeekList[4].dsplanAchievement);
	 	          	$("#day6").text(data.dateStudyPlanWeekList[5].dsplanDay);
	 	          	$("#dDetail6").val(data.dateStudyPlanWeekList[5].dsplanDetail);
	 	          	$("#dAchieve6").val(data.dateStudyPlanWeekList[5].dsplanAchievement);
	 	        	$("#day7").text(data.dateStudyPlanWeekList[6].dsplanDay);
		          	$("#dDetail7").val(data.dateStudyPlanWeekList[6].dsplanDetail);
		          	$("#dAchieve7").val(data.dateStudyPlanWeekList[6].dsplanAchievement);
		          	
		          	
		          	$("#subject1").val(data.subjectStudyPlanWeekList[0].mngSubject);
	 	          	$("#sDetail1").val(data.subjectStudyPlanWeekList[0].ssplanDetail);
	 	          	$("#sAchieve1").val(data.subjectStudyPlanWeekList[0].ssplanAchievement);
		          	$("#subject2").val(data.subjectStudyPlanWeekList[1].mngSubject);
	 	          	$("#sDetail2").val(data.subjectStudyPlanWeekList[1].ssplanDetail);
	 	          	$("#sAchieve2").val(data.subjectStudyPlanWeekList[1].ssplanAchievement);
		          	$("#subject3").val(data.subjectStudyPlanWeekList[2].mngSubject);
	 	          	$("#sDetail3").val(data.subjectStudyPlanWeekList[2].ssplanDetail);
	 	          	$("#sAchieve3").val(data.subjectStudyPlanWeekList[2].ssplanAchievement);
		          	$("#subject4").val(data.subjectStudyPlanWeekList[3].mngSubject);
	 	          	$("#sDetail4").val(data.subjectStudyPlanWeekList[3].ssplanDetail);
	 	          	$("#sAchieve4").val(data.subjectStudyPlanWeekList[3].ssplanAchievement);
		          	$("#subject5").val(data.subjectStudyPlanWeekList[4].mngSubject);
	 	          	$("#sDetail5").val(data.subjectStudyPlanWeekList[4].ssplanDetail);
	 	          	$("#sAchieve5").val(data.subjectStudyPlanWeekList[4].ssplanAchievement);
		          	$("#subject6").val(data.subjectStudyPlanWeekList[5].mngSubject);
	 	          	$("#sDetail6").val(data.subjectStudyPlanWeekList[5].ssplanDetail);
	 	          	$("#sAchieve6").val(data.subjectStudyPlanWeekList[5].ssplanAchievement);
		          	$("#subject7").val(data.subjectStudyPlanWeekList[6].mngSubject);
	 	          	$("#sDetail7").val(data.subjectStudyPlanWeekList[6].ssplanDetail);
	 	          	$("#sAchieve7").val(data.subjectStudyPlanWeekList[6].ssplanAchievement);
	 	          	
	 	          	$("#weekBtn").val(data.studyPlanWeek.splanWeek);
	 	          	$("#target").val(data.studyPlanWeek.splanTargettime);
	 	          	$("#actual").val(data.studyPlanWeek.splanActualtime);
	 	          	$("#feedback").val(data.studyPlanWeek.splanFeedback);
		          	} else {
			          	$("#dDetail1").val("");
			          	$("#dAchieve1").val("");
			          	$("#dDetail2").val("");
			          	$("#dAchieve2").val("");
			          	$("#dDetail3").val("");
			          	$("#dAchieve3").val("");
			          	$("#dDetail4").val("");
			          	$("#dAchieve4").val("");
			          	$("#dDetail5").val("");
			          	$("#dAchieve5").val("");
			          	$("#dDetail6").val("");
			          	$("#dAchieve6").val("");
			          	$("#dDetail7").val("");
			          	$("#dAchieve7").val("");
			          	
			          	
			          	$("#subject1").val("");
			          	$("#sDetail1").val("");
			          	$("#sAchieve1").val("");
			          	$("#subject2").val("");
			          	$("#sDetail2").val("");
			          	$("#sAchieve2").val("");
			          	$("#subject3").val("");
			          	$("#sDetail3").val("");
			          	$("#sAchieve3").val("");
			          	$("#subject4").val("");
			          	$("#sDetail4").val("");
			          	$("#sAchieve4").val("");
			          	$("#subject5").val("");
			          	$("#sDetail5").val("");
			          	$("#sAchieve5").val("");
			          	$("#subject6").val("");
			          	$("#sDetail6").val("");
			          	$("#sAchieve6").val("");
			          	$("#subject7").val("");
			          	$("#sDetail7").val("");
			          	$("#sAchieve7").val("");
			       
			          	$("#target").val("");
			          	$("#actual").val("");
			          	$("#feedback").val("");
		          	
		          	}
			          
		         }
		  	});
			
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
//	 	var sysyear = date.getFullYear();
//	 	var sysweek = date.getWeek();
//	 	var result = sysyear +"-W" + sysweek;
//	 	document.getElementById('weekBtn').value= date;
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

	    	
			let studentId = $("#studentList option:selected").attr("id");
			//console.log(studentId);
			
			let dataItem = {
					"week" : selectValue
				   ,"studentId" : studentId 
			}
			dataItem = JSON.stringify(dataItem);
			
			$.ajax({
		          type: "post"
		         ,url : "/manager/studyPlan/studentRegistForm.do"
		         ,contentType: 'application/json'
		         ,data : dataItem
		         ,success : function (data){
		          	console.log(data);
		          	if(data.dateStudyPlanWeekList.length){
			          	$("#day1").text(data.dateStudyPlanWeekList[0].dsplanDay);
			          	$("#dDetail1").val(data.dateStudyPlanWeekList[0].dsplanDetail);
			          	$("#dAchieve1").val(data.dateStudyPlanWeekList[0].dsplanAchievement);
			          	$("#day2").text(data.dateStudyPlanWeekList[1].dsplanDay);
			          	$("#dDetail2").val(data.dateStudyPlanWeekList[1].dsplanDetail);
			          	$("#dAchieve2").val(data.dateStudyPlanWeekList[1].dsplanAchievement);
			          	$("#day3").text(data.dateStudyPlanWeekList[2].dsplanDay);
			          	$("#dDetail3").val(data.dateStudyPlanWeekList[2].dsplanDetail);
			          	$("#dAchieve3").val(data.dateStudyPlanWeekList[2].dsplanAchievement);
			          	$("#day4").text(data.dateStudyPlanWeekList[3].dsplanDay);
			          	$("#dDetail4").val(data.dateStudyPlanWeekList[3].dsplanDetail);
			          	$("#dAchieve4").val(data.dateStudyPlanWeekList[3].dsplanAchievement);
			          	$("#day5").text(data.dateStudyPlanWeekList[4].dsplanDay);
			          	$("#dDetail5").val(data.dateStudyPlanWeekList[4].dsplanDetail);
			          	$("#dAchieve5").val(data.dateStudyPlanWeekList[4].dsplanAchievement);
			          	$("#day6").text(data.dateStudyPlanWeekList[5].dsplanDay);
			          	$("#dDetail6").val(data.dateStudyPlanWeekList[5].dsplanDetail);
			          	$("#dAchieve6").val(data.dateStudyPlanWeekList[5].dsplanAchievement);
			        	$("#day7").text(data.dateStudyPlanWeekList[6].dsplanDay);
			          	$("#dDetail7").val(data.dateStudyPlanWeekList[6].dsplanDetail);
			          	$("#dAchieve7").val(data.dateStudyPlanWeekList[6].dsplanAchievement);
			          	
			          	
			          	$("#subject1").val(data.subjectStudyPlanWeekList[0].mngSubject);
			          	$("#sDetail1").val(data.subjectStudyPlanWeekList[0].ssplanDetail);
			          	$("#sAchieve1").val(data.subjectStudyPlanWeekList[0].ssplanAchievement);
			          	$("#subject2").val(data.subjectStudyPlanWeekList[1].mngSubject);
			          	$("#sDetail2").val(data.subjectStudyPlanWeekList[1].ssplanDetail);
			          	$("#sAchieve2").val(data.subjectStudyPlanWeekList[1].ssplanAchievement);
			          	$("#subject3").val(data.subjectStudyPlanWeekList[2].mngSubject);
			          	$("#sDetail3").val(data.subjectStudyPlanWeekList[2].ssplanDetail);
			          	$("#sAchieve3").val(data.subjectStudyPlanWeekList[2].ssplanAchievement);
			          	$("#subject4").val(data.subjectStudyPlanWeekList[3].mngSubject);
			          	$("#sDetail4").val(data.subjectStudyPlanWeekList[3].ssplanDetail);
			          	$("#sAchieve4").val(data.subjectStudyPlanWeekList[3].ssplanAchievement);
			          	$("#subject5").val(data.subjectStudyPlanWeekList[4].mngSubject);
			          	$("#sDetail5").val(data.subjectStudyPlanWeekList[4].ssplanDetail);
			          	$("#sAchieve5").val(data.subjectStudyPlanWeekList[4].ssplanAchievement);
			          	$("#subject6").val(data.subjectStudyPlanWeekList[5].mngSubject);
			          	$("#sDetail6").val(data.subjectStudyPlanWeekList[5].ssplanDetail);
			          	$("#sAchieve6").val(data.subjectStudyPlanWeekList[5].ssplanAchievement);
			          	$("#subject7").val(data.subjectStudyPlanWeekList[6].mngSubject);
			          	$("#sDetail7").val(data.subjectStudyPlanWeekList[6].ssplanDetail);
			          	$("#sAchieve7").val(data.subjectStudyPlanWeekList[6].ssplanAchievement);
			          	
			          	$("#weekBtn").val(data.studyPlanWeek.splanWeek);
			          	$("#target").val(data.studyPlanWeek.splanTargettime);
			          	$("#actual").val(data.studyPlanWeek.splanActualtime);
			          	$("#feedback").val(data.studyPlanWeek.splanFeedback);
		          	} else {
			          	$("#dDetail1").val("");
			          	$("#dAchieve1").val("");
			          	$("#dDetail2").val("");
			          	$("#dAchieve2").val("");
			          	$("#dDetail3").val("");
			          	$("#dAchieve3").val("");
			          	$("#dDetail4").val("");
			          	$("#dAchieve4").val("");
			          	$("#dDetail5").val("");
			          	$("#dAchieve5").val("");
			          	$("#dDetail6").val("");
			          	$("#dAchieve6").val("");
			          	$("#dDetail7").val("");
			          	$("#dAchieve7").val("");
			          	
			          	
			          	$("#subject1").val("");
			          	$("#sDetail1").val("");
			          	$("#sAchieve1").val("");
			          	$("#subject2").val("");
			          	$("#sDetail2").val("");
			          	$("#sAchieve2").val("");
			          	$("#subject3").val("");
			          	$("#sDetail3").val("");
			          	$("#sAchieve3").val("");
			          	$("#subject4").val("");
			          	$("#sDetail4").val("");
			          	$("#sAchieve4").val("");
			          	$("#subject5").val("");
			          	$("#sDetail5").val("");
			          	$("#sAchieve5").val("");
			          	$("#subject6").val("");
			          	$("#sDetail6").val("");
			          	$("#sAchieve6").val("");
			          	$("#subject7").val("");
			          	$("#sDetail7").val("");
			          	$("#sAchieve7").val("");
			          	
			          	$("#target").val("");
			          	$("#actual").val("");
			          	$("#feedback").val("");
		          	}
		          
		         }
		  	});
			
		});
		
		
		
		
		$("#registBtn").click(function(){
			let week = $("#weekBtn").val();
			let target = $("#target").val();
			let actual = $("#actual").val();
			let feedback = $("#feedback").val();
		 	let mngId = $("#userId").text().trim(); 
			let mngName = $("#mngName").text().trim().replace("T","");
			
			
			let studyPlan = new Object();
			studyPlan.week = week;
			studyPlan.target = target;
			studyPlan.actual = actual;
			studyPlan.feedback = feedback;
			studyPlan.mngId = mngId; 
			studyPlan.mngName = mngName;
			
			console.log(studyPlan);

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
			
			
			let userId = $("#studentList option:selected").attr("id");
			console.log(userId);
			

			console.log(studyPlan)
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
	         ,url : "/manager/studyPlan/regist.do"
	         ,contentType: 'application/json'
	         ,data : dataItem
	         ,success : function (data){
	        	 	Swal.fire({
				        icon: 'success',
				        title: '저장이 완료 되었습니다!'
				    });
			    	setTimeout(function() {
				    	location.reload();
			    		}, 2000);
			     }
	         ,error : function(e){
	          }
	  		});

		});
	  	 
			

	  		 


		
		
		
		
		
		

//	     var dow = simple.getDay();
//	     var ISOweekStart = simple;
//	     if (dow <= 4)
//	         ISOweekStart.setDate(simple.getDate() - simple.getDay() + 1);
//	     else
//	         ISOweekStart.setDate(simple.getDate() + 8 - simple.getDay());
//	     return ISOweekStart;


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

		         