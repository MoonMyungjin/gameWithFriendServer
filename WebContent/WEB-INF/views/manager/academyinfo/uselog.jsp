<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<c:set var="selectMenuNameAll" value="${dataMap.selectMenuNameAll }" />
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>	
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display : flex;">
              <h2 data-userId="${loginUser.id }">홈페이지이용현황</h2> 
             <!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '홈페이지이용현황') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '홈페이지이용현황') == -1}">
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
						
						<div class="card card-dark card-outline" style="height:45vh;">
						
							<div class="card-header">
							 	<div class="row">
									<div class="col-sm-12">
										<h3 class="card-title">
											<i class="fas fa-check"></i>
											&nbsp;&nbsp;
											홈페이지 이용현황
										</h3>
									</div>
								</div>
								<div class="row" style="margin-top: 1vh;">
									<div class="col-sm-3 input-group" >
										<div class="input-group-prepend">
										<button type="submit" class="btn btn-dark" style="margin-right: 2vh;">
										<i class="fa-solid fa-angle-left"></i>
										</button>
										<button type="submit" class="btn btn-dark">
											<i class="far fa-calendar-alt"></i>
										</button>
										</div>
										<input type="text" value="년도" class="form-control float-right" id="reservation">
										<button type="submit" class="btn btn-dark" style="margin-left: 2vh;">
										<i class="fa-solid fa-angle-right"></i>
										</button>
									</div>
									<div class="col-sm-1" style="margin-top: 1vh;">
										<button type="button" class="btn btn-block btn-dark btn-xs">검색</button>
										
									</div>
									<div class="col-sm-1" style="margin-top: 1vh;">
										<button id="listSaveExcelBtn" type="button" class="btn btn-block btn-info btn-xs">EXCEL</button>
									</div>
								</div>	
							</div>
							<div class="card-body" style="padding-top: 5px; height: 80vh;">
							
								<div class="row " >

									<div id="uselogTableDiv" class="col-sm-12 table1 row" style="max-height: 30vh;" >
									<table id="uselogTable" class="table table-head-fixed table-bordered" >

													<thead >
													
														<tr>
															<th style="background-color:rgb(32 73 105); color: white;">구분</th>
															<th id="fiveDate" style="background-color:rgb(32 73 105); color: white;">2021-11</th>
															<th id="fourDate" style="background-color:rgb(32 73 105); color: white;">2021-12</th>
															<th id="threeDate" style="background-color:rgb(32 73 105); color: white;">2022-1</th>
															<th id="secondDate" style="background-color:rgb(32 73 105); color: white;">2022-2</th>
															<th id="firstDate" style="background-color:rgb(32 73 105); color: white;">2022-3</th>
															<th style="background-color:rgb(32 73 105); color: white;">합계</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach items="${selectMenuNameAll}" var="selectMenuNameAll" varStatus="loop" >
														<tr>
															<td class="pageName">${selectMenuNameAll.menuName}</td>
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
															<div class="card card-dark card-outline" style="height:85vh;">
										
																<div class="card-header">
																	<h3 class="card-title">
																		<i class="fas fa-check"></i>
																		&nbsp;&nbsp;
																		전체 홈페이지 이용현황 -그래프 
																	</h3>
																</div>
																<div class="card-body" style="padding-top: 5px; max-height: 50vh;">
																	<div class="row">
																		<div class="col-sm-12" >
																			<div class="row">
																				 <div class="col-sm-2">
																				 </div>
																				 <div class="col-sm-8" style="width:600px;height:400px">
																				        <!--버그가 있음, canvas 사이즈로는 차트사이즈가 조절이 안됨 미쳐버림(첫고비)-->
																				        <canvas id="myChart" width="100" height="100"></canvas>
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
</section>							

<script>

    var v_anotherDateSet =
    {       
            type: 'bar',
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3 , 70, 66]
         
    };

</script>
<script>

let fourName;
let threeName;
let secondName;

