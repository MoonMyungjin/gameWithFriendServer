<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<meta charset="UTF-8">
<title></title>
<style>
	.lessonLine {
		cursor: pointer;
	}
	.lessonLine:hover {
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
	.selectedLesson{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
	div.table3 {
		max-height: 300px;
		overflow-y: auto;
	}
	.backgroundTd {
		background-color:rgb(32 73 105);
		color: white;
	}
</style>

</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }">강의관리</h1>
              <!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '강의관리') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '강의관리') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
                            
           </div>
           <div class="col-sm-6">
           </div>
        </div>
   </div>
</section>
<section class="content">
	
   <div class="card-header">
   	  <div class="row">
			<div class="col-sm-12">
				<div class="card card-outline card-dark">
	   			
	   			<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
 						   <div class="row">
	               <h3 class="card-title">
						<i class="fa-solid fa-person-chalkboard"></i>
	<!-- 					<i class="fa-solid fa-1"></i> -->
						&nbsp;
						강의선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   </h3>
 						   </div>
	               <div class="card-tools" style="margin: 0;">
	                  <div class="row">
	                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
							<input id="searchlessonInput" type="text" class="form-control float-right" placeholder="강의 검색" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
							<div class="input-group-append">
								<button id="searchlessonBtn" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
									<i class="fas fa-search" aria-hidden="true"></i>
								</button>
							</div>
						</div>
					  </div>
	               </div>
	            </div>
	   			
	            <div class="card-body">
	            	<div class="row table3">
						<div id="lessonListTableDiv" class="card-body p-0">
							<table id="lessonListTable" class="table table-head-fixed table-bordered">
								<thead>
									<tr>
										<th style="width: 9%">수업번호</th>
										<th style="width: 8%">과목</th>
										<th style="width: 28%">수업명</th>
										<th style="width: 10%">금액</th>
										<th style="width: 10%">대상</th>
										<th style="width: 10%">수업시수</th>
									</tr>
								</thead>
								<tbody id="searchResultTable">
									<c:forEach items="${lessonList}" var="lsList">
										<tr class="lessonLine">
											<td>${lsList.lessonId}</td>
											<td data-id="${lsList.lessonSubjectType }">${lsList.lessonSubjectTypeName}</td>
											<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">&nbsp;&nbsp;${lsList.lessonName}</td>
											<td>
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${lsList.lessonPrice}"/>
											</td>
											<td>${lsList.lessonGradeInteGrate}</td>
											<td>${lsList.lessonHours}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
	            </div>
	            <div class="card-footer">
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
						<i class="fa-solid fa-file-circle-plus"></i>
	<!-- 					<i class="fa-solid fa-1"></i> -->
						&nbsp;
						강의 상세&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   </h3>
 						   </div>
	               <div class="card-tools" style="margin: 0;">
	                  <div class="row">
	                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
							<div class="input-group-append">
								<button id="inputFieldResetBtn" class="btn btn-dark" type="button" >
									초기화
								</button>
							</div>
							<div class="input-group-append">
								<button class="btn btn-dark" type="button" onclick="document.getElementById('lessonForm').submit();">
									저장
								</button>
							</div>
						</div>
					  </div>
	               </div>
	            </div>
				<div id="tableArea2" class="card-body">
					<form id="lessonForm" action="/manager/lesson/regist.do">
						<table class="table table-bordered">
							<tr>
								<td class="backgroundTd" colspan="2">강의명</td>
								<td colspan="5">
									<input id="lessonName" name="lessonName" type="text" class="form-control editable editText1">
								</td>
							</tr>
							<tr>
								<td class="backgroundTd" style="width: 10%" rowspan="2">대상</td>
								<td class="backgroundTd" style="width: 10%">구분</td>
								<td style="width: 20%">
									<select id="lessonGradeCategoryCode" name="lessonGradeCategoryCode" required class="form-control">
										<c:forEach items="${ScodeValues.StudentGradeCategoryCodeList}" var="SG">
											<option value="${SG.scodeKey },${SG.scodeValue }">${SG.scodeValue }</option>
										</c:forEach>
									</select>
								</td>
								<td class="backgroundTd" style="width: 10%">강의금액</td>
								<td style="width: 20%">
									<input id="lessonPrice" name="lessonPrice" type="number" min="0" class="form-control editable editText1">
								</td>
								<td class="backgroundTd" style="width: 10%">수업시수</td>
								<td style="width: 20%">
									<input id="lessonHours" name="lessonHours" type="number" min="0" class="form-control editable editText1">
									<input id="lessonId" name="lessonId" type="hidden" class="form-control">
								</td>
							</tr>
							<tr>
								<td class="backgroundTd" >학년</td>
								<td>
									<select id="lessonGrade" name="lessonGrade" required class="form-control">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
									</select>
								</td>
								<td class="backgroundTd" >과목명</td>
								<td>
									<select id="lessonSubjectType" name="lessonSubjectType" required class="form-control">
										<c:forEach items="${ScodeValues.subjectList}" var="subject">
											<option value="${subject.scodeKey }">${subject.scodeValue }</option>
										</c:forEach>
									</select>
								</td>
								<td colspan="2"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
   		</div>
      </div>
   </div>
