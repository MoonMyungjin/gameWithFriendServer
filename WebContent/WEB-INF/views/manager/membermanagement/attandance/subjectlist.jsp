<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="tempList" value="${dataMap.tempList }" />
<c:set var="subjectAttList" value="${dataMap.subjectAttList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="subjectList" value="${dataMap.subjectList }" />
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }">과목출석부</h1>
              <!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '과목출석부') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '과목출석부') == -1}">
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
						
						<div class="card card-dark card-outline" style="height:11vh;">
							<div class="card-header">
								<div class="row">
									<div class="col-sm-5">
										<h3 class="card-title">
											<i class="nav-icon fas fa-search"></i> &nbsp;&nbsp; 검색 옵션
										</h3>
									</div>
									<div class="col-sm-4">
									</div>
									<div class="col-sm-3">
									
									</div>
								</div>
							</div>
							<div class="card-body" style="padding-top: 5px;">
								
							<div class="row" style="max-height: 20vh;">
								<div class="col-sm-3">
								
									<select id="checkClassSelect" class="form-control">
											<option>담당반</option>
									<c:forEach items="${subjectList }" var="subjectList" varStatus="status">
											<option value='${subjectList.lessonAssignmentId}'>${subjectList.lessonName }</option>
									</c:forEach>
									</select>
								</div>
								<div class="col-sm-5">
								
								</div>
								<div class="col-sm-4">
									<div class="input-group-append">
										<input type="text" class="form-control" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }">
										<button type="submit" class="btn btn-dark"
											style="height: 4vh;" id="searchTeacherBtn">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</div>
							
						</div>
						</div>
						<div class="card card-dark card-outline" style="height:75vh;">
							<div class="card-header">
								<div class="row">
									<div class="col-sm-10">
										<h3 class="card-title">
											<i class="fas fa-list"></i>
												&nbsp;&nbsp; 출석 상세 리스트
										</h3>
									</div>
									<div class="col-sm-1">
									<button id="allAtt" type="button" class="btn btn-block btn-outline-info btn-xs">전체출석</button>
								</div>
								<div class="col-sm-1">
									<button id="allCancle" type="button" class="btn btn-block btn-outline-danger btn-xs">전체취소</button>
								</div>	
								</div>
							</div>
							<div class="card-body" style="padding-top: 5px; height: 58vh;">
						
							<div id="subjectAttTableDiv" class="row table1" style="height: 58vh;">
								<table id="subjectAttTable" class="table table-head-fixed table-bordered" style="height: 50vh;" >
							
										<thead >
										
											<tr>
												<th style="background-color:rgb(32 73 105); color: white;">수업명</th>
												<th style="background-color:rgb(32 73 105); color: white;">학생명</th>
												<th style="background-color:rgb(32 73 105); color: white;">학교명</th>
												<th style="background-color:rgb(32 73 105); color: white;">전화번호</th>
												<th style="background-color:rgb(32 73 105); color: white;">출석시간</th>												
												<th style="background-color:rgb(32 73 105); color: white;">출석여부</th>
						
											</tr>
										</thead>
										<tbody id="loopbody">
										<c:forEach items="${tempList }" var="tempList" varStatus="status">
											<tr style="height: 4vh;">
												
												<td style="height: 4vh;">${tempList.lessonName}</td>
												<td style="height: 4vh; cursor: pointer;" onclick="OpenWindow('/common/totalDetail.do?id='+'${tempList.studentId}','회원상세보기',600,400);"><strong>${tempList.studentName}</strong></td>
												<td style="height: 4vh;">${tempList.schoolName}</td>
												<td style="height: 4vh;">${tempList.phone}</td>
												<td style="height: 4vh;">${tempList.sattTime}</td>
												<td id="assignmentIdData${status.index}" style="display: none">${tempList.lessonAssignmentId} </td>
												<td style="display: none">${tempList.sattYN} </td>
												<td class="indexTable" style="display: none">${status.index} </td>
												<td id="stIdData${status.index}" style="display: none">${tempList.studentId}</td>
												<td style="height: 4vh;">
													<div class="row">
														<div class="col-sm-6">
															<button  type="button" class="btn btn-block btn-outline-info btn-xs gunOne">출석</button>
														</div>
														<div class="col-sm-6">
															<button id="two" type="button" class="btn btn-block btn-outline-danger btn-xs twoout">결석</button>
														</div>
													</div>	
												</td>
												
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
</section>
<form role="form" class="form-horizontal" action="subjectInmodify.do"  method="post" >
		<input id="stIdGun" type="hidden" value="" name="studentId">
		<input id="assignIdGun" type="hidden" value="" name="assignId">
