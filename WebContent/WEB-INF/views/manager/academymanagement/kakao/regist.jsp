<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="userList" value="${dataMap.userList}" />
<c:set var="cri" value="${pageMaker.cri }" />

<head>
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
	<style>
		* {
			font-size: 14px;
		}
		
		label {
			margin-bottom: 0;
		}
		
		div.table1 {
			max-height: 300px;
			overflow-y: auto;
		}	

		div.table2 {
			max-height: 160px;
			overflow-y: scroll;
		}
		
		div.table3 {
			max-height: 400px;
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
		
		.table-hover:hover tbody tr:hover td {
   			 background-color: #395d83;
   			 color: white;
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
		
	.stepper-wrapper {
	  margin-top: auto;
	  display: flex;
	  justify-content: space-between;
	  margin-bottom: 20px;
	}
	.stepper-item {
	  position: relative;
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  flex: 1;
	
	  @media (max-width: 768px) {
	    font-size: 12px;
	  }
	}
	
	.stepper-item::before {
	  position: absolute;
	  content: "";
	  border-bottom: 2px solid #ccc;
	  width: 100%;
	  top: 20px;
	  left: -50%;
	  z-index: 2;
	}
	
	.stepper-item::after {
	  position: absolute;
	  content: "";
	  border-bottom: 2px solid #ccc;
	  width: 100%;
	  top: 20px;
	  left: 50%;
	  z-index: 2;
	}
	
	.stepper-item .step-counter {
	  position: relative;
	  z-index: 5;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  width: 40px;
	  height: 40px;
	  border-radius: 50%;
	  background: #ccc;
	  margin-bottom: 6px;
	}
	
	.stepper-item.active {
	  font-weight: bold;
	}
	
	.stepper-item.completed .step-counter {
	  background-color: #26ff7b;
	  color : white;
	}
	
	.stepper-item.completed::after {
	  position: absolute;
	  content: "";
	  border-bottom: 2px solid #26ff7b;
	  width: 100%;
	  top: 20px;
	  left: 50%;
	  z-index: 3;
	}
	
	.stepper-item:first-child::before {
	  content: none;
	}
	.stepper-item:last-child::after {
	  content: none;
	}
	</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }" >메세지발송</h1>
              <!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '메세지발송') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '메세지발송') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
                            
           </div>
         
        </div>
   </div>
</section>
<section class="content">
  <div class="container-fluid" style="padding-left: 20px; padding-right: 20px;">
   <div class="card card-dark card-outline" style="height: 89vh;">
		<div class="card-header p-0 border-bottom-0">
		</div>
		<div class="card-body" style="padding-top: 0px;">
			<div class="tab-content" id="custom-tabs-four-tabContent" style="padding-top: 5px;">
				<div class="tab-pane fade show active" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
					<div class="row">
						<div class="col-sm-1">
						</div>
						<div class="col-sm-10">
							<div class="row">
								<div class="col-sm-12" style="padding-top: 10px;">
									<div class="stepper-wrapper">
									  <div class="stepper-item completed">
									    <div class="step-counter">
									    	<i class="fa-solid fa-1"></i>
									    </div>
									    <div class="step-name">발송대상자선택</div>
									  </div>
									  <div id="" class="stepper-item second">
									    <div class="step-counter">
										    <i class="fa-solid fa-2"></i>
									    </div>
									    <div class="step-name">발송메세지선택</div>
									  </div>
									  <div id="" class="stepper-item third">
									    <div class="step-counter">
										    <i class="fa-solid fa-3"></i>
									    </div>
									    <div class="step-name">선택정보확인</div>
									  </div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-1">
						</div>
					</div>
					<div class="row">
					<div class="col-sm-12">
				<div class="card card-dark card-outline">
				<div class="card-header">
				<div class="row" style="display: flex; align-items: center;">
					<div class="col-sm-4">
						<h3 class="card-title">
							<i class="nav-icon fas fa-search"></i> &nbsp;&nbsp; 메세지 발송 검색 리스트
						</h3>
					</div>
					<div class="col-sm-2">
					</div>
					<div class="col-sm-3" style="color:#395d83; text-align: right;">
						총합 : <span class="tableSearchListCount"></span>명
					</div>
					<div class="col-sm-3">
							<div class="input-group">
									<select id="messageCategory" class="form-control form-control-sm" onchange="changeType();" style="width: 20px;">
										<option value="t">전체</option>
										<option value="s">학생</option>
										<option value="p">학부모</option>
										<option value="m">직원</option>
									</select> 
									<input type="text" id="searchKeyWord" class="form-control form-control-sm" placeholder="검색어">
									<div class="input-group-append">
										<button type="button" class="btn btn-dark btn-sm" onclick="changeType();">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
						</div>
					</div>
				</div>
				<div class="card-body" style="padding-top: 5px; height:23vh">
						<div id="tableSearchListDiv" class="row table2">
							<table id="tableSearchList" class="table table-hover table-bordered table-head-fixed text-center" >					
									<thead>
										<tr>
											<th style="width:10%;">발송대상</th>
											<th style="width:10%;">이름</th>
											<th style="width:10%;">연락처</th>
										</tr>
									</thead>
									<tbody id="tbodyUp">	
									<c:if test="${empty userList}">
										<tr>
											<td colspan="8" class="text-center">
											해당 내용이 없습니다.
											</td>
										</tr>
									</c:if>
									<c:if test="${!empty userList}">
										<c:forEach items="${userList}" var="user" varStatus="status">
											<tr class="upclickableTr" style="cursor: pointer;">
												<c:if test="${user.category eq 's'}">
												<td>학생</td>
												</c:if>
												<c:if test="${user.category eq 'p'}">
												<td>부모</td>
												</c:if>
												<c:if test="${user.category eq 'm'}">
												<td>직원</td>
												</c:if>
												<td style="cursor: pointer;"><strong>${user.name }</strong></td>
												<td>${user.hp }</td>
												<td class="deleteBtn" style="display: none; width:5%;"><button type="button" class="btn btn-danger btn-xs" onclick="deleteTrBtn(this);">삭제</button></td>
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
					<!-- 여기가 첫번째 페이지 검색 창 아래 부분  -->
					<div class="row">
					<div class="col-sm-6"></div>
					<div class="row col-sm-6" style="display: flex; justify-content: space-between;">
							<div class="col-sm-4"></div>
							<div class="col-sm-2" >
								<button id="moveDown" class="btn btn-block btn-dark btn-flat"><i class="fa-solid fa-angle-down"></i></button>
							</div>
							<div class="col-sm-2" >
								<button id="moveAllDown" class="btn btn-block btn-dark btn-flat"><i class="fa-solid fa-angles-down"></i></button>
							</div>	
							<div class="col-sm-4"></div>
					</div>
					</div>
					<div class="row" style="padding-top: 20px;">
					
						<div class="col-sm-6" >
								<div class="card card-outline card-dark">
									<div class="card-header">
									<div class="row" style="display: flex; align-items: center;">
										<div class="col-sm-5">
										<h3 class="card-title">
										<i class="fas fa-solid fa-user-group"></i>
											&nbsp;
											그룹 관리
										</h3>
										</div>
										<div class="col-sm-7" style="color:#395d83; text-align: right;">
										<button type="button" class="btn btn-dark btn-sm" onclick="newGroup();">+ 새그룹</button>
										</div>
									</div>
									</div>
									<div class="card-body" style="height:23vh">
										<div id="groupListTableDiv" class="row table2" >
													
											<table id="groupListTable" class="table table-hover table-bordered table-head-fixed text-center" >					
												<thead>
													<tr>
														<th style="width:30%;">그룹명</th>
														<th style="width:20%;">수정/저장</th>
														<th style="width:15%;">삭제</th>
													</tr>
												</thead>
												<tbody>	
												
												</tbody>
											</table>
											
										</div>
									</div>
								</div>
							</div>
							
							<div class="col-sm-6" >
								<div class="card card-outline card-dark">
									<div class="card-header">
									<div class="row" style="display: flex; align-items: center;">
										<div class="col-sm-5">
										<h3 class="card-title">
										<i class="fas fa-solid fa-envelope"></i>
											&nbsp;
											메세지 발송 인원
										</h3>
										</div>
										<div class="col-sm-7" style="color:#395d83; text-align: right;">
										총합 : <span class="tableSendListCount"></span>명&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-dark btn-sm" onclick="groupSave();">그룹 저장</button>
										<button type="button" class="btn btn-dark btn-sm" onclick="flushList();">목록 비우기</button>
										</div>
									</div>
									</div>
									<div class="card-body" style="height:23vh">
										<div id="tableSendListDiv" class="row table2" >
													
											<table id="tableSendList" class="table table-bordered table-head-fixed text-center" >					
												<thead>
													<tr>
														<th style="width:8%;">발송대상</th>
														<th style="width:8%;">이름</th>
														<th style="width:5%;">연락처</th>
														<th class="none" style="display: none;"></th>
														<th class="none" style="display: none;"></th>
														<th class="none" style="display: none;"></th>
														<th style="width:5%;">삭제</th>
													</tr>
												</thead>
												<tbody id="tbodyDown">	
														
												</tbody>
											</table>
											
										</div>
									</div>
								</div>
							</div>
					</div>
					<div class="row">
						<div class="col-sm-1">
						</div>
						<div class="col-sm-10"></div>
						<div class="col-sm-1">
						<button id="firstNextBtn" class="btn btn-block btn-dark">다음</button>
						</div>
					</div>
				</div>