</section>
<script>
	window.onload = function(){
		
		setTimeout(function() {
			let searchKeyword = $("#searchlessonInput").val();
			let searchResultTableStr = $("#searchResultTable").html();
			if(!(searchKeyword == 'undefined' || searchKeyword=='')){
				let result = HighLightSearchResult($("#searchResultTable"),searchResultTableStr,searchKeyword);
				$("#searchResultTable").html(result);
			}
		}, 200);
		
		$("#searchlessonInput").val("${value}");
		
		if($("#searchlessonInput").val()){
			$("#searchlessonInput").focus();
		}
		
		$(document).on("click",".lessonLine",function(){
			$(".selectedLesson").attr("class","lessonLine");
			$(this).attr("class","selectedLesson");
			
			let lessonId = ""+$(this).children().eq(0).text();
			
			getlessonDetailInfo(lessonId);
		});
		
		$("#inputFieldResetBtn").on("click",function(){
			inputFieldReset();
		});
		
		$("#searchlessonBtn").on("click",function(){
			let value = $("#searchlessonInput").val();
			location.href = "/manager/lesson/registForm.do?value="+value;
	
		});
		
		$("#searchlessonInput").on("keyup",function(key){
			if(key.keyCode==13) {
				let value = $("#searchlessonInput").val();
				location.href = "/manager/lesson/registForm.do?value="+value;
	        }
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
<script>
	function getlessonDetailInfo(lessonId){
		console.log(lessonId);
		
		$.ajax({
	        type: "post"
	       ,url : "/manager/lesson/detail.do"
	       ,data : {"lessonId" : lessonId}
	       ,success : function (data){
	    		console.log(data);
	    		let Ld = data.lessonDetailInfo;
	    		$("#lessonName").val(Ld.lessonName);
	    		$("#lessonGradeCategoryCode option").each(function(){
	    			if($(this).text() == Ld.lessonGradeCategoryCode){
	    				$(this).attr("selected","selected");
	    			}
	    		});
	    		$("#lessonPrice").val(Ld.lessonPrice);
	    		$("#lessonHours").val(Ld.lessonHours);
	    		$("#lessonGrade option").each(function(){
	    			if($(this).text() == Ld.lessonGrade){
	    				$(this).attr("selected","selected");
	    			}
	    		});
	    		$("#lessonSubjectType option").each(function(){
	    			if($(this).text() == Ld.lessonSubjectTypeName){
	    				$(this).attr("selected","selected");
	    			}
	    		});
	    		$("#lessonId").val(Ld.lessonId);

	        }
	       ,error : function(e){
	        }
		});
	}
	
	function inputFieldReset(){
		$("#lessonName").val("");
		$("#lessonGradeCategoryCode option:eq(0)").prop("selected", true);
		$("#lessonPrice").val("");
		$("#lessonHours").val("");
		$("#lessonGrade option:eq(0)").prop("selected", true);
		$("#lessonSubjectType option:eq(0)").prop("selected", true);
		$("#lessonId").val("");
	}
</script>
</body>
</html>