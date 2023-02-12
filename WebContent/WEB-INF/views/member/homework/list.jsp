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
		max-height: 180px;
		overflow-y: auto;
	}
	div.table2 {
		max-height: 200px;
		overflow-y: scroll;
	}
	div.table11 {
		max-height: 900px;
		overflow-y: auto;
	}
	.clickableTr {
		cursor: pointer;
	}
	.clickableTr:hover {
		color: #fdfbd7;
	    background-color: #9674d3cf;
	    border-color: white;
	    box-shadow: none;
	}
	.selectedTr {
		color: #fdfbd7;
	    background-color: #9674d3cf;
	    border-color: white;
	    box-shadow: none;
	    cursor: pointer;
	}
	.HomeworkLine{
		cursor: pointer;
	}
	.HomeworkLine:hover {
		color: #fdfbd7;
	    background-color: #9674d3cf;
	    border-color: white;
	    box-shadow: none;
	}
	.selectedHomework {
		color: #fdfbd7;
	    background-color: #9674d3cf;
	    border-color: white;
	    box-shadow: none;
	    cursor: pointer;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<script>
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
Handlebars.registerHelper("getToolTipMsg", function(targetStr) {
    
	let resultStr;
	
	if(targetStr == 'badge bg-warning'){resultStr = '과제를 제출하지 않았습니다.'}
	if(targetStr == 'badge bg-secondary'){resultStr = '과제를 제출하였으나, 제출기한이 지났습니다.'}
	if(targetStr == 'badge bg-danger'){resultStr = '과제의 제출기한이 지났습니다. 과제를 제출하지 않았습니다.'}
	if(targetStr == 'badge bg-success'){resultStr = '과제 제출을 완료하고, 담당교사 확인하였습니다.'}
	if(targetStr == 'badge bg-info'){resultStr = '과제를 제출하였으나, 담당교사가 확인하지 않았습니다.'}
	
     return resultStr;
});
</script>
</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }">과제</h1> 
               <c:if test="${fn:indexOf(favoriteMenuListStr, '과제') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               <c:if test="${fn:indexOf(favoriteMenuListStr, '과제') == -1}">
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
   			<div class="col-sm-8">
   				<div class="card card-outline card-light">
					<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
		 				<div class="row">
			               <h3 class="card-title">
								<i class="fas fa-list" aria-hidden="true"></i>
								&nbsp;
								수업선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						   </h3>
		 				</div>
			               <div class="card-tools" style="margin: 0;">
			                  <div class="row">
			                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
									<input id="" type="text" class="form-control float-right" placeholder="수업 검색" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
									<div class="input-group-append">
										<button id="" type="submit" class="btn btn-light" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
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
											<th style="width: 10%">과목</th>
											<th style="width: 25%">수업명</th>
											<th style="width: 10%">강의실</th>
											<th style="width: 10%">선생님</th>
											<th style="width: 10%">상세</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${userLessonList}" var="list">
												<tr data-lessonAssignmentId="${list.lessonAssignmentId }" class="clickableTr">
													<td >${list.lessonSubjectTypeName }</td>
													<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.lessonName }</td>
													<td>${list.lRoomId }</td>
													<td ><strong>${list.mngName }T</strong></td>
													<td>
														<button type="button" class="btn btn-sm btn-light" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;" onclick="OpenWindow('/common/lesson/detail.do?lessonAssignmentId='+${list.lessonAssignmentId},'강의 상세정보',800,700);">상세</button>
													</td>
												</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="card card-outline card-light">
					<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
		 				<div class="row">
			               <h3 class="card-title">
								<i class="fas fa-list" aria-hidden="true"></i>
								&nbsp;
								과제선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						   </h3>
		 				</div>
			               <div class="card-tools" style="margin: 0;">
			                  <div class="row">
			                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
			                  		<select class="form-control" style="width: 100px;">
			                  			<option>전체</option>
			                  			<option>완료</option>
			                  			<option>미완료</option>
			                  		</select>
			                  		<div class="input-group-append">
			                  		</div>
									<input id="" type="text" class="form-control float-right" placeholder="과제 검색" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
									<div class="input-group-append">
										<button id="" type="submit" class="btn btn-light" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
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
											<th style="width: 50%">과제명</th>
											<th style="width: 10%">
												상태
		                                    	</th>
											<th style="width: 15%">요청일</th>
											<th style="width: 20%">마감일</th>
										</tr>
									</thead>
									<tbody id="homeworkTargetTr">
										<tr>
											<td colspan="4">수업을 선택해주세요</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
   			</div>
   			<div class="col-sm-4">
   				<div class="card card-outline card-light">
					<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
  						   <div class="row">
		               <h3 class="card-title">
							<i class="fas fa-list" aria-hidden="true"></i>
							&nbsp;
							과제상세&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					   </h3>
  						   </div>
		               <div class="card-tools" style="margin: 0;">
		                  <div class="row">
		                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
								<div class="input-group-append">
									<button style="display: none;" id="HomeworkSubmitFormBtn" type="button" class="btn btn-light">
										제출하러가기									
									</button>
								</div>
							</div>
						  </div>
		               </div>
		            </div>
							
					<div class="card-body">
						<div class="row table11">
							<table id="example1" class="table table-bordered dataTable dtr-inline" style="text-align : center">
								<tr>
									<td style="width: 30%">과제명</td>
									<td id="hwkName"></td>
								</tr>
								<tr>
									<td style="width: 30%">요청일</td>
									<td id="hwkReqdate" style="width: 70%; text-align: right;"></td>
								</tr>
								<tr>
									<td style="width: 30%">마감일</td>
									<td id="hwkDuedate" style="text-align: right;"></td>
								</tr>
								<tr>
									<td style="width: 30%">제출상태</td>
									<td id="hwkState" style="text-align: right;"></td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td>
										<div id="appendListTr"></div>
									</td>
								</tr>
								<tr>
									<td colspan="2">과제내용</td>
								</tr>
								<tr>
									<td id="hwkContent" colspan="2">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
   			</div>
   		</div>
   </div>
   <div id="userInfo" style="display: none;">
   		${loginUser.id }
   </div>
