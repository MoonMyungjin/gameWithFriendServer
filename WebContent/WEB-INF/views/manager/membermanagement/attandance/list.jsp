<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="attMaker" value="${dataMap.attMaker }" />
<c:set var="att" value="${dataMap.attMaker.att }" />
<c:set var="attandanceList" value="${dataMap.attandanceList }" />
<c:set var="selectAttandancePlusList" value="${dataMap.selectAttandancePlusList }" />



<head>
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
<meta charset="UTF-8">
<title></title>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<div id="load">
    <img src="/resources/images/Book.gif" alt="loading">
</div>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6" style="display: flex;">
					<h1 data-userId="${loginUser.id }">학생출결관리</h1>
					<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '학생출결관리') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '학생출결관리') == -1}">
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
					<div class="card card-dark card-outline">

						<div class="card-header">
							<h3 class="card-title">
								<i class="nav-icon fas fa-search"></i> &nbsp;&nbsp; 학생 출결 검색 옵션
							</h3>
						</div>

						<div class="card-body" style="padding-top: 5px;">

							<div class="row">
								<div class="form-group"
									style="margin-bottom: 3px; margin-left: 6px;">
									<div class="custom-control custom-radio col-xs-3"
										style="display: inline;">
										<input class="custom-control-input" type="radio"
											id="customRadio1" name="customRadio" checked> <label
											for="customRadio1" class="custom-control-label">일자별
											출력</label>
									</div>
									&nbsp;&nbsp;
									<div class="custom-control custom-radio"
										style="display: inline;">
										<input class="custom-control-input" type="radio"
											id="customRadio2" name="customRadio"> <label
											for="customRadio2" class="custom-control-label">월전체
											출력</label>
									</div>
								</div>
							</div>

							<div class="row">
								
									<div class="col-sm-9">
											<div class="row">
												<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
													<div class="input-group-append">
														<input id="startDateAtt" value="" type="date" class="form-control">
													</div>
													
													<div class="input-group-append">
														<input id="monthDateAtt"  type="month" class="form-control" style="display: none">
													</div>
												</div>
											</div>
									</div>
									<div class="col-sm-3">
										<div class="input-group" style="padding: 3px;">
		
									
											
											<input type="text" class="form-control" >
											<div class="input-group-append">
												<button type="submit" class="btn btn-dark"
													style="height: 4vh;">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
							
							</div>
							<div class="row"></div>
						</div>
						<!-- card body -->
					</div>
					<!-- card-outline -->
					<div class="card card-dark card-outline">
						<div class="card-header">
							<h3 class="card-title">
								<i class="fa-solid fa-table-cells"></i> &nbsp;&nbsp; 학생 출결 상태 표
							</h3>
						</div>
						<div class="card-body" style="padding-top: 5px;">
							<div class="row">
								
								<div class="col-sm-12">
								
									<table id="simpletable" class="table table-head-fixed table-bordered">
										<thead>
											<tr>
												<th style="background-color:rgb(32 73 105); color: white;">전체</th>
												<th style="background-color:rgb(32 73 105); color: white;">출석</th>
												<th style="background-color:rgb(32 73 105); color: white;">결석</th>
												
												<th style="background-color:rgb(32 73 105); color: white;">지각</th>
												<th style="background-color:rgb(32 73 105); color: white;">조퇴</th>
												
											</tr>
											<tr>
												<td id="totalNum">${attMaker.totalNum}</td>
												<td id="attNum">${attMaker.ynnNum}</td>
												<td id="ynnNum">${attMaker.ynNum}</td>
												
												<td id="lateNum">23</td>
												<td id="earlyLeaveNum">44</td>
												
											</tr>
										</thead>
									</table>		
								</div>	
							
							</div>
						</div>
					</div>
					
					<br />
					
				
					<div class="card card-dark card-outline">

						<div class="card-header">
							<div class="row">
								<div class="col-sm-3">
									<h3 class="card-title">
										<i class="fas fa-list" aria-hidden="true"></i> &nbsp;&nbsp; 학생 출결 리스트
									</h3>
								</div>
								<div class="col-sm-7">
								
								</div>
								
								<div class="col-sm-2" style="text-align: right;">
									<button type="button" class="btn btn-dark">저장</button>
								
									<button id="excelDownloadBtn" type="button" class="btn btn-info">Excel</button>
								</div>	
							</div>
						</div>
						<div class="card-body" >
							
								
								
								
							
							<div class="row table1" style="max-height: 32vh;">
								<div id="test" class="card-body table p-0">
									<table id="printTargetTable" class="table table-head-fixed table-bordered" style="height: 30vh;" >
										<thead >
										
											<tr>
												<th style="background-color:rgb(32 73 105); color: white;">NO</th>
												<th style="background-color:rgb(32 73 105); color: white;">이름</th>
												<th style="background-color:rgb(32 73 105); color: white;">수강 반</th>
												<th style="background-color:rgb(32 73 105); color: white;">일자</th>
												<th style="background-color:rgb(32 73 105); color: white;">등원</th>
												<th style="background-color:rgb(32 73 105); color: white;">하원</th>
												<th style="background-color:rgb(32 73 105); color: white;">출결</th>
												<th style="background-color:rgb(32 73 105); color: white;">결석/지각 /조퇴사유</th>
											</tr>
										</thead>
										<tbody id="tbodyForAttCount">
										<c:forEach items="${selectAttandancePlusList }" var="selectAttandancePlusList" varStatus="i">
											<tr>
												<td>${selectAttandancePlusList.atnId }</td>
												<td style="cursor: pointer;"><strong>${selectAttandancePlusList.studentName }</strong></td>
												<td>${selectAttandancePlusList.className }</td>
												<td id="atnDate${i.index }">
												<%-- ${attandance.atnDate } --%>
												<fmt:parseDate value='${selectAttandancePlusList.atnDate }' var='trading_day' pattern='yyyy-MM-dd'/>
												<fmt:formatDate value="${trading_day}" pattern='yyyy-MM-dd'/>
												</td>
												<td id="goTimeValue${i.index }">${selectAttandancePlusList.atnGoTime }</td>
												<td id="outTimeValue${i.index }">${selectAttandancePlusList.atnOutTime }</td>
												<td id="attCheckForLate${i.index }"  class="hiddenCheck excludeThisClass" style="display: none;">${selectAttandancePlusList.atnYnManager }</td>
												<td  class="hiddenindex excludeThisClass" style="display: none;">${i.index }</td>
												<td>
													<div class="row">
														<div class="col-sm-6">
															<button id="one" type="button" class="btn btn-block btn-outline-info btn-xs one go" >출석</button>
														</div>
														<div class="col-sm-6">
															<button id="two" type="button" class="btn btn-block btn-outline-danger btn-xs two out" >결석</button>
														</div>
													</div>	
												</td>
												<td><input id="reasonForAtt${i.index }" type="text" class="form-control" value="${selectAttandancePlusList.atnReason }" placeholder="사유"></td>
												<td id="hiddenForLateId${i.index }" class="hiddenStId excludeThisClass" style="display: none;">${selectAttandancePlusList.studentId }</td>
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
let scriptCheckAtt;
	