<!-- 첫번째 탭 끝 -->
<!-- 두번째 탭 시작 -->
				<div class="tab-pane fade" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
					<div class="row">
						<div class="col-sm-1">
						</div>
						<div class="col-sm-10">
							<div class="row">
								<div class="col-sm-12" style="padding-top: 10px;">
									<div class="stepper-wrapper">
									  <div class="stepper-item completed">
									    <div class="step-counter">
									    	<i class="fa-solid fa-1"></i>
									    </div>
									    <div class="step-name">발송대상자선택</div>
									  </div>
									  <div id="" class="stepper-item second">
									    <div class="step-counter">
										    <i class="fa-solid fa-2"></i>
									    </div>
									    <div class="step-name">발송메세지선택</div>
									  </div>
									  <div id="" class="stepper-item third">
									    <div class="step-counter">
										    <i class="fa-solid fa-3"></i>
									    </div>
									    <div class="step-name">선택정보확인</div>
									  </div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-1">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5">
								<div class="card card-outline card-dark" >
						           <div class="card-header">
						               <h3 class="card-title">
											<i class="fas fa-solid fa-envelope-open-text"></i>
											&nbsp;
											저장 양식
									   </h3>
						            </div>
						            <div class="card-body">
						            	<div id="templateListTableDiv" class="row table2">
						            		<table id="templateListTable" class="table table-hover table-bordered table-head-fixed text-center">
						            		<thead>
													<tr>
														<th>양식 제목</th>
														<th>삭제</th>
													</tr>
												</thead>
												<tbody>	
													
												</tbody>
											</table>
						            	</div>
						            </div>
						         </div>
<!-- 						         발송 예정 인원  -->
						         <div class="card card-outline card-dark" style="padding-top: 5px;">
						           <div class="card-header row">
						           		<div class="col-sm-8">
							               <h3 class="card-title">
												<i class="fas fa-solid fa-envelope"></i>
												&nbsp;
												발송 예정 인원
										   </h3>
									   </div>
									   <div class="col-sm-4" style="color:#395d83; text-align: right;">
									   		총합 : <span class="tableSendListCount"></span>명
									   </div>
						            </div>
						            <div class="card-body">
						            	<div id="sendMessageConfirmList1" class="row table2">
						            	
						            	</div>
						            </div>
						         </div>
				   		</div>
					  <div id="templateSelectArea" class="col-sm-7">
						<div class="card card-outline card-dark" style="height: 63vh;">
				           <div class="card-header">
				           <div class="row" style="display: flex; align-items: center;">
										<div class="col-sm-4">
										<h3 class="card-title">
										<i class="fas fa-solid fa-comment-sms"></i>
											&nbsp;메세지 내용
							  			</h3>
										</div>
										<div class="col-sm-4">
										</div>
										<div class="col-sm-4" style="text-align: right;">
										<button type="button" class="btn btn-dark btn-sm" onclick="registDirect();">직접 입력</button>
										<button type="button" class="btn btn-dark btn-sm" onclick="templateSave();">작성양식저장</button>
										</div>
									</div>
				            </div>
				            <div class="card-body" style="height: 54vh;">
				            	<div id="sendMessageFormTableDiv" class="row" >
				            		<table id="sendMessageFormTable" class="table table-bordered">
												<tr>
													<th class="noHover" style="width: 10%; vertical-align: center;">양식 제목</th>
													<td class="noHover" style="width: 30%; vertical-align: center;">
														<input class="form-control" disabled="disabled" id="templateName" type="text" placeholder="저장 양식 제목 입력">
													</td>
												</tr>
												<tr>
													<th class="noHover" style="width: 10%; vertical-align: center; ">발송일</th>
													<td class="todayInputTd" id="messageSendDate">
													</td>
												</tr>
												<tr>
													<th class="noHover" style="width: 10%; vertical-align: center;">제목</th>
													<td class="noHover" style="width: 30%; vertical-align: center;">
														<input class="form-control" disabled="disabled" id="templateTitle" type="text" placeholder="제목 입력">
													</td>
												</tr>
												<tr>
													<th class="noHover" style="vertical-align: center;" >내용<br>(<span id="nowByte">0</span>/90bytes)</th>
													<td class="noHover"><textarea id="templateContent" required rows="10" class="form-control" style="resize: none;" disabled="disabled" onkeyup="fn_checkByte(this,90)"></textarea></td>
												</tr>
									</table>
				            	</div>
				            </div>
				         </div>
					  </div>
					</div>
					<div class="row" style="padding-top: 39px;">
						<div class="col-sm-1">
						<button id="secondPrevBtn" class="btn btn-block btn-secondary">이전</button>
						</div>
						<div class="col-sm-10"></div>
						<div class="col-sm-1">
						<button id="secondNextBtn" class="btn btn-block btn-dark">다음</button>
						</div>
					</div>
				</div>
<!-- 				두번째 탭 끝 -->
<!-- 				세번째 탭 시작 -->
				<div class="tab-pane fade" id="custom-tabs-four-third" role="tabpanel" aria-labelledby="custom-tabs-four-info-tab">
				<div class="row">
					<div class="col-sm-1">
					</div>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-12" style="padding-top: 10px;">
								<div class="stepper-wrapper">
								  <div class="stepper-item completed">
								    <div class="step-counter">
								    	<i class="fa-solid fa-1"></i>
								    </div>
								    <div class="step-name">발송대상자선택</div>
								  </div>
								  <div id="" class="stepper-item second" >
								    <div class="step-counter">
									    <i class="fa-solid fa-2"></i>
								    </div>
								    <div class="step-name">발송메세지선택</div>
								  </div>
								  <div id="" class="stepper-item third">
								    <div class="step-counter">
									    <i class="fa-solid fa-3"></i>
								    </div>
								    <div class="step-name">선택정보확인</div>
								  </div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-1">
					</div>
				</div>