let ajaxAfterList = [];
let menuNameListForList= [];
window.onload = function(){
	
	$("#listSaveExcelBtn").on("click",function(){
		console.log($("#uselogTable"))
			$("#uselogTableDiv").table2excel({
		        exclude: ".excludeThisClass",
		        name: "sheet1",
		        filename: "홈페이지이용현황", 
		        preserveColors: false 
		 	});
	 });
	
	let day = moment();
	console.log(day.format());
	let basicDay = day.format();
	
	
	let MonthNow = moment().month() + 1;
	console.log(MonthNow);
	let oneMonthBefore = moment().subtract(1,'month').month() + 1;
	console.log(oneMonthBefore);
	let twoMonthBefore = moment().subtract(2,'month').month() + 1;
	console.log(twoMonthBefore);
	let threeMonthBefore = moment().subtract(3,'month').month() + 1;
	console.log(threeMonthBefore);
	let fourMonthBefore = moment().subtract(4,'month').month() + 1;
	console.log(fourMonthBefore);
	let fiveMonthBefore = moment().subtract(5,'month').month() + 1;
	console.log(fiveMonthBefore);
	
	let nowMonthBeforeYear = moment().format('YYYY-MM');
    let oneMonthBeforeYear = moment().subtract(1,'month').format('YYYY-MM');
    let twoMonthBeforeYear = moment().subtract(2,'month').format('YYYY-MM');
    let threeMonthBeforeYear = moment().subtract(3,'month').format('YYYY-MM');
    let fourMonthBeforeYear = moment().subtract(4,'month').format('YYYY-MM');
    let fiveMonthBeforeYear = moment().subtract(5,'month').format('YYYY-MM');
    
    console.log(nowMonthBeforeYear);
	console.log(oneMonthBeforeYear);
	console.log(twoMonthBeforeYear);
	console.log(threeMonthBeforeYear);
	console.log(fourMonthBeforeYear);
	console.log(fiveMonthBeforeYear);

	let dateList = [];
	let indexList = [];
	let dateObject1 = {
			date :nowMonthBeforeYear,
			indexOn: 'A'
	};
	let dateObject2 = {
			date :oneMonthBeforeYear,
			indexOn: 'B'
	};
	let dateObject3 = {
			date :twoMonthBeforeYear,
			indexOn: 'C'
	};
	let dateObject4 = {
			date :threeMonthBeforeYear,
			indexOn: 'D'
	};
	let dateObject5 = {
			date :fourMonthBeforeYear,
			indexOn: 'E'
	};
	dateList.push(dateObject1);
	dateList.push(dateObject2);
	dateList.push(dateObject3);
	dateList.push(dateObject4);
	dateList.push(dateObject5);
	
	
	$.ajax({
       url : "/manager/academyinfo/uselog/menulist.do"
       ,success : function (data){
    	   
    	menuNameListForList = data.selectMenuNameAll;
    	  console.log(menuNameListForList);
    	  
    	  
    	  let dataItem = {
    				menuNameListForList : menuNameListForList,
    				dateList : dateList
    			  
    		};
    		 	
    	 		dataItem = JSON.stringify(dataItem);
    	 		console.log(dataItem);
    		$.ajax({
    	       url : "/manager/academyinfo/uselog/list.do"
    	       ,type: "post"
    	       ,contentType: 'application/json'
    	       ,data: dataItem
    	       ,success : function (data){
    	    	   let nowMonthBeforeYearList =[];
    	    	   let oneMonthBeforeYearList =[];
    	    	   let twoMonthBeforeYearList =[];
    	    	   let threeMonthBeforeYearList =[];
    	    	   let fourMonthBeforeYearList =[];
    	    	   let nameList = [];
    	    	   let sumList = [];
    	    	 	/* console.log(data); */
    	    	 	ajaxAfterList = data.selectAcademyHomepageUse;
    	    	 	
    	    	 	for(let i =0; i<ajaxAfterList.length; ++i){
    	    	 		if(i<62){
    	    	 			nameList.push(ajaxAfterList[i]);
    	    	 			
    	    	 		}
    	    	 		if(ajaxAfterList[i].acaHuseDate == nowMonthBeforeYear){
    	    	 			
    	    	 			nowMonthBeforeYearList.push(ajaxAfterList[i]);
    	    	 		}else if(ajaxAfterList[i].acaHuseDate == oneMonthBeforeYear){
    	    	 			
    	    	 			oneMonthBeforeYearList.push(ajaxAfterList[i]);
    	    	 		}else if(ajaxAfterList[i].acaHuseDate == twoMonthBeforeYear){
    	    	 			
    	    	 			twoMonthBeforeYearList.push(ajaxAfterList[i]);
    	    	 		}else if(ajaxAfterList[i].acaHuseDate == threeMonthBeforeYear){
    	    	 			
    	    	 			threeMonthBeforeYearList.push(ajaxAfterList[i]);
    	    	 		}else if(ajaxAfterList[i].acaHuseDate == fourMonthBeforeYear){
    	    	 			fourMonthBeforeYearList.push(ajaxAfterList[i]);
    	    	 		}
    	    	 		
    	    	 	}
    	    	 	console.log(nameList);
    	    	 			if(fourMonthBeforeYearList.length == 0){
    	    	 				let fillObject = {
    	    	 						acaHuseCount : "0"
    	    	 				}
    	    	 				fourMonthBeforeYearList.length = 62;
    	    	 				fourMonthBeforeYearList.fill(fillObject, 0,62);
    	    	 				
    	    	 			}
    	    	 			if(threeMonthBeforeYearList.length == 0){
    	    	 				let fillObject = {
    	    	 						acaHuseCount : "0"
    	    	 				}
    	    	 				threeMonthBeforeYearList.length = 62;
    	    	 				threeMonthBeforeYearList.fill(fillObject, 0,62);
    	    	 				
    	    	 			}
    	    	 			if(twoMonthBeforeYearList.length == 0){
    	    	 				let fillObject = {
    	    	 						acaHuseCount : "0"
    	    	 				}
    	    	 				twoMonthBeforeYearList.length = 62;
    	    	 				twoMonthBeforeYearList.fill(fillObject, 0,62);
    	    	 				
    	    	 			}
    	    	 			if(oneMonthBeforeYearList.length == 0){
    	    	 				let fillObject = {
    	    	 						acaHuseCount : "0"
    	    	 				}
    	    	 				oneMonthBeforeYearList.length = 62;
    	    	 				oneMonthBeforeYearList.fill(fillObject, 0,62);
    	    	 				
    	    	 			}
    	    	 			if(nowMonthBeforeYearList.length == 0){
    	    	 				let fillObject = {
    	    	 						acaHuseCount : "0"
    	    	 				}
    	    	 				nowMonthBeforeYearList.length = 62;
    	    	 				nowMonthBeforeYearList.fill(fillObject, 0,62);
    	    	 				
    	    	 			}
    	    	 			
    	    	 			for(let j= 0; j<nameList.length; ++j){
	    	    	 			let sumCount= 0;
	        	    	 		/* console.log(nowMonthBeforeYearList[j].acaHuseCount); */
	            	  			sumCount = (parseInt(nowMonthBeforeYearList[j].acaHuseCount)+parseInt(oneMonthBeforeYearList[j].acaHuseCount)
	            	    	 	+parseInt(twoMonthBeforeYearList[j].acaHuseCount)+parseInt(threeMonthBeforeYearList[j].acaHuseCount)
	            	    	 	+parseInt(fourMonthBeforeYearList[j].acaHuseCount));
	            	    	 	
	            	    	  	 	let sumObject ={
	            	    	 			acaHuseCount : sumCount
	            	    	 	}
	            	    	 	sumList.push(sumObject);
	            	    	 	
    	    	 			}
    	    	 	let newData={
    	    	 			nameList:nameList,
    	    	 			nowMonthBeforeYearList:nowMonthBeforeYearList,
    	    	 			oneMonthBeforeYearList:oneMonthBeforeYearList,
    	    	 			twoMonthBeforeYearList:twoMonthBeforeYearList,
    	    	 			threeMonthBeforeYearList:threeMonthBeforeYearList,
    	    	 			fourMonthBeforeYearList:fourMonthBeforeYearList,
    	    	 			sumList:sumList 
    	    	 	}
    	    	 	
    	    	 	
    	    	 	 printData(newData,$('#uselogTable'),$('#uselogTableDiv'),$('#uselogList-template')); 
    	    	 	 printData1(newData,$('#uselogTableDiv'),$('#uselogList-template1')); 
    	    	 	 printData2(newData,$('#uselogTableDiv'),$('#uselogList-template2')); 
    	    	 	 printData3(newData,$('#uselogTableDiv'),$('#uselogList-template3')); 
    	    	 	 printData4(newData,$('#uselogTableDiv'),$('#uselogList-template4')); 
    	    	 	 printData5(newData,$('#uselogTableDiv'),$('#uselogList-template5')); 
    	    	 	 printData6(newData,$('#uselogTableDiv'),$('#uselogList-template6'));
    	    	 	 $('#fiveDate').text(fourMonthBeforeYear);
    	    		 $('#fourDate').text(threeMonthBeforeYear);
    	    	 	 $('#threeDate').text(twoMonthBeforeYear);
    	    	 	 $('#secondDate').text(oneMonthBeforeYear);
    	    	 	 $('#firstDate').text(nowMonthBeforeYear);
    	    	 	 
    	    		let newLabelList = [];
    	    		newLabelList.push(fourMonthBeforeYear);
    	    		newLabelList.push(threeMonthBeforeYear);
    	    		newLabelList.push(twoMonthBeforeYear);
    	    		newLabelList.push(oneMonthBeforeYear);
    	    		newLabelList.push(nowMonthBeforeYear);
    	 /*    		newLabelList.push("총합"); */
    	    	 	console.log(newLabelList);
    	    	 	myChart.data.labels = newLabelList;
    	    	 	console.log(myChart.data.labels);
    	    	 	
    	    	 		let totalCountForChartFour=0;
    	    	 		let totalCountForChartThree=0;
    	    	 		let totalCountForChartTwo=0;
    	    	 		let totalCountForChartOne=0;
    	    	 		let totalCountForChartNow=0;
    	    	 		
    	    	 	
    	    	 	for(let q = 0; q < fourMonthBeforeYearList.length; ++q){
    	    	 		totalCountForChartFour =  totalCountForChartFour + parseInt(fourMonthBeforeYearList[q].acaHuseCount);
    	    	 	}
    	    	 	for(let q = 0; q < threeMonthBeforeYearList.length; ++q){
    	    	 		totalCountForChartThree =  totalCountForChartThree + parseInt(threeMonthBeforeYearList[q].acaHuseCount);
    	    	 	}
    	    	 	for(let q = 0; q < twoMonthBeforeYearList.length; ++q){
    	    	 		totalCountForChartTwo =  totalCountForChartTwo + parseInt(twoMonthBeforeYearList[q].acaHuseCount);
    	    	 	}
    	    	 	for(let q = 0; q < oneMonthBeforeYearList.length; ++q){
    	    	 		totalCountForChartOne =  totalCountForChartOne + parseInt(oneMonthBeforeYearList[q].acaHuseCount);
    	    	 	}
    	    	 	for(let q = 0; q < nowMonthBeforeYearList.length; ++q){
    	    	 		totalCountForChartNow =  totalCountForChartNow + parseInt(nowMonthBeforeYearList[q].acaHuseCount);
    	    	 	}
    	    	 	console.log(totalCountForChartFour);
    	    	 	console.log(totalCountForChartThree);
    	    	 	console.log(totalCountForChartTwo);
    	    	 	console.log(totalCountForChartOne);
    	    	 	console.log(totalCountForChartNow);
    	    	 	let totalOfTotal = totalCountForChartFour + totalCountForChartThree + totalCountForChartTwo + totalCountForChartOne + totalCountForChartNow;
    	    	 	let newDataList = [];
    	    	 	newDataList.push(totalCountForChartFour);
    	    	 	newDataList.push(totalCountForChartThree);
    	    	 	newDataList.push(totalCountForChartTwo);
    	    	 	newDataList.push(totalCountForChartOne);
    	    	 	newDataList.push(totalCountForChartNow);
    	    	/*  	newDataList.push(totalOfTotal); */
    	    	 	myChart.data.datasets[0].data = newDataList;
    	    	 	console.log(myChart.data.datasets[0].data);
    	    	 	myChart.update();
    	        },error : function(e){
    	        }
    		});
       }
     });     	  

    var v_btn = document.querySelector("#id_btn");
    var f_click = function(){
        
        //처음 만들때 갯수에 맞추어야 함(현실도 그러함)
        var v_ranData = [];
        for(var i=1; i<=8; i++){
            v_ranData.push(Math.ceil(Math.random()*100));

        }
    }
}
</script>   
<script>
    var v_btn = document.querySelector("#id_btn");
    var f_click = function(){
        
        //처음 만들때 갯수에 맞추어야 함(현실도 그러함)
        var v_ranData = [];
        for(var i=1; i<=8; i++){
            v_ranData.push(Math.ceil(Math.random()*100));

        }
       ,error : function(e){
        }
	});
	
	
	
}