</section>
<script>
	window.onload = function(){
		$(".clickableTr").on("click",function(){
			$(".selectedTr").attr("class","clickableTr");
			$(this).attr("class","selectedTr")
			let lessonAssignmentId = $(this).attr("data-lessonassignmentid");
			getHomeWorkInfo(lessonAssignmentId);
		});
		
		$(document).on("click",".HomeworkLine",function(){
			$(".selectedHomework").attr("class","HomeworkLine");
			$(this).attr("class","selectedHomework");
			let stateStr = $(this).children().eq(1).children().text();
			if(stateStr == '대기' || stateStr == '완료' || stateStr == '지연'){
				$("#HomeworkSubmitFormBtn").text("수정하러가기");
				$("#HomeworkSubmitFormBtn").attr("style","display:block;");
			} else {
				$("#HomeworkSubmitFormBtn").text("제출하러가기");
				$("#HomeworkSubmitFormBtn").attr("style","display:block;");
			}
			viewHomeWorkDetailInfo($(this));
		});
		
		$(document).on("click",".text-sm",function(){
    		download_go($(this));
    	});
		
		$("#HomeworkSubmitFormBtn").on("click",function(){
			HomeworkSubmitForm_go();
		});
	}
</script>
<script>

	function getHomeWorkInfo(lessonAssignmentId){
		let userId = $("#userInfo").text().trim();
		$.ajax({
	        type: "post"
	       ,url : "/manager/homework/userGetHomeWorkList.do"
	       ,data : {"lessonAssignmentId" : lessonAssignmentId,
	    	   		"userId" : userId
	       			}
	       ,success : function (data){
	    	   
	    	   if(data.howeworkList){
	    		   
	    	   }
	    	   printHtmlData(data,$("#homeworkTargetTr"),$("#howeworkList-template"));
	    	   $('[data-bs-toggle="tooltip"]').tooltip();
	    	   
	        }
	       ,error : function(e){
	        }
		});
	}
	
	function viewHomeWorkDetailInfo(obj){
		let dateStr = obj.children().eq(3).attr("data-origin");
		dateStr = dateStr.substr(0,4)+"-"+dateStr.substr(4,2)+"-"+dateStr.substr(6,2)+"-"+dateStr.substr(9,5);
    	
		$("#hwkName").text(obj.children().eq(0).text());
		$("#hwkDuedate").html(dateStr);
		$("#hwkContent").text(obj.children().eq(3).attr("data-content"));
		let reqDate = obj.children().eq(3).attr("data-hwkReqdate");
		reqDate = reqDate.substr(0,10);
		$("#hwkReqdate").text(reqDate);
		$("#hwkState").text(obj.children().eq(1).text());
		let attachGroupId = obj.children().eq(3).attr("data-attachGroupId");
		
		$.ajax({
	        type: "post"
	       ,url : "/manager/homework/getAttachfileList.do"
	       ,data : {"attachGroupId" : attachGroupId}
	       ,success : function (data){
	    	   console.log(data);
	    	   printHtmlData(data,$('#appendListTr'),$('#attachFileList-template'));
	        }
	       ,error : function(e){
	        }
		});
	}
	
	function download_go(obj){
		
		let attachName = obj.attr("data-attachname");
		let attachPath = obj.attr("data-attachpath");
		
		location.href = "/download.do?attachName="+attachName+"&attachPath="+attachPath;
		
	}
</script>
<script>
	function HomeworkSubmitForm_go(){
		let homeworkId = $(".selectedHomework").attr('id');
		if(!homeworkId){
			alert("과제를 선택해주세요");
			return;
		}
		let userId = $("#userInfo").text().trim();
		let btnName = $("#HomeworkSubmitFormBtn").text().trim();
		let btnNameStr;
		if(btnName == '제출하러가기'){
			btnNameStr = 1;
		}
		if(btnName == '수정하러가기'){
			btnNameStr = 2;
		}
		OpenWindow('/member/homework/registForm.do?homeworkId='+homeworkId+'&userId='+userId+'&btnName='+btnNameStr,'과제 제출',800,700);
	}
</script>
<script>
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
<script type="text/x-handlebars-template"  id="howeworkList-template" >
	{{#each howeworkList}}
	<tr id="{{hwkId}}" class="HomeworkLine">
		<td style="text-align:left;max-width: 30px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{hwkName}}</td>
		<td  data-bs-toggle="tooltip" data-placement="left" title="{{getToolTipMsg givenHwkBadge}}"><span class="{{givenHwkBadge}}">{{givenHwkIscomplete}}</span>
		
		</td>
		<td >{{deleteTime hwkReqdate}}</td>
		<td data-hwkReqdate="{{hwkReqdate}}" data-origin="{{hwkDuedate}}" data-content="{{hwkContent}}" data-attachGroupId="{{attachGroupId}}">{{replaceT hwkDuedate}}</td>
	</tr>
	{{/each}}
</script>
<script type="text/x-handlebars-template"  id="attachFileList-template" >
	
	{{#each attachFileList}}
		<div class="appendList" style="text-align:right;">
			<span>
				<a class="link-black text-sm" data-attachName="{{attachName}}" data-attachPath="{{attachPath}}"><i class="fas fa-link mr-1"></i>{{cutUUID attachName}}</a>
			</span>
		</div>
	{{/each}}
</script>  
</body>
</html>