<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="selectAttMember" value="${dataMap.selectAttMember }" />
<c:set var="selectChildList" value="${dataMap.selectChildList }" />
<c:set var="selectChildList2" value="${dataMap.selectChildList2 }" />
<c:set var="cate" value="${dataMap.cate }" />
<c:set var="name" value="${dataMap.name }" />
<c:set var="id" value="${dataMap.id }" />
<head>
<meta charset="UTF-8">
<title></title>
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
	</style>
</head>
 
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>


<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }">출석내역</h1>
              <!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '출석내역') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '출석내역') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
                            
           </div>
         
        </div>
   </div>
</section>
<section class="content">
		<div class="container-fluid">
			<div class="row">
				
				<!-- 좌측 영역 -->
				<div class="col-sm-12">
						
						<div class="card card-light card-outline" style="height:35vh;">
							<div class="card-header">
								<div class="row">
									<div class="col-sm-5">
										<h3 class="card-title" >
											<i class="fas fa-check"></i> &nbsp;&nbsp;${name}&nbsp;출석 내역
										</h3>
										<div class="custom-control custom-radio col-xs-3" style="display: inline; margin-left: 2vh; ">
											<input class="custom-control-input" type="radio" id="customRadio1" name="customRadio" checked> 
											<label for="customRadio1" class="custom-control-label">
											일주일별 출력
											</label>
										</div>
										<div class="custom-control custom-radio" style="display: inline; margin-left: 1vh; ">
											<input class="custom-control-input" type="radio" id="customRadio2" name="customRadio"> 
											<label for="customRadio2" class="custom-control-label">
												월전체 출력
											</label>
										</div>
									</div>
									<div class="col-sm-4">
										
									</div>
									<div class="col-sm-3">
										
									</div>
								</div>
								<div class="row" style="margin-top: 2vh; margin-bottom: 2vh;">
									
										<div class="col-sm-5">
											<div class="row">
												<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
													<div class="input-group-append">
														<input id="startDateAtt" value="" type="date" class="form-control"> <span id="waveSpan" style="font-size: 20px;">&nbsp;&nbsp;~&nbsp;&nbsp;</span>
													</div>
													<div class="input-group-append">
														<input id="endDateAtt" value="" type="date" class="form-control">
													</div>
													<div class="input-group-append">
														<input id="monthDateAtt"  type="month" class="form-control" style="display: none">
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm-4">
											
										</div>
										<div class="col-sm-3">
											<select class="form-control" id="selectController1">
												<option>자녀 선택</option>
											<c:forEach items="${selectChildList}" var="selectChildList" varStatus="loop" >
												<option data-name="${selectChildList.name}" value="${selectChildList.id}">${selectChildList.name}</option>										
											</c:forEach>
											</select>
										</div>
									
							</div>
							<div class="card-body" style="padding-top: 5px;">
								
							<div class="row" style="max-height: 15vh;">
								<table class="table table-head-fixed table-bordered" style="height: 15vh;" >
							
										<thead >
										
											<tr>
												<th>출석</th>
												<th>결석</th>
												<th>지각</th>
												<th>조퇴</th>
												<th>외출</th>
						
											</tr>
										</thead>
										<tbody>
											<tr>
												<td id="memAttCountAttendance">0</td>
												<td id="memAttCountAbsent">0</td>
												<td id="memAttCountlate">0</td>
												<td id="memAttCountEarlyLeave">0</td>
												<td id="memAttCountOuting">0</td>
												
											</tr>
										
										</tbody>
										<thead >
										
											<tr>
												<th >지각&조퇴</th>
												<th>지각&외출</th>
												<th>외출&조퇴</th>
												<th>지각&외출&조퇴</th>
												<th>100분의 50미만 출석</th>
												
											</tr>
										</thead>
										<tbody>
											<tr>
												<td id="memAttCountlateAndMemAttCountEarlyLeave">0</td>
												<td id="memAttCountlateAndMemAttCountOuting">0</td>
												<td id="memAttCountOutingAndMemAttCountEarlyLeave">0</td>
												<td id="memAttCountlateAndMemAttCountEarlyLeaveAndMemAttCountOuting">0</td>
												<td id="fitHalfOneAtt">0</td>
												
											</tr>
										
										</tbody>
									</table>
							</div>
							
						</div>
						</div>
						<div class="card card-light card-outline" style="height:46vh;">
							<div class="card-header">
								<div class="row">
									<div class="col-sm-5">
										<h3 class="card-title">
											<i class="fas fa-check"></i> &nbsp;&nbsp;${name}&nbsp;출석 상세 리스트
										</h3>
									</div>
									<div class="col-sm-4">
										
									</div>
									<div class="col-sm-3">
									
									</div>
								</div>
							</div>
							<div class="card-body" style="padding-top: 5px;">
						
							<div id="memAttTableDiv" class="row table1" style="max-height: 35vh;">
								<table id="memAttTable" class="table table-head-fixed table-bordered" style="height: 15vh;" >
							
										<thead >
										
											<tr>
												<th>일자</th>
												<th>입실시간</th>
												<th>퇴실시간</th>
												<th>수업시간</th>
												<th>실수업시간(분)</th>
												<th>출결상태</th>
						
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${selectAttMember}" var="selectAttMember" varStatus="loop" >
											<tr>
												<c:if test="${selectAttMember.atnDate eq null}">	
													<td id="memAttDate${loop.index }">수업없음</td>
												</c:if>
												<c:if test="${selectAttMember.atnDate ne null}">	
													<td id="memAttDate${loop.index }">
														<fmt:parseDate value='${selectAttMember.atnDate }' var='trading_day' pattern='yyyy-MM-dd'/>
														<fmt:formatDate value="${trading_day}" pattern='yyyy-MM-dd'/>
													</td>
												</c:if>
												
												<td id="go${loop.index }" style="width: 20vh;">${selectAttMember.atnGoTime }</td>
												<td id="out${loop.index }" style="width: 20vh;">${selectAttMember.atnOutTime }</td>
												<td id="startAndEnd${loop.index }">${selectAttMember.minStart }&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;${selectAttMember.maxEnd }</td>
												<td id="realLessonTime${loop.index }">${selectAttMember.realTimeLesson }</td>
												<td id="attYn${loop.index }">${selectAttMember.atnYnManager }</td>
												<td class="indexList" style="display: none;">${loop.index }</td>
												<td id="attreason${loop.index }" style="display: none;">${selectAttMember.atnReason }</td>
												<td id="attreason${loop.index }" style="display: none;">${selectAttMember.studentId }</td>
												
											</tr>
										</c:forEach>	
										</tbody>
									
									</table>
							</div>
							
						</div>
						</div>
						
						
						
				</div>
			</div>
		</div>
		</div>
</section>
<script>

