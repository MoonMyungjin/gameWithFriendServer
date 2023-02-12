<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<meta charset="UTF-8">
<title></title>
<style>
	div#tableArea2 {
		max-height: 560px;
		overflow-y: scroll;
	}
</style>
</head>
<body>
<script>
	<c:if test="${msg eq 'ok'}" >
		alert("시간표가 적용되었습니다!");	
	</c:if>
</script>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }">시간표관리</h1>
              <!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '시간표관리') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '시간표관리') == -1}">
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
   <div class="card-header">
   	<div class="row">
   		<div class="col-sm-3">
   			<div class="card card-outline card-dark">
				<div class="card-header">
				<h3 class="card-title">정보입력</h3>
					<div class="card-tools">
						<div class="input-group input-group-sm">
						<button id="weekDayReflectionBtn" type="submit" class="btn btn-dark">
							반영
						</button>
					</div>
					</div>
				</div>
				<div class="card-body" style="text-align: right;">
					(시간단위 : 분)<br><br>
					<div class="row">
						<div class="col-sm-12">
							<table>
								<tr>
									<td style="width: 40%;">시작시간&nbsp;&nbsp;</td>
									<td><input id="weekdaySTime" class="form-control" type="time" value="${weekDayInfo.ttsettingStartTime }"></td>
								</tr>
								<tr>
									<td>수업시간&nbsp;&nbsp;</td>
									<td><input id="weekdayCTime" class="form-control" type="number" min="0" max="2359" value="${weekDayInfo.ttsettingClassTime }"></td>
								</tr>
								<tr>
									<td>쉬는시간&nbsp;&nbsp;</td>
									<td><input id="weekdayBTime" class="form-control" type="number" min="0" value="${weekDayInfo.ttsettingBreakTerm }"></td>
								</tr>
								<tr>
									<td>교시수&nbsp;&nbsp;</td>
									<td><input id="weekdayPCount" class="form-control" type="number" min="0" value="${weekDayInfo.ttsettingPeriodCount }"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
   		</div>
   		
   		<div class="col-sm-9">
   			<div class="card card-outline card-dark">
				<div class="card-header">
				<h3 class="card-title">미리보기</h3>
					<div class="card-tools">
					<div class="input-group input-group-sm">
						<button id="weekdayConfirmBtn" type="submit" class="btn btn-dark">
							확정
						</button>
					</div>
				</div>
			</div>
				<div id="tableArea1" class="card-body">
					<table class="table table-bordered">
							<tbody><tr>
								<th style="width: 10%">
									</th>
								<th  style="width: 15%">
									시간
								</th>
								<th style="width: 10%">월</th>
								<th style="width: 10%">화</th>
								<th style="width: 10%">수</th>
								<th style="width: 10%">목</th>
								<th style="width: 10%">금</th>
								<th style="width: 10%">토</th>
								<th style="width: 10%">일</th>
							</tr>
							<c:forEach items="${ttMap.weekDayList}" var="wdList">
								<tr>
									<td>
										${wdList.timetablePeriod}교시<br>
									</td>
									<td>
										${wdList.timetableStartTime }~ ${wdList.timetableEndTime }
									</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
   		</div>
   	</div>
   	
   </div>
   <div class="card-body">
   	
   </div>
</section>