window.onload=function(){
	
	setTimeout(function(){
		$('#load').hide();
	},1500);
	
	
	$("#customRadio1").on("change",function(){
 		let changeWeekDate = moment();
		$('#startDateAtt').attr('style','display:block');
		$('#monthDateAtt').attr('style','display:none;');
		
	
	});
	
	$("#startDateAtt").on("change",function(){
		let changeWeekDate2 = moment().format("YYYY-MM-DD");
		let ajaxDate= $("#startDateAtt").val()
		
		if(ajaxDate > changeWeekDate2){
			alert("현재 날짜 이후 날짜는 선택하실수없습니다.");
			return;
		}
		$.ajax({
	        type: "post"
	       ,url : "/manager/membermanagement/attandance/ajaxAtt.do"     
	       ,data : {
	    	   "ajaxDate" : ajaxDate
	       }
	       ,success : function (data){
	        	
	        	printData(data,$('#printTargetTable'),$('#test'),$('#workListSelectDay-template'));
	        	let countForAtt2 =0
	        	
	        	let countGoForAjax =0;
	        	let countOutForAjax =0;
	        	console.log(data)
	        	console.log(data.selectAttandancePlusList.length)
	        	console.log(data.selectAttandancePlusList[0].atnYnManager)
	        	
	        	
	    		for(let i=0; i< data.selectAttandancePlusList.length; i++){
	    			let atnCheck= $('#atnDate'+i.toString()).text()
	    			
	    			$('#atnDate'+i.toString()).text(atnCheck.trim().substr(0,10))
		    		if(data.selectAttandancePlusList[i].atnYnManager ==='Y'){
		    		
		    			document.getElementsByClassName("btn btn-block btn-outline-info btn-xs one go")[i].style.borderColor ="#17a2b8";	
		    			document.getElementsByClassName("btn btn-block btn-outline-info btn-xs one go")[i].style.backgroundColor ="#17a2b8";	
		    			document.getElementsByClassName("btn btn-block btn-outline-info btn-xs one go")[i].style.color ="#fff";	
		    			
		    			countGoForAjax =countGoForAjax+1;
		    			
		    		}else{
		    		
		    			document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs two out")[i].style.borderColor ="#c82333";	
		    			document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs two out")[i].style.backgroundColor ="#c82333";	
		    			document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs two out")[i].style.color ="#fff";
		    			
		    			countOutForAjax =countOutForAjax +1;
		    		}
	    		}
	        	
	        	console.log(countGoForAjax)
	        	console.log(countOutForAjax)
	        	$('#totalNum').text(data.selectAttandancePlusList.length);
	        	$('#attNum').text(countGoForAjax);
	        	$('#ynnNum').text(countOutForAjax);
	    		
	        	for(let n =0; n <data.selectAttandancePlusList.length; ++n){
	       		 let forIdLate = $('#hiddenForLateId'+n).text()
	       		 $.ajax({
	       		        type: "post"
	       		       ,url : "/manager/membermanagement/attandance/listForLate.do"     
	       		       ,data : {
	       		    	   "id" : forIdLate
	       		       }
	       		       ,success : function (data){
	       		        	console.log(n+forIdLate)
	       		 			console.log(data)
	       		 			if(data.selectForLate !=null){
	       		 				if(data.selectForLate.atnYnManager=='Y'){
	       		 					if(data.selectForLate.atnGoTime > data.selectForLate.minStart){
	       		 						countForLateTotal = countForLateTotal +1;
	       		 					}
	       		 					
	       		 				}
	       		 				if(data.selectForLate.atnStartDeadlineYn=='YY'){
	       		 					if(data.selectForLate.atnOutTime < data.selectForLate.maxEnd){
	       		 						countForLeaveEarlyTotal = countForLeaveEarlyTotal +1;
	       		 					}
	       		 					
	       		 				}
	       		 			}
	       		 			$('#lateNum').text(countForLateTotal);
	       		 			$('#earlyLeaveNum').text(countForLeaveEarlyTotal);
	       		        	
	       		        	
	       		        	
	       		        }
	       		       ,error : function(e){
	       		        }
	       			});
	       	 }
	    		
	    		
	        }
	       ,error : function(e){
	        }
		});
		
		
	});
	
	
	
	
	
	$('#customRadio2').change(function() {
		$('#startDateAtt').attr('style','display:none;');
		
		$('#monthDateAtt').attr('style','display:block;');
		
		
		let monthDate2 = moment().format("YYYY-MM-DD");
		
		 $.ajax({
		        type: "post"
		       ,url : "/manager/membermanagement/attandance/ajaxAttMonth.do"     
		       ,data : {
		    	   "ajaxDate" : monthDate2
		       }
		       ,success : function (data){
		        	
		 			console.log(data)
		 			printData(data,$('#printTargetTable'),$('#test'),$('#workListSelectDay-template'));
		 			let countForAtt2 =0
		        	
		        	let countGoForAjax =0;
		        	let countOutForAjax =0;
		        	console.log(data)
		        	console.log(data.selectAttandancePlusList.length)
		        	console.log(data.selectAttandancePlusList[0].atnYnManager)
		        	
		        	
		    		for(let i=0; i< data.selectAttandancePlusList.length; i++){
		    			let atnCheck= $('#atnDate'+i.toString()).text()
		    			
		    			$('#atnDate'+i.toString()).text(atnCheck.trim().substr(0,10))
			    		if(data.selectAttandancePlusList[i].atnYnManager ==='Y'){
			    		
			    			
			    			document.getElementsByClassName("btn btn-block btn-outline-info btn-xs one go")[i].style.borderColor ="#17a2b8";	
			    			document.getElementsByClassName("btn btn-block btn-outline-info btn-xs one go")[i].style.backgroundColor ="#17a2b8";	
			    			document.getElementsByClassName("btn btn-block btn-outline-info btn-xs one go")[i].style.color ="#fff";	
			    			
			    			countGoForAjax =countGoForAjax+1;
			    			
			    		}else{
			    		
			    			document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs two out")[i].style.borderColor ="#c82333";	
			    			document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs two out")[i].style.backgroundColor ="#c82333";	
			    			document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs two out")[i].style.color ="#fff";
			    			
			    			countOutForAjax =countOutForAjax +1;
			    		}
		    		}
		        	
		        	console.log(countGoForAjax)
		        	console.log(countOutForAjax)
		        	$('#totalNum').text(data.selectAttandancePlusList.length);
		        	$('#attNum').text(countGoForAjax);
		        	$('#ynnNum').text(countOutForAjax);
		    		
		        	for(let n =0; n <data.selectAttandancePlusList.length; ++n){
		       		 let forIdLate = $('#hiddenForLateId'+n).text()
		       		 $.ajax({
		       		        type: "post"
		       		       ,url : "/manager/membermanagement/attandance/listForLate.do"     
		       		       ,data : {
		       		    	   "id" : forIdLate
		       		       }
		       		       ,success : function (data){
		       		        	console.log(n+forIdLate)
		       		 			console.log(data)
		       		 			if(data.selectForLate !=null){
		       		 				if(data.selectForLate.atnYnManager=='Y'){
		       		 					if(data.selectForLate.atnGoTime > data.selectForLate.minStart){
		       		 						countForLateTotal = countForLateTotal +1;
		       		 					}
		       		 					
		       		 				}
		       		 				if(data.selectForLate.atnStartDeadlineYn=='YY'){
		       		 					if(data.selectForLate.atnOutTime < data.selectForLate.maxEnd){
		       		 						countForLeaveEarlyTotal = countForLeaveEarlyTotal +1;
		       		 					}
		       		 					
		       		 				}
		       		 			}
		       		 			$('#lateNum').text(countForLateTotal);
		       		 			$('#earlyLeaveNum').text(countForLeaveEarlyTotal);
		       		        	
		       		        	
		       		        	
		       		        }
		       		       ,error : function(e){
		       		        }
		       			});
		       	 }
		        	
		        }
		       ,error : function(e){
		        }
			});
		
		
		
	});
	
	
	$("#excelDownloadBtn").on("click",function(){
		//		ExcelDownload($("#printTargetTable"),"");
// 			console.log($("#printTargetTable")[0]);
			ReportToExcelConverter();
			
		});
	
	
	

	let attScriptNum = $('#attNum').text();
	let ynnScriptNum = $('#ynnNum').text();
	console.log(attScriptNum);
	$(document).delegate('#one','click',function(){
		
		scriptCheckAtt = $(this).parent().parent().parent().prev().prev().text();
		console.log(scriptCheckAtt);
		if(scriptCheckAtt !=='Y'){
			++attScriptNum;
			$('#attNum').text(attScriptNum);
			--ynnScriptNum;
			$('#ynnNum').text(ynnScriptNum);
			console.log(scriptCheckAtt);
			$(this).parent().parent().parent().prev().prev().text('Y');
			console.log(scriptCheckAtt);
		}

		// From the other examples
		let scriptCheckId = $(this).parent().parent().parent().parent().children('td:eq(0)').text();
		let scriptCheckDate = $(this).parent().parent().parent().parent().children('td:eq(3)').text();
		let scriptCheckStId = $(this).parent().parent().parent().parent().children('td:eq(10)').text().toString();
		console.log(scriptCheckAtt);
		console.log(scriptCheckId);
		console.log(scriptCheckStId);
		$(this).css('backgroundColor','#17a2b8');
		$(this).css('borderColor','#17a2b8');
		$(this).css('color','#fff');
		$(this).parent().next().children().css('backgroundColor','#fff');
		$(this).parent().next().children().css('color','#c82333');
		
		$.ajax({
	        type: "post"
	       ,url : "/manager/membermanagement/attandance/inmodifyAll.do"     
	       ,data : {
	    	   "atnId" : scriptCheckId
	       }
	       ,success : function (data){
	        	
	    	
	    	   
	        }
	       ,error : function(e){
	        }
		});

		
		
		
		
		
	});
	

	

	$(document).delegate('#two','click',function(){
		
		let scriptCheckId = $(this).parent().parent().parent().parent().children('td:eq(0)').text();
		console.log(scriptCheckId);
		
		$(this).css('backgroundColor','#c82333');
		$(this).css('borderColor','#c82333');
		$(this).css('color','#fff');
		$(this).parent().prev().children().css('backgroundColor','#fff');
		$(this).parent().prev().children().css('color','#17a2b8');
		scriptCheckAtt = $(this).parent().parent().parent().prev().prev().text();
		if(scriptCheckAtt !=='N'){
			--attScriptNum;
			$('#attNum').text(attScriptNum);
			++ynnScriptNum;
			$('#ynnNum').text(ynnScriptNum);
			console.log(scriptCheckAtt);
			$(this).parent().parent().parent().prev().prev().text('N');
			console.log(scriptCheckAtt);
		}

		
		$.ajax({
	        type: "post"
	       ,url : "/manager/membermanagement/attandance/inmodifyAllCancle.do"     
	       ,data : {
	    	   "atnId" : scriptCheckId
	       }
	       ,success : function (data){
	        	
	 			
	    	   
	        }
	       ,error : function(e){
	        }
		});
		
	}); 
	
	let countForAtt =0;
	let attList = [];
	let countForLateTotal = 0;
	let countForLeaveEarlyTotal = 0;
	attList = $('.hiddenindex').text();
	 console.log(attList);
	 if(attList.length>10){
		 console.log(attList.substr(-2))
		 countForAtt = attList.substr(-2);
		 countForAtt = Number(countForAtt)+1
	 }else{
		 countForAtt = attList.substr(-1);
		 countForAtt = Number(countForAtt)+1
	 }
	 console.log(countForAtt);
	 
	 for(let n =0; n <countForAtt; ++n){
		 let forIdLate = $('#hiddenForLateId'+n).text()
		 $.ajax({
		        type: "post"
		       ,url : "/manager/membermanagement/attandance/listForLate.do"     
		       ,data : {
		    	   "id" : forIdLate
		       }
		       ,success : function (data){
		        	console.log(n+forIdLate)
		 			console.log(data)
		 			if(data.selectForLate !=null){
		 				if(data.selectForLate.atnYnManager=='Y'){
		 					if(data.selectForLate.atnGoTime > data.selectForLate.minStart){
		 						countForLateTotal = countForLateTotal +1;
		 					}
		 					
		 				}
		 				if(data.selectForLate.atnStartDeadlineYn=='YY'){
		 					if(data.selectForLate.atnOutTime < data.selectForLate.maxEnd){
		 						countForLeaveEarlyTotal = countForLeaveEarlyTotal +1;
		 					}
		 					
		 				}
		 			}
		 			$('#lateNum').text(countForLateTotal);
		 			$('#earlyLeaveNum').text(countForLeaveEarlyTotal);
		        	
		        	
		        	
		        }
		       ,error : function(e){
		        }
			});
	 }
	 
	 
	 
	var mem_att_check = []
		mem_att_check = $('.hiddenCheck').text();
	 console.log(mem_att_check);
for(let i=0; i< attList.length; i++){
	if(mem_att_check[i] ==='Y'){
		
			document.getElementsByClassName("btn btn-block btn-outline-info btn-xs one go")[i].style.borderColor ="#17a2b8";	
			document.getElementsByClassName("btn btn-block btn-outline-info btn-xs one go")[i].style.backgroundColor ="#17a2b8";	
			document.getElementsByClassName("btn btn-block btn-outline-info btn-xs one go")[i].style.color ="#fff";	
			
			
			
	}else{
		
			document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs two out")[i].style.borderColor ="#c82333";	
			document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs two out")[i].style.backgroundColor ="#c82333";	
			document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs two out")[i].style.color ="#fff";
		
	}
}




};
function printData(data,delArea,target,templateObject){
	console.log("test")
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	delArea.remove();
	target.append(html);
}	
</script>	
<script>
	function ReportToExcelConverter(){
		
		$("#printTargetTable").table2excel({
	        exclude: ".excludeThisClass",
	        name: "sheet1",
	        filename: "출결List", 
	        preserveColors: false 
	 	});
	}
	