window.onload=function(){
	
	
	
	
	
	let checkYn =[];
	let memAttDateCheck = [];
	let nowDate = moment();
	let miusDate = moment().subtract(6,'days');
	let formatDate = nowDate.format('YYYY-MM-DD');
	let totalCountForAtt = 0;
	let totalCountForAbsent = 0;
	let totalCountForattendance = 0;
	let totalCountForLate = 0;
	let totalCountForEarlyLeave = 0;
	let totalCountForOuting = 0;
	let totalCountForLateAndTotalCountForEarlyLeave =0;
	let totalCountForLateAndTotalCountForOuting =0;
	let	totalCountForEarlyLeaveAndTotalCountForOuting = 0;
	let totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting = 0;
	let studyLessonTimeDutyHalfDownCount = 0;
	let categoryForSelect = '${cate}';
	let memAttlVOList = [];
	let memAttlVO = {};
	let memAttlVOList2 = [];
	let memAttlVO2 = {};
	let studentIdForMemAtt ="";	
	let childSelectVal ="";

	let renewnowDate = nowDate.format('YYYY-MM-DD');
	console.log(renewnowDate)
	let renewmiusDate = miusDate.format('YYYY-MM-DD');
	$('#startDateAtt').val(renewmiusDate);
	
	$('#endDateAtt').val(renewnowDate);
	
	
	
	
	if(categoryForSelect !='p'){
		$('#selectController2').attr('style','display:none;');
		$('#selectController1').attr('style','display:none;');
	}
	$('#customRadio2').change(function() {
		$('#startDateAtt').attr('style','display:none;');
		$('#endDateAtt').attr('style','display:none;');
		$('#waveSpan').attr('style','display:none;');
		$('#monthDateAtt').attr('style','display:block;');
		let monthDate = moment().format("YYYY-MM");
		
		
		let startOfMonth = moment().startOf('month').format('DD');
		let endOfMonth   = moment().format('DD');
		console.log(startOfMonth)
		console.log(endOfMonth)
		let MonthSize= (Number(endOfMonth) - Number(startOfMonth))+1;
		
		$('#monthDateAtt').val(monthDate);
		
		
		
		
		
		$(document).delegate('#monthDateAtt','change',function(){
			
			
			
			let checkYn =[];
			let memAttDateCheck = [];
			let nowDate = moment();
			let miusDate = moment().subtract(6,'days');
			let formatDate = nowDate.format('YYYY-MM-DD');
			let totalCountForAtt = 0;
			let totalCountForAbsent = 0;
			let totalCountForattendance = 0;
			let totalCountForLate = 0;
			let totalCountForEarlyLeave = 0;
			let totalCountForOuting = 0;
			let totalCountForLateAndTotalCountForEarlyLeave =0;
			let totalCountForLateAndTotalCountForOuting =0;
			let	totalCountForEarlyLeaveAndTotalCountForOuting = 0;
			let totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting = 0;
			let studyLessonTimeDutyHalfDownCount = 0;
			let categoryForSelect = '${cate}';
			let memAttlVOList = [];
			let memAttlVO = {};
			let memAttlVOList3 = [];
			let memAttlVO3 = {};
			let studentIdForMemAtt ="";	
			let childSelectVal ="";
			
			
			let changeMomthValue = document.getElementById("monthDateAtt").value;
			console.log(changeMomthValue)
			let startOfMonth2 = moment(changeMomthValue).startOf('month').format('DD');
			let endOfMonth2   = moment(changeMomthValue).endOf('month').format('DD');
			console.log(startOfMonth2)
			console.log(endOfMonth2)
			let MonthSize2= (Number(endOfMonth2) - Number(startOfMonth2))+1;
			
			for(let q=0; q<MonthSize2; ++q){
	  	 		let renewendDateVal = moment(changeMomthValue);
	  	 		
	  			let renewendDateValmius = renewendDateVal.add(q,'days');
	  			
	  			let endDateForAtt = renewendDateValmius._d;
	  			
	  		 	let renewendDateForAtt = moment(endDateForAtt).format('YYYY-MM-DD');
	  		 	console.log(renewendDateForAtt)
	  		 	if(childSelectVal !=""){
	  		 		
	  				studentIdForMemAtt = childSelectVal;
	  			}else{
	  				if(categoryForSelect !='p'){
	  					studentIdForMemAtt='${loginUser.id }';
	  				}else if(categoryForSelect ='p'){
	  					studentIdForMemAtt='${id}';
	  				}
	  			}
	  			memAttlVO3 ={
	  					nowDate: renewendDateForAtt,
	  					studentId: studentIdForMemAtt
	  			};
	  			
	  			memAttlVOList3.push(memAttlVO3);
	  		}
			  	let dataItem4 = {
						memAttlVOList : memAttlVOList3
					  
				};
	  			dataItem4 = JSON.stringify(dataItem4);
			
	  			$.ajax({
	  		        type: "post"
	  		       ,url : "/member/attandance/listMonth.do"
	  		       ,contentType: 'application/json'
	  		       ,data : dataItem4
	  		       ,success : function (data){
	  		    	 	
	  		    	   if(moment().format('MM') < moment(changeMomthValue).format('MM')){
	  		    		   alert("당해 월보다 높은 월은 조회하실수없습니다.");
	  		    		   return;
	  		    	   }
	  		    	 	if(moment().format('MM') == moment(changeMomthValue).format('MM')){
	  		    	 		
	  		    	 		
	  		    	 		MonthSize2 = ( Number(moment().format('DD'))- Number(startOfMonth2))+1;
	  		    	 		
	  		    	   }
	  		    	 		
	  		    	 	console.log(data.selectAttMember)
	  		    	 	if((data.selectAttMember.length) != MonthSize2){
	  		    	 		console.log("test")
	  		    	 		console.log(MonthSize2)
	  		    	 		data.selectAttMember.length = MonthSize2;
	  		    	 		
	  		    	 	}
	  		    	 	
	  		    	 	printData(data,$('#memAttTable'),$('#memAttTableDiv'),$('#memAttSearchList-template'));
	  		    	 	
	  		    	 	
  		    		for(let p=0; p<MonthSize2; ++p){
  		    			let indexString2 = p.toString();
		    			let newnowDate2 = moment(changeMomthValue).endOf('month');
 		    			let miusnewnowDate2 = newnowDate2.subtract(p,'days');
		    			let formatmiusnewnowDate2 = miusnewnowDate2.format('YYYY-MM-DD');
 		    			console.log(formatmiusnewnowDate2)
		    			$('#memAttDate'+indexString2).text(formatmiusnewnowDate2)
	  		    			
	  		    		}
	  		    		
	  		    		for(let i =0; i<MonthSize2; ++i){
	  		    			
	  		    			
	  		    			
	  		    			
	  		    			
	  		    			let  stringIndex = (i).toString();
	  		    			let pushbefore = $('#attYn'+stringIndex).text();
	  		    			let trimPush = pushbefore.replace(/-/gi, "");
	  		    			console.log(trimPush)
	  		    			checkYn.push(trimPush);
	  		    			
	  		    			if(checkYn[i] == 'Y'){
	  		    				$('#attYn'+stringIndex).text('출석');
	  		    				totalCountForattendance = totalCountForattendance +1;
	  		    			}else if(checkYn[i] == 'N'){
	  		    				$('#attYn'+stringIndex).text('결석');
	  		    				totalCountForAbsent = totalCountForAbsent +1;
	  		    			}
	  		    			
	  		    			memAttDateCheck.push($('#memAttDate'+stringIndex).text());
	  		    			
	  						
	  		    		/* 	let ajaxDate = $('#memAttDate'+stringIndex).text();
	  		    			console.log(ajaxDate);
	  		    			let formatajaxDate = moment().format('YYYY-MM-DD');
	  		    			$('#memAttDate'+stringIndex).text(formatajaxDate); */
	  		    			
	  		    			if(data.selectAttMember[i] ==null){
	  		    				
	  		    				
	  		    					console.log("test");
	  		    					console.log(data.selectAttMember[i]);
	  		    					$('#attYn'+stringIndex).text('');
	  		    					$('#go'+stringIndex).attr('colspan','2');
	  		    					$('#go'+stringIndex).text('수업없음');
	  		    					$('#go'+stringIndex).next().remove();
	  		    				
	  		    				
	  		    			}
	  		    			if($('#attYn'+stringIndex).text() =='출석'){
	  		    				
	  		    				
	  		    				
	  		    				let attTimeForLate =$('#go'+stringIndex).text().toString();
	  		    				let outTimeForEarlyLeave = $('#out'+stringIndex).text().toString();
	  		    				
	  		    			
	  		    				
	  		    				let cutAttTimeForLate = attTimeForLate.slice(11,(attTimeForLate.length)-3);
	  		    				let cutOutTimeForEarlyLeave = outTimeForEarlyLeave.slice(11,(attTimeForLate.length)-3);
	  		    				
	  		    				
	  		    				
	  		    				let startAndEndreal =$('#startAndEnd'+stringIndex).text();
	  		    				let cutstartAndEndreal = startAndEndreal.substr(0,5);
	  		    				let cutstartAndEndreal2 = startAndEndreal.slice(12,(attTimeForLate.length));
	  		    				
	  		    			
	  		    				if(cutAttTimeForLate>cutstartAndEndreal){
	  		    					totalCountForLate = totalCountForLate +1;
	  		    					$('#memAttCountlate').text(totalCountForLate);
	  		    				}
	  		    				
	  		    				if(cutstartAndEndreal2>cutOutTimeForEarlyLeave){
	  		    					totalCountForEarlyLeave = totalCountForEarlyLeave +1;
	  		    					$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
	  		    				}
	  		    				
	  		    				let attReasonForOutingCheck = $('#attreason'+stringIndex).text();
	  		    				let attReasonForOutingCheckSplit = attReasonForOutingCheck.split(":");
	  		    				
	  		    				
	  		    				
	  		    				if(attReasonForOutingCheckSplit[0] =='외출'){
	  		    					totalCountForOuting = totalCountForOuting +1;
	  		    					$('#memAttCountOuting').text(totalCountForOuting);
	  		    				}
	  		    				
	  		    				if(cutAttTimeForLate>cutstartAndEndreal && cutstartAndEndreal2>cutOutTimeForEarlyLeave){
	  		    					totalCountForLateAndTotalCountForEarlyLeave = totalCountForLateAndTotalCountForEarlyLeave +1;
	  		    					totalCountForLate = totalCountForLate -1;
	  		    					totalCountForEarlyLeave = totalCountForEarlyLeave -1;
	  		    					$('#memAttCountlateAndMemAttCountEarlyLeave').text(totalCountForLateAndTotalCountForEarlyLeave);
	  		    					$('#memAttCountlate').text(totalCountForLate);
	  		    					$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
	  		    				}
	  		    				
	  		    				if(cutAttTimeForLate>cutstartAndEndreal && attReasonForOutingCheckSplit[0] =='외출'){
	  		    					totalCountForLateAndTotalCountForOuting = totalCountForLateAndTotalCountForOuting +1;
	  		    					totalCountForLate = totalCountForLate -1;
	  		    					totalCountForOuting = totalCountForOuting -1;
	  		    					$('#memAttCountlateAndMemAttCountOuting').text(totalCountForLateAndTotalCountForOuting);
	  		    					$('#memAttCountlate').text(totalCountForLate);
	  		    					$('#memAttCountOuting').text(totalCountForOuting);
	  		    				}
	  		    				
	  		    				if(cutstartAndEndreal2>cutOutTimeForEarlyLeave && attReasonForOutingCheckSplit[0] =='외출'){
	  		    					totalCountForEarlyLeaveAndTotalCountForOuting = totalCountForEarlyLeaveAndTotalCountForOuting +1;
	  		    					totalCountForEarlyLeave = totalCountForEarlyLeave -1;
	  		    					totalCountForOuting = totalCountForOuting -1;
	  		    					$('#memAttCountOutingAndMemAttCountEarlyLeave').text(totalCountForEarlyLeaveAndTotalCountForOuting);
	  		    					$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
	  		    					$('#memAttCountOuting').text(totalCountForOuting);
	  		    				}
	  		    				if(cutstartAndEndreal2>cutOutTimeForEarlyLeave && attReasonForOutingCheckSplit[0] =='외출' && cutAttTimeForLate>cutstartAndEndreal){
	  		    					totalCountForEarlyLeaveAndTotalCountForOuting = totalCountForEarlyLeaveAndTotalCountForOuting -1;
	  		    					totalCountForLateAndTotalCountForOuting = totalCountForLateAndTotalCountForOuting -1;
	  		    					totalCountForLateAndTotalCountForEarlyLeave = totalCountForLateAndTotalCountForEarlyLeave -1;
	  		    					totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting = totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting +1;
	  		    					$('#memAttCountlateAndMemAttCountOuting').text(totalCountForLateAndTotalCountForOuting);
	  		    					$('#memAttCountOutingAndMemAttCountEarlyLeave').text(totalCountForEarlyLeaveAndTotalCountForOuting);
	  		    					$('#memAttCountlateAndMemAttCountEarlyLeave').text(totalCountForLateAndTotalCountForEarlyLeave);
	  		    					$('#memAttCountlateAndMemAttCountEarlyLeaveAndMemAttCountOuting').text(totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting);
	  		    				}
	  		    			
	  		    				let timeSide2 = new Date($('#go'+stringIndex).text())
	  		    				let timeSide = new Date($('#out'+stringIndex).text())
	  		    			
	  		    				let countTimeForAtt = (timeSide.getTime() - timeSide2.getTime());
	  		    				
	  		    				let milChangeMit = Math.round(countTimeForAtt/60000);
	  		    				let dutyLessonTime = $('#realLessonTime'+stringIndex).text();
	  		    			
	  		    				if(dutyLessonTime/2 - milChangeMit >0){
	  		    					studyLessonTimeDutyHalfDownCount = studyLessonTimeDutyHalfDownCount +1;
	  		    					$('#fitHalfOneAtt').text(studyLessonTimeDutyHalfDownCount);
	  		    				}
	  		    			}
	  		    			
	  		    			
	  		    			
	  		    		}
	  		    		$('#memAttCountAttendance').text(totalCountForattendance);
	  		    		$('#memAttCountAbsent').text(totalCountForAbsent);
	  		    	   	
	  		    	 	
	  	   			}
	  			   ,error : function(e){
	  			    }
	  			});
		});		
		
		
		
		
		  for(let q=0; q<MonthSize; ++q){
  	 		let renewendDateVal = moment();
  			let renewendDateValmius = renewendDateVal.subtract(q,'days');
  			
  			let endDateForAtt = renewendDateValmius._d;
  		
  		 	let renewendDateForAtt = moment(endDateForAtt).format('YYYY-MM-DD');
  		 	if(childSelectVal !=""){
  		 		
  				studentIdForMemAtt = childSelectVal;
  			}else{
  				if(categoryForSelect !='p'){
  					studentIdForMemAtt='${loginUser.id }';
  				}else if(categoryForSelect ='p'){
  					studentIdForMemAtt='${id}';
  				}
  			}
  			memAttlVO2 ={
  					nowDate: renewendDateForAtt,
  					studentId: studentIdForMemAtt
  			};
  			
  			memAttlVOList2.push(memAttlVO2);
  		}
		  	let dataItem3 = {
					memAttlVOList : memAttlVOList2
				  
			};
  			dataItem3 = JSON.stringify(dataItem3);
			
		
		$.ajax({
	        type: "post"
	       ,url : "/member/attandance/listMonth.do"
	       ,contentType: 'application/json'
	       ,data : dataItem3
	       ,success : function (data){
	    	 	console.log(data)
	    	 	console.log(MonthSize)
	    	 	console.log(data.selectAttMember)
	    	 	if((data.selectAttMember.length) != MonthSize){
	    	 		console.log("test")
	    	 		data.selectAttMember.length = MonthSize;
	    	 	}
	    	 	console.log(data)
	    	 	printData(data,$('#memAttTable'),$('#memAttTableDiv'),$('#memAttSearchList-template'));
	    	 	
	    	 	
	    		for(let p=0; p<MonthSize; ++p){
	    			let indexString2 = p.toString();
	    			let newnowDate2 = moment();
	    			let miusnewnowDate2 = newnowDate2.subtract(p,'days');
	    			let formatmiusnewnowDate2 = miusnewnowDate2.format('YYYY-MM-DD');
	    			console.log(formatmiusnewnowDate2)
	    			$('#memAttDate'+indexString2).text(formatmiusnewnowDate2)
	    			
	    		}
	    		
	    		for(let i =0; i<MonthSize; ++i){
	    			
	    			
	    			
	    			
	    			
	    			let  stringIndex = (i).toString();
	    			let pushbefore = $('#attYn'+stringIndex).text();
	    			let trimPush = pushbefore.replace(/-/gi, "");
	    			console.log(trimPush)
	    			checkYn.push(trimPush);
	    			
	    			if(checkYn[i] == 'Y'){
	    				$('#attYn'+stringIndex).text('출석');
	    				totalCountForattendance = totalCountForattendance +1;
	    			}else if(checkYn[i] == 'N'){
	    				$('#attYn'+stringIndex).text('결석');
	    				totalCountForAbsent = totalCountForAbsent +1;
	    			}
	    			
	    			memAttDateCheck.push($('#memAttDate'+stringIndex).text());
	    			
					
	    		/* 	let ajaxDate = $('#memAttDate'+stringIndex).text();
	    			console.log(ajaxDate);
	    			let formatajaxDate = moment().format('YYYY-MM-DD');
	    			$('#memAttDate'+stringIndex).text(formatajaxDate); */
	    			
	    			if(data.selectAttMember[i] ==null){
	    				
	    				
	    				
	    					$('#attYn'+stringIndex).text('');
	    					$('#go'+stringIndex).attr('colspan','2');
	    					$('#go'+stringIndex).text('수업없음');
	    					$('#go'+stringIndex).next().remove();
	    				
	    				
	    			}
	    			if($('#attYn'+stringIndex).text() =='출석'){
	    				
	    				
	    				
	    				let attTimeForLate =$('#go'+stringIndex).text().toString();
	    				let outTimeForEarlyLeave = $('#out'+stringIndex).text().toString();
	    				
	    			
	    				
	    				let cutAttTimeForLate = attTimeForLate.slice(11,(attTimeForLate.length)-3);
	    				let cutOutTimeForEarlyLeave = outTimeForEarlyLeave.slice(11,(attTimeForLate.length)-3);
	    				
	    				
	    				
	    				let startAndEndreal =$('#startAndEnd'+stringIndex).text();
	    				let cutstartAndEndreal = startAndEndreal.substr(0,5);
	    				let cutstartAndEndreal2 = startAndEndreal.slice(12,(attTimeForLate.length));
	    				
	    			
	    				if(cutAttTimeForLate>cutstartAndEndreal){
	    					totalCountForLate = totalCountForLate +1;
	    					$('#memAttCountlate').text(totalCountForLate);
	    				}
	    				
	    				if(cutstartAndEndreal2>cutOutTimeForEarlyLeave){
	    					totalCountForEarlyLeave = totalCountForEarlyLeave +1;
	    					$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
	    				}
	    				
	    				let attReasonForOutingCheck = $('#attreason'+stringIndex).text();
	    				let attReasonForOutingCheckSplit = attReasonForOutingCheck.split(":");
	    				
	    				
	    				
	    				if(attReasonForOutingCheckSplit[0] =='외출'){
	    					totalCountForOuting = totalCountForOuting +1;
	    					$('#memAttCountOuting').text(totalCountForOuting);
	    				}
	    				
	    				if(cutAttTimeForLate>cutstartAndEndreal && cutstartAndEndreal2>cutOutTimeForEarlyLeave){
	    					totalCountForLateAndTotalCountForEarlyLeave = totalCountForLateAndTotalCountForEarlyLeave +1;
	    					totalCountForLate = totalCountForLate -1;
	    					totalCountForEarlyLeave = totalCountForEarlyLeave -1;
	    					$('#memAttCountlateAndMemAttCountEarlyLeave').text(totalCountForLateAndTotalCountForEarlyLeave);
	    					$('#memAttCountlate').text(totalCountForLate);
	    					$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
	    				}
	    				
	    				if(cutAttTimeForLate>cutstartAndEndreal && attReasonForOutingCheckSplit[0] =='외출'){
	    					totalCountForLateAndTotalCountForOuting = totalCountForLateAndTotalCountForOuting +1;
	    					totalCountForLate = totalCountForLate -1;
	    					totalCountForOuting = totalCountForOuting -1;
	    					$('#memAttCountlateAndMemAttCountOuting').text(totalCountForLateAndTotalCountForOuting);
	    					$('#memAttCountlate').text(totalCountForLate);
	    					$('#memAttCountOuting').text(totalCountForOuting);
	    				}
	    				
	    				if(cutstartAndEndreal2>cutOutTimeForEarlyLeave && attReasonForOutingCheckSplit[0] =='외출'){
	    					totalCountForEarlyLeaveAndTotalCountForOuting = totalCountForEarlyLeaveAndTotalCountForOuting +1;
	    					totalCountForEarlyLeave = totalCountForEarlyLeave -1;
	    					totalCountForOuting = totalCountForOuting -1;
	    					$('#memAttCountOutingAndMemAttCountEarlyLeave').text(totalCountForEarlyLeaveAndTotalCountForOuting);
	    					$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
	    					$('#memAttCountOuting').text(totalCountForOuting);
	    				}
	    				if(cutstartAndEndreal2>cutOutTimeForEarlyLeave && attReasonForOutingCheckSplit[0] =='외출' && cutAttTimeForLate>cutstartAndEndreal){
	    					totalCountForEarlyLeaveAndTotalCountForOuting = totalCountForEarlyLeaveAndTotalCountForOuting -1;
	    					totalCountForLateAndTotalCountForOuting = totalCountForLateAndTotalCountForOuting -1;
	    					totalCountForLateAndTotalCountForEarlyLeave = totalCountForLateAndTotalCountForEarlyLeave -1;
	    					totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting = totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting +1;
	    					$('#memAttCountlateAndMemAttCountOuting').text(totalCountForLateAndTotalCountForOuting);
	    					$('#memAttCountOutingAndMemAttCountEarlyLeave').text(totalCountForEarlyLeaveAndTotalCountForOuting);
	    					$('#memAttCountlateAndMemAttCountEarlyLeave').text(totalCountForLateAndTotalCountForEarlyLeave);
	    					$('#memAttCountlateAndMemAttCountEarlyLeaveAndMemAttCountOuting').text(totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting);
	    				}
	    			
	    				let timeSide2 = new Date($('#go'+stringIndex).text())
	    				let timeSide = new Date($('#out'+stringIndex).text())
	    			
	    				let countTimeForAtt = (timeSide.getTime() - timeSide2.getTime());
	    				
	    				let milChangeMit = Math.round(countTimeForAtt/60000);
	    				let dutyLessonTime = $('#realLessonTime'+stringIndex).text();
	    			
	    				if(dutyLessonTime/2 - milChangeMit >0){
	    					studyLessonTimeDutyHalfDownCount = studyLessonTimeDutyHalfDownCount +1;
	    					$('#fitHalfOneAtt').text(studyLessonTimeDutyHalfDownCount);
	    				}
	    			}
	    			
	    			
	    			
	    		}
	    		$('#memAttCountAttendance').text(totalCountForattendance);
	    		$('#memAttCountAbsent').text(totalCountForAbsent);
	    	   	
	    	 	
   			}
		   ,error : function(e){
		    }
		});
		

	
		

		
	});
	$('#customRadio1').change(function() {
		let changeWeekDate = moment();
		$('#startDateAtt').attr('style','display:block');
		$('#endDateAtt').attr('style','display:block');
		$('#waveSpan').attr('style','display:block;');
		$('#monthDateAtt').attr('style','display:none;');
		$('#endDateAtt').attr("value",changeWeekDate);
		$('#endDateAtt').change(); 
	});
	
	
$(document).delegate('#selectController1','change',function(){
	childSelectVal = $(this).val();
	console.log(childSelectVal)
	copyForSelectChild(childSelectVal);
	
});	
$(document).delegate('#endDateAtt','change',function(){
	
	
	
	
	let endDateVal = $('#endDateAtt').val();
	
	
	if(endDateVal > formatDate){
		alert("현재 날짜보다 이후 날짜는 선택하실수 없습니다.");
		$('#endDateAtt').val(formatDate);
		return;
	}
	if(childSelectVal !=""){
	
		studentIdForMemAtt = childSelectVal;
	}else{
		if(categoryForSelect !='p'){
			studentIdForMemAtt='${loginUser.id }';
		}else if(categoryForSelect ='p'){
			studentIdForMemAtt='${id}';
		}
	}
	
	
	
	
	
 	 for(let j=0; j<7; ++j){
 		let renewendDateVal = moment(endDateVal);
		let renewendDateValmius = renewendDateVal.subtract(j,'days');
		
		let endDateForAtt = renewendDateValmius._d;
	
	 	let renewendDateForAtt = moment(endDateForAtt).format('YYYY-MM-DD');
	
		memAttlVO ={
				nowDate: renewendDateForAtt,
				studentId: studentIdForMemAtt
		};
		memAttlVOList.push(memAttlVO);
	}
	console.log(memAttlVOList)
	if(memAttlVOList.length >7){
		memAttlVOList.splice(0, 7);
	}
	let dataItem = {
			memAttlVOList : memAttlVOList
		  
	};
	 	
 	dataItem = JSON.stringify(dataItem);
 	console.log($(this).val())
 	let thisvalue = $(this).val();
 
	$.ajax({
        type: "post"
       ,url : "/member/attandance/listweek.do"
       ,contentType: 'application/json'
       ,data : dataItem
       ,success : function (data){
    	   console.log(thisvalue);
    	   console.log(data);
    	   printData(data,$('#memAttTable'),$('#memAttTableDiv'),$('#memAttSearchList-template'));
    	   	
    		for(let o=0; o<7; ++o){
    			let indexString = o.toString();
    			let newnowDate = moment(thisvalue);
    			let miusnewnowDate = newnowDate.subtract(o,'days');
    			let formatmiusnewnowDate = miusnewnowDate.format('YYYY-MM-DD');
    			$('#memAttDate'+indexString).text(formatmiusnewnowDate)
    			if(o == 6){
    				$('#startDateAtt').val(formatmiusnewnowDate);
    			}
    		}
    	   
    	   
    	   
    		let checkYn =[];
    		let memAttDateCheck = [];
    		let nowDate = moment();
    		let miusDate = moment().subtract(6,'days');
    		let formatDate = nowDate.format('YYYY-MM-DD');
    		let totalCountForAtt = 0;
    		let totalCountForAbsent = 0;
    		let totalCountForattendance = 0;
    		let totalCountForLate = 0;
    		let totalCountForEarlyLeave = 0;
    		let totalCountForOuting = 0;
    		let totalCountForLateAndTotalCountForEarlyLeave =0;
    		let totalCountForLateAndTotalCountForOuting =0;
    		let	totalCountForEarlyLeaveAndTotalCountForOuting = 0;
    		let totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting = 0;
    		let studyLessonTimeDutyHalfDownCount = 0;
    		let categoryForSelect = '${cate}';
    		let memAttlVOList = [];
    		let memAttlVO = {};
    		let studentIdForMemAtt ="";	
    		

    		let renewnowDate = nowDate.format('YYYY-MM-DD');
    		let renewmiusDate = miusDate.format('YYYY-MM-DD');
    		
    		
    		
    		
    		
    		if(categoryForSelect !='p'){
    			$('#selectController2').attr('style','display:none;');
    			$('#selectController1').attr('style','display:none;');
    		}else if(categoryForSelect ='p'){
    			studentIdForMemAtt='${id}';
    		}
    		console.log(studentIdForMemAtt)
    		let indexList = $('.indexList').text();
    		let indexReal = indexList.length;
    		
    		totalCountForAtt = totalCountForAtt + indexReal;
    		
    		if($('#memAttDate'+'0').text() == '수업없음'){
    			$('#memAttDate'+'0').text(formatDate);
    			$('#attYn'+'0').text('');
    			$('#go'+'0').attr('colspan','2');
    			$('#go'+'0').text('수업없음');
    			$('#go'+'0').next().remove();
    			
    		}
    		
    		for(let i =0; i<indexReal; ++i){
    			
    			
    			
    			
    			
    			let  stringIndex = (i).toString();
    			checkYn.push($('#attYn'+stringIndex).text());
    			if(checkYn[i] == 'Y'){
    				$('#attYn'+stringIndex).text('출석');
    				totalCountForattendance = totalCountForattendance +1;
    			}else if(checkYn[i] == 'N'){
    				$('#attYn'+stringIndex).text('결석');
    				
    				totalCountForAbsent = totalCountForAbsent +1;
    			}
    			
    			memAttDateCheck.push($('#memAttDate'+stringIndex).text());
    			
				
    		/* 	let ajaxDate = $('#memAttDate'+stringIndex).text();
    			console.log(ajaxDate);
    			let formatajaxDate = moment().format('YYYY-MM-DD');
    			$('#memAttDate'+stringIndex).text(formatajaxDate); */
    			
    			if(data.selectAttMember[i] ==null){
    				
    				
    				
    					$('#attYn'+stringIndex).text('');
    					$('#go'+stringIndex).attr('colspan','2');
    					$('#go'+stringIndex).text('수업없음');
    					$('#go'+stringIndex).next().remove();
    				
    				
    			}
    			if($('#attYn'+stringIndex).text() =='출석'){
    				
    				
    				
    				let attTimeForLate =$('#go'+stringIndex).text().toString();
    				let outTimeForEarlyLeave = $('#out'+stringIndex).text().toString();
    				
    			
    				
    				let cutAttTimeForLate = attTimeForLate.slice(11,(attTimeForLate.length)-3);
    				let cutOutTimeForEarlyLeave = outTimeForEarlyLeave.slice(11,(attTimeForLate.length)-3);
    				
    				
    				
    				let startAndEndreal =$('#startAndEnd'+stringIndex).text();
    				let cutstartAndEndreal = startAndEndreal.substr(0,5);
    				let cutstartAndEndreal2 = startAndEndreal.slice(12,(attTimeForLate.length));
    				
    			
    				if(cutAttTimeForLate>cutstartAndEndreal){
    					totalCountForLate = totalCountForLate +1;
    					$('#memAttCountlate').text(totalCountForLate);
    				}
    				
    				if(cutstartAndEndreal2>cutOutTimeForEarlyLeave){
    					totalCountForEarlyLeave = totalCountForEarlyLeave +1;
    					$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
    				}
    				
    				let attReasonForOutingCheck = $('#attreason'+stringIndex).text();
    				let attReasonForOutingCheckSplit = attReasonForOutingCheck.split(":");
    				
    				
    				
    				if(attReasonForOutingCheckSplit[0] =='외출'){
    					totalCountForOuting = totalCountForOuting +1;
    					$('#memAttCountOuting').text(totalCountForOuting);
    				}
    				
    				if(cutAttTimeForLate>cutstartAndEndreal && cutstartAndEndreal2>cutOutTimeForEarlyLeave){
    					totalCountForLateAndTotalCountForEarlyLeave = totalCountForLateAndTotalCountForEarlyLeave +1;
    					totalCountForLate = totalCountForLate -1;
    					totalCountForEarlyLeave = totalCountForEarlyLeave -1;
    					$('#memAttCountlateAndMemAttCountEarlyLeave').text(totalCountForLateAndTotalCountForEarlyLeave);
    					$('#memAttCountlate').text(totalCountForLate);
    					$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
    				}
    				
    				if(cutAttTimeForLate>cutstartAndEndreal && attReasonForOutingCheckSplit[0] =='외출'){
    					totalCountForLateAndTotalCountForOuting = totalCountForLateAndTotalCountForOuting +1;
    					totalCountForLate = totalCountForLate -1;
    					totalCountForOuting = totalCountForOuting -1;
    					$('#memAttCountlateAndMemAttCountOuting').text(totalCountForLateAndTotalCountForOuting);
    					$('#memAttCountlate').text(totalCountForLate);
    					$('#memAttCountOuting').text(totalCountForOuting);
    				}
    				
    				if(cutstartAndEndreal2>cutOutTimeForEarlyLeave && attReasonForOutingCheckSplit[0] =='외출'){
    					totalCountForEarlyLeaveAndTotalCountForOuting = totalCountForEarlyLeaveAndTotalCountForOuting +1;
    					totalCountForEarlyLeave = totalCountForEarlyLeave -1;
    					totalCountForOuting = totalCountForOuting -1;
    					$('#memAttCountOutingAndMemAttCountEarlyLeave').text(totalCountForEarlyLeaveAndTotalCountForOuting);
    					$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
    					$('#memAttCountOuting').text(totalCountForOuting);
    				}
    				if(cutstartAndEndreal2>cutOutTimeForEarlyLeave && attReasonForOutingCheckSplit[0] =='외출' && cutAttTimeForLate>cutstartAndEndreal){
    					totalCountForEarlyLeaveAndTotalCountForOuting = totalCountForEarlyLeaveAndTotalCountForOuting -1;
    					totalCountForLateAndTotalCountForOuting = totalCountForLateAndTotalCountForOuting -1;
    					totalCountForLateAndTotalCountForEarlyLeave = totalCountForLateAndTotalCountForEarlyLeave -1;
    					totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting = totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting +1;
    					$('#memAttCountlateAndMemAttCountOuting').text(totalCountForLateAndTotalCountForOuting);
    					$('#memAttCountOutingAndMemAttCountEarlyLeave').text(totalCountForEarlyLeaveAndTotalCountForOuting);
    					$('#memAttCountlateAndMemAttCountEarlyLeave').text(totalCountForLateAndTotalCountForEarlyLeave);
    					$('#memAttCountlateAndMemAttCountEarlyLeaveAndMemAttCountOuting').text(totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting);
    				}
    			
    				let timeSide2 = new Date($('#go'+stringIndex).text())
    				let timeSide = new Date($('#out'+stringIndex).text())
    			
    				let countTimeForAtt = (timeSide.getTime() - timeSide2.getTime());
    				
    				let milChangeMit = Math.round(countTimeForAtt/60000);
    				let dutyLessonTime = $('#realLessonTime'+stringIndex).text();
    			
    				if(dutyLessonTime/2 - milChangeMit >0){
    					studyLessonTimeDutyHalfDownCount = studyLessonTimeDutyHalfDownCount +1;
    					$('#fitHalfOneAtt').text(studyLessonTimeDutyHalfDownCount);
    				}
    			}
    			
    			
    			
    		}
    		$('#memAttCountAttendance').text(totalCountForattendance);
    		$('#memAttCountAbsent').text(totalCountForAbsent);
    	   	
        }
       ,error : function(e){
        }
	});
	
	

	
	
	
});	

	
	
	
	let indexList = $('.indexList').text();
	let indexReal = indexList.length;
	
	totalCountForAtt = totalCountForAtt + indexReal;
	
	if($('#memAttDate'+'0').text() == '수업없음'){
		$('#memAttDate'+'0').text(formatDate);
		$('#attYn'+'0').text('');
		$('#go'+'0').attr('colspan','2');
		$('#go'+'0').text('수업없음');
		$('#go'+'0').next().remove();
		
	}
	
	for(let i =0; i<indexReal; ++i){
		let  stringIndex = (i).toString();
		checkYn.push($('#attYn'+stringIndex).text());
		if(checkYn[i] == 'Y'){
			$('#attYn'+stringIndex).text('출석');
			totalCountForattendance = totalCountForattendance +1;
		}else if(checkYn[i] == 'N'){
			$('#attYn'+stringIndex).text('결석');
			totalCountForAbsent = totalCountForAbsent +1;
		}
		
		memAttDateCheck.push($('#memAttDate'+stringIndex).text());
		

		
		if(memAttDateCheck[i] =='수업없음'){
			
			if(i !== 0){
				let oneDayOut =  moment().subtract(i,'days');
				let renewDayOut= oneDayOut.format('YYYY-MM-DD');
				$('#memAttDate'+stringIndex).text(renewDayOut);
				$('#attYn'+stringIndex).text('');
				$('#go'+stringIndex).attr('colspan','2');
				$('#go'+stringIndex).text('수업없음');
				$('#go'+stringIndex).next().remove();
			}
			
		}
		if($('#attYn'+stringIndex).text() =='출석'){
			
			
			
			let attTimeForLate =$('#go'+stringIndex).text().toString();
			let outTimeForEarlyLeave = $('#out'+stringIndex).text().toString();
			
			
			
			let cutAttTimeForLate = attTimeForLate.slice(11,(attTimeForLate.length)-3);
			let cutOutTimeForEarlyLeave = outTimeForEarlyLeave.slice(11,(attTimeForLate.length)-3);
			
		
			
			let startAndEndreal =$('#startAndEnd'+stringIndex).text();
			let cutstartAndEndreal = startAndEndreal.substr(0,5);
			let cutstartAndEndreal2 = startAndEndreal.slice(12,(attTimeForLate.length));
			
		
			if(cutAttTimeForLate>cutstartAndEndreal){
				totalCountForLate = totalCountForLate +1;
				$('#memAttCountlate').text(totalCountForLate);
			}
			
			if(cutstartAndEndreal2>cutOutTimeForEarlyLeave){
				totalCountForEarlyLeave = totalCountForEarlyLeave +1;
				$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
			}
			
			let attReasonForOutingCheck = $('#attreason'+stringIndex).text();
			let attReasonForOutingCheckSplit = attReasonForOutingCheck.split(":");
			
			
			
			if(attReasonForOutingCheckSplit[0] =='외출'){
				totalCountForOuting = totalCountForOuting +1;
				$('#memAttCountOuting').text(totalCountForOuting);
			}
			
			if(cutAttTimeForLate>cutstartAndEndreal && cutstartAndEndreal2>cutOutTimeForEarlyLeave){
				totalCountForLateAndTotalCountForEarlyLeave = totalCountForLateAndTotalCountForEarlyLeave +1;
				totalCountForLate = totalCountForLate -1;
				totalCountForEarlyLeave = totalCountForEarlyLeave -1;
				$('#memAttCountlateAndMemAttCountEarlyLeave').text(totalCountForLateAndTotalCountForEarlyLeave);
				$('#memAttCountlate').text(totalCountForLate);
				$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
			}
			
			if(cutAttTimeForLate>cutstartAndEndreal && attReasonForOutingCheckSplit[0] =='외출'){
				totalCountForLateAndTotalCountForOuting = totalCountForLateAndTotalCountForOuting +1;
				totalCountForLate = totalCountForLate -1;
				totalCountForOuting = totalCountForOuting -1;
				$('#memAttCountlateAndMemAttCountOuting').text(totalCountForLateAndTotalCountForOuting);
				$('#memAttCountlate').text(totalCountForLate);
				$('#memAttCountOuting').text(totalCountForOuting);
			}
			
			if(cutstartAndEndreal2>cutOutTimeForEarlyLeave && attReasonForOutingCheckSplit[0] =='외출'){
				totalCountForEarlyLeaveAndTotalCountForOuting = totalCountForEarlyLeaveAndTotalCountForOuting +1;
				totalCountForEarlyLeave = totalCountForEarlyLeave -1;
				totalCountForOuting = totalCountForOuting -1;
				$('#memAttCountOutingAndMemAttCountEarlyLeave').text(totalCountForEarlyLeaveAndTotalCountForOuting);
				$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
				$('#memAttCountOuting').text(totalCountForOuting);
			}
			if(cutstartAndEndreal2>cutOutTimeForEarlyLeave && attReasonForOutingCheckSplit[0] =='외출' && cutAttTimeForLate>cutstartAndEndreal){
				totalCountForEarlyLeaveAndTotalCountForOuting = totalCountForEarlyLeaveAndTotalCountForOuting -1;
				totalCountForLateAndTotalCountForOuting = totalCountForLateAndTotalCountForOuting -1;
				totalCountForLateAndTotalCountForEarlyLeave = totalCountForLateAndTotalCountForEarlyLeave -1;
				totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting = totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting +1;
				$('#memAttCountlateAndMemAttCountOuting').text(totalCountForLateAndTotalCountForOuting);
				$('#memAttCountOutingAndMemAttCountEarlyLeave').text(totalCountForEarlyLeaveAndTotalCountForOuting);
				$('#memAttCountlateAndMemAttCountEarlyLeave').text(totalCountForLateAndTotalCountForEarlyLeave);
				$('#memAttCountlateAndMemAttCountEarlyLeaveAndMemAttCountOuting').text(totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting);
			}
		
			let timeSide2 = new Date($('#go'+stringIndex).text())
			let timeSide = new Date($('#out'+stringIndex).text())
		
			let countTimeForAtt = (timeSide.getTime() - timeSide2.getTime());
			
			let milChangeMit = Math.round(countTimeForAtt/60000);
			let dutyLessonTime = $('#realLessonTime'+stringIndex).text();
		
			if(dutyLessonTime/2 - milChangeMit >0){
				studyLessonTimeDutyHalfDownCount = studyLessonTimeDutyHalfDownCount +1;
				$('#fitHalfOneAtt').text(studyLessonTimeDutyHalfDownCount);
			}
		}
		
		
		
	}
	$('#memAttCountAttendance').text(totalCountForattendance);
	$('#memAttCountAbsent').text(totalCountForAbsent);
	

}
function printData(data,delArea,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	delArea.remove();
	target.append(html);
}

