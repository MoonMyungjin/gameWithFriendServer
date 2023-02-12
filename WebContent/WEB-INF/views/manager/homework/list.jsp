<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<meta charset="UTF-8">
<title></title>
<style>
	div.table1 {
		max-height: 200px;
		overflow-y: auto;
	}
	div.table2 {
		max-height: 250px;
		overflow-y: auto;
	}
	div.table4 {
		max-height: 700px;
		overflow-y: auto;
	}
	#userHomeWorkContent{
		max-width: 615px;
	}
	.rightselectedTr{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
	.rightclickableTr{
		cursor: pointer;
	}
	.rightclickableTr:hover{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
	}
	.rightselectedTr{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
	.leftclickableTr{
		cursor: pointer;
	}
	.leftclickableTr:hover{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
	}
	.leftselectedTr{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
	.selectedLesson{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
	
	.lessonLine {
		cursor: pointer;
	}
	.lessonLine:hover {
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
	}
	.HomeworkLine{
		cursor: pointer;
	}
	.HomeworkLine:hover{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
	}
	.selectedHomeworkLesson{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
	.homeworkInfoclickableTr{
		cursor: pointer;
	}
	.homeworkInfoclickableTr:hover{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
	}
	.selectedHomeworkInfo{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
	.input-file-button{
	  padding: 6px 25px;
	  background-color:#FF6600;
	  border-radius: 4px;
	  color: white;
	  cursor: pointer;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
        
        Handlebars.registerHelper("deleteTime", function(targetStr) {
            
 	        return targetStr.substr(0,10);
        });
        Handlebars.registerHelper("replaceT", function(targetStr) {
            
        	let resultStr;
        	
        	resultStr = targetStr.substr(0,4)+"-"+targetStr.substr(4,2)+"-"+targetStr.substr(6,2)+" "+targetStr.substr(9,5)
        	
        	
 	        return resultStr;
        });
        Handlebars.registerHelper("cutUUID", function(targetStr) {
            
        	let resultStr;
        	
        	resultStr = targetStr.split("$$")[1];
        	
 	        return resultStr;
        });
 
</script>
</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }" >과제관리</h1>
              <c:if test="${fn:indexOf(favoriteMenuListStr, '과제관리') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               <c:if test="${fn:indexOf(favoriteMenuListStr, '과제관리') == -1}">
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
    <div class="card card-dark card-outline card-outline-tabs">
		<div class="card-header p-0 border-bottom-0">
			<ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true">과제상세</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile" aria-selected="false">제출과제확인</a>
				</li>
			</ul>
		</div>
		<div class="card-body">
			<div class="tab-content" id="custom-tabs-four-tabContent">
				<div class="tab-pane fade show active" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
					<div class="row">
						<div class="col-sm-6">
							<div class="card card-outline card-dark">
								<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
	    						   <div class="row">
					               <h3 class="card-title">
										<i class="fa-solid fa-person-chalkboard"></i>
					<!-- 					<i class="fa-solid fa-1"></i> -->
										&nbsp;
										수업선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								   </h3>
	    						   </div>
					               <div class="card-tools" style="margin: 0;">
					                  <div class="row">
					                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											<input id="searchlessonInput" type="text" class="form-control float-right" value="${cri.keyword }" placeholder="" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											<div class="input-group-append">
												<button id="searchlessonButton" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
													<i class="fas fa-search" aria-hidden="true"></i>
												</button>
											</div>
										</div>
									  </div>
					               </div>
					            </div>
								
								<div class="card-body">
									<div class="row table1">
										<div class="card-body p-0">
											<table class="table table-head-fixed table-bordered">
												<thead>
													<tr>
														<th style="width: 13%">과목</th>
														<th style="width: 35%">수업명</th>
														<th style="width: 17%">강의실</th>
														<th style="width: 17%">선생님</th>
														<th style="width: 18%">상세</th>
													</tr>
												</thead>
												<tbody id="searchResultTable">
													<c:forEach items="${lessonList}" var="lessonList">
													<tr class="lessonLine" data-lessonAsgnId="${lessonList.lessonId}">
														<td>${lessonList.lessonSubjectType}</td>
														<td style="text-align:left;max-width: 150px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${lessonList.lessonName}</td>
														<td>${lessonList.lessonRoom}</td>
														<td class="managerDetail" data-id="${lessonList.mngId }" style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><strong>${lessonList.mngName}T</strong></td>
														<td>
															<button data-id="${lessonList.lessonId}" type="button" class="btn btn-sm btn-dark viewDetailBtn">상세</button>
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
						<div class="col-sm-6">
							<div class="card card-outline card-dark">
								<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
	    						   <div class="row">
					               <h3 class="card-title">
										<i class="fas fa-list" aria-hidden="true"></i>
										&nbsp;
										과제선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								   </h3>
	    						   </div>
					               <div class="card-tools" style="margin: 0;">
					                  <div class="row">
					                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											<input id="" type="text" class="form-control float-right" placeholder="과제명 검색" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											<div class="input-group-append">
												<button id="" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
													<i class="fas fa-search" aria-hidden="true"></i>
												</button>
											</div>
										</div>
									  </div>
					               </div>
					            </div>
								
								<div class="card-body">
									<div class="row table1">
										<div class="card-body p-0">
											<table class="table table-head-fixed table-bordered">
												<thead>
													<tr>
														<th>과제명</th>
														<th style="width: 20%">요청일</th>
														<th style="width: 30%">마감기한</th>
													</tr>
												</thead>
												<tbody id="homeworkTargetTr">
													<tr>
														<td colspan="3">수업을 선택해주세요</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="card card-outline card-dark">
							<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
	    						<div class="row">
					               <h3 class="card-title">
					               		<i class="fa-solid fa-file-signature" aria-hidden="true"></i>
										&nbsp;
										과제정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										
								   </h3>
	    						   </div>
					               <div class="card-tools" style="margin: 0;">
					                  <div class="row">
					                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											<div class="input-group-append">
												<button id="submitFormResetBtn" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
													초기화
												</button>
											</div>
											<div class="input-group-append">
												<button id="submitFormBtn" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
													저장
												</button>
											</div>
											<div class="input-group-append">
												<button id="deleteHomeworkBtn" type="submit" class="btn btn-danger" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
													삭제
												</button>
											</div>
										</div>
									  </div>
					               </div>
					            </div>
							<div class="card-body">
								<div class="row">
									<div class="col-sm-6">
										<form enctype="multipart/form-data" role="form" method="post" action="/manager/homework/regist.do" name="registForm">
											<table id="example1" class="table table-bordered dataTable dtr-inline" style="text-align : center">
												<tr>
													<td style="width: 20%">과제명</td>
													<td colspan="3"><input id="hwkName" name="hwkName" class="form-control" type="text" value=""></td>
												</tr>
												<tr>
													<td style="width: 25%">마감기한</td>
													<td colspan="3" style="width: 25%"><input id="hwkDuedate" name="hwkDuedate" class="form-control" type="datetime-local" value="" style="width:100%; height:15px; border: 0; text-align: center;"></td>
												</tr>
												<tr id="appendListTr">
													<td colspan="4">
														<textarea id="hwkContent" name="hwkContent" class="form-control" rows="6" cols="">
														</textarea>
													</td>
												</tr>
												<tr>
													<td colspan="1">
														<div class="form-group">								
															&nbsp;&nbsp;<button class="btn btn-xs btn-dark"
															onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
														</div>
													</td>
													<td colspan="3">
														<div class="form-group">								
															<div class="card-footer fileInput">
															</div>
														</div>
													</td>
												</tr>
											</table>
											<input type="hidden" id="studentInfoStr" name="studentInfoStr" >
											<input type="hidden" id="lessonassignmentId" name="lessonassignmentId" >
											<input type="hidden" id="managerId" name="managerId" value="${loginUser.id }">
											<input type="hidden" id="hwkId" name="hwkId" value=>
										</form>
									</div>
									<div class="col-sm-6">
									<div class="row">
										<div class="col-sm-5">
											<div class="card card-outline card-dark">
												<div class="card-header">
													<h3 class="card-title">
													<i class="fas fa-list" aria-hidden="true"></i>
														&nbsp;
														수강원생목록
													</h3>
													 <div class="card-tools">
									               </div>
												</div>
												
												<div class="card-body">
													<div class="row table2">
														<div id="includeStudentListDiv" class="card-body p-0">
															<table id="includeStudentListTable" class="table table-head-fixed table-bordered">
																<thead>
																	<tr>
																		<th style="width: 50%">반</th>
																		<th style="width: 50%">학생명</th>
																	</tr>
																</thead>
																<tbody id="includeStudentListBody">
																	<tr id = "leftGhostTr"></tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm-2" style="vertical-align: center;">
										<br><br><br>
										<br>
											<button id="moveAllLeft" class="btn-sm btn-block btn-dark btn-flat"><i class="fa-solid fa-angles-left"></i></button>
											<button id="moveLeft" class="btn-sm btn-block btn-dark btn-flat"><i class="fa-solid fa-angle-left"></i></button>
											<button id="moveRight" class="btn-sm btn-block btn-dark btn-flat"><i class="fa-solid fa-angle-right"></i></button>
											<button id="moveAllRight" class="btn-sm btn-block btn-dark btn-flat"><i class="fa-solid fa-angles-right"></i></button>
										</div>
										<div class="col-sm-5">
											<div class="card card-outline card-dark">
												<div class="card-header">
													<h3 class="card-title">
													<i class="fas fa-list" aria-hidden="true"></i>
														&nbsp;
														과제요청목록
													</h3>
													 <div class="card-tools">
									               </div>
												</div>
												
												<div class="card-body">
													<div class="row table2">
														<div id="notIncludeStudentListDiv" class="card-body p-0">
															<table id="notIncludeStudentListTable" class="table table-head-fixed table-bordered">
																<thead>
																	<tr>
																		<th style="width: 50%">반</th>
																		<th style="width: 50%">학생명</th>
																	</tr>
																</thead>
																<tbody id="notIncludeStudentListBody">
																	<tr id = "rightGhostTr"></tr>
																</tbody>
															</table>
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
				</div>
				<div class="tab-pane fade" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
				<div class="row">
					<div class="col-sm-4">
						<div class="card card-outline card-dark">
							<div class="card-header">
								<h3 class="card-title">
								<i class="fas fa-list" aria-hidden="true"></i>
									&nbsp;
									과제요청목록
								</h3>
								 <div class="card-tools">
				               </div>
							</div>
							
							<div class="card-body">
								<div class="row table4">
									<div class="card-body p-0">
										<table class="table table-head-fixed table-bordered">
											<thead>
												<tr>
													<th style="width: 40%;">반
													</th>
													<th style="width: 40%">학생명</th>
													<th style="width: 20%">상태</th>
												</tr>
											</thead>
											<tbody id="notIncludeStudentListBody2">
												<tr id="beforeSelect">
													<td colspan="3">과제를 선택해주세요</td>
												</tr>
												<tr id="homeworkInfoGhostTr"></tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="card card-outline card-dark">
							<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
    						   <div class="row">
					               <h3 class="card-title">
										<i class="fa-solid fa-person-chalkboard"></i>
					<!-- 					<i class="fa-solid fa-1"></i> -->
										&nbsp;
										제출과제 확인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								   </h3>
    						   </div>
				               <div class="card-tools" style="margin: 0;">
				                  <div class="row">
				                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<div class="input-group-append">
											<button id="homeWorkConfirmBtn" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
												완료
											</button>
										</div>
<!-- 										<div class="input-group-append"> -->
<!-- 											<button id="searchlessonButton" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;"> -->
<!-- 												미완료 -->
<!-- 											</button> -->
<!-- 										</div> -->
									</div>
								  </div>
				               </div>
				            </div>
							
							<div class="card-body">
								<div class="row table4">
									<div class="card-body p-0">
										<table class="table table-head-fixed table-bordered">
											<thead>
												<tr>
													<th style="width: 30%">과제명</th>
													<th id="homeWorkNameField" style="width: 70%">쎈수학 102~107페이지 풀기</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td colspan="2">제출과제</td>
												</tr>
												<tr>
													<td id="userHomeWorkContent" colspan="2">
													과제를 선택해주세요
													</td>
												</tr>
												<tr>
												</tr>
											</tbody>
										</table>
										<div id="attachFileListArea">
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
<form id="jobForm">	
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form>   
</section>
<script>
	window.onload=function(){
    	
		setTimeout(function() {
			let searchKeyword = $("#searchlessonInput").val();
			let searchResultTableStr = $("#searchResultTable").html();
			if(!(searchKeyword == 'undefined' || searchKeyword=='')){
				let result = HighLightSearchResult($("searchResultTable"),searchResultTableStr,searchKeyword);
				$("#searchResultTable").html(result);
			}
		}, 200);
		$(document).on("click",".managerDetail",function(e){
    		e.stopImmediatePropagation(); 
    		let managerId = $(this).attr("data-id");
    		OpenWindow('/common/totalDetail.do?id='+managerId,'회원상세보기',600,400);
    	 });
		$(document).on("click",".memberDetail",function(e){
    		e.stopImmediatePropagation(); 
    		let managerId = $(this).attr("data-id");
    		OpenWindow('/common/totalDetail.do?id='+managerId,'회원상세보기',600,400);
    	 });
		
    	$(".viewDetailBtn").on("click",function(){
    		let lessonAssignmentId = $(this).attr("data-id"); 
    		OpenWindow('/common/lesson/detail.do?lessonAssignmentId='+lessonAssignmentId,'강의 상세정보',800,700);
    	});
    	 
    	$("#searchlessonButton").on("click",function(){
    		submitSearchForm();
    	});
    	 
		$("#searchlessonInput").on("keyup",function(key){
    		if(key.keyCode==13) {
	    		submitSearchForm(); 
	        }
		});
    	 
		let lessonAssignmentIdToLineClick;
		$(".lessonLine").on("click",function(){
			lessonAssignmentIdToLineClick = $(this).attr("data-lessonAsgnId");
			getIncludeStudentList(lessonAssignmentIdToLineClick);
			$(".selectedLesson").attr("class","lessonLine");
			$(this).attr("class","selectedLesson");
			$("#lessonassignmentId").val(lessonAssignmentIdToLineClick);
			getHomeWorkList(lessonAssignmentIdToLineClick);
		});
		
		$(document).on("click",".homeworkInfoclickableTr",function(){
			let homeWorkState = $(this).children().eq(2).children().eq(0).text();
			if(homeWorkState=='미제출'){
				Swal.fire({
			        icon: 'warning',
			        title: '제출한 과제가 없습니다!'
			    });
				return;
			}
			$(".selectedHomeworkInfo").attr("class","homeworkInfoclickableTr");
			$(this).attr("class","selectedHomeworkInfo");
			
			getHomeworkDetail($(this));
		});
		
		$("#submitFormResetBtn").on("click",function(){
			submitFormReset();
		});
		
		$("#submitFormBtn").on("click",function(){
			regist_go();
		});
		
		$(document).on('click','.leftclickableTr',function(){
	   		 $(this).attr("class","leftselectedTr");
	   	});
		
	   	$(document).on('click','.leftselectedTr',function(){
			 $(this).attr("class","leftclickableTr");
	   	});
	   	
	   	$(document).on('click','.rightclickableTr',function(){
	   		$(this).attr("class","rightselectedTr");
	   	});
	   	
	   	$(document).on('click','.rightselectedTr',function(){
			$(this).attr("class","rightclickableTr");
	   	});
		
		$("#moveLeft").click(function(){
    		$("#leftGhostTr").after($(".rightselectedTr"));
    		$(".rightselectedTr").css("background-color","white");
    		$(".rightselectedTr").attr("class","leftclickableTr");
    		$(".rightselectedTr").remove();
    	});
		
    	$("#moveRight").click(function(){
    		$("#rightGhostTr").after($(".leftselectedTr"));
    		$(".leftselectedTr").css("background-color","white");
    		$(".leftselectedTr").attr("class","rightclickableTr");
    		$(".leftselectedTr").remove();
    	});
    	
    	$("#moveAllRight").click(function(){
    		$("#rightGhostTr").after($(".leftselectedTr"));
    		$("#rightGhostTr").after($(".leftclickableTr"));
    		$(".leftselectedTr").css("background-color","white");
    		$(".leftselectedTr").attr("class","rightclickableTr");
    		$(".leftselectedTr").remove();
    		$(".leftclickableTr").css("background-color","white");
    		$(".leftclickableTr").attr("class","rightclickableTr");
    		$(".leftclickableTr").remove();
    	});
    	
    	$("#moveAllLeft").click(function(){
    		$("#leftGhostTr").after($(".rightselectedTr"));
    		$("#leftGhostTr").after($(".rightclickableTr"));
    		$(".rightselectedTr").css("background-color","white");
    		$(".rightselectedTr").attr("class","rightclickableTr");
    		$(".rightselectedTr").remove();
    		$(".rightclickableTr").css("background-color","white");
    		$(".rightclickableTr").attr("class","leftclickableTr");
    		$(".rightclickableTr").remove();
    	});
    	
    	let HomeworkId;
    	
    	$(document).on("click",".HomeworkLine",function(){
			$("[name=attachGroupId]").remove();
    		$(".selectedHomeworkLesson").attr("class","HomeworkLine");
			$(this).attr("class","selectedHomeworkLesson");
			viewHomeWorkDetailInfo($(this));
			
			HomeworkId = $(this).attr("id");
			getGivenStudentList(lessonAssignmentIdToLineClick,HomeworkId);
			
			$("#hwkId").val(HomeworkId);
			
			$("#homeWorkNameField").text($("#hwkName").val());
    	});
    	
    	$(document).on("click",".text-sm",function(){
    		download_go($(this));
    	});
    	
    	$("#deleteHomeworkBtn").on("click",function(){
    		deleteHomework(HomeworkId);
    	});
    	
    	$("#homeWorkConfirmBtn").on("click",function(){
    		homeWorkConfirm();
    	});
	}
</script>
<script>
	function viewHomeWorkDetailInfo(obj){
		let dateStr = obj.children().eq(2).attr("data-origin");
		dateStr = dateStr.substr(0,4)+"-"+dateStr.substr(4,2)+"-"+dateStr.substr(6,2)+"T"+dateStr.substr(9,5)
    	
		$("#hwkName").val(obj.children().eq(0).text());
		$("#hwkDuedate").val(dateStr);
		$("#hwkContent").val(obj.children().eq(2).attr("data-content"));
		let attachGroupId = obj.children().eq(2).attr("data-attachGroupId");
		
		$.ajax({
	        type: "post"
	       ,url : "/manager/homework/getAttachfileList.do"
	       ,data : {"attachGroupId" : attachGroupId}
	       ,success : function (data){
	    	   console.log(data);
	    	   printAfterData(data,$(".appendList"),$('#appendListTr'),$('#attachFileList-template'));
	    	   if(data.attachFileList){
	    			var input=$('<input>').attr({"type":"hidden",
	 				 "name":"attachGroupId",
	 				 "value": data.attachFileList[0].attachGroupId
	 					});
	 				$('form[role="form"]').prepend(input);
	    	   }
	        }
	       ,error : function(e){
	        }
		});
	}
	let homeWorkId;
	let studentId;
	let studentName;
	function getHomeworkDetail(obj){
		
		homeWorkId = obj.attr("id");
		studentId = obj.children().eq(1).attr("data-id");
		studentName = obj.children().eq(1).text().trim();
		
		$.ajax({
	        type: "post"
	       ,url : "/manager/homework/getUserHomeWorkInfo.do"
	       ,data : {
	    	   		"homeWorkId" : homeWorkId,
					"studentId" : studentId	    	   		
	       		   }
	       ,success : function (data){
	    	   console.log(data);
	    	   printHtmlData(data,$('#attachFileListArea'),$('#userAttachFileList-template'));
	    	   $("#userHomeWorkContent").html(data.howeworkVO.givenHwkContent);
	        }
	       ,error : function(e){
	        }
		});
	}
</script>

<script>
	
	function submitSearchForm(){
		var jobForm=$('#jobForm');
		
		jobForm.find("[name='keyword']").val($('#searchlessonInput').val());
	
		jobForm.attr({
			action: "/manager/homework/list.do",
			method:'get'
		}).submit();
		
	}
	
	function getIncludeStudentList(lessonAssignmentId){
		
		$.ajax({
	        type: "post"
	       ,url : "/manager/homework/getIncludeStudentList.do"
	       ,data : {"lessonAssignmentId" : lessonAssignmentId}
	       ,success : function (data){
	    	   listClean();
	    	   printAfterData(data,$(".leftclickableTr"),$('#leftGhostTr'),$('#studentIncludeList-template'));
	        }
	       ,error : function(e){
	        }
		});
	}
	
	function listClean(){
		$("#includeStudentListBody").html('<tr id = "leftGhostTr"></tr>');
		$("#notIncludeStudentListBody").html('<tr id = "rightGhostTr"></tr>');
	}
	
	function getHomeWorkList(lessonAssignmentId){
		
		$.ajax({
	        type: "post"
	       ,url : "/manager/homework/getHomeWorkList.do"
	       ,data : {"lessonAssignmentId" : lessonAssignmentId}
	       ,success : function (data){
	    	   
	    	   if(data.howeworkList){
	    		   
	    	   }
	    	   printHtmlData(data,$("#homeworkTargetTr"),$("#howeworkList-template"));
	    	   
	        }
	       ,error : function(e){
	        }
		});
		
		
	}
	
	function submitFormReset(){
		
		// 보여지는 inputpage 필드 비우기
		$("#hwkName").val("");
		$("#hwkDuedate").val("");
		$("#hwkContent").val("");
		$(".appendList").remove();
		
		// 지울파일list input hidden 삭제
		var deleteFile = $("input[name=deleteFile]").length;
		var deleteArr = new Array(deleteFile);
		for(var i=0; i<deleteFile; i++){                          
			deleteArr[i] = $("input[name=deleteFile]").remove();
	    }
		
		
		// addFile 로 만든 list input File 삭제
		$(".inputRow").remove();
	}
	
	var dataNum=0;
	
	function addFile_go(){
		//alert('add file btn');
		
		if($('input[name="uploadFile"]').length >=5){
			alert("파일추가는 5개까지만 가능합니다.");
			return;
		}
		
		var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");

		div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");  
		
		$('.fileInput').append(div);
		
		dataNum++;
	}
	
// 	$(".inputFile").on('change',function(){
// 		  var fileName = $(this).val();
// 		  console.log(fileName);
// 		  $(".upload-name").val(fileName);
// 		});
	
	function remove_go(dataNum){
		$('div[data-no="'+dataNum+'"]').remove();
	}
	
	function remove_old(obj){
		obj.parent().remove();
		
		var input=$('<input>').attr({"type":"hidden",
									 "name":"deleteFile",
									 "value":obj.attr("data-attachgroupId")+"&"+obj.attr("data-attachId")
										});
		$('form[role="form"]').prepend(input);
	}
	function regist_go(){
		
		var rightTrs = [];
		var rightIds = [];
		 
		rightTrs.push($(".rightselectedTr"));
		rightTrs.push($(".rightclickableTr"));
		
		console.log(rightTrs[1]);
		 
		for (var i=0; i<rightTrs[1].length; i++) {
			rightIds.push(rightTrs[1][i].getAttribute("id"));
		}

		let dataItem = {
			IncludeList : rightIds
		};
		 	 
		dataItem = JSON.stringify(dataItem);
		$("#studentInfoStr").val(dataItem);
		
		var files = $('input[name="uploadFile"]');
		for(var file of files){
			console.log(file.name+" : "+file.value);
			if(file.value==""){
				alert("파일을 선택하세요.");
				file.focus();
				file.click();
				return;
			}
		}	
		
		if($("input[name='title']").val()==""){
			Swal.fire({
		        icon: 'warning',
		        title: '과제명은 필수입니다.'
		    });
			$("input[name='title']").focus();
			return;
		}
// 		console.log($("form[role='form']"));
		$("form[role='form']").submit();
		
	}
	
	function download_go(obj){
		console.log(obj[0]);
		
		let attachName = obj.attr("data-attachname");
		let attachPath = obj.attr("data-attachpath");
		
		location.href = "/download.do?attachName="+attachName+"&attachPath="+attachPath;
		
	}
	
	function getGivenStudentList(lessonAssignmentId,homeworkId){
		$.ajax({
	        type: "post"
	       ,url : "/manager/homework/getHomeworkList.do"
	       ,data : {"lessonAssignmentId" : lessonAssignmentId
	    	   	   ,"homeworkId" : homeworkId
	    	   		}
	       ,success : function (data){
	    	   console.log(data);
	    	   $("#beforeSelect").remove();
	    	   $(".selectedHomeworkInfo").attr("class","homeworkInfoclickableTr");
	    	   printAfterData(data,$(".leftclickableTr"),$('#leftGhostTr'),$('#notGivenHomeStudentList-template'));
	    	   printAfterData(data,$(".rightclickableTr"),$('#rightGhostTr'),$('#givenHomeWorkStudentList-template'));
	    	   printAfterData(data,$(".homeworkInfoclickableTr"),$('#homeworkInfoGhostTr'),$('#userGivenHomeStudentList-template'));
	    	   
	        }
	       ,error : function(e){
	        }
		});
		
	}
	
	function deleteHomework(homeworkId){
		if(!homeworkId){
			alert("선택한 과제가 없습니다.");
			return;
		}
		$.ajax({
	        type: "post"
	       ,url : "/manager/homework/remove.do"
	       ,data : {"homeworkId" : homeworkId }
	       ,success : function (data){
	    	   alert("삭제되었습니다.");
	    	   location.reload();	        
	    	}
	       ,error : function(e){
	        }
		});
	}
	
	function homeWorkConfirm(){
		if(!homeWorkId){
			alert("선택한 과제가 없습니다.");
			return;
		}
		if(!studentId){
			alert("선택한 과제가 없습니다.");
			return;
		}
		
		$.ajax({
	        type: "post"
	       ,url : "/manager/homework/confirm.do"
	       ,data : {"homeWorkId" : homeWorkId
	    		   ,"studentId"  : studentId 		
	       }
	       ,success : function (data){
		   	   alert(studentName+"학생의 과제가 완료 처리 되었습니다!");
		   	   $(".selectedHomeworkInfo").children().eq(2).children().eq(0).attr("class","badge bg-success");
		   	   $(".selectedHomeworkInfo").children().eq(2).children().eq(0).text("완료");
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
function printHtmlData(data,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	target.html(html);
}
function printAfterData(data,delArea,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);
	delArea.remove();
	target.after(html);
}
</script>
<script type="text/x-handlebars-template"  id="studentIncludeList-template" >
	{{#each includeList}}
	<tr id="{{id}}" class="leftclickableTr">
		<td style="text-align=left; max-width: 50px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{className}}</td>
		<td class="memberDetail" data-id="{{id}}"><strong>{{name}}</strong></td>
	</tr>
	{{/each}}
</script>     
<script type="text/x-handlebars-template"  id="howeworkList-template" >
	{{#each howeworkList}}
	<tr id="{{hwkId}}" class="HomeworkLine">
		<td style="text-align:left;max-width: 30px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{hwkName}}</td>
		<td >{{deleteTime hwkReqdate}}</td>
		<td data-origin="{{hwkDuedate}}" data-content="{{hwkContent}}" data-attachGroupId="{{attachGroupId}}">{{replaceT hwkDuedate}}</td>
	</tr>
	{{/each}}
</script>     
<script type="text/x-handlebars-template"  id="attachFileList-template" >
	
	{{#each attachFileList}}
	<tr class="appendList">
		<td colspan='2' style="text-align:left;">
			<a class="link-black text-sm" data-attachName="{{attachName}}" data-attachPath="{{attachPath}}"><i class="fas fa-link mr-1"></i>{{cutUUID attachName}}</a>
			<button data-attachGroupId="{{attachGroupId}}" data-attachId="{{attachId}}" onclick="remove_old($(this));" style="border:0;outline:0;" class="badge bg-red" type="button">X</button>
		</td>
	</tr>
	<div>
	{{/each}}
</script>

<script type="text/x-handlebars-template"  id="givenHomeWorkStudentList-template" >
	{{#each givenHomeStudentList}}
	<tr id="{{id}}" class="rightclickableTr">
		<td style="text-align=left; max-width: 50px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{className}}</td>
		<td class="memberDetail" data-id="{{id}}"><strong>{{name}}</strong></td>
	</tr>
	{{/each}}
</script>   
<script type="text/x-handlebars-template"  id="notGivenHomeStudentList-template" >
	{{#each notGivenHomeStudentList}}
	<tr id="{{id}}" class="leftclickableTr">
		<td style="text-align=left; max-width: 50px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{className}}</td>
		<td class="memberDetail" data-id="{{id}}"><strong>{{name}}</strong></td>
	</tr>
	{{/each}}
</script>   
<script type="text/x-handlebars-template"  id="userGivenHomeStudentList-template" >
	{{#each givenHomeWorkList}}
	<tr id="{{hwkId}}" class="homeworkInfoclickableTr">
		<td style="text-align: left;">{{className}}</td>
		<td class="memberDetail" data-id="{{studentId}}"><strong>{{studentName}}</strong>
		</td>
		<td><span class="{{givenHwkBadge}}">{{givenHwkIscomplete}}</span></td>
	</tr>
	{{/each}}
</script>
<script type="text/x-handlebars-template"  id="userAttachFileList-template" >
	{{#each attachFileList}}
	<tr class="appendList">
		<td colspan='2' style="text-align:left;">
			<a class="link-black text-sm" data-attachName="{{attachName}}" data-attachPath="{{attachPath}}"><i class="fas fa-link mr-1"></i>{{cutUUID attachName}}</a>
		</td>
	</tr>
	<div>
	{{/each}}
</script>   
</body>
</html>