</script>
<script type="text/x-handlebars-template"  id="workListSelectDay-template" >
								<table id="printTargetTable" class="table table-head-fixed table-bordered" style="height: 30vh;" >
										<thead >
										
											<tr>
												<th style="background-color:rgb(32 73 105); color: white;">NO</th>
												<th style="background-color:rgb(32 73 105); color: white;">이름</th>
												<th style="background-color:rgb(32 73 105); color: white;">수강 반</th>
												<th style="background-color:rgb(32 73 105); color: white;">일자</th>
												<th style="background-color:rgb(32 73 105); color: white;">등원</th>
												<th style="background-color:rgb(32 73 105); color: white;">하원</th>
												<th style="background-color:rgb(32 73 105); color: white;">출결</th>
												<th style="background-color:rgb(32 73 105); color: white;">결석/지각 /조퇴사유</th>
											</tr>
										</thead>
										<tbody id="tbodyForAttCount">
												{{#each selectAttandancePlusList}}
											<tr>
												<td>{{atnId}}</td>
												<td>{{studentName}}</td>
												<td>{{className}}</td>
												<td id="atnDate{{@index}}">
												<%-- ${attandance.atnDate } --%>
												{{atnDate}}
												</td>
												<td id="goTimeValue{{@index}}">{{atnGoTime}}</td>
												<td id="outTimeValue{{@index}}">{{atnOutTime}}</td>
												<td id="attCheckForLate{{@index}}"  class="hiddenCheck excludeThisClass" style="display: none;">{{atnYnManager}}</td>
												<td  class="hiddenindex excludeThisClass" style="display: none;">{{@index}}</td>
												<td>
													<div class="row">
														<div class="col-sm-6">
															<button id="one" type="button" class="btn btn-block btn-outline-info btn-xs one go" >출석</button>
														</div>
														<div class="col-sm-6">
															<button id="two" type="button" class="btn btn-block btn-outline-danger btn-xs two out" >결석</button>
														</div>
													</div>	
												</td>
												<td><input id="reasonForAtt{{@index}}"value="{{atnReason}}" type="text" class="form-control" placeholder="사유"></td>
												<td id="hiddenForLateId{{@index}}" class="hiddenStId excludeThisClass" style="display: none;">{{studentId}}</td>
											</tr>
										{{/each}}
										</tbody>
									</table>


</script>	
</body>
</html>