function copyForSelectChild(childSelectVal) {
	
	let checkYn =[];
	let memAttDateCheck = [];
	let nowDate = moment();
	let miusDate = moment().subtract(6,'days');
	let formatDate = nowDate.format('YYYY-MM-DD');
	let totalCountForAtt = 0;
	let totalCountForAbsent = 0;
	let totalCountForattendance = 0;
	let totalCountForLate = 0;
	let totalCountForEarlyLeave = 0;
	let totalCountForOuting = 0;
	let totalCountForLateAndTotalCountForEarlyLeave =0;
	let totalCountForLateAndTotalCountForOuting =0;
	let	totalCountForEarlyLeaveAndTotalCountForOuting = 0;
	let totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting = 0;
	let studyLessonTimeDutyHalfDownCount = 0;
	let categoryForSelect = '${cate}';
	let memAttlVOList = [];
	let memAttlVO = {};
	let studentIdForMemAtt ="";	
	
	
	
	let changeId = childSelectVal;
	let endDateVal = $('#endDateAtt').val();
	
	
	if(endDateVal > formatDate){
		alert("현재 날짜보다 이후 날짜는 선택하실수 없습니다.");
		$('#endDateAtt').val(formatDate);
		return;
	}
	
	if(categoryForSelect !='p'){
		studentIdForMemAtt='${loginUser.id }';
	}else if(categoryForSelect ='p'){
		studentIdForMemAtt=changeId;
	}
	
 	 for(let j=0; j<7; ++j){
 		let renewendDateVal = moment(endDateVal);
		let renewendDateValmius = renewendDateVal.subtract(j,'days');
		
		let endDateForAtt = renewendDateValmius._d;
	
	 	let renewendDateForAtt = moment(endDateForAtt).format('YYYY-MM-DD');
	
		memAttlVO ={
				nowDate: renewendDateForAtt,
				studentId: studentIdForMemAtt
		};
		memAttlVOList.push(memAttlVO);
	}
	console.log(memAttlVOList)
	if(memAttlVOList.length >7){
		memAttlVOList.splice(0, 7);
	}
	
	let dataItem2 = {
			memAttlVOList : memAttlVOList
		  
	};
	console.log(dataItem2) 	
 	dataItem2 = JSON.stringify(dataItem2);
	console.log(dataItem2) 	
 	
 	
	$.ajax({
        type: "post"
       ,url : "/member/attandance/listweek.do"
       ,contentType: 'application/json'
       ,data : dataItem2
       ,success : function (data){
    	 
    	   console.log(data);
    	   printData(data,$('#memAttTable'),$('#memAttTableDiv'),$('#memAttSearchList-template'));
    	   	
    		
    	   
    	   
    		let checkYn =[];
    		let memAttDateCheck = [];
    		let nowDate = moment();
    		let miusDate = moment().subtract(6,'days');
    		let formatDate = nowDate.format('YYYY-MM-DD');
    		let totalCountForAtt = 0;
    		let totalCountForAbsent = 0;
    		let totalCountForattendance = 0;
    		let totalCountForLate = 0;
    		let totalCountForEarlyLeave = 0;
    		let totalCountForOuting = 0;
    		let totalCountForLateAndTotalCountForEarlyLeave =0;
    		let totalCountForLateAndTotalCountForOuting =0;
    		let	totalCountForEarlyLeaveAndTotalCountForOuting = 0;
    		let totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting = 0;
    		let studyLessonTimeDutyHalfDownCount = 0;
    		let categoryForSelect = '${cate}';
    		let memAttlVOList = [];
    		let memAttlVO = {};
    		let studentIdForMemAtt ="";	
    		

    		let renewnowDate = nowDate.format('YYYY-MM-DD');
    		let renewmiusDate = miusDate.format('YYYY-MM-DD');
    		
    		
    		
    		
    		
    		if(categoryForSelect !='p'){
    			$('#selectController2').attr('style','display:none;');
    			$('#selectController1').attr('style','display:none;');
    		}else if(categoryForSelect ='p'){
    			studentIdForMemAtt='${id}';
    		}
    		console.log(studentIdForMemAtt)
    		let indexList = $('.indexList').text();
    		let indexReal = indexList.length;
    		
    		totalCountForAtt = totalCountForAtt + indexReal;
    		
    		if($('#memAttDate'+'0').text() == '수업없음'){
    			$('#memAttDate'+'0').text(formatDate);
    			$('#attYn'+'0').text('');
    			$('#go'+'0').attr('colspan','2');
    			$('#go'+'0').text('수업없음');
    			$('#go'+'0').next().remove();
    			
    		}
    		
    		for(let i =0; i<indexReal; ++i){
    			
    			
    			
    			
    			
    			let  stringIndex = (i).toString();
    			checkYn.push($('#attYn'+stringIndex).text());
    			if(checkYn[i] == 'Y'){
    				$('#attYn'+stringIndex).text('출석');
    				totalCountForattendance = totalCountForattendance +1;
    			}else if(checkYn[i] == 'N'){
    				$('#attYn'+stringIndex).text('결석');
    				totalCountForAbsent = totalCountForAbsent +1;
    			}
    			
    			memAttDateCheck.push($('#memAttDate'+stringIndex).text());
    			
				
    		/* 	let ajaxDate = $('#memAttDate'+stringIndex).text();
    			console.log(ajaxDate);
    			let formatajaxDate = moment().format('YYYY-MM-DD');
    			$('#memAttDate'+stringIndex).text(formatajaxDate); */
    			
    			if(data.selectAttMember[i] ==null){
    				
    				
    				
    					$('#attYn'+stringIndex).text('');
    					$('#go'+stringIndex).attr('colspan','2');
    					$('#go'+stringIndex).text('수업없음');
    					$('#go'+stringIndex).next().remove();
    				
    				
    			}
    			if($('#attYn'+stringIndex).text() =='출석'){
    				
    				
    				
    				let attTimeForLate =$('#go'+stringIndex).text().toString();
    				let outTimeForEarlyLeave = $('#out'+stringIndex).text().toString();
    				
    			
    				
    				let cutAttTimeForLate = attTimeForLate.slice(11,(attTimeForLate.length)-3);
    				let cutOutTimeForEarlyLeave = outTimeForEarlyLeave.slice(11,(attTimeForLate.length)-3);
    				
    				
    				
    				let startAndEndreal =$('#startAndEnd'+stringIndex).text();
    				let cutstartAndEndreal = startAndEndreal.substr(0,5);
    				let cutstartAndEndreal2 = startAndEndreal.slice(12,(attTimeForLate.length));
    				
    			
    				if(cutAttTimeForLate>cutstartAndEndreal){
    					totalCountForLate = totalCountForLate +1;
    					$('#memAttCountlate').text(totalCountForLate);
    				}
    				
    				if(cutstartAndEndreal2>cutOutTimeForEarlyLeave){
    					totalCountForEarlyLeave = totalCountForEarlyLeave +1;
    					$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
    				}
    				
    				let attReasonForOutingCheck = $('#attreason'+stringIndex).text();
    				let attReasonForOutingCheckSplit = attReasonForOutingCheck.split(":");
    				
    				
    				
    				if(attReasonForOutingCheckSplit[0] =='외출'){
    					totalCountForOuting = totalCountForOuting +1;
    					$('#memAttCountOuting').text(totalCountForOuting);
    				}
    				
    				if(cutAttTimeForLate>cutstartAndEndreal && cutstartAndEndreal2>cutOutTimeForEarlyLeave){
    					totalCountForLateAndTotalCountForEarlyLeave = totalCountForLateAndTotalCountForEarlyLeave +1;
    					totalCountForLate = totalCountForLate -1;
    					totalCountForEarlyLeave = totalCountForEarlyLeave -1;
    					$('#memAttCountlateAndMemAttCountEarlyLeave').text(totalCountForLateAndTotalCountForEarlyLeave);
    					$('#memAttCountlate').text(totalCountForLate);
    					$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
    				}
    				
    				if(cutAttTimeForLate>cutstartAndEndreal && attReasonForOutingCheckSplit[0] =='외출'){
    					totalCountForLateAndTotalCountForOuting = totalCountForLateAndTotalCountForOuting +1;
    					totalCountForLate = totalCountForLate -1;
    					totalCountForOuting = totalCountForOuting -1;
    					$('#memAttCountlateAndMemAttCountOuting').text(totalCountForLateAndTotalCountForOuting);
    					$('#memAttCountlate').text(totalCountForLate);
    					$('#memAttCountOuting').text(totalCountForOuting);
    				}
    				
    				if(cutstartAndEndreal2>cutOutTimeForEarlyLeave && attReasonForOutingCheckSplit[0] =='외출'){
    					totalCountForEarlyLeaveAndTotalCountForOuting = totalCountForEarlyLeaveAndTotalCountForOuting +1;
    					totalCountForEarlyLeave = totalCountForEarlyLeave -1;
    					totalCountForOuting = totalCountForOuting -1;
    					$('#memAttCountOutingAndMemAttCountEarlyLeave').text(totalCountForEarlyLeaveAndTotalCountForOuting);
    					$('#memAttCountEarlyLeave').text(totalCountForEarlyLeave);
    					$('#memAttCountOuting').text(totalCountForOuting);
    				}
    				if(cutstartAndEndreal2>cutOutTimeForEarlyLeave && attReasonForOutingCheckSplit[0] =='외출' && cutAttTimeForLate>cutstartAndEndreal){
    					totalCountForEarlyLeaveAndTotalCountForOuting = totalCountForEarlyLeaveAndTotalCountForOuting -1;
    					totalCountForLateAndTotalCountForOuting = totalCountForLateAndTotalCountForOuting -1;
    					totalCountForLateAndTotalCountForEarlyLeave = totalCountForLateAndTotalCountForEarlyLeave -1;
    					totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting = totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting +1;
    					$('#memAttCountlateAndMemAttCountOuting').text(totalCountForLateAndTotalCountForOuting);
    					$('#memAttCountOutingAndMemAttCountEarlyLeave').text(totalCountForEarlyLeaveAndTotalCountForOuting);
    					$('#memAttCountlateAndMemAttCountEarlyLeave').text(totalCountForLateAndTotalCountForEarlyLeave);
    					$('#memAttCountlateAndMemAttCountEarlyLeaveAndMemAttCountOuting').text(totalCountForLateAndTotalCountForEarlyLeaveAndTotalCountForOuting);
    				}
    			
    				let timeSide2 = new Date($('#go'+stringIndex).text())
    				let timeSide = new Date($('#out'+stringIndex).text())
    			
    				let countTimeForAtt = (timeSide.getTime() - timeSide2.getTime());
    				
    				let milChangeMit = Math.round(countTimeForAtt/60000);
    				let dutyLessonTime = $('#realLessonTime'+stringIndex).text();
    			
    				if(dutyLessonTime/2 - milChangeMit >0){
    					studyLessonTimeDutyHalfDownCount = studyLessonTimeDutyHalfDownCount +1;
    					$('#fitHalfOneAtt').text(studyLessonTimeDutyHalfDownCount);
    				}
    			}
    			
    			
    			
    		}
    		$('#memAttCountAttendance').text(totalCountForattendance);
    		$('#memAttCountAbsent').text(totalCountForAbsent);
    	   	
        }
       ,error : function(e){
        }
	});
	
	
	
}