<!-- 				내용 확인 -->
				<div class="row">
						<div class="col-sm-5">
<!-- 						         발송 예정 인원  -->
						         <div class="card card-outline card-dark" style="padding-top: 5px; height: 63vh;">
						           <div class="card-header row">
						              <div class="col-sm-8">
							               <h3 class="card-title">
												<i class="fas fa-solid fa-envelope"></i>
												&nbsp;
												발송 예정 인원
										   </h3>
									   </div>
									   <div class="col-sm-4" style="color:#395d83; text-align: right;">
									   		총합 : <span class="tableSendListCount"></span>명
									   </div>
						            </div>
						            <div class="card-body">
						            	<div id="sendMessageConfirmList2" class="row table3">
						            	
						            	</div>
						            </div>
						         </div>
				   		</div>
					  <div id="lessonSelectArea" class="col-sm-7">
						<div class="card card-outline card-dark" style="height: 63vh;">
				           <div class="card-header">
				           <div class="row" style="display: flex; align-items: center;">
										<div class="col-sm-4">
										<h3 class="card-title">
										<i class="fas fa-solid fa-comment-sms"></i>
											&nbsp;메세지 내용
							  			</h3>
										</div>
										<div class="col-sm-4">
										</div>
										<div class="col-sm-4" >
										</div>
									</div>
				            </div>
				            <div class="card-body" style="height: 54vh;">
				            	<div id="lessonTimeRegistWeekDayForm" class="row" >
				            		<table id="lessonRegistFormTable" class="table table-bordered">
												<tr>
													<th class="noHover" style="width: 20%; vertical-align: center; ">발송일</th>
													<td class="todayInputTd">
													</td>
												</tr>
												<tr>
													<th class="noHover" style="width: 20%; vertical-align: center; ">제목</th>
													<td class="todayInputTd" id="finalMessageTitle">
													</td>
												</tr>
												<tr>
													<th class="noHover" style="vertical-align: center;" >내용</th>
													<td class="noHover" style="height: 320px;" ><textarea id="finalMessageContent" disabled="disabled" style="width:100%; height: 100%; resize: none; border:none;"></textarea></td>
												</tr>
									</table>
				            	</div>
				            </div>
				         </div>
					  </div>
					</div>
						<div class="row" style="padding-top: 39px;">
						<div class="col-sm-1">
						<button id="thirdPrevBtn" class="btn btn-block btn-secondary">이전</button>
						</div>
						<div class="col-sm-10"></div>
						<div class="col-sm-1">
						<input class="btn btn-block btn-dark" type="button" onclick="messageFormSubmit()" value="발송">
						</div>
						</div>
			</div>
		</div>
		</div>
	</div>
   </div>
   <input type="hidden" id="mngId" value="${loginUser.id}">
