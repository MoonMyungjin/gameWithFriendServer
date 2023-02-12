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
		max-height: 230px;
		overflow-y: auto;
	}
	div.table2 {
		max-height: 230px;
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
	.managerDetail:hover{
		cursor: pointer;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }">수강인원관리</h1>      
              <!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '수강인원관리') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '수강인원관리') == -1}">
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
        <div class="col-sm-12">
<!--       member -->
<!--       <div class="card card-outline card-light"> -->
<!--       manager -->
          <div class="card card-outline card-dark">
            <div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
	   		<div class="row">
               <h3 class="card-title">
					<i class="fa-solid fa-person-chalkboard"></i>
					&nbsp;
					수업목록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
			   </h3>
			</div>
              <div class="card-tools" style="margin: 0;">
                 <div class="row">
                 	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
					<input name="searchkeyword" type="text" class="form-control float-right" placeholder="" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
					<div class="input-group-append">
						<button id="IncludeListSearchBtn" type="submit" onclick="list_go('/manager/lesson/list.do')" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
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
									<th style="width: 8%">과목</th>
									<th style="width: 33%">수업명</th>
									<th style="width: 8%">강의실</th>
									<th style="width: 9%">선생님</th>
									<th style="width: 18%">강의기간</th>
									<th style="width: 10%">강의상태</th>
									<th style="width: 10%">상세보기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${lessonMap.lessonList}" var="lsList">
								<tr class="line">
									<td style="display: none;">${lsList.lessonId }</td>
									<td>${lsList.lessonSubjectType}</td>
									<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">&nbsp;&nbsp;${lsList.lessonName}</td>
									<td>${lsList.lessonRoom}</td>
									<td class="managerDetail" data-id="${lsList.mngName }" ><strong>${lsList.mngId}T</strong></td>
									<td>
<%-- 									<fmt:formatDate value="${lsList.lessonStartDate}" pattern="yyyy-MM-dd"/>~ --%>
<%-- 									<fmt:formatDate value="${lsList.lessonEndDate}" pattern="yyyy-MM-dd"/> --%>
									${fn:substring(lsList.lessonStartDate,0,4)}-${fn:substring(lsList.lessonStartDate,4,6)}-${fn:substring(lsList.lessonStartDate,6,8)}~
									${fn:substring(lsList.lessonEndDate,0,4)}-${fn:substring(lsList.lessonEndDate,4,6)}-${fn:substring(lsList.lessonEndDate,6,8)}
									</td>
									<td>${lsList.lessonStateCode}</td>
									<td>
										<button  type="button" class="btn btn-sm btn-dark viewDetailBtn" >상세보기</button>
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
      </div>
   <div class="card-body">
    <div class="row">
		<div class="col-sm-5">
          <div class="card card-outline card-dark">
          	<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
	   		<div class="row">
               <h3 class="card-title">
					<i class="fa-solid fa-person-chalkboard"></i>
					&nbsp;
					회원목록(수강중)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   </h3>
						   </div>
               <div class="card-tools" style="margin: 0;">
                  <div class="row">
                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
						<input id="searchTeacherInput" type="text" class="form-control float-right" placeholder="" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
						<div class="input-group-append">
							<button id="IncludeListSearchBtn" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
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
							<table id="studentIncludeListTable" class="table table-head-fixed table-bordered">
								<thead>
									<tr>
										<th style="width: 20%">학생명</th>
										<th style="width: 30%">학교명</th>
										<th style="width: 20%">반</th>
										<th style="width: 30%">학년</th>
									</tr>
								</thead>
								<tbody id="leftth">
									<tr class="leftclickableTr">
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
            </div>
         </div>
		</div>
		<div class="col-sm-2" style="vertical-align: center;">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<br>
					<button id="moveSave" class="btn-lg btn-block btn-dark btn-flat" style="font-size: 12px;">저장</button>
					<button id="moveAllLeft" class="btn-lg btn-block btn-dark btn-flat"><i class="fa-solid fa-angles-left"></i></button>
					<button id="moveLeft" class="btn-lg btn-block btn-dark btn-flat"><i class="fa-solid fa-angle-left"></i></button>
					<button id="moveRight" class="btn-lg btn-block btn-dark btn-flat"><i class="fa-solid fa-angle-right"></i></button>
					<button id="moveAllRight" class="btn-lg btn-block btn-dark btn-flat"><i class="fa-solid fa-angles-right"></i></button>
				</div>
				<div class="col-sm-1"></div>
			</div>
		</div>        
		<div class="col-sm-5">
          <div class="card card-outline card-dark">
          	<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
		   		<div class="row">
	               <h3 class="card-title">
						<i class="fa-solid fa-person-chalkboard"></i>
						&nbsp;
						회원목록(비수강)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   </h3>
 						   </div>
	               <div class="card-tools" style="margin: 0;">
	                  <div class="row">
	                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
							<input id="searchTeacherInput" type="text" class="form-control float-right" placeholder="" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
							<div class="input-group-append">
								<button id="notIncludeListSearchBtn" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
									<i class="fas fa-search" aria-hidden="true"></i>
								</button>
							</div>
						</div>
					  </div>
	               </div>
	            </div>
            <div class="card-body">
            	<div class="row table1">
					<div class="card-body p-0" >
						<div id="studentNotIncludeListTableDiv">
							<table id="studentNotIncludeListTable" class="table table-head-fixed table-bordered">
								<thead>
									<tr >
										<th style="width: 20%">학생명</th>
										<th style="width: 30%">학교명</th>
										<th style="width: 20%">반</th>
										<th style="width: 30%">학년</th>
									</tr>
								</thead>
								<tbody>
									<tr class="rightclickableTr">
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
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
   
   <form id="jobForm">	
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
   </form>
