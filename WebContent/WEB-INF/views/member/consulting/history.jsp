 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
<meta charset="UTF-8">
<title></title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
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
		.lineTr:hover {
		cursor: pointer;
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
	}


	</style>

</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-12" style="display: flex;">
					<h1 data-userId="${loginUser.id }">상담내역</h1>
				
<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '상담내역') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '상담내역') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>

	
				
				</div>
			</div>
		</div>
	</section>
	
	
<section class="content">
<div class="container-fluid">

		<div class="row">
			<div class="col-sm-12">
			
			
				<div class="row">
			    	<div class="col-sm-12">
			    	
			    	<div class="row">
					<div class="col-sm-6">
						<div class="card card-light card-outline">
						
						
							<div class="card-header">
								<h3 class="card-title">
									<i class="fas fa-check"></i> &nbsp;&nbsp; 상담 신청 내역
								</h3>
							</div>
							<div class="card-tools"></div>


							<div class="card-body" style="height:295px;">
							<div class="row table1" style="max-height: 50vh;">
							
							
												<table class="table table-head-fixed table-bordered">
													<thead>
														<tr>
															<th>신청자</th>
															<th>예약일</th>
															<th>예약 시간</th>
															<th>상담 구분</th>
															<th>상담 선생님</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${category eq 'p' }">
															<c:forEach items="${parentSelectCNSLTBeforList}" var="history">
																<tr data-id="${history.cnsltId}" class="lineTr">
																	<td>${history.cnsltApplyer}</td>
																	<td><fmt:formatDate value="${history.cnsltSchDate}" pattern="yyyy-MM-dd" /></td>
																	<td>${history.cnsltSchTime}</td>
																	<td>${history.scodeValue}</td>
																	<td>${history.mngName}T</td>
																</tr>
	                                						</c:forEach>
	                                				 	</c:if>
	                                				 
	                                				 <c:if test="${category eq 's' }">
	                                					<c:forEach items="${studentSelectCNSLTBeforList}" var="history">
	                                						<tr data-id="${history.cnsltId}" class="lineTr">
																<td>${history.studentName}</td>
																<td><fmt:formatDate value="${history.cnsltSchDate}" pattern="yyyy-MM-dd" /></td>
																<td>${history.cnsltSchTime}</td>
																<td>${history.scodeValue}</td>
																<td style="font-weight: 900; cursor:pointer;" onclick="OpenWindow('/common/totalDetail.do?id='+'${history.mngId}','회원상세보기',600,400);">${history.mngName}T</td>
															</tr>
														</c:forEach>
	                                				 </c:if>
			



													</tbody>
												</table>
											</div>
										
										</div>
										</div>
									</div>
							
									




	
					<div class="col-sm-6">
						<div class="card card-light card-outline">
						
						
							<div class="card-header">
								<h3 class="card-title">
									<i class="fas fa-check"></i> &nbsp;&nbsp; 상담 신청 상세내용
								</h3>
								<div class="card-tools" style="padding: 3px;">
								<div class="input-group input-group-sm">
									<div class="input-group">
										<button id="cancelBtn" type="button" class="btn btn-light" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;" >
											신청 취소
										</button>
									</div>
								</div>
							</div>
								</div>
								




						<div class="card-body" style="height:295px;">
			
						
						
						      <div class="row">
						
							<div class="col-sm-4">
							<label for="id">상담 대상자</label>
							<input type="text" class="form-control" id="studentName" readonly="readonly" style="background-color: white;">
					
							</div>
								
						<div class="col-sm-4">
							<label for="id">선생님</label>
							<input type="text" class="form-control" id="mngName" readonly="readonly" style="background-color: white; font-weight: 900; cursor:pointer;" onclick="OpenWindow('/common/managerDetail.do?id='+'mngId','회원상세보기',600,400);">
						
							</div>
							<div class="col-sm-4">
							<label for="id">신청 현황</label>
							<button id="cnsltConfirmYn" type="button" class="btn btn-block btn-info btn-sm" style="width: 10vh; margin-left: 4vh;">신청 중</button>
											
											
						
							</div>
								</div>
						
				
						      <div class="row">
						<div class="col-sm-4">
							<label for="id">예약일</label>
							<input type="text" class="form-control" id="cnsltSchDate" readonly="readonly" style="background-color: white;">
						
							</div>
							<div class="col-sm-4">
							<label for="id">예약 시간</label>
							<input type="text" class="form-control" id="cnsltSchTime" readonly="readonly" style="background-color: white;">
						
							</div>
							<div class="col-sm-4">
							<label for="id">상담 구분</label>
							<input type="text" class="form-control" id="scodeValue" readonly="readonly" style="background-color: white;">
						
							</div>
								</div>
							
							  <div class="row">
						    <div class="row col-sm-12" style="margin: 5px;">
							<br><label for="id">상담 신청 내용</label>
							<textarea id="cnsltApplyContent" readonly="readonly" style="width: 900px; height: 100px; background-color: white;"></textarea>
							</div>
					
						
							</div>
										
							
					
						</div>
		</div>					
	</div>
										
									
									
									
									
									
									
									
									
									</div>
									





				<div class="col-sm-12">
					<div class="card card-light card-outline">

						<div class="card-header" style="max-height: 8vh;">
						
						
						  <div class="row">
						 
						   
						   <div class="col-sm-8" style="">
								<h3 class="card-title" style="margin-top: 1vh;">
									<i class="fas fa-check"></i> &nbsp;&nbsp; 상담 내역
								</h3>
						   </div>
							<div class="col-sm-2">
							</div>	
				
						
						
						  <div class="col-sm-2" style="margin-bottom: 2vh;">			
								<c:if test="${category eq 'p' }">
							 	<select id="pStudentList" class="form-control" style="">
									<c:forEach items="${studentList}" var="student">
									<option id="${student.studentId}" ${student.studentId eq selectedStudentId ? 'selected':'' }>${student.studentName}</option>
									</c:forEach>
								</select>
								</c:if>
								<c:if test="${category eq 's' }">
								</c:if>
							
						</div>	
					
				</div>
						
						
						</div>
						
					
						
						
						
						
						
						
						

						<div class="card-body" style="padding-top: 5px; height: 315px;">
							<div class="row table1" style="max-height: 40vh;">
							
								
								
								<table
									class="table table-head-fixed table-bordered">
									 <thead>
									<tr class="jsgrid-header-row">
										<th class="jsgrid-header-cell jsgrid-header-sortable"
										>NO.</th>
										<th class="jsgrid-header-cell jsgrid-header-sortable"
										>상담일</th>
										<th class="jsgrid-header-cell jsgrid-header-sortable"
											>상담 시간</th>
										<th class="jsgrid-header-cell jsgrid-header-sortable"
											>상담 대상자</th>
										<th class="jsgrid-header-cell jsgrid-header-sortable"
											>상담 선생님</th>
										<th class="jsgrid-header-cell jsgrid-header-sortable"
											>구분</th>
										<th class="jsgrid-header-cell jsgrid-header-sortable"
											>상담 완료 여부</th>
									</tr>
								<c:if test="${category eq 'p' }">
								<c:forEach items="${selectFinishDetailParentVer}" var="detail" varStatus="index">
									<tr class="jsgrid-row">
										<td class="jsgrid-cell">${index.index+1}.</td>
									    <td class="jsgrid-cell"><fmt:formatDate value="${detail.cnsltSchDate}" pattern="yyyy-MM-dd" /></td>
										<td class="jsgrid-cell">${detail.cnsltSchTime}</td>
										<td class="jsgrid-cell">${detail.studentName}</td>
										<td class="jsgrid-cell">${detail.mngName}T</td>
										<td class="jsgrid-cell">${detail.scodeValue}</td>
										<td class="cnsltCompletionYn">${detail.cnsltCompletionYn}</td>
									</tr>
									</c:forEach>
	                                	</c:if>
	                                	
	                                	<c:if test="${category eq 's' }">
								<c:forEach items="${selectFinishDetailStudentVer}" var="detail" varStatus="index">
										<tr class="jsgrid-row">
										<td class="jsgrid-cell">${index.index+1}.</td>
									    <td class="jsgrid-cell"><fmt:formatDate value="${detail.cnsltSchDate}" pattern="yyyy-MM-dd" /></td>
										<td class="jsgrid-cell">${detail.cnsltSchTime}</td>
										<td class="jsgrid-cell">${detail.studentName}</td>
										<td class="jsgrid-cell">${detail.mngName}T</td>
										<td class="jsgrid-cell">${detail.scodeValue}</td>
										<td class="cnsltCompletionYn">${detail.cnsltCompletionYn}</td>
									</tr>
									</c:forEach>
	                                	</c:if>
	                                	
	                                	
	                                	
	                                	
									</thead>
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

	</section>
	
	
	<input type="hidden" name="parentName" id="parentName">
	<input type="hidden" name="studentName" id="studentName">
	<input type="hidden" name="mngName" id="mngName">
	<input type="hidden" name="cnsltConfirmYn" id="cnsltConfirmYn">
	<input type="hidden" name="cnsltSchDate" id="cnsltSchDate">
	<input type="hidden" name="cnsltSchTime" id="cnsltSchTime">
	<input type="hidden" name="scodeValue" id="scodeValue">
	<input type="hidden" name="cnsltApplyContent" id="cnsltApplyContent">
	