</section>
   
 <script>
 window.onload=function(){
	 changeType();
	 changeCount();
	 loadGroupListName();
	 loadTemplateList();
	 
	 $("#firstNextBtn").on("click",function(){
			
			$("#custom-tabs-four-home-tab").attr("class","nav-link");
			$("#custom-tabs-four-profile-tab").attr("class","nav-link active");
			$("#custom-tabs-four-home-tab").attr("aria-selected","false");
			$("#custom-tabs-four-profile-tab").attr("aria-selected","true");
			$("#custom-tabs-four-home").attr("class","tab-pane fade");
			$("#custom-tabs-four-profile").attr("class","tab-pane fade active show");
			
			$(".second").attr("class","stepper-item second completed");
			
			
                var td = new Date();                   //오늘 날짜
                var yyyy = td.getFullYear();           //년도  
                var mm = "" + (td.getMonth()+1);    //월
                var dd = "" + td.getDate();           //일 

                if(mm.length < 2) mm = "0" + mm;
                if(dd.length < 2) dd = "0" + dd;

                var Today = yyyy.toString() +"-"+ mm +"-"+ dd; 

                $(".todayInputTd").text(Today);
                
                $('#sendMessageConfirmList1').empty();
                $('#sendMessageConfirmList2').empty();
                
                $('#tableSendList').clone().appendTo('#sendMessageConfirmList1');
                $('#tableSendList').clone().appendTo('#sendMessageConfirmList2');
 
                $("#sendMessageConfirmList1 table th:last").remove();
                $('#sendMessageConfirmList1 table tbody tr td:last-child').remove();
                $("#sendMessageConfirmList2 table th:last").remove();
                $('#sendMessageConfirmList2 table tbody tr td:last-child').remove();
                
		});
		
		$("#secondPrevBtn").on("click",function(){
			$("#custom-tabs-four-profile-tab").attr("class","nav-link");
			$("#custom-tabs-four-home-tab").attr("class","nav-link active");
			$("#custom-tabs-four-profile-tab").attr("aria-selected","false");
			$("#custom-tabs-four-home-tab").attr("aria-selected","true");
			$("#custom-tabs-four-profile").attr("class","tab-pane fade");
			$("#custom-tabs-four-home").attr("class","tab-pane fade active show");
			$(".second").attr("class","stepper-item second");
			
			$('#sendMessageConfirmList1').empty();
			$('#sendMessageConfirmList2').empty();
			
		});
		
		$("#secondNextBtn").on("click",function(){
			
			$("#custom-tabs-four-profile-tab").attr("class","nav-link");
			$("#custom-tabs-four-third-tab").attr("class","nav-link active");
			$("#custom-tabs-four-profile-tab").attr("aria-selected","false");
			$("#custom-tabs-four-third-tab").attr("aria-selected","true");
			$("#custom-tabs-four-profile").attr("class","tab-pane fade");
			$("#custom-tabs-four-third").attr("class","tab-pane fade active show");
			$(".third").attr("class","stepper-item third completed");
			$(".second").attr("class","stepper-item second completed");
			
			var messageContent = $('#templateContent').val();
			var messageTitle = $('#templateTitle').val();
			$('#finalMessageContent').val(messageContent);
			$('#finalMessageTitle').text(messageTitle);
			
			 $('#sendMessageConfirmList1').empty();
             $('#sendMessageConfirmList2').empty();
             
             $('#tableSendList').clone().appendTo('#sendMessageConfirmList1');
             $('#tableSendList').clone().appendTo('#sendMessageConfirmList2');
             
         	$("#sendMessageConfirmList1 table th:last").remove();
            $('#sendMessageConfirmList1 table tbody tr td:last-child').remove();
            $("#sendMessageConfirmList2 table th:last").remove();
            $('#sendMessageConfirmList2 table tbody tr td:last-child').remove();
		});
		
		$("#thirdPrevBtn").on("click",function(){
			$("#custom-tabs-four-third-tab").attr("class","nav-link");
			$("#custom-tabs-four-profile-tab").attr("class","nav-link active");
			$("#custom-tabs-four-third-tab").attr("aria-selected","false");
			$("#custom-tabs-four-profile-tab").attr("aria-selected","true");
			$("#custom-tabs-four-third").attr("class","tab-pane fade");
			$("#custom-tabs-four-profile").attr("class","tab-pane fade active show");
			$(".third").attr("class","stepper-item third");
			
            $('#sendMessageConfirmList2').empty();
		});
		
// 	테이블 tr 선택 관련 css 변화	
		$(document).on('click','.upclickableTr',function(){
			 $(this).css("background-color","#395d83");
			 $(this).css("color","white");
			 $(this).attr("class","upselectedTr");
			 //var test = $(this).children('.tdShow');
			 $(this).children('.tdShow').attr("class","tdHide");
			 $(this).children('.deleteBtn').attr("class","deleteBtnShow");
		 });
		 $(document).on('click','.upselectedTr',function(){
			 $(this).css("background-color","white");
			 $(this).css("color","black");
			 $(this).attr("class","upclickableTr");
			 $(this).children('.tdHide').attr("class","tdShow");
			 $(this).children('.deleteBtnShow').attr("class","deleteBtn");
		 });
		// 다운 버튼 눌렀을 때 실행되는 함수
		 $("#moveDown").click(function(){
			 $("#tbodyDown").append($(".upselectedTr"));
			 
			 $(".tdHide").css("display","none");
			 $(".deleteBtnShow").css("display","");
			 
			 $(".upselectedTr").css("background-color","white");
			 $(".upselectedTr").css("color","black");
			 $(".upselectedTr").css("cursor","default");
			 $(".upselectedTr").attr("class","downclickableTr");
			 $(".upselectedTr").remove();
			 
			 changeCount();
			 
		 });
		 // 올 다운 버튼 눌렀을 때 실행되는 함수
		 $("#moveAllDown").click(function(){
			 $("#tbodyDown").append($(".upselectedTr"));
			 $("#tbodyDown").append($(".upclickableTr"));
			 
			 $(".tdHide").css("display","none");
			 $(".deleteBtnShow").css("display","");
			 $(".deleteBtn").css("display","");
			 $(".tdShow").css("display","none");
			 
			 $(".upselectedTr").css("background-color","white");
			 $(".upselectedTr").css("color","black");
			 $(".upselectedTr").attr("class","downclickableTr");
			 $(".upselectedTr").remove();
			 $(".upclickableTr").css("background-color","white");
			 $(".upclickableTr").attr("class","downclickableTr");
			 $(".upclickableTr").remove();
			 
			 changeCount();
		 });
		 
		
 }
 </script>  
 <script>
 // 메세지 90byte 안넘게 설정
 function fn_checkByte(obj,maxByte){
	 var str3 = $(obj);
	 var str = str3.val();
	 var str_len = str.length;


	    var rbyte = 0;
	    var rlen = 0;
	    var one_char = "";
	    var str2 = "";


	    for(var i=0; i<str_len; i++)
	    {
	        one_char = str.charAt(i);
	        if(escape(one_char).length > 4) {
	            rbyte += 2;                                         //한글2Byte
	        }else{
	            rbyte++;                                            //영문 등 나머지 1Byte
	        }
	        if(rbyte <= maxByte){
	            rlen = i+1;                                          //return할 문자열 갯수
	        }
	     }
	     if(rbyte > maxByte)
	     {
	        // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
	        //alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
	        Swal.fire({
		        icon: 'error',
		        title: '최대 90Byte까지만 입력가능합니다.',
		    }).then(function(){
		        str2 = str.substr(0,rlen);                                  //문자열 자르기
		        obj.value = str2;
		        fn_checkByte(obj, maxByte);
					
			});
	     }
	     else
	     {
	        document.getElementById('nowByte').innerText = rbyte;
	        document.getElementById("nowByte").style.color = "green";
	     }
//     const maxByte = 90; //최대 90바이트
//     const text_val = obj.value; //입력한 문자
//     const text_len = text_val.length; //입력한 문자수
//     var str2 = "";
    
//     let totalByte=0;
//     for(let i=0; i<text_len; i++){
//     	const each_char = text_val.charAt(i);
//         const uni_char = escape(each_char); //유니코드 형식으로 변환
//         if(uni_char.length>4){
//         	// 한글 : 2Byte
//             totalByte += 2;
//         }else{
//         	// 영문,숫자,특수문자 : 1Byte
//             totalByte += 1;
//         }
//     }
    
//     if(totalByte>maxByte){
//     	//alert('최대 90Byte까지만 입력가능합니다.');
//     	 Swal.fire({
// 		        icon: 'error',
// 		        title: '최대 90Byte까지만 입력가능합니다.',
// 		    });
//     	 str2 = text_val.substr(0,rlen);  
//         	document.getElementById("nowByte").innerText = totalByte;
//             document.getElementById("nowByte").style.color = "red";
//         }else{
//         	document.getElementById("nowByte").innerText = totalByte;
//             document.getElementById("nowByte").style.color = "green";
//         }
    }
 
 // 메시지 발송 함수
 function messageFormSubmit(){
	// alert('messageFormSubmit click!!!');
	
	 var tableSendListCount = $("#tableSendList >tbody tr").length;
	 if(tableSendListCount == 0){
		 Swal.fire({
		        icon: 'error',
		        title: '발송할 목록이 없습니다.',
		    });
		 return;
	 }
	 
	 var finalMessageContent = $('#finalMessageContent').val();
	 //console.log(finalMessageContent);
	 if(finalMessageContent == ""){
		 Swal.fire({
		        icon: 'error',
		        title: '발송할 내용이 없습니다.',
		    });
		 return;
	 }
	
	Swal.fire({
		title: '메세지를 발송 하시겠습니까?',
		text: '발송 예정 인원과 메세지 내용을 한번 더 확인해주세요.',
		icon: 'warning',
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		confirmButtonText: '보내기', // confirm 버튼 텍스트 지정
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		reverseButtons: false, // 버튼 순서 거꾸로
		}).then(result => {
		// 만약 Promise리턴을 받으면,
		if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			 sendMessage();
			 saveSendList();
			 const Toast = Swal.mixin({
			      toast: true,
			      position: 'center-center',
			      showConfirmButton: false,
			      timer: 1500,
			      timerProgressBar: true,
			      didOpen: (toast) => {
			        toast.addEventListener('mouseenter', Swal.stopTimer)
			        toast.addEventListener('mouseleave', Swal.resumeTimer)
			      }
			    })

			    Toast.fire({
			      icon: 'success',
			      title: '메세지 발송을 완료했습니다. 메세지 발송 화면으로 돌아갑니다.'
			    })
			    
			    setTimeout(function() {
					window.location.href="<%=request.getContextPath()%>/manager/academymanagement/kakao/regist.do";
				}, 1600);
					
			  }
			});
 }
 
 // 메세지 보내는 함수
 function sendMessage(){
	 var kakaoSendContent1 = $('#finalMessageContent').val();
	 $('#sendMessageConfirmList1').empty();
     $('#sendMessageConfirmList2').empty();
     //console.log(kakaoSendContent1);
     let downTrs = [];
	 $(".downclickableTr").each(function(){
		 let messageGroupList1 = new Object();
		 //console.log(this);
		 
		 messageGroupList1.kakaoSendType = $(this).children().eq(0).text();
		 messageGroupList1.kakaoReceiverName = $(this).children().eq(1).text();
		 messageGroupList1.kakaoReceiverHp = $(this).children().eq(2).text();
		 
		 downTrs.push(messageGroupList1);
	 });
	 var dataItem = {
			messageGroupList : downTrs
			,kakaoSendContent : kakaoSendContent1
	 }
	 dataItem = JSON.stringify(dataItem);
		 	
	 $.ajax({
	       type: "post"
	      ,url : "/manager/academymanagement/message/send.do"
	      ,contentType: 'application/json'
	      ,data : dataItem
	      ,success : function (data){

	       }
	      ,error : function(e){
	    	  Swal.fire({
		  	        icon: 'error',
		  	        title: '오류입니다. 관리자에게 연락해주세요.',
		  	  }); 
	       }
	 }); 

 }
 
 // 메세지 전송 내역 저장
 function saveSendList(){
	var mngId1 = $('#mngId').val();
	var kakaoSendContent1 = $('#finalMessageContent').val();
	var kakaoSendTitle1 = $('#finalMessageTitle').text();
	var kakaoSendType1 = 'SMS';
	 $('#sendMessageConfirmList1').empty();
    $('#sendMessageConfirmList2').empty();
    //console.log(kakaoSendContent1);
    let downTrs = [];
	 $(".downclickableTr").each(function(){
		 let messageGroupList1 = new Object();
		 //console.log(this);
		 
		 messageGroupList1.kakaoReceiverType = $(this).children().eq(0).text();
		 messageGroupList1.kakaoReceiverName = $(this).children().eq(1).text();
		 messageGroupList1.kakaoReceiverHp = $(this).children().eq(2).text();
		 messageGroupList1.kakaoReceiverEmail = $(this).children().eq(2).attr("data-email");
		 
		 downTrs.push(messageGroupList1);
	 });
	 var dataItem1 = {
			messageGroupList : downTrs
			,kakaoSendContent : kakaoSendContent1
			,mngId :mngId1
			,kakaoSendTitle :kakaoSendTitle1
			,kakaoSendType : kakaoSendType1
	 }
	 dataItem = JSON.stringify(dataItem1);
	 console.log(dataItem);
	 $.ajax({
	       type: "post"
	      ,url : "/manager/academymanagement/kakaoSendList/regist.do"
	      ,contentType: 'application/json'
	      ,data : dataItem
	      ,success : function (data){
	    	
	       }
	      ,error : function(e){
	    	  Swal.fire({
		  	        icon: 'error',
		  	        title: '오류입니다. 관리자에게 연락해주세요.',
		  	  }); 
	       }
	 });   
 }
 
 // 양식 직접 입력 눌렀을때 input 태그 입력 가능하게 변화
 function registDirect(){
	 //alert('registDirect click!!!');
	 $('#templateName').attr("disabled",false);
	 $('#templateContent').attr("disabled",false);
	 $('#templateTitle').attr("disabled",false);
 }
 
 // 탬플릿 저장 버튼 눌렀을때 실행되는 함수
 function templateSave(){
	 //alert('templateSave click!!!');
	 var templateName = $('#templateName').val();
	//console.log('테스트1 '+templateName);
	 $.ajax({
		 url : "/manager/academymanagement/template/templateListCheck.do?templateName="+templateName,
	   	 method : "get",	
	   	 success : function(result){
	  		   if(result.toUpperCase() == "DUPLICATED"){
	  			 Swal.fire({
	  				title: '동일한 이름이 있습니다.',
	  				text: '탬플릿 내용을 변경하시겠습니까?',
	  				icon: 'warning',
	  				showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
	  				confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	  				cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
	  				confirmButtonText: '변경', // confirm 버튼 텍스트 지정
	  				cancelButtonText: '취소', // cancel 버튼 텍스트 지정
	  				reverseButtons: false, // 버튼 순서 거꾸로
	  				}).then(result => {
	  				// 만약 Promise리턴을 받으면,
	  				if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
								// 템플릿 같은 이름으로 업데이트
	  							updateTemplate();
	  				}
	  				});
	  				
	  		   }else{
	  			 registTemplate(); 
	  		   }
	   	 },
	        error:function(error){
	         // alert("시스템장애로 가입이 불가합니다.");
	       	 AjaxErrorSecurityRedirectHandler(error.status);
	        }			 
		 });
	 
 }
 
 // 탬플릿 regist 실행 함수
 function registTemplate(){
	 var templateName = $('#templateName').val();
	 var templateTitle = $('#templateTitle').val();
	 var templateContent = $('#templateContent').val();
	 var dataItem = {
			 templateName : templateName 
			,templateTitle : templateTitle
			,templateContent : templateContent
	 }
	 dataItem = JSON.stringify(dataItem);
		 	
	 $.ajax({
	       type: "post"
	      ,url : "/manager/academymanagement/template/regist.do"
	      ,contentType: 'application/json'
	      ,data : dataItem
	      ,success : function (data){
	    	Swal.fire({
	  	        icon: 'success',
	  	        title: '저장 되었습니다.',
	  	    });
	    	
	    	loadTemplateList();
// 	    	setTimeout(function() {
// 	    		window.location.reload();
// 	    				}, 500);
	       }
	      ,error : function(e){
	    	  Swal.fire({
		  	        icon: 'error',
		  	        title: '오류입니다. 관리자에게 연락해주세요.',
		  	  }); 
	       }
	 });   
 }
 
 // 탬플릿 업데이트 실행되는 함수
 function updateTemplate(){
	 var templateId = $('#templateName').attr("data-id");
	 var templateName = $('#templateName').val();
	 var templateTitle = $('#templateTitle').val();
	 var templateContent = $('#templateContent').val();
	 
	 var dataItem = {
			 templateId : templateId
			,templateName : templateName 
			,templateTitle : templateTitle
			,templateContent : templateContent
	 }
	 dataItem = JSON.stringify(dataItem);
	 
	 $.ajax({
	       type: "post"
	      ,url : "/manager/academymanagement/template/update.do"
	      ,contentType: 'application/json'
	      ,data : dataItem
	      ,success : function (data){
	    	Swal.fire({
	  	        icon: 'success',
	  	        title: '변경 되었습니다.',
	  	    });
	    	
	    	loadTemplateList();
	       }
	      ,error : function(e){
	    	  Swal.fire({
		  	        icon: 'error',
		  	        title: '오류입니다. 관리자에게 연락해주세요.',
		  	  }); 
	       }
	 });   
 }
 
 // 탬플릿 td 눌렀을때 실행되는 함수
 function templateDetail(e){
	 var templateId = $(e).attr("data-num");
	 //console.log(templateId);
	 var dataItem = {
 	   		"templateId" : templateId
    		}
	 
	$.ajax({
 		type: "get"
	,url : "/manager/academymanagement/template/detail.do"
	,data : dataItem 
	,success : function (data){
	   //console.log(data);
	   var templateContent = $('#templateContent');
		$('#templateName').attr("disabled",false);
		$('#templateContent').attr("disabled",false);
		$('#templateTitle').attr("disabled",false);
		
		$('#templateName').attr("data-id",data.templateDetail.templateId);
		$('#templateName').val(data.templateDetail.templateName);
		$('#templateContent').val(data.templateDetail.templateContent);
		$('#templateTitle').val(data.templateDetail.templateTitle);
		//console.log(templateContent.value);
		fn_checkByte(templateContent, 90);
	}
	,error : function(e){
	   Swal.fire({
	        icon: 'error',
	        title: '오류입니다. 관리자에게 연락해주세요.',
	   }); 
	 }
	});
 }
 
 // 탬플릿 삭제 버튼 눌렀을때 실행되는 함수
 function daleteTemplate(e){
	// alert('daleteTemplate click!!!');
	Swal.fire({
		title: '삭제 하시겠습니까?',
		text: '한번 삭제 하면 되돌릴 수 없습니다.',
		icon: 'warning',
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		reverseButtons: false, // 버튼 순서 거꾸로
		}).then(result => {
		// 만약 Promise리턴을 받으면,
		if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			var templateId = $(e).attr("data-id");
			console.log(templateId);
			var dataItem = {"templateId" : templateId}
			$.ajax({
			       type: "post"
			      ,url : "/manager/academymanagement/template/delete.do"
			      ,data : dataItem
			      ,success : function(){
			    	  Swal.fire({
					        icon: 'success',
					        title: '삭제 완료 되었습니다.',
					    });
			    	  $(e).parent().parent().remove();
			    	  loadTemplateList();
			       }
			      ,error : function(e){
			    	  Swal.fire({
				  	        icon: 'error',
				  	        title: '오류입니다. 관리자에게 연락해주세요.',
				  	  }); 
					}
			 });
			}
		});
	
 }
 
 // 그룹 저장 버튼 눌렀을때 실행되는 함수
 function groupSave(){
	// alert('groupSave click!!!');
	newGroup();
 }
 
 // 목록 비우기 버튼 눌렀을때 실행되는 함수
 function flushList(){
	 //alert('flushList click!!!');
	 $(".downclickableTr").remove();
	 
	  changeCount();
 }
 
 // 새 그룹 눌렀을때 tr 추가
 function newGroup() {
	 //alert('new Group click!!!');
	 $("#groupListTable>tbody>tr:eq(0)").before("<tr data-id=''>"
			 +     "<td><input type='text' value='' style='border:none; text-align:center; width: 100%; height: 100%;'></td>"
			 +		"<td><button type='button' class='btn btn-dark btn-xs' onclick='messageGroupDetail(this);' >선택</button></td>"
			 +     "<td class=''>"
			 +     "<button type='button' class='btn btn-info btn-xs' onclick='groupNameChange(this);' style='display:none;'>수정</button>"
			 +     "<button type='button' class='btn btn-dark btn-xs' onclick='registGroup(this);'>저장</button>"
			 +     "</td>"
			 +     "<td><button type='button' class='btn btn-danger btn-xs' onclick='daleteGroup(this);'>삭제</button></td>"
			 + "</tr>");
	 
	 $("#groupListTable>tbody>tr:eq(0)").children('td:eq(0)').children('input:eq(0)').focus();
 }
 
 
 // 저장 버튼 눌렀을 때 그룹 저장(수정도 여기서)
 function registGroup(e) {
	 var tableSendListCount = $("#tableSendList >tbody tr").length;
	 //console.log(tableSendListCount);
	 if(tableSendListCount == 0){
		 Swal.fire({
		        icon: 'error',
		        title: '저장할 목록이 없습니다.',
		    });
		 return;
	 }
	 
	// alert('regist Group click!!!');
	 var thisInput = $(e).parent().parent().children('td:eq(0)').children('input:eq(0)');
	 var thisTrGroupName = $(e).parent().parent().attr("data-id");
	 //alert(thisTrGroupName);
	 //alert(thisInput.val());
	 if(thisInput.val() == ""){
		 Swal.fire({
		        icon: 'error',
		        title: '그룹 이름이 없습니다.',
		    });
		 return;
	 }
	 
	 if(thisInput.val() == thisTrGroupName){
		 //alert("두 값은 같습니다");
		 updateGroup(e);
		 return;
	 } else {
		// alert("두 값은 다릅니다");
		  $.ajax({
		 url : "/manager/academymanagement/messageGroup/groupNameCheck.do?messageGroupName="+thisInput.val(),
	   	 method : "get",	
	   	 success : function(result){
	  		   if(result.toUpperCase() == "DUPLICATED"){
		  			 Swal.fire({
		 		        icon: 'error',
		 		        title: '이미 있는 그룹이름입니다.',
		 		     });
	  			} else{
	  				var dataItem = {messageGroupName : thisTrGroupName}
	  				dataItem = JSON.stringify(dataItem);
	  				$.ajax({
	  				       type: "post"
	  				      ,url : "/manager/academymanagement/messageGroup/delete.do"
	  				      ,contentType: 'application/json'
	  				      ,data : dataItem
	  				      ,success : function(){
	  				       
	  				      }
	  				      ,error : function(e){
	  				    	  Swal.fire({
	  					  	        icon: 'error',
	  					  	        title: '오류입니다. 관리자에게 연락해주세요.',
	  					  	  }); 
	  						}
	  				 });
	  				
	  				updateGroup(e);
	  			}
	   	 },
	        error:function(error){
	         // alert("시스템장애로 가입이 불가합니다.");
	       	 AjaxErrorSecurityRedirectHandler(error.status);
	        }			 
		 });
	 }
	 
		
		
 }
 
 function updateGroup(e){
	 //console.log($(e));
	 var thisInput = $(e).parent().parent().children('td:eq(0)').children('input:eq(0)');
	 
	 $(thisInput).attr('readonly','true');
	 var thisModifyBtn = $(e).parent().children('button:eq(0)');
	 $(thisModifyBtn).css("display","");
	 $(e).css("display","none");
	 
	 var downTrs = [];
	 $(".downclickableTr").each(function(){
		 let messageGroupList1 = new Object();
		 //console.log(this);
		 
		 messageGroupList1.receiverCategory = $(this).children().eq(0).text();
		 messageGroupList1.receiverName = $(this).children().eq(1).text();
		 messageGroupList1.receiverHp = $(this).children().eq(2).text();
		 messageGroupList1.receiverEmail = $(this).children().eq(2).attr("data-email");
		 downTrs.push(messageGroupList1);
	 });
	 console.log(downTrs);
 	 var messageGroupName1 = $(thisInput).val();
	 var dataItem = {
			messageGroupList : downTrs
			,messageGroupName : messageGroupName1
	 }
	 dataItem = JSON.stringify(dataItem);
		 	
	 $.ajax({
	       type: "post"
	      ,url : "/manager/academymanagement/messageGroup/regist.do"
	      ,contentType: 'application/json'
	      ,data : dataItem
	      ,success : function (data){
	    	Swal.fire({
	  	        icon: 'success',
	  	        title: '저장 되었습니다.',
	  	    });
	    	setTimeout(function() {
	    		window.location.reload();
	    				}, 500);
	       }
	      ,error : function(e){
	    	  Swal.fire({
		  	        icon: 'error',
		  	        title: '오류입니다. 관리자에게 연락해주세요.',
		  	  }); 
	       }
	 });   
	 
 }
 
 // 수정 버튼 눌렀을때 저장 버튼 나오게 하고 수정 버튼 숨김
 function groupNameChange(e){
	 //alert('Group Name Change click!!!');
	 var thisInput = $(e).parent().parent().children('td:eq(0)').children('input:eq(0)');
	 $(thisInput).removeAttr('readonly');
	 var thisSaveBtn = $(e).parent().children('button:eq(1)');
	 $(thisSaveBtn).css("display","");
	 $(e).css("display","none");
// 	 alert(test);
 	 //console.log(thisSaveBtn);
 }
 
 // 그룹 삭제하는 함수
 function daleteGroup(e){
 	 //alert('delete Group click!!!');
 	
	 	Swal.fire({
		title: '삭제 하시겠습니까?',
		text: '한번 삭제 하면 되돌릴 수 없습니다.',
		icon: 'warning',
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		reverseButtons: false, // 버튼 순서 거꾸로
		}).then(result => {
		// 만약 Promise리턴을 받으면,
		if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			var messageGroupName1 = $(e).parent().parent().attr("data-id");
			//console.log(messageGroupName1);
			var dataItem = {messageGroupName : messageGroupName1}
			dataItem = JSON.stringify(dataItem);
			$.ajax({
			       type: "post"
			      ,url : "/manager/academymanagement/messageGroup/delete.do"
			      ,contentType: 'application/json'
			      ,data : dataItem
			      ,success : function(){
			    	  Swal.fire({
					        icon: 'success',
					        title: '삭제 완료 되었습니다.',
					    });
			    	  loadGroupListName(); 
			       }
			      ,error : function(e){
			    	  Swal.fire({
				  	        icon: 'error',
				  	        title: '오류입니다. 관리자에게 연락해주세요.',
				  	  }); 
					}
			 });
			$(e).parent().parent().remove();
 		 }
		});
 }
 
 // selectbox 값 바뀔때 실행되는 함수(카테고리 전체,학생,직원,부모)
 function changeType(){
	 
	 var category = $('#messageCategory').val();
	 
	 if(category == "s"){
		 var data = null;
		//alert('학생 change 됨 ^^');
		 var keyword = $("#searchKeyWord").val();
			
    		 let dataItem = {
	    	   		"keyword" : keyword
	       		}
    		 
    		 $.ajax({
 		        type: "get"
 		       ,url : "/manager/academymanagement/message/studentSearchList.do"
 		       ,data : dataItem
 		       ,success : function (data){
 		    	   //console.log(data);
	 			   printData(data,$('#tableSearchList'),$('#tableSearchListDiv'),$('#tableSearchListStudent-template'));
	 			   
	 			   changeCount();
 		       }
 		       ,error : function(e){
 		        }
 			});
	 }
	 if(category == "p"){
		 //var data = null;
		 //alert('부모 change 됨 ^^');
		  var keyword = $("#searchKeyWord").val();
			
    		 let dataItem = {
	    	   		"keyword" : keyword
	       		}
    		 
    		 $.ajax({
 		        type: "get"
 		       ,url : "/manager/academymanagement/message/parentSearchList.do"
 		       ,data : dataItem
 		       ,success : function (data){
 		    	  // console.log(data);
		 		   printData(data,$('#tableSearchList'),$('#tableSearchListDiv'),$('#tableSearchListParent-template'));
		 		   
		 		   changeCount();
 		        }
 		       ,error : function(e){
 		        }
 			});
	 }
	 if(category == "m"){
		 //var data = null;
		 //alert('매니저 change 됨 ^^');
		  var keyword = $("#searchKeyWord").val();
			
    		 let dataItem = {
	    	   		"keyword" : keyword,
	    	   		"searchType" : 't'
	       		}
    		 
    		 $.ajax({
 		        type: "get"
 		       ,url : "/manager/academymanagement/message/managerSearchList.do"
 		       ,data : dataItem
 		       ,success : function (data){
 		    	  // console.log(data);
		 		   printData(data,$('#tableSearchList'),$('#tableSearchListDiv'),$('#tableSearchListManager-template'));
 			
		 		   changeCount();
 		        }
 		       ,error : function(e){
 		        }
 			});
	 }
	 if(category == "t"){
		 //var data = null;
		 //alert('유저 change 됨 ^^');
		// list_go(1,"/manager/academymanagement/kakao/regist.do");
		var keyword = $("#searchKeyWord").val();
		
		let dataItem = {
	    	   		"keyword" : keyword
	       		}
		
		 $.ajax({
 		        type: "get"
 		       ,url : "/manager/academymanagement/message/userSearchList.do"
 		       ,data : dataItem
 		       ,success : function (data){
 		    	  // console.log(data);
 		    	   printData(data,$('#tableSearchList'),$('#tableSearchListDiv'),$('#tableSearchListUser-template'));
 			
		 		   changeCount();
 		        }
 		       ,error : function(e){
 		        }
 			});
		 
		 changeCount();
	 }
 }
 
 // 메세지 발송 인원 tr 삭제 버튼 클릭시 작동(해당 tr 삭제)
 function deleteTrBtn(e){
	 //var parent = $(e).parent();
	 //alert(parent);
	//console.log(parent);
	$(e).parent().parent().remove();
	 
	changeCount();
 }
 
 // 카운트 바꾸는 함수
 function changeCount(){
	 var tableSearchListCount = $("#tableSearchList >tbody tr").length;
	 if(tableSearchListCount == 0) {
		 $(".tableSearchListCount").text(0);
	 } else {
	 	$(".tableSearchListCount").text(tableSearchListCount);
	 }
	 
	 var tableSendListCount = $("#tableSendList >tbody tr").length;
	 if(tableSendListCount == 0){
	 	$(".tableSendListCount").text(0);
	 } else {
	 	$(".tableSendListCount").text(tableSendListCount);
	 }
 }