<script>
	window.onload=function(){
		$("#weekDayReflectionBtn").click(function(){
// 			alert("abc");
			let weekdaySTime = $("#weekdaySTime").val();
			let weekdayCTime = parseInt($("#weekdayCTime").val());
			let weekdayBTime = parseInt($("#weekdayBTime").val());
			let weekdayPCount = parseInt($("#weekdayPCount").val());
			
			let result = `<table class="table table-bordered">
								<tbody><tr>
								<th style="width: 10%">
								</th>
							<th  style="width: 15%">
								시간
							</th>
							<th style="width: 10%">월</th>
							<th style="width: 10%">화</th>
							<th style="width: 10%">수</th>
							<th style="width: 10%">목</th>
							<th style="width: 10%">금</th>
							<th style="width: 10%">토</th>
							<th style="width: 10%">일</th>
							</tr>
							`;
			for (var i=1; i<=weekdayPCount; i++) {
				
				let remindHour = Math.floor(weekdayCTime / 60);
				weekdayCTime2 = weekdayCTime - remindHour * 60;
				
				weekdaySTime2 = weekdaySTime.split(":");
				weekdayHour = parseInt(weekdaySTime2[0]) + remindHour;
				weekdayMinute = parseInt(weekdaySTime2[1]) + weekdayCTime2;
				
				if(weekdayMinute>60){
					weekdayMinute = weekdayMinute-60;
					weekdayHour = weekdayHour +1;
				}
				
				if (weekdayHour<10){
					weekdayHour = "0"+weekdayHour
				}
					
				
				let weekdayEndTime = weekdayHour + ":" + weekdayMinute;
				
				weekdayHour = parseInt(weekdayHour);
				if (weekdaySTime2[1]<10){
					weekdaySTime2[1] = "0"+weekdaySTime2[1];
					weekdaySTime2[1] = weekdaySTime2[1].substr(0,2);
				}
				weekdaySTime2 = weekdaySTime2[0] + ":" + weekdaySTime2[1];
				let TimeRange = weekdaySTime2 + "~" + weekdayEndTime;
				
				let remindHour2 = Math.floor((weekdayMinute+weekdayBTime) / 60);
				weekdayHour = weekdayHour + remindHour2;
				weekdayMinute = (weekdayMinute + weekdayBTime)%60;

				let weekdayRealEndTime = weekdayHour + ":" + weekdayMinute;
				weekdaySTime = weekdayRealEndTime;
				
				result += `<tr>
								<td>`;
				result += i+"교시";
				result += `	</td>`;
				result += `<td>`;
				result += TimeRange;
				result += `	</td>`;
				
				result +=  "<td class='ttvalue' id='mon' period='"+i+"' starttime='"+weekdaySTime2+"' endtime='"+weekdayEndTime+"'></td>";
				result +=  "<td class='ttvalue' id='tue' period='"+i+"' starttime='"+weekdaySTime2+"' endtime='"+weekdayEndTime+"'></td>";
				result +=  "<td class='ttvalue' id='wed' period='"+i+"' starttime='"+weekdaySTime2+"' endtime='"+weekdayEndTime+"'></td>";
				result +=  "<td class='ttvalue' id='thu' period='"+i+"' starttime='"+weekdaySTime2+"' endtime='"+weekdayEndTime+"'></td>";
				result +=  "<td class='ttvalue' id='fri' period='"+i+"' starttime='"+weekdaySTime2+"' endtime='"+weekdayEndTime+"'></td>";
				result +=  "<td class='ttvalue' id='sat' period='"+i+"' starttime='"+weekdaySTime2+"' endtime='"+weekdayEndTime+"'></td>";
				result +=  "<td class='ttvalue' id='sun' period='"+i+"' starttime='"+weekdaySTime2+"' endtime='"+weekdayEndTime+"'></td>";
				result += ` </tr>`;
			}
			result += `</tbody>
						</table>`;
			$("#tableArea1").html(result);
		});
		
		$("#weekdayConfirmBtn").click(function(){
			let newIds = [];
			let newPeriods = [];
			let newStarttime = [];
			let newEndtime = [];
			let ttInfoArr = new Array();
			
			
			$(".ttvalue").each(function(i){
				let ttInfo = new Object();
				
				newIds = $(this).attr('id');
				newPeriods = $(this).attr('period');
				newStarttime = $(this).attr('starttime');
				newEndtime = $(this).attr('endtime');
				
				ttInfo.timetableId = newIds+newPeriods;
				ttInfo.timetableDayOfWeek = newIds;
				ttInfo.timetablePeriod = parseInt(newPeriods);
				ttInfo.timetableStartTime = newStarttime;
				ttInfo.timetableEndTime = newEndtime;
				ttInfoArr.push(ttInfo);
			});
			
			let ttSettingValue = new Object();
			ttSettingValue.ttsettingStartTime =  $("#weekdaySTime").val();
			ttSettingValue.ttsettingClassTime =  parseInt($("#weekdayCTime").val());
			ttSettingValue.ttsettingBreakTerm =  parseInt($("#weekdayBTime").val());
			ttSettingValue.ttsettingPeriodCount =  parseInt($("#weekdayPCount").val());
			
			
			let dataItem = {
				category : "weekDay"
			   ,timeList : ttInfoArr
			   ,timeSettingInfo : ttSettingValue
			};
			
			dataItem = JSON.stringify(dataItem);
			console.log(dataItem);
			
			$.ajax({
		        type: "post"
		       ,url : "/manager/timetable/update.do"
		       ,contentType: 'application/json'
		       ,data : dataItem
		       ,success : function (data){
		        	location.reload();
		        }
		       ,error : function(e){
		        }
			});
		});
		
		$("#weekendConfirmBtn").click(function(){
			let newIds2 = [];
			let newPeriods2 = [];
			let newStarttime2 = [];
			let newEndtime2 = [];
			let ttInfoArr2 = new Array();
			
			
			$(".ttvalue2").each(function(i){
				let ttInfo2 = new Object();
				
				newIds2 = $(this).attr('id');
				newPeriods2 = $(this).attr('period');
				newStarttime2 = $(this).attr('starttime');
				newEndtime2 = $(this).attr('endtime');
				
				ttInfo2.timetableId = newIds2+newPeriods2;
				ttInfo2.timetableDayOfWeek = newIds2;
				ttInfo2.timetablePeriod = parseInt(newPeriods2);
				ttInfo2.timetableStartTime = newStarttime2;
				ttInfo2.timetableEndTime = newEndtime2;
				ttInfoArr2.push(ttInfo2);
			});
			
			let ttSettingValue2 = new Object();
			ttSettingValue2.ttsettingStartTime =  $("#weekendSTime").val();
			ttSettingValue2.ttsettingClassTime =  parseInt($("#weekendCTime").val());
			ttSettingValue2.ttsettingBreakTerm =  parseInt($("#weekendBTime").val());
			ttSettingValue2.ttsettingPeriodCount =  parseInt($("#weekendPCount").val());
			
			let dataItem2 = {
				category : "weekEnd"
			   ,timeList : ttInfoArr2
			   ,timeSettingInfo : ttSettingValue2
			};
			
			dataItem2 = JSON.stringify(dataItem2);
			console.log(dataItem2);
			
			$.ajax({
		        type: "post"
		       ,url : "/manager/timetable/update.do"
		       ,contentType: 'application/json'
		       ,data : dataItem2
		       ,success : function (data){
		        	console.log(data);
		        }
		       ,error : function(e){
		        }
			});
		});

		
	}
	
</script>
<script>
</script>