</form>
	
<form role="formOut" class="form-horizontal" action="subjectOutmodify.do"  method="post" >
		<input id="stIdGun2" type="hidden" value="" name="studentId">
		<input id="assignIdGun2" type="hidden" value="" name="assignId">
</form>	
<form id="jobForm">	
		<input type='hidden' name="page" value="" />
		<input type='hidden' name="perPageNum" value="300"/>
		<input type='hidden' name="searchType" value="" />
		<input type='hidden' name="keyword" value="" />
</form>

	
 <script>
 window.onload=function(){
var index =	$('#loopbody').children('tr:last()').children('td:eq(7)').text();

$(document).delegate('#searchTeacherBtn','click',function(){
	let search = $(this).prev().val();
	console.log(search);
	

	
	$.ajax({
        type: "post"
       ,url : "/manager/membermanagement/attandance/subjectlistSearch.do"
       ,data : {"search" : search
    	   		}
       ,success : function (data){
    	   console.log(data);
    	   printData(data,$('#subjectAttTable'),$('#subjectAttTableDiv'),$('#SubjectAttSearchList-template'));
    	   		let index2 = $('.indexTable').text();
    			let handleIndex =  index2[index2.length - 1];
    		
    		for(var i =0; i<handleIndex+1; i++){	
    			
    			let mem_att_check = $('#loopbody').children('tr:eq('+i+')').children('td:eq(6)').text();
    			console.log("das"+mem_att_check);
    			if(mem_att_check ==='Y'){
    				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.borderColor ="#17a2b8";	
    				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.backgroundColor ="#17a2b8";	
    				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.color ="#fff";	
    			}else{			
    				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.borderColor ="#c82333";	
    				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.backgroundColor ="#c82333";	
    				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.color ="#fff";
    			}	
    		}
    		
    		
        }
       ,error : function(e){
        }
	});
	
	
	
	
});

$(document).delegate('.gunOne','click',function(){
	console.log("test");
		
	console.log($(this));
	let studentId = $(this).parent().parent().parent().prev().text();
	let assignId = $(this).parent().parent().parent().prev().prev().prev().prev().text();
		console.log(studentId);
		console.log(assignId);
		/* $("#stIdGun").val(studentId);
		$("#assignIdGun").val(assignId);

		alert("전송");
	 	var form=$('form[role="form"]');	
		form.submit(); */
		let tempCheckAtt= $(this).parent().parent().parent().prev().prev().prev().text();
		console.log(tempCheckAtt);
		
	
		
		$.ajax({
	        type: "post"
	       ,url : "/manager/membermanagement/attandance/subjectInmodify.do"      
	       ,data : {
	    	   studentId :studentId,
	    	   assignId :assignId
	       }
	       ,success : function (data){
	        	console.log(data);
	    	 /*   location.reload(); */
	        }
	       ,error : function(e){
	        }
		});
		
		$(this).css('backgroundColor','#17a2b8');
		$(this).css('borderColor','#17a2b8');
		$(this).css('color','#fff');
		$(this).parent().next().children().css('backgroundColor','#fff');
		$(this).parent().next().children().css('color','#c82333');
		
	
 });
$(document).delegate('#checkClassSelect','change',function(){	
	let sessionId ='${loginUser.id}';
	
	 let changedTemp = $("#checkClassSelect option:selected").val();
	 console.log(changedTemp)
	 if(changedTemp =="담당반"){
		 location.href="/manager/membermanagement/attandance/subjectlist.do"
	 }
	let dataAjax = {
		 mngId : sessionId,
		 lessonAssignmentId : changedTemp
		  
	};
	 	
	dataAjax = JSON.stringify(dataAjax);
	
	
	$.ajax({
        type: "post"
       ,url : "/manager/membermanagement/attandance/subjectlistAjax.do"
       ,contentType: 'application/json'
       ,data : dataAjax
       ,success : function (data){
    	  console.log(data)
    	  printData(data,$('#subjectAttTable'),$('#subjectAttTableDiv'),$('#SubjectAttSearchList-template2'));
    	  
    		let index2 = $('.indexTable').text();
			let handleIndex =  index2[index2.length - 1];
		
		for(var i =0; i<handleIndex+1; i++){	
			
			let mem_att_check = $('#loopbody').children('tr:eq('+i+')').children('td:eq(6)').text();
			console.log("das"+mem_att_check);
			if(mem_att_check ==='Y'){
				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.borderColor ="#17a2b8";	
				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.backgroundColor ="#17a2b8";	
				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.color ="#fff";	
			}else{			
				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.borderColor ="#c82333";	
				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.backgroundColor ="#c82333";	
				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.color ="#fff";
			}	
		}
    	  
        }
       ,error : function(e){
        }
	});
	
});
 

$(document).delegate('.twoout','click',function(){	
	let studentId = $(this).parent().parent().parent().prev().text();
	let assignId = $(this).parent().parent().parent().prev().prev().prev().prev().text();
		console.log("test");
	/* 	$("#stIdGun2").val(studentId);
		$("#assignIdGun2").val(assignId);

		alert("전송");
	 	var form=$('form[role="formOut"]');	
		form.submit();
		 */
			
	$.ajax({
        type: "post"
       ,url : "/manager/membermanagement/attandance/subjectOutmodify.do"      
       ,data : {
    	   studentId :studentId,
    	   assignId :assignId
       }
       ,success : function (data){
        	console.log(data);
    	 /*   location.reload(); */
        }
       ,error : function(e){
        }
	});
	$(this).css('backgroundColor','#c82333');
	$(this).css('borderColor','#c82333');
	$(this).css('color','#fff');
	$(this).parent().prev().children().css('backgroundColor','#fff');
	$(this).parent().prev().children().css('color','#17a2b8');
 });

$(document).delegate('#allAtt','click',function(){
	

	 let schoolIdList =[];
	 let lessonAssignmentIdList =[];
	 let schoolVOList2=[];
	 console.log(index);
		
	 index =	$('#loopbody').children('tr:last()').children('td:eq(7)').text();
		
	 console.log(index);
	for(var j=0; j-1<index; ++j){
		let stringj = j.toString();
		
		let schoolVO ={};
		let tempschoolId = $("#stIdData"+stringj+"").text();
		let tempassignId = $("#assignmentIdData"+stringj+"").text();
		schoolIdList.push(tempschoolId);
		lessonAssignmentIdList.push(tempassignId);
		schoolVO.schoolId=  schoolIdList[j];
		
		schoolVO.lessonAssignmentId = lessonAssignmentIdList[j];
		schoolVOList2.push(schoolVO);
		
	} 
	
	let dataItem = {
			schoolVOList : schoolVOList2
		  
	};
	dataItem = JSON.stringify(dataItem);
	console.log(dataItem);
	$.ajax({
        type: "post"
       ,url : "/manager/membermanagement/attandance/subjectAllmodify.do"      
       ,contentType: 'application/json'
       ,data : dataItem
       ,success : function (data){
    	   let index2 = $('.indexTable').text();
			let handleIndex =  index2[index2.length - 1];
			for(var i =0; i<handleIndex+1; i++){
				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.borderColor ="#17a2b8";	
				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.backgroundColor ="#17a2b8";	
				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.color ="#fff";	
				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.backgroundColor ="#fff";	
				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.color ="#c82333";	
				
			}	
        }
       ,error : function(e){
        }
	});
	
});

$(document).delegate('#allCancle','click',function(){
	

	 let schoolIdList =[];
	 let lessonAssignmentIdList =[];
	 let schoolVOList2=[];
	 console.log(index);
		
		
	 index =	$('#loopbody').children('tr:last()').children('td:eq(7)').text();
		
	for(var j=0; j-1<index; ++j){
		let stringj = j.toString();
		
		let schoolVO ={};
		let tempschoolId = $("#stIdData"+stringj+"").text();
		let tempassignId = $("#assignmentIdData"+stringj+"").text();
		schoolIdList.push(tempschoolId);
		lessonAssignmentIdList.push(tempassignId);
		schoolVO.schoolId=  schoolIdList[j];
		
		schoolVO.lessonAssignmentId = lessonAssignmentIdList[j];
		schoolVOList2.push(schoolVO);
		
	} 
	
	let dataItem = {
			schoolVOList : schoolVOList2
		  
	};
	dataItem = JSON.stringify(dataItem);
	console.log(dataItem);
	$.ajax({
        type: "post"
       ,url : "/manager/membermanagement/attandance/subjectAllCanclemodify.do"      
       ,contentType: 'application/json'
       ,data : dataItem
       ,success : function (data){
    	   let index2 = $('.indexTable').text();
			let handleIndex =  index2[index2.length - 1];
			for(var i =0; i<handleIndex+1; i++){
				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.borderColor ="#c82333";	
				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.backgroundColor ="#c82333";	
				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.color ="#fff";
				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.backgroundColor ="#fff";	
				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.color ="#17a2b8";	
			
			}	
        }
       ,error : function(e){
        }
	});
	
});

	
	
	

			
		for(var i =0; i<index+1; i++){
			
			let mem_att_check = $('#loopbody').children('tr:eq('+i+')').children('td:eq(6)').text();
			console.log(mem_att_check);
			if(mem_att_check ==='Y'){
				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.borderColor ="#17a2b8";	
				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.backgroundColor ="#17a2b8";	
				document.getElementsByClassName("btn btn-block btn-outline-info btn-xs gunOne")[i].style.color ="#fff";	
			}else{			
				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.borderColor ="#c82333";	
				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.backgroundColor ="#c82333";	
				document.getElementsByClassName("btn btn-block btn-outline-danger btn-xs twoout")[i].style.color ="#fff";
			}	
		}
		


 }
 