// 그룹 이름 리스트 불러오는 ajax
function loadGroupListName(){
		
		$.ajax({
	        type: "get"
	       ,url : "/manager/academymanagement/messageGroup/list.do"
	       ,success : function (data){
	    	   //console.log(data);
	    	   printData(data,$('#groupListTable'),$('#groupListTableDiv'),$('#groupListTable-template'));
	        }
	       ,error : function(e){
	    	   Swal.fire({
		  	        icon: 'error',
		  	        title: '오류입니다. 관리자에게 연락해주세요.',
		  	  }); 
	        }
		});
}

// 그룹 이름별 디테일 불러오는 ajax
function messageGroupDetail(e){
	var GroupName = $(e).parent().parent().attr("data-id");
	//console.log(GroupName);
	var dataItem = {
	    	   		"messageGroupName" : GroupName
	       		}
	$.ajax({
        type: "get"
       ,url : "/manager/academymanagement/messageGroup/detail.do"
       ,data : dataItem 
       ,success : function (data){
    	   //console.log(data);
    	   printData(data,$('#tableSendList'),$('#tableSendListDiv'),$('#tableSendList-template'));
    	   changeCount();
        }
       ,error : function(e){
    	   Swal.fire({
	  	        icon: 'error',
	  	        title: '오류입니다. 관리자에게 연락해주세요.',
	  	  }); 
        }
	});
}

