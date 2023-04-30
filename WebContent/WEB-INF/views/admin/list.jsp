<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
	padding-top: 5px;
	padding-bottom: 0px !important;
}

#tb1 td, #td1 th {
	padding: 0;
	padding-top: 5px;
	padding-bottom: 0px;
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
.lineTr:hover {
		cursor: pointer;
		color: #fdfbd7;
	    background-color: rgb(32 73 105);
	    border-color: white;
	    box-shadow: none;
	}
	.selectedTr {
		color: #fdfbd7;
	    background-color: rgb(32 73 105);
	    border-color: white;
	    box-shadow: none;
	}
</style>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6" style="display: flex;">
					<h1 data-userId="${loginUser.id }">상담일지</h1>
					
				<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '상담일지') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '상담일지') == -1}">
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
					<div class="card card-dark card-outline" style="height: 450px;">
						<div class="card-header">
							<div class="row">
								<div class="col-sm-5">
									<h3 class="card-title">
										<i class="fas fa-check"></i> &nbsp;&nbsp; 상담 완료 내역
									</h3>
								</div>
								<div class="col-sm-4"></div>
								<div class="col-sm-3">
											<div class="input-group">
												<input type="text" class="form-control form-control-defalt" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }">
												<div class="input-group-append">
												<button type="button" class="btn btn-dark btn-defalt" id="searchBtn">
												<i class="fas fa-search"></i>
												</button>
			   					 	</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body" style="padding-top: 5px;">

							<div class="row table1" style="max-height: 365px;">
								<table class="table table-head-fixed table-bordered">
									<thead>
										<tr>
											<th style="background-color: rgb(32, 73, 105); color: white;">NO</th>
											<th style="background-color: rgb(32, 73, 105); color: white;">상담일</th>
											<th style="background-color: rgb(32, 73, 105); color: white;">상담구분</th>
											<th style="background-color: rgb(32, 73, 105); color: white;">신청자</th>
											<th style="background-color: rgb(32, 73, 105); color: white;">상담대상자</th>
											<th style="background-color: rgb(32, 73, 105); color: white; width: 20vh;" >일지 작성</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${userList}" var="user">
										<td>${user.UIntgId}</td>
										<td>${user.UName}</td>
									</c:forEach>
									<c:forEach items="${selectCNSLFinishList}" var="finishList" varStatus="index">
										<tr data-id="${finishList.cnsltId }" class="lineTr" style="padding-bottom: 0px;">
											<td>${index.index+1}.</td>
											<td><fmt:formatDate value="${finishList.cnsltSchDate}" pattern="yyyy-MM-dd" /></td>
											<td>${finishList.scodeValue}</td>
											<td id="${finishList.applyerId}">${finishList.cnsltApplyer}</td>
											<td id="${finishList.tarketId}">${finishList.cnsltTarget}</td>
											<c:if test="${empty finishList.cnsltAs}">
											<td>
											<button id="cnsltCompletionYn" type="button" class="btn btn-block btn-info btn-sm" style="width: 10vh; margin-left: 4vh; margin-bottom: 5px;">미완료</button>
											</td>
											</c:if>
											<c:if test="${!empty finishList.cnsltAs}">
											<td>
											<button id="cnsltCompletionYn" type="button" class="btn btn-block btn-info btn-sm" style="width: 10vh; margin-left: 4vh; margin-bottom: 5px;">완료</button>
											</td>
											</c:if>
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
	
	<div id="userId" style="display: none;">${loginUser.id }</div>
	
	<script>
		 
		 
	window.onload = function(){

		
		$("#searchBtn").on("click",function(){
			var search = $(this).parent().parent().children().val();
			
			location.href = "/manager/consulting/list.do?search="+search;
			 
		});

		
	let cnsltId;
	$(document).on("click",".lineTr",function(){
		$(".selectedTr").attr("class","lineTr");
		$(this).attr("class","selectedTr")
		
		cnsltId = $(this).attr("data-id");
		console.log(cnsltId);
		
		
		$.ajax({
		     type: "post"
		    ,url : "/manager/consulting/finishDetail.do"
		    ,data : {"cnsltId" : cnsltId}
		    ,success : function (data){
			 	   console.log(data.finishDetail.parentName);
			 	   console.log(data.finishDetail);
			 	   console.log(data);
			 	   
			 	   
			 	   let studentHpStr = data.finishDetail.studentHp
			 	   studentHpStr = studentHpStr.substr(0,3)+"-"+studentHpStr.substr(3,4)+"-"+studentHpStr.substr(7,4);
			 		console.log(studentHpStr);
			 		let modifyDay = data.finishDetail.cnsltSchDate
			 		let modifiedDay = parseInt(modifyDay.split("-")[2])+1;
			 		if(modifiedDay < 10){
			 			modifiedDay = "0"+modifiedDay;
			 		}
		 	 		modifyDay = modifyDay.split("-")[0]+"-"+modifyDay.split("-")[1]+"-"+modifiedDay;
			 		console.log(modifyDay);
			 		
			 		
			    	if(data.finishDetail.parentName == null ){
			    	
		 	    	$("#cnsltSchDate").text(modifyDay);
		 			$("#scodeValue").attr("data-id",cnsltId);
			 		$("#scodeValue").text(data.finishDetail.scodeValue);
			 		$("#cnsltSchTime").text(data.finishDetail.cnsltSchTime);
			 		$("#parentName").text(data.finishDetail.studentName);
			 		$("#parentHp").text(studentHpStr);
			 		$("#studentName").text(data.finishDetail.studentName);
			 		$("#studentHp").text(studentHpStr);
			 		$("#schoolName").text(data.finishDetail.schoolName);
			 		$("#grade").text(data.finishDetail.grade);
			 		$("#className").text(data.finishDetail.className); 
			 		$("#cnsltContent").text(data.finishDetail.cnsltContent); 
			 		$("#cnsltAs").text(data.finishDetail.cnsltAs); 
			 	
			 		
			    }else{ 
			 		let parentHpStr = data.finishDetail.parentHp
			 		parentHpStr = parentHpStr.substr(0,3)+"-"+parentHpStr.substr(3,4)+"-"+parentHpStr.substr(7,4);
			 		console.log(parentHpStr);
			 		
			 		$("#cnsltSchDate").text(modifyDay);
			 		$("#scodeValue").attr("data-id",cnsltId);
			 		$("#scodeValue").text(data.finishDetail.scodeValue);
			 		$("#cnsltSchTime").text(data.finishDetail.cnsltSchTime);
			 		$("#parentName").text(data.finishDetail.parentName);
			 		$("#parentHp").text(parentHpStr);
			 		$("#studentName").text(data.finishDetail.studentName);
			 		$("#studentHp").text(studentHpStr);
			 		$("#schoolName").text(data.finishDetail.schoolName);
			 		$("#grade").text(data.finishDetail.grade);
			 		$("#className").text(data.finishDetail.className);
			 		$("#cnsltContent").text(data.finishDetail.cnsltContent); 
			 		$("#cnsltAs").text(data.finishDetail.cnsltAs); 
			    }
		     }
		    ,error : function(e){
		     }
			});

	     });
	
	
	$("#registBtn").click(function(){
	 let cnsltContent = $("#cnsltContent").val();
	 let cnsltAs = $("#cnsltAs").val();
	 
	 console.log(cnsltId);
	
	let dataItem = {
			"cnsltContent" : cnsltContent,
			"cnsltAs" : cnsltAs,
			"cnsltId" : cnsltId
		};
	console.log(dataItem);
	
	
	
		  $.ajax({
	          type: "post"
	         ,url : "/manager/consulting/updateRegist.do"
	         ,data : dataItem
	         ,success : function (data){
	        	 console.log(data);
	        		Swal.fire({
				        icon: 'success',
				        title: '저장이 완료 되었습니다!'
				    });
			    	setTimeout(function() {
				    	location.reload();
			    		}, 2000);
	        	 
			     }
	         ,error : function(e){
	          }
	  		}); 
	
	});
	}	
	

</script>

<script>
function list_go(page,url){
      if(!url) url="/manager/consulting/list.do";
      
      var jobForm=$('#jobForm');
      
      jobForm.find("[name='page']").val(page);
      jobForm.find("[name='perPageNum']").val(300);
      jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
      jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
   
      jobForm.attr({
         action:url,
         method:'get'
      }).submit();
   }

</script>

</body>
</html>