</script>   
<script>
function printData(data,delArea,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	delArea.remove();
	target.append(html);
}
function printData1(data,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	
	target.append(html);
}
function printData2(data,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	
	target.append(html);
}
function printData3(data,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	
	target.append(html);
}
function printData4(data,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	
	target.append(html);
}
function printData5(data,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	
	target.append(html);
}
function printData6(data,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	
	target.append(html);
}
</script>
<script type="text/x-handlebars-template"  id="uselogList-template" >
									<div >
									<table class="table table-head-fixed table-bordered" >
									
								
									 <thead >
												<th style="background-color:rgb(32 73 105); color: white;">구분</th>
												
										</thead >		
									{{#each nameList}}
											<tr>
												<td class="pageName">{{acaHuseMenuName}}</td>
											</tr>
									{{/each}}
										</table>
									</div>
</script>
<script type="text/x-handlebars-template"  id="uselogList-template1" >
									<div style="width: 18vh;">										
									<table class="table table-head-fixed table-bordered">
										<thead >
											<th id="fiveDate" style="background-color:rgb(32 73 105); color: white;">2021-11</th>
										 </thead >	
									{{#each fourMonthBeforeYearList}}
											<tr>
												<td>{{acaHuseCount}}</td>
											</tr>
										{{/each}}
										</table>
									</div>
</script>
<script type="text/x-handlebars-template"  id="uselogList-template2" >
									<div style="width: 16vh;">
									<table class="table table-head-fixed table-bordered">
										<thead >
										<th id="fourDate" style="background-color:rgb(32 73 105); color: white;">2021-12</th>
										 </thead >			
									{{#each threeMonthBeforeYearList}}
											<tr>
												<td>{{acaHuseCount}}</td>
											</tr>
										{{/each}}
									</table>
									</div>
</script>
<script type="text/x-handlebars-template"  id="uselogList-template3" >
									<div style="width: 16vh;">
									<table class="table table-head-fixed table-bordered">
								<thead >
									<th id="threeDate" style="background-color:rgb(32 73 105); color: white;">2022-1</th>
											 </thead >	
												
									{{#each twoMonthBeforeYearList}}
											<tr>
												<td>{{acaHuseCount}}</td>
											</tr>
										{{/each}}
									</table>
									</div>
</script>
<script type="text/x-handlebars-template"  id="uselogList-template4" >
									<div style="width: 16vh;">
								
									<table class="table table-head-fixed table-bordered">
											<thead >
												<th id="secondDate" style="background-color:rgb(32 73 105); color: white;">2022-2</th>
											 </thead >	
									{{#each oneMonthBeforeYearList}}
											<tr>
												<td>{{acaHuseCount}}</td>
											</tr>
										{{/each}}
									</table>
									</div>
</script>
<script type="text/x-handlebars-template"  id="uselogList-template5" >
									<div style="width: 16vh;">
									<table class="table table-head-fixed table-bordered">
											<thead >	
												<th id="firstDate" style="background-color:rgb(32 73 105); color: white;">2022-3</th>
											 </thead >	
									{{#each nowMonthBeforeYearList}}
											<tr>
												<td>{{acaHuseCount}}</td>
											</tr>
									{{/each}}
											
												
								
									</table>
									</div>
</script>
<script type="text/x-handlebars-template"  id="uselogList-template6" >
									<div style="width: 16vh;">
									<table class="table table-head-fixed table-bordered">
											<thead >	
												<th  style="background-color:rgb(32 73 105); color: white;">합계</th>
											 </thead >	
									{{#each sumList}}
											<tr>
												<td>{{acaHuseCount}}</td>
											</tr>
									{{/each}}
											
												
								
									</table>
									</div>
</script>
<script>


    var ctx = document.getElementById('myChart').getContext('2d');
    //그래픽엔진 가져오기(openGL)  마이크로소프트는 directX를 가지고 있어용
   		let fourNewName	= document.querySelector("#fiveDate").innerText;
	 	let threeNewName = document.querySelector("#fourDate").innerText
	 	let twoNewName = document.querySelector("#threeDate").innerText
	 	let oneNewName = document.querySelector("#secondDate").innerText
	 	let nowNewName = document.querySelector("#firstDate").innerText
    
    var myChart = new Chart(ctx, {
    	
    type: 'bar', // bar, line,doughnut, pie,radar등이 자주 쓰이는 차트
    data: {
    	
        labels: [fourNewName,threeNewName, twoNewName,oneNewName, nowNewName], // x축 값
        datasets: [{
            label: '홈페이지 이용현황',
            data: [12, 19, 3, 5, 2],
            backgroundColor: [
                'rgba(32, 73, 105, 0.8)',
                'rgba(32, 73, 105, 0.8)',
                'rgba(32, 73, 105, 0.8)',
                'rgba(32, 73, 105, 0.8)',
               /*  'rgba(32, 73, 105, 0.8)', */
                'rgba(32, 73, 105, 0.8)'
            ],	
            borderColor: [
                'rgba(32, 73, 105, 1)',
                'rgba(32, 73, 105, 1)',
                'rgba(32, 73, 105, 1)',
                'rgba(32, 73, 105, 1)',
              /*   'rgba(32, 73, 105, 1)', */
                'rgba(32, 73, 105, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
	 	/* 	window.onload = function(){
	
	}	 	
 	 */
/* f_click(); */ 	 	
</script>	 	
	 	
	
<!-- // 페이지 접근하자 마자 실행

//요기 데이타에 접근하는 것이 사용 포인트
//console.log(myChart.data.datasets[0].data);
 -->
</body>
</html>