// 메세지 저장 양식 불러오는 함수
function loadTemplateList(){
	$.ajax({
        type: "get"
       ,url : "/manager/academymanagement/template/list.do"
       ,success : function (data){
    	   //console.log(data);
    	   printData(data,$('#templateListTable'),$('#templateListTableDiv'),$('#templateListTable-template'));
        }
       ,error : function(e){
    	   Swal.fire({
	  	        icon: 'error',
	  	        title: '오류입니다. 관리자에게 연락해주세요.',
	  	  }); 
        }
	});
}

 
 </script>
 
 <script>
// handlebars 관련
function printData(data,delArea,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	delArea.remove();
	target.append(html);
}


</script>

 <script type="text/x-handlebars-template"  id="tableSearchListStudent-template" >
<table id="tableSearchList" class="table table-hover table-head-fixed table-bordered" >
		<thead>
			<tr>
				<th style="width:8%;">발송대상</th>
				<th style="width:10%;">이름</th>
				<th style="width:10%;">연락처</th>
				<th style="width:10%;">학교</th>
				<th style="width:8%;">학년</th>
				<th style="width:10%;">수강반</th>
			</tr>
		</thead>
		<tbody id="tbodyUp">	
			{{#each studentList}}
					<tr class="upclickableTr" onclick='' style="cursor: pointer;">
						<td data-category="학생">학생</td>
						<td data-name="{{name}}">{{name}}</td>
						<td data-hp="{{hp}}" data-email="{{id}}">{{hp}}</td>
						<td class="tdShow">{{schoolNo}}</td>
						<td class="tdShow">{{gradeCategoryCode}}&nbsp;{{grade}}</td>
						<td class="tdShow">{{sibling}}</td>
						<td class="deleteBtn" style="display: none; width:5%;"><button type="button" class="btn btn-danger btn-xs" onclick="deleteTrBtn(this);">삭제</button></td>
					</tr>
			{{else}}
				<tr>
					<td colspan="7" class="text-center" style="background: white; color: black;">
						해당 학생이 없습니다.
					</td>
				</tr>
			{{/each}}
		</tbody>
</table>
</script>   
<script type="text/x-handlebars-template"  id="tableSearchListParent-template" >
<table id="tableSearchList" class="table table-hover table-head-fixed table-bordered" >
		<thead>
			<tr>
				<th style="width:8%;">발송대상</th>
				<th style="width:10%;">이름</th>
				<th style="width:10%;">연락처</th>
				<th style="width:10%;">자녀이름</th>
				<th style="width:10%;">자녀학교</th>
				<th style="width:8%;">자녀학년</th>
				<th style="width:10%;">자녀수강반</th>
			</tr>
		</thead>
		<tbody id="tbodyUp">	
			{{#each parentList}}
					<tr class="upclickableTr" style="cursor: pointer;">
						<td data-category="부모">부모</td>
						<td data-name="{{parentName}}">{{parentName}}</td>
						<td data-hp="{parentHp}}" data-email="{{id}}">{{parentHp}}</td>
						<td style="cursor: pointer;" class="tdShow"><strong>{{childrenName}}</strong></td>
						<td class="tdShow">{{childrenSchoolName}}</td>
						<td class="tdShow">{{childrenGradeCode}}&nbsp;{{childrenGrade}}</td>
						<td class="tdShow">{{childrenClassName}}</td>
						<td class="deleteBtn" style="display: none; width:5%;"><button type="button" class="btn btn-danger btn-xs" onclick="deleteTrBtn(this);">삭제</button></td>
					</tr>
			{{else}}
					<tr>
						<td colspan="8" class="text-center" style="background: white; color: black;">
							해당 부모가 없습니다.
						</td>
					</tr>
			{{/each}}
		</tbody>
</table>
</script>   
<script type="text/x-handlebars-template"  id="tableSearchListManager-template" >
<table id="tableSearchList" class="table table-hover table-head-fixed table-bordered" >
		<thead>
			<tr>
				<th style="width:8%;">발송대상</th>
				<th style="width:10%;">이름</th>
				<th style="width:10%;">연락처</th>
				<th style="width:8%;">직분</th>
			</tr>
		</thead>
		<tbody id="tbodyUp">	
			{{#each managerList}}
				<tr class="upclickableTr" style="cursor: pointer;">
					<td data-category="직원">직원</td>
					<td style="cursor: pointer;" data-name="{{mngName}}"><strong>{{mngName}}</strong></td>
					<td data-hp="{mngHp}}" data-email="{{id}}">{{mngHp}}</td>
					<td class="tdShow" >{{deptId}}</td>
					<td class="deleteBtn" style="display: none; width:5%;"><button type="button" class="btn btn-danger btn-xs" onclick="deleteTrBtn(this);">삭제</button></td>
				</tr>
			{{else}}
				<tr>
					<td colspan="5" class="text-center" style="background: white; color: black;">
						해당 직원이 없습니다.
					</td>
				</tr>
			{{/each}}
		</tbody>
</table>
</script>
<script type="text/x-handlebars-template"  id="tableSearchListUser-template" >
<table id="tableSearchList" class="table table-hover table-bordered table-head-fixed text-center" >					
			<thead>
				<tr>
					<th style="width:10%;">발송대상</th>
					<th style="width:10%;">이름</th>
					<th style="width:10%;">연락처</th>
				</tr>
			</thead>
			<tbody id="tbodyUp">
				{{#each userList}}
					<tr class="upclickableTr" style="cursor: pointer;">
						<td data-category="{{category}}">{{category}}</td>
						<td style="cursor: pointer;" data-name="{{name}}"><strong>{{name}}</strong></td>
						<td data-hp="{{hp}}" data-email="{{id}}">{{hp}}</td>
						<td class="deleteBtn" style="display: none; width:5%;"><button type="button" class="btn btn-danger btn-xs" onclick="deleteTrBtn(this);">삭제</button></td>
					</tr>
				{{else}}
					<tr>
						<td colspan="4" class="text-center" style="background: white; color: black;">
						해당 유저가 없습니다.
						</td>
					</tr>
				{{/each}}	
			</tbody>
		</table>
</script> 

<script type="text/x-handlebars-template"  id="groupListTable-template" >
<table id="groupListTable" class="table table-hover table-bordered table-head-fixed text-center" >					
	<thead>
		<tr>
			<th style="width:30%;">그룹명</th>
			<th style="width:20%;">선택</th>
			<th style="width:20%;">수정/저장</th>
			<th style="width:15%;">삭제</th>
		</tr>
	</thead>
	<tbody>	
		{{#each groupNameList}}
		<tr data-id="{{messageGroupName}}">
			<td><input type="text" value="{{messageGroupName}}" readonly="readonly" style="border:none; text-align:center; width: 100%; height: 100%;"></td>
			<td>
			<button type="button" class="btn btn-dark btn-xs" onclick="messageGroupDetail(this);" >선택</button></td>
			<td class="">
			<button type="button" class="btn btn-info btn-xs" onclick="groupNameChange(this);">수정</button>
			<button type="button" class="btn btn-dark btn-xs" onclick="registGroup(this);" style="display:none;">저장</button>
			</td>
			<td><button type="button" class="btn btn-danger btn-xs" onclick="daleteGroup(this);">삭제</button></td>
		</tr>
		{{else}}
		<tr>
			<td colspan="3" class="text-center" style="background: white; color: black;">
			그룹이 없습니다.
			</td>
		</tr>
		{{/each}}	
	</tbody>
</table>  
</script>

<script type="text/x-handlebars-template"  id="tableSendList-template" >
<table id="tableSendList" class="table table-bordered table-head-fixed text-center">					
	<thead>
		<tr>
			<th style="width:8%;">발송대상</th>
			<th style="width:8%;">이름</th>
			<th style="width:5%;">연락처</th>
			<th class="none" style="display: none;"></th>
			<th class="none" style="display: none;"></th>
			<th class="none" style="display: none;"></th>
			<th style="width:5%;">삭제</th>
		</tr>
	</thead>
	<tbody id="tbodyDown">	
		{{#each groupNameDetail}}
		<tr class="downclickableTr" background-color: white; color: black;">
			<td data-category="{{receiverCategory}}">{{receiverCategory}}</td>
			<td style="cursor: pointer;" data-name="{{receiverName}}"><strong>{{receiverName}}</strong></td>
			<td data-hp="{{receiverHp}}" data-email="{{receiverEmail}}">{{receiverHp}}</td>
			<td class="deleteBtnShow" style="width: 5%;"><button type="button" class="btn btn-danger btn-xs" onclick="deleteTrBtn(this);">삭제</button></td>
		</tr>
		{{/each}}	
	</tbody>
</table>
</script>

<script type="text/x-handlebars-template"  id="templateListTable-template" >
<table id="templateListTable" class="table table-hover table-bordered table-head-fixed text-center">
	<thead>
		<tr>
			<th>양식 제목</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>	
		{{#each templateList}}
		<tr id="{{templateId}}">
			<td onclick="templateDetail(this);" data-num={{templateId}}>{{templateName}}</td>
			<td><button type="button" data-id="{{templateId}}" class="btn btn-danger btn-xs" onclick="daleteTemplate(this);">삭제</button></td>
		</tr>
		{{else}}
		<tr>
			<td colspan="2" class="text-center" style="background: white; color: black;">
			저장 양식이 없습니다.
			</td>
		</tr>
		{{/each}}	
	</tbody>
</table>
</script>
   
</body>
</html>