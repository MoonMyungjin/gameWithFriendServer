<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<meta charset="UTF-8">
<title></title>
<style>
	div.table1 {
		max-height: 500px;
		overflow-y: auto;
		
	}
	div.table2 {
		max-height: 200px;
		overflow-y: auto;
	}
	.line{
	}
	.line:hover {
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
		
	}
	.selectedLine{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
	.leftclickableTr:hover{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
	.leftselectedTr{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
	}
	.rightclickableTr:hover{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
	.rightselectedTr{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
	}
	.page-item.active .page-link {
		    z-index: 3;
		    color: #fff;
		    background-color: #395d83;
		    border-color: #395d83;
		}
		.page-link{
		color: #395d83;
		}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }">반정보관리</h1>      
              <!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '반정보관리') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '반정보관리') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
                      
           </div>
           <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                 <li class="breadcrumb-item">
                 	<div class="lessonRoomList" style="display: none;">
	                 	<select class="form-control">
	                 		<c:forEach items="${roomList}" var="roomList" varStatus="loop" >
	                 			<option>${roomList.lRoomId }</option>
	                 		</c:forEach>
	                 	</select>
                 	</div>
                 	<div class="teacherList" style="display:none;">
	                 	<select class="form-control">
	                 		<c:forEach items="${teacherList}" var="teacherList" varStatus="loop" >
	                 			<option id="${teacherList.mngId }">${teacherList.mngName }</option>
	                 		</c:forEach>
	                 	</select>
                 	</div>
                 </li>
               </ol>
           </div>
        </div>
   </div>
</section>
<section class="content">
		<div class="row">
			<div class="col-sm-5">
				<div class="card card-outline card-dark">
					<div class="card-header"
								style="vertical-align: center; display: flex; align-items: center; justify-content: space-between; padding: 0.47rem 1.25rem;">
								<div class="row">
									<h3 class="card-title">
										<i class="fa-solid fa-person-chalkboard"></i>
										<!-- 					<i class="fa-solid fa-1"></i> -->
										&nbsp;
										학생&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</h3>
								</div>
								<div class="card-tools" style="margin: 0;">
									<div class="row">
										<div class="input-group input-group-sm"
											style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											<input id="searchlessonInput" type="text"
												class="form-control float-right" value="${cri.keyword }"
												placeholder=""
												style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											<div class="input-group-append">
												<button id="searchlessonButton" type="submit"
													class="btn btn-dark"
													style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
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
								<div id="studentIncludeListTableDiv">
									<div id="studentNotIncludeByClassDiv"></div>
									<table id="studentNotIncludeByClass"
										class="table table-head-fixed table-bordered">
										<thead>
											<tr>
												<th style="width: 18%">학생명</th>
												<th style="width: 34%">학교명</th>
												<th style="width: 30%">반</th>
												<th style="width: 18%">학년</th>
											</tr>
										</thead>
										<tbody id="leftth">
											<tr id="leftGhostTr" ></tr>
										<c:if test="${empty studentList }">
											<tr>
												<td colspan="4" class="text-center">
													해당 내용이 없습니다.
												</td>
											</tr>
										</c:if>
										
										<c:if test="${!empty studentList }">
											<c:forEach items="${studentList }" var="student">
												<tr class="leftclickableTr" style="cursor:pointer;">
													<td id="${student.id }"><strong>${student.name }</strong></td>
													<td>${student.schoolName }</td>
													<td>${student.className }</td>
													<td>${student.grade }</td>
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
			</div>
			<div class="col-sm-7">
				<div class="row">
<!-- 				<div class="col-sm-2"></div> -->
					<div class="col-sm-12">
						<div class="card card-outline card-dark">
							<div class="card-header"
								style="vertical-align: center; display: flex; align-items: center; justify-content: space-between; padding: 0.47rem 1.25rem;">
								<div class="row">
									<h3 class="card-title">
										<i class="fa-solid fa-person-chalkboard"></i>
										<!-- 					<i class="fa-solid fa-1"></i> -->
										&nbsp;
										반&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</h3>
								</div>
								<div class="card-tools" style="margin: 0;">
									<div class="row">
										<div style="width: 40px; margin-right: 10px;">
											<button type="button" id="save" class="btn btn-block btn-dark btn-xs">저장</button>
										</div>
										<div style="width: 60px; margin-right: 0px;">
											<button type="button" id="addForm" class="btn btn-block btn-dark btn-xs">폼추가</button>
										</div>
									
