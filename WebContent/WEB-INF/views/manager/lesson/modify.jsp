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
	div.table2 {
		max-height: 230px;
		overflow-y: auto;
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
              <h1 data-userId="${loginUser.id }" >수업목록</h1>
                    <!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '수업목록') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '수업목록') == -1}">
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
						<i class="fa-solid fa-chalkboard-user"></i>
						&nbsp;
						수업목록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;
				   </h3>
 						   </div>
	               <div class="card-tools" style="margin: 0;">
	                  <div class="row">
	                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
							<input id="searchlessonInput" value="${keyword }" type="text" class="form-control float-right" placeholder="수업 검색" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
							<div class="input-group-append">
								<button id="searchlessonBtn" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
									<i class="fas fa-search" aria-hidden="true"></i>
								</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<div class="input-group-append">
								<button id="listSaveExcelBtn" type="submit" class="btn btn-info" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
									EXCEL
								</button>
							</div>
							<div class="input-group-append">
								<button id="listSavePdfBtn" type="submit" class="btn btn-danger" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
									PDF
								</button>
							</div>
						</div>
					  </div>
	               </div>
	            </div>
           	<div id="ghostDiv"></div>
            <div id="lessonList">
	            <div id="lessonArea" class="card-body">
	            	<div id="lessonListTable" class="row table1">
						<div class="card-body p-0">
							<table id="excelPrintTargetTable" class="table table-head-fixed table-bordered">
								<thead>
									<tr>
										<th style="width: 9%">수업번호</th>
										<th style="width: 8%">과목</th>
										<th style="width: 28%">수업명</th>
										<th style="width: 8%">강의실</th>
										<th style="width: 9%">선생님</th>
										<th style="width: 18%">강의기간</th>
										<th style="width: 10%">강의상태</th>
										<th class="excludeThisClass" style="width: 10%">상세보기</th>
									</tr>
								</thead>
								<tbody id="searchResultTable">
									<c:forEach items="${lessonList}" var="lsList">
									<tr class="line">
										<td>${lsList.lessonId}</td>
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
										<td class="excludeThisClass">
											<button  type="button" class="btn btn-sm btn-dark viewDetailBtn" >상세보기</button>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
	            </div>
	            <div>
	            	<div class="card-footer">
<!-- 		            	<nav aria-label="Navigation"> -->
<!-- 							<ul class="pagination justify-content-center m-0"> -->
<!-- 								<li class="page-item"> -->
<!-- 									<a class="page-link" href="javascript:list_go(1);"> -->
<!-- 										<i class="fas fa-angle-double-left"></i> -->
<!-- 									</a> -->
<!-- 								</li> -->
<!-- 								<li class="page-item"> -->
<%-- 									<a class="page-link" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page}');"> --%>
<!-- 										<i class="fas fa-angle-left"></i> -->
<!-- 									</a> -->
<!-- 								</li> -->
<%-- 								<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" > --%>
										
<%-- 									<li class="page-item ${pageMaker.cri.page == pageNum?'active':''}"> --%>
<%-- 										<a class="page-link" href="javascript:list_go('${pageNum}');" >${pageNum }</a> --%>
<!-- 									</li> -->
									
<%-- 								</c:forEach> --%>
<!-- 								<li class="page-item"> -->
<%-- 									<a class="page-link" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page}');"> --%>
<!-- 										<i class="fas fa-angle-right" ></i> -->
<!-- 									</a> -->
<!-- 								</li> -->
<!-- 								<li class="page-item"> -->
<%-- 									<a class="page-link" href="javascript:list_go('${pageMaker.realEndPage}');"> --%>
<!-- 										<i class="fas fa-angle-double-right"></i> -->
<!-- 									</a> -->
<!-- 								</li>	 -->
<!-- 							</ul> -->
<!-- 						</nav> -->
		            </div>
	            </div>
            </div>
         </div>
		</div>         
      </div>
   </div>
   <div class="card-body">
   </div>
   <form id="jobForm">	
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value="6"/>
	<input type='hidden' name="keyword" value="" />
   </form>
</section>

<script>
     window.onload=function(){
    	 
    	 $("#listSaveExcelBtn").on("click",function(){
   			$("#excelPrintTargetTable").table2excel({
   		        exclude: ".excludeThisClass",
   		        name: "sheet1",
   		        filename: "수업List", 
   		        preserveColors: false 
   		 	});
    	 });
    	 
    	 $(".managerDetail").on("click",function(e){
     		e.stopImmediatePropagation(); 
     		let managerId = $(this).attr("data-id");
     		OpenWindow('/common/totalDetail.do?id='+managerId,'회원상세보기',600,400);
     	 });
    	 
    	 $(".page-item").on("click",function(){
    		 setTimeout(function() {
		    		$(".page-item active").attr("class","page-item");
		    		$(this).attr("class","page-item active"); 
     			}, 3000);
    	 });
    	 
    	 $('#listSavePdfBtn').click(function() { // pdf저장 button id
    			
    			PDFSave($('#lessonListTable'),'lessonList.pdf');
    			
    		});
    	 
    	 setTimeout(function() {
 			let searchKeyword = $("#searchlessonInput").val();
 			let searchResultTableStr = $("#searchResultTable").html();
 			if(!(searchKeyword == 'undefined' || searchKeyword=='')){
 				let result = HighLightSearchResult($("searchResultTable"),searchResultTableStr,searchKeyword);
 				$("#searchResultTable").html(result);
 			}
 		}, 200);
    	 
    	 $("#searchlessonInput").on("keyup",function(key){
 			if(key.keyCode==13) {
 				
 				list_go(1);
 	        }
 		});
    	 
    	 $("#searchlessonBtn").on("click",function(){
    		
    		 list_go(1);
    	 });
    	 
    	 $(document).on("click",".viewDetailBtn",function(){
     		let lessonAssignmentId = $(this).parent().parent().children().first().text(); 
     	 	OpenWindow('/common/lesson/detail.do?lessonAssignmentId='+lessonAssignmentId,'강의 상세정보',800,700);
     		 
     	 });
   	 }
     
     function list_go(page,url){
 		if(!url) url="/manager/lesson/modify.do";
 		
 		var jobForm=$('#jobForm');
 		
 		jobForm.find("[name='page']").val(page);
 		jobForm.find("[name='keyword']").val($('#searchlessonInput').val());
 		jobForm.attr({
 			action:url,
 			method:'get'
 		}).submit();
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
</body>
</html>