</section>
   
   <script>
	function list_go(url){
		
		var jobForm=$('#jobForm');
		
		jobForm.find("[name='page']").val($('select[name="page"]').val());
		jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val($('[name="searchkeyword"]').val());
	
		jobForm.attr({
			action:url,
			method:'get'
		}).submit();
	}
   </script>
   <script>
     window.onload=function(){
    	 
    	 $(".viewDetailBtn").on("click",function(e){
    		let lessonAssignmentId = $(this).parent().parent().children().first().text(); 
    	 	OpenWindow('/common/lesson/detail.do?lessonAssignmentId='+lessonAssignmentId,'강의 상세정보',800,700);
    		e.stopImmediatePropagation(); 
    	 });
    	 
    	 $(".managerDetail").on("click",function(e){
    		e.stopImmediatePropagation(); 
    		let managerId = $(this).attr("data-id");
    		OpenWindow('/common/totalDetail.do?id='+managerId,'회원상세보기',600,400);
    	 });
    	 $(document).on("click",".memberDetail",function(e){
    		e.stopImmediatePropagation(); 
    		let managerId = $(this).attr("data-id");
    		OpenWindow('/common/totalDetail.do?id='+managerId,'회원상세보기',600,400);
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
    	 $(".line").click(function(){
    		 $(".selectedLine").attr("class","line")
    		 $(this).attr("class","selectedLine");
    		 
    		 lessonId = $(this).children().first().text();
    		 console.log(lessonId);
    		 
    		 $.ajax({
 		        type: "post"
 		       ,url : "/manager/lesson/getStudentList.do"
 		       ,data : {"lessonId" : lessonId}
 		       ,success : function (data){
 		    	   console.log(data);
 		    	   printData(data,$('#studentIncludeListTable'),$('#studentIncludeListTableDiv'),$('#studentIncludeList-template'));
 		    	   printData(data,$('#studentNotIncludeListTable'),$('#studentNotIncludeListTableDiv'),$('#studentNotIncludeList-template'));
 		        }
 		       ,error : function(e){
 		        }
 			});
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
    	 $("#moveSave").click(function(){
    		 var rightTrs = [];
    		 var leftTrs = [];
    		 var rightIds = [];
    		 var leftIds = [];
    		 
    		 rightTrs.push($(".rightselectedTr"));
    		 rightTrs.push($(".rightclickableTr"));
    		 leftTrs.push($(".leftselectedTr"));
    		 leftTrs.push($(".leftclickableTr"));
    		 
    		 for (var i=0; i<rightTrs[1].length; i++) {
    			 rightIds.push(rightTrs[1][i].getAttribute("studentId"));
    		 }
    		 for (var i=0; i<leftTrs[1].length; i++) {
    			 leftIds.push(leftTrs[1][i].getAttribute("studentId"));
    		 }
    		
   		 	 let dataItem = {
   				   includeList : leftIds
   				  ,notIncludeList : rightIds
   				  ,lessonId : lessonId
   			 };
   		 	 
   		 	 console.log(dataItem);
   		 	dataItem = JSON.stringify(dataItem);
   		 	
   		 	$.ajax({
		        type: "post"
		       ,url : "/manager/takeLesson/regist.do"
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
<script type="text/x-handlebars-template"  id="studentIncludeList-template" >
<table id="studentIncludeListTable" class="table table-head-fixed table-bordered">
	<thead>
		<tr>
			<th style="width: 20%">학생명</th>
			<th style="width: 30%">학교명</th>
			<th style="width: 20%">반</th>
			<th style="width: 30%">학년</th>
		</tr>
	</thead>
	<tbody>
		<tr id = "leftGhostTr"></tr>
{{#each includeList}}
		<tr class="leftclickableTr" studentId="{{id}}">
			<td class="memberDetail" data-id="{{id}}"><strong>{{name}}</strong></td>
			<td>{{schoolNo}}</td>
			<td>{{className}}</td>
			<td>{{gradeCategoryCode}}등 {{grade}}학년</td>
		</tr>
{{/each}}
	</tbody>
</table>
</script>   
<script type="text/x-handlebars-template"  id="studentNotIncludeList-template" >
<table id="studentNotIncludeListTable" class="table table-head-fixed table-bordered">
	<thead>
		<tr>
			<th style="width: 20%">학생명</th>
			<th style="width: 30%">학교명</th>
			<th style="width: 20%">반</th>
			<th style="width: 30%">학년</th>
		</tr>
	</thead>
	<tbody>
		<tr id = "rightGhostTr"></tr>
{{#each notIncludeList}}
		<tr class="rightclickableTr" studentId="{{id}}">
			<td class="memberDetail" data-id="{{id}}"><strong>{{name}}</strong></td>
			<td>{{schoolNo}}</td>
			<td>{{className}}</td>
			<td>{{gradeCategoryCode}}등 {{grade}}학년</td>
		</tr>
{{/each}}
	</tbody>
</table>
</script>  
</body>
</html>