<!-- 										<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5; display: flex;"> -->
<!-- 											<button type="button" id="save" class="btn btn-block btn-outline-info btn-xs">저장</button> -->
<!-- 											<button type="button" id="delete" class="btn btn-block btn-outline-info btn-xs">삭제</button> -->
<!-- 											<button type="button" class="btn btn-block btn-outline-info btn-xs" onclick="rowAdd()">폼추가</button> -->
<!-- 										</div> -->
									</div>
								</div>
							</div>

							<div class="card-body">
							<div class="row table2">
								<div class="card-body table p-0">
									<table data-maxVal="${nextClassId}" id="tb1" class="table table-head-fixed table-bordered">
										<thead>
										
											<tr>
<!-- 													<th><input type="checkbox" value="option1" onclick="checkAll()"></th> -->
													<th style="width: 18%">반이름</th>
													<th style="width: 20%">담임</th>
													<th style="width: 16%">교실</th>
													<th style="width: 11%">인원</th>
													<th style="width: 11%">정원</th>
													<th style="width: 12%">명단</th>
													<th style="width: 12%">삭제</th>
											</tr>
										</thead>
										<tbody id="body">
										
										<c:forEach items="${classList}" var="classList" varStatus="loop" >
											<tr class="insertLine" data-classId="${classList.classId }" style="max-height: 4vh;">
												<td style="padding: 0px; margin: 0px; max-height: 4vh;"><input id="className" name="className" class="form-control" type="text" value="${classList.className}" width="100%"></td>
												<td style="padding: 0px; margin: 0px; max-height: 4vh;"><input id="mngName" name="mngName" data-id="${classList.mngId }" class="form-control" type="text" value="${classList.mngName}" width="100%"></td>
												<td style="padding: 0px; margin: 0px; max-height: 4vh;"><input id="classRoom" name="classRoom" class="form-control" type="text" value="${classList.classRoom}" width="100%"></td>
												<td style="padding: 0px; margin: 0px; max-height: 4vh;">${classList.studentId}</td>
												<td style="padding: 0px; margin: 0px; width: 10vh; max-height: 4vh;" >${classList.lroomMaxNo}</td>
												<td >
													<button class="btn btn-xs btn-dark" onclick="byClassStudent($(this));">명단</button>
												</td>
												<td >
													<button class="btn btn-xs btn-danger deleteBtnWithData">삭제</button>
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
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-2">
								<div class="row">
									<div class="col-sm-1"></div>
									<div class="col-sm-10">
										<br>
										<button id="moveSave"
											class="btn-sm btn-block btn-dark btn-flat"
											style="font-size: 12px;">저장</button>
										<button id="moveAllLeft"
											class="btn-sm btn-block btn-dark btn-flat">
											<i class="fa-solid fa-angles-left"></i>
										</button>
										<button id="moveLeft"
											class="btn-sm btn-block btn-dark btn-flat">
											<i class="fa-solid fa-angle-left"></i>
										</button>
										<button id="moveRight"
											class="btn-sm btn-block btn-dark btn-flat">
											<i class="fa-solid fa-angle-right"></i>
										</button>
										<button id="moveAllRight"
											class="btn-sm btn-block btn-dark btn-flat">
											<i class="fa-solid fa-angles-right"></i>
										</button>
									</div>
									<div class="col-sm-1"></div>
								</div>
							</div>
							<div class="col-sm-10">
								<div class="card card-outline card-dark">
									<div class="card-header"
								style="vertical-align: center; display: flex; align-items: center; justify-content: space-between; padding: 0.47rem 1.25rem;">
								<div class="row">
									<h3 class="card-title">
										<i class="fa-solid fa-person-chalkboard"></i>
										<!-- 					<i class="fa-solid fa-1"></i> -->
										&nbsp;
										<span id="classNameSpan" style="max-width: 150px;">해당 반 학생</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</h3>
								</div>
								<div class="card-tools" style="margin: 0;">
									<div class="row">
										<div class="input-group input-group-sm"
											style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											<input id="searchlessonInput" type="text"
												class="form-control float-right" value="${cri.keyword }"
												placeholder=""
												style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											<div class="input-group-append">
												<button id="searchlessonButton" type="submit"
													class="btn btn-dark"
													style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
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
												<div id="studentByClassDiv">
													<table id="studentByClass" class="table table-head-fixed table-bordered">
														<thead>
															<tr>
																<th style="width: 25%">학생명</th>
																<th style="width: 55%">학교명</th>
																<th style="width: 20%;  display: none">반</th>
																<th style="width: 20%">학년</th>
															</tr>
														</thead>
														<tbody>
															<tr id="rightGhostTr"></tr>
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


		<form id="jobForm">	
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
   </form>