<div id="userId" style="display: none;">${loginUser.id }</div>

	<c:if test="${category eq 'p' }">
		<div id="parentName" style="display: none;">
			${loginUser.parentName }</div>
	</c:if>
	<c:if test="${category eq 's' }">
		<div id="studentName" style="display: none;">
		${loginUser.name }</div>
	</c:if>

<script>
// 	let param = "${parentSelectCNSLTBeforList}";
// 	console.log(param);

</script>

<script>
		 
		 
	window.onload = function(){
		
	/* 	
		if($("#pStudentList").length){
		$("#pStudentList").on("change",function(){
			var pStudentId =  $("#pStudentList option:selected").attr("id");
			console.log(pStudentId);
			
		window.location.href='/member/consulting/history.do?studentId='+pStudentId;
	
		});
		}
		

		
		 
		 */
		
		
		
		
		
		
		
		$(".cnsltCompletionYn").each(function(){
			let text = $(this).text();
			text = text.replaceAll("W","미완료").replaceAll("Y","완료").replaceAll("N","미완료");
			$(this).text(text);
		});
		
	
		
	$(".lineTr").on("click",function(){
		$(".selectedTr").attr("class","lineTr");
		$(this).attr("class","selectedTr")
		
		let cnsltId = $(this).attr("data-id");
		console.log(cnsltId);
		
		
		
		$.ajax({
		     type: "post"
		    ,url : "/member/consulting/beforDetail.do"
		    ,data : {"cnsltId" : cnsltId}
		    ,success : function (data){
		      console.log(data);
		      let cnsltConfirmYn = data.selectCNSLTBeforDetail[0].cnsltConfirmYn;
		      let cnsltConfirmResultStr;
		      if (cnsltConfirmYn == 'W'){
		    	  cnsltConfirmResultStr = '신청 중';
		    	  $("#cancelBtn").css("display","block");
		      }
			  if (cnsltConfirmYn == 'Y'){
				  cnsltConfirmResultStr = '상담  확정';
				  $("#cancelBtn").css("display","none");
			  }
			  if (cnsltConfirmYn == 'N'){
				  cnsltConfirmResultStr = '상담  취소';
				  $("#cancelBtn").css("display","block");
			  }
			  
		      $("#studentName").val(data.selectCNSLTBeforDetail[0].studentName); 

			  $("#mngName").val(data.selectCNSLTBeforDetail[0].mngName);  
			  $("#cnsltConfirmYn").text(cnsltConfirmResultStr);  
			  $("#cnsltSchDate").val(data.selectCNSLTBeforDetail[0].cnsltSchDate);  
			  $("#cnsltSchTime").val(data.selectCNSLTBeforDetail[0].cnsltSchTime);  
			  $("#scodeValue").attr("data-id",cnsltId);
			  $("#scodeValue").val(data.selectCNSLTBeforDetail[0].scodeValue);  
			  $("#cnsltApplyContent").text(data.selectCNSLTBeforDetail[0].cnsltApplyContent);  
		     }
		    ,error : function(e){
		     }
			});

	     });
	
 
	 $("#cancelBtn").click(function(){
		 let cnsltId = $("#scodeValue").attr("data-id");
			console.log(cnsltId);

		$.ajax({
		     type: "post"
		    ,url : "/member/consulting/studentUpdateConfirmN.do"
		    ,data : {"cnsltId" : cnsltId}
		    ,success : function (data){
		    	console.log(data);
		     	Swal.fire({
			        icon: 'success',
			        title: '신청 취소 되었습니다!'
			    });
		    	setTimeout(function() {
			    	location.reload();
		    		}, 2000);
		     }
		    ,error : function(e){
		    	 Swal.fire({
				        icon: 'fail',
				        title: '신청 확정 이후에는 신청 취소가 불가합니다!'
				    });
			    	setTimeout(function() {
				    	location.reload();
			    		}, 2000);
		     }
			});
	});   
	
	 
	 
	 

	 
	 
	 
	 
	 
	 
	 
	 
}


</script>







</body>
</html>