</script>
<script>
function printData(data,delArea,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	delArea.remove();
	target.append(html);
}
</script>
<script type="text/x-handlebars-template"  id="SubjectAttSearchList-template" >
<table id="subjectAttTable" class="table table-head-fixed table-bordered" style="height: 50vh;" >
							
										<thead >
										
											<tr>
												<th style="background-color:rgb(32 73 105); color: white;">수업명</th>
												<th style="background-color:rgb(32 73 105); color: white;">학생명</th>
												<th style="background-color:rgb(32 73 105); color: white;">학교명</th>
												<th style="background-color:rgb(32 73 105); color: white;">전화번호</th>
												<th style="background-color:rgb(32 73 105); color: white;">출석시간</th>												
												<th style="background-color:rgb(32 73 105); color: white;">출석여부</th>
						
											</tr>
										</thead>
										<tbody id="loopbody">
									{{#each byTeacherAttSearchList}}
											<tr>
												
												<td>{{lessonName}}</td>
												<td cursor: pointer;" onclick="OpenWindow('/common/totalDetail.do?id='+'{{studentId}}','회원상세보기',600,400);"><strong>{{studentName}}</strong></td>
												<td>{{schoolName}}</td>
												<td>{{phone}}</td>
												<td>{{sattTime}}</td>
												<td id="assignmentIdData{{@index}}" style="display: none">{{lessonAssignmentId}}</td>
												<td style="display: none">{{sattYN}}</td>
												<td class="indexTable" style="display: none">{{@index}}</td>
												<td id="stIdData{{@index}}" style="display: none">{{studentId}}</td>
												<td>
													<div class="row">
														<div class="col-sm-6">
															<button  type="button" class="btn btn-block btn-outline-info btn-xs gunOne">출석</button>
														</div>
														<div class="col-sm-6">
															<button id="two" type="button" class="btn btn-block btn-outline-danger btn-xs twoout">결석</button>
														</div>
													</div>	
												</td>
												
											</tr>
									
									{{/each}}
										</tbody>
									</table>

</script>
<script type="text/x-handlebars-template"  id="SubjectAttSearchList-template2" >
<table id="subjectAttTable" class="table table-head-fixed table-bordered" style="height: 50vh;" >
							
										<thead >
										
											<tr>
												<th style="background-color:rgb(32 73 105); color: white;">수업명</th>
												<th style="background-color:rgb(32 73 105); color: white;">학생명</th>
												<th style="background-color:rgb(32 73 105); color: white;">학교명</th>
												<th style="background-color:rgb(32 73 105); color: white;">전화번호</th>
												<th style="background-color:rgb(32 73 105); color: white;">출석시간</th>												
												<th style="background-color:rgb(32 73 105); color: white;">출석여부</th>
						
											</tr>
										</thead>
										<tbody id="loopbody">
									{{#each ajaxSubjectList}}
											<tr>
												
												<td>{{lessonName}}</td>
												<td cursor: pointer;" onclick="OpenWindow('/common/totalDetail.do?id='+'{{studentId}}','회원상세보기',600,400);"><strong>{{studentName}}</strong></td>
												<td>{{schoolName}}</td>
												<td>{{phone}}</td>
												<td>{{sattTime}}</td>
												<td id="assignmentIdData{{@index}}" style="display: none">{{lessonAssignmentId}}</td>
												<td style="display: none">{{sattYN}}</td>
												<td class="indexTable" style="display: none">{{@index}}</td>
												<td id="stIdData{{@index}}" style="display: none">{{studentId}}</td>
												<td>
													<div class="row">
														<div class="col-sm-6">
															<button  type="button" class="btn btn-block btn-outline-info btn-xs gunOne">출석</button>
														</div>
														<div class="col-sm-6">
															<button id="two" type="button" class="btn btn-block btn-outline-danger btn-xs twoout">결석</button>
														</div>
													</div>	
												</td>
												
											</tr>
									
									{{/each}}
										</tbody>
									</table>


</script>
 
</body>
</html>