</section>


   <script>
let className;
let classId;
	function list_go(page,url){
		if(!url) url="list.do";
		
		var jobForm=$('#jobForm');
		
		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
		jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
		jobForm.attr({
			action:url,
			method:'get'
		}).submit();
	}
</script>


   <script>
	function byClassStudent(obj){
		className = obj.parent().parent().children().eq(0).children().val();
		classId = obj.parent().parent().attr("data-classId");
		$("#classNameSpan").text(className);
		
		 $.ajax({
		        type: "post"
		       ,url : "/manager/classManagement/studentByClass.do"
		       ,data : {"className" : className}
		       ,success : function (data){
		    	   console.log(data);
		    	   printData(data,$('#studentByClass'),$('#studentByClassDiv'),$('#studentByClass-template'));
		    	   printData(data,$('#studentNotIncludeByClass'),$('#studentNotIncludeByClassDiv'),$('#studentNotIncludeList-template'));
		        }
		       ,error : function(e){
		        }
			});
		
	}
   </script>
   <script>
   
   let nextClassId;
   
     window.onload=function(){
    	 
    	 nextClassId = "${nextClassId}";
    	 
    	 
    	 
    	 $(".viewDetailBtn").on("click",function(){
    		let lessonAssignmentId = $(this).parent().parent().children().first().text(); 
    	 	OpenWindow('/common/lesson/detail.do?lessonAssignmentId='+lessonAssignmentId,'강의 상세정보',800,700);
    		 
    	 });
    	 
    	 $("#addForm").on("click",function(){
    		 let lessonSelectList = $(".lessonRoomList").html();
        	 let teacherList = $(".teacherList").html();
        	 
    		 let line = `<tr class="addedLine" data-classId=`+nextClassId+` style="max-height: 4vh;">
					<td style="padding: 0px; margin: 0px; max-height: 4vh;"><input id="className" name="className" class="form-control" type="text" value="" width="100%"></td>
					<td style="padding: 0px; margin: 0px; max-height: 4vh;">`
					+teacherList+
					`</td>
					<td style="padding: 0px; margin: 0px; max-height: 4vh;">`
					+lessonSelectList+	
					`</td>
					<td style="padding: 0px; margin: 0px; max-height: 4vh;"></td>
					<td style="padding: 0px; margin: 0px; width: 10vh; max-height: 4vh;" ></td>
					<td >
					</td>
					<td >
						<button class="btn btn-xs btn-danger deleteBtnJustForm">삭제</button>
					</td>
				</tr>`;
    		 $("#body").prepend(line);
    		 nextClassId++;
    	 });
    	 
    	 var lessonId = null;
    	 
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
    	 $(document).on('click','.deleteBtnJustForm',function(){
    		 $(this).parent().parent().remove(); 
    	 });
    	 let deleteClassIdArr = [];
    	 $(document).on('click','.deleteBtnWithData',function(){
    		 deleteClassId = $(this).parent().parent().attr("data-classId");
    		 deleteClassIdArr.push(deleteClassId);
    		 $(this).parent().parent().remove(); 
    	 });
    	 $(document).on('click','#save',function(){
    		 let classArr = [];
    		 $(".insertLine").each(function(){
    			 let classInfo = new Object();
    			 console.log(this);
    			 
    			 classInfo.classId = $(this).attr("data-classId");
    			 classInfo.className = $(this).children().eq(0).children().eq(0).val();
    			 classInfo.mngId = $(this).children().eq(1).children().eq(0).attr("data-id");
    			 classInfo.classRoom = $(this).children().eq(2).children().eq(0).val();
    			 classArr.push(classInfo);
    		 });
    		 $(".addedLine").each(function(){
    			 let classInfo = new Object();
    			 console.log(this);
    			 
    			 classInfo.classId = $(this).attr("data-classId");
    			 classInfo.className = $(this).children().eq(0).children().eq(0).val();
    			 classInfo.mngId = $(this).children().eq(1).children().children("option:selected").attr("id");
    			 classInfo.classRoom = $(this).children().eq(2).children().children("option:selected").val();
    			 classArr.push(classInfo);
    		 });
   			 console.log(classArr);
    		 console.log(deleteClassIdArr);
    		 let dataItem = {
    			updatedClassInfo : classArr
    		   ,deletedClassId : deleteClassIdArr
    		 }
    		 dataItem = JSON.stringify(dataItem);
 				
    		 $.ajax({
 		        type: "post"
 		       ,url : "/manager/classManagement/classInfoUpdate.do"
 		       ,contentType: 'application/json'
 		       ,data : dataItem
 		       ,success : function (data){
 		        	location.reload();
 		        }
 		       ,error : function(e){
 		        }
 			});
    		 
    	 });
    	
    	 $(".line").click(function(){
    		 $(".selectedLine").attr("class","line")
    		 $(this).attr("class","selectedLine");
    		 
    		 lessonId = $(this).children().first().text();
    		 console.log(lessonId);
    		 
//     		 $.ajax({
//  		        type: "post"
//  		       ,url : "/manager/classManagement/classInfoUpdate.do"
//  		       ,data : {"lessonId" : lessonId}
//  		       ,success : function (data){
//  		    	   console.log(data);
//  		    	   printData(data,$('#studentIncludeListTable'),$('#studentIncludeListTableDiv'),$('#studentIncludeList-template'));
//  		    	   printData(data,$('#studentNotIncludeListTable'),$('#studentNotIncludeListTableDiv'),$('#studentNotIncludeList-template'));
//  		        }
//  		       ,error : function(e){
//  		        }
//  			});
    	 });
    	 
    	 $("#moveLeft").click(function(){
    		 if(typeof className == "undefined" || className == null || className == ""){
    			 alert("반을 선택해주세요!!");
    			 return;
    		 }
    		 $("#leftGhostTr").after($(".rightselectedTr"));
    		 $(".rightselectedTr").css("background-color","white");
    		 $(".rightselectedTr").each(function(){
     			$(this).children().eq(2).css("display","block");
     		 });
    		 $(".rightselectedTr").attr("class","leftclickableTr");
    		 $(".rightselectedTr").remove();
    	 });
    	 $("#moveRight").click(function(){
    		 if(typeof className == "undefined" || className == null || className == ""){
    			 alert("반을 선택해주세요!!");
    			 return;
    		 }
    		 $("#rightGhostTr").after($(".leftselectedTr"));
    		 $(".leftselectedTr").css("background-color","white");
    		 $(".leftselectedTr").each(function(){
    			$(this).children().eq(2).css("display","none");
    		 });
    		 $(".leftselectedTr").attr("class","rightclickableTr");
    		 $(".leftselectedTr").remove();
    	 });
    	 $("#moveAllRight").click(function(){
    		 if(typeof className == "undefined" || className == null || className == ""){
    			 alert("반을 선택해주세요!!");
    			 return;
    		 }
    		 $("#rightGhostTr").after($(".leftselectedTr"));
    		 $("#rightGhostTr").after($(".leftclickableTr"));
    		 $(".leftselectedTr").css("background-color","white");
    		 $(".leftselectedTr").each(function(){
     			$(this).children().eq(2).css("display","none");
     		 });
    		 $(".leftselectedTr").attr("class","rightclickableTr");
    		 $(".leftselectedTr").remove();
    		 $(".leftclickableTr").css("background-color","white");
    		 $(".leftclickableTr").each(function(){
      			$(this).children().eq(2).css("display","none");
      		 });
    		 $(".leftclickableTr").attr("class","rightclickableTr");
    		 $(".leftclickableTr").remove();
    	 });
    	 $("#moveAllLeft").click(function(){
    		 if(typeof className == "undefined" || className == null || className == ""){
    			 alert("반을 선택해주세요!!");
    			 return;
    		 }
    		 $("#leftGhostTr").after($(".rightselectedTr"));
    		 $("#leftGhostTr").after($(".rightclickableTr"));
    		 $(".rightselectedTr").css("background-color","white");
    		 $(".rightselectedTr").attr("class","rightclickableTr");
    		 $(".rightselectedTr").each(function(){
      			$(this).children().eq(2).css("display","block");
      		 });
    		 $(".rightselectedTr").remove();
    		 $(".rightclickableTr").css("background-color","white");
    		 $(".rightclickableTr").each(function(){
       			$(this).children().eq(2).css("display","block");
       		 });
    		 $(".rightclickableTr").attr("class","leftclickableTr");
    		 $(".rightclickableTr").remove();
    	 });
    	 $("#moveSave").click(function(){
    		 if(typeof className == "undefined" || className == null || className == ""){
    			 alert("반을 선택해주세요!!");
    			 return;
    		 }
    		 var rightTrs = [];
    		 var rightIds = [];
    		 
    		 rightTrs.push($(".rightselectedTr"));
    		 rightTrs.push($(".rightclickableTr"));
    		 for (var i=0; i<rightTrs[1].length; i++) {
    			 rightIds.push(rightTrs[1][i].getAttribute("data-id"));
    		 }
    		
   		 	 let dataItem = {
   		 		   classId : classId
   				  ,studentId : rightIds
   			 };
   		 	 
   		 	 console.log(dataItem);
   		 	dataItem = JSON.stringify(dataItem);
   		 	
   		 	$.ajax({
		        type: "post"
		       ,url : "/manager/classManagement/belongUpdate.do"
		       ,contentType: 'application/json'
		       ,data : dataItem
		       ,success : function (data){
		        	location.reload();
		        }
		       ,error : function(e){
		        }
			});   		 	
    	 });
    	 
    	 $("#IncludeListSearchBtn").click(function(){
    		 var keyword = $("#IncludeListKeyword").val();
    		 var category = $("#IncludeListCategory option:selected").attr('id');
			
    		 let dataItem = {
	    	   		"keyword" : keyword,
	    	   		"searchType" : category,
	    	   		"page" : lessonId
	       			}
    		 
    		 $.ajax({
 		        type: "post"
 		       ,url : "/manager/lesson/getSearchIncludeStudentListToJSON.do"
 		       ,data : dataItem
 		       ,success : function (data){
 		    	   console.log(data);
 		    	   printData(data,$('#studentIncludeListTable'),$('#studentIncludeListTableDiv'),$('#studentIncludeList-template'));
 		    	  console.log($('.leftclickableTr').nth-child(1))
 		        }
 		       ,error : function(e){
 		        }
 			});  
    	 });
    	 
    	 $("#notIncludeListSearchBtn").click(function(){
    		 var keyword = $("#notIncludeListKeyword").val();
    		 var category = $("#notIncludeListCategory option:selected").attr('id');
			
    		 let dataItem = {
	    	   		"keyword" : keyword,
	    	   		"searchType" : category,
	    	   		"page" : lessonId
	       			}
    		 
    		 $.ajax({
 		        type: "post"
 		       ,url : "/manager/lesson/getSearchNotIncludeStudentListToJSON.do"
 		       ,data : dataItem
 		       ,success : function (data){
 		    	   console.log(data);
 		    	   printData(data,$('#studentNotIncludeListTable'),$('#studentNotIncludeListTableDiv'),$('#studentNotIncludeList-template'));
 		    	   console.log($('.leftclickableTr').nth-child(1))
 		    	   
 		        }
 		       ,error : function(e){
 		        }
 			});  
    	 });
   	 }
   </script>