</script>
<script type="text/x-handlebars-template"  id="memAttSearchList-template" >
	<table id="memAttTable" class="table table-head-fixed table-bordered" style="height: 15vh;" >
							
										<thead >
										
											<tr>
												<th>일자</th>
												<th>입실시간</th>
												<th>퇴실시간</th>
												<th>수업시간</th>
												<th>실수업시간(분)</th>
												<th>출결상태</th>
						
											</tr>
										</thead>
										<tbody>
										{{#each selectAttMember}}
											<tr>
												
													<td id="memAttDate{{@index}}">
														{{atnDate}}
													</td>
												
												
												<td id="go{{@index}}" style="width: 20vh;">{{atnGoTime}}</td>
												<td id="out{{@index}}" style="width: 20vh;">{{atnOutTime}}</td>
												<td id="startAndEnd{{@index}}">{{minStart}}&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;{{maxEnd}}</td>
												<td id="realLessonTime{{@index}}">{{realTimeLesson}}</td>
												<td id="attYn{{@index}}">{{atnYnManager}}</td>
												<td class="indexList" style="display: none;">{{@index}}</td>
												<td id="attreason{{@index}}" style="display: none;">{{atnReason}}</td>
												
											</tr>
										{{/each}}	
										</tbody>
									
									</table>
</script>

   
</body>

</html>