<script>
function printData(data,delArea,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	delArea.remove();
	target.after(html);
}
</script>




<script type="text/x-handlebars-template"  id="studentByClass-template" >
<table id="studentByClass" class="table table-head-fixed table-bordered">
	<thead>
		<tr>
			<th style="width: 30%">학생명</th>
			<th style="width: 40%">학교명</th>
			<th style="width: 20%;  display: none">반</th>
			<th style="width: 30%">학년</th>
		</tr>
	</thead>
	<tbody>
		<tr id="rightGhostTr"></tr>
		{{#if studentByClassList}}
			 {{#each studentByClassList}}

		<tr data-id="{{id}}" class="rightclickableTr">
			<td style="font-weight: bold;"><strong>{{name}}</strong></td>
			<td>{{schoolName}}</td>
			<td style="display:none">{{className}}</td>
			<td>{{grade}}</td>
		</tr>

			 {{/each}}
		{{else}}
			<tr>
  				 <td colspan="7" class="text-center">
      				 해당내용이 없습니다.
  				 </td>
			</tr>
		{{/if}}




	</tbody>
</table>
</script> 


  
<script type="text/x-handlebars-template"  id="studentNotIncludeList-template" >
<table id="studentNotIncludeByClass"
	class="table table-head-fixed table-bordered">
	<thead>
		<tr>
			<th style="width: 18%">학생명</th>
			<th style="width: 34%">학교명</th>
			<th style="width: 30%">반</th>
			<th style="width: 18%">학년</th>
		</tr>
	</thead>
	<tbody id="leftth">
		<tr id="leftGhostTr" ></tr>
		{{#each notIncludeStudentByClassList}}
	       <tr data-id="{{id}}" class="leftclickableTr" style="cursor:pointer;">
	       	<td><strong>{{name }}</strong></td>
	       	<td>{{schoolName }}</td>
	       	<td>{{className }}</td>
	       	<td>{{grade }}</td>
	       </tr>
		{{/each}}
	</tbody>
</table>
</script>  
</body>
</html>