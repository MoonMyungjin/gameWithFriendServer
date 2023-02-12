<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<meta charset="UTF-8">
<title></title>
<style>
	div.table1 {
		max-height: 550px;
		overflow-y: auto;
	}
	div.table2 {
		max-height: 510px;
		overflow-y: auto;
	}
	div.table3 {
		max-height: 160px;
		overflow-y: hidden;
	}
	.leftclickableTr:hover{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
	.leftSelectedTr{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
	}
	.disabledTd{
		background-color: rgb(128, 128, 128, 0.3);
	}
	.selectedTd{
		background-color: blue;
	}
	.copiedSelectedTd{
		background-color: blue;
	}
	.clickableTd{
		background-color: white;
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
	.nameTd{
	 	background-color: rgb(32 73 105);
 		color: rgb(253 251 216);
	
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
	  background-color: #1E90FF;
	  color : white;
	}
	
	.stepper-item.completed::after {
	  position: absolute;
	  content: "";
	  border-bottom: 2px solid #1E90FF;
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
	.backgroundTd{
		background-color:rgb(32 73 105);
		color: white;
	}
	
	.modal-backdrop{
		height:200%;
		width: 200%;
	  top: -50%;
	  margin-top: -50px;
	}
	
	#lessonListModal {
	  top: 50%;
	  margin-top: -50px;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
        
        // 헬퍼함수 만들기
        // 헬퍼함수는 Handlebars.registerHelper()를 사용해서 등록할 수 있다.
        // 헬퍼함수는 스크립트 상단에 선언하자 (호이스팅)
        // Handlebars.registerHelper("선언함수명", function(args..., option){ ... }
        // args 매개변수 인자보다.. 그냥 this.변수명 으로 접근은 편하다.
 
        Handlebars.registerHelper("isSchudule", function(targetStr, valueStr1, valueStr2) {
//             console.log(this); // this == jQuery에서 el과 같다. (반복문에서 현재 컨텐스트)
//             console.log(targetStr);
            var valueStr = valueStr1+valueStr2;
//             console.log(valueStr);
            
            if(targetStr.indexOf(valueStr)>-1){
 	           return "disabledTd";
            } else {
 	           return "clickableTd";
            }
        });
 
</script>
</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }">수업개설</h1>
              
              <!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '수업개설') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '수업개설') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
                            
           </div>
           <div class="col-sm-6" >
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
   <div class="card card-dark card-outline">
		<div class="card-header p-0 border-bottom-0">
		</div>
		<div class="card-body" style="padding-top: 0px;">
			<div class="tab-content" id="custom-tabs-four-tabContent">
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
									    <div class="step-name">선생님선택</div>
									  </div>
									  <div id="" class="stepper-item second">
									    <div class="step-counter">
										    <i class="fa-solid fa-2"></i>
									    </div>
									    <div class="step-name">수업시간선택</div>
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
							<button id="firstNextBtn" class="btn btn-block btn-dark">다음</button>
						</div>
					</div>
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
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   </h3>
    						   </div>
				               <div class="card-tools" style="margin: 0;">
				                  <div class="row">
				                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
<!-- 				                  		<select id="subjectSel" class="form-control" style="width: 80px;"> -->
<!-- 												<option value="">과목</option> -->
<%-- 											<c:forEach items="${ScodeValues.subjectList}" var="sj"> --%>
<%-- 												<option value="${sj.scodeKey }">${sj.scodeValue }</option> --%>
<%-- 											</c:forEach> --%>
<!-- 										</select> -->
<!-- 				                  		<select id="gradeSel" required class="form-control" style="width: 80px;"> -->
<!-- 												<option value="">대상</option> -->
<%-- 											<c:forEach items="${ScodeValues.StudentGradeCategoryCodeList}" var="SG"> --%>
<%-- 												<option value="${SG.scodeKey }">${SG.scodeValue }</option> --%>
<%-- 											</c:forEach> --%>
<!-- 										</select> -->
										<input id="searchlessonInput" type="text" class="form-control float-right" placeholder="수업명 검색" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
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
											<tbody>
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
				            	<nav aria-label="Navigation">
									<ul class="pagination justify-content-center m-0">
										<li class="page-item">
											<a class="page-link" href="javascript:list_go(1);">
												<i class="fas fa-angle-double-left"></i>
											</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page}');">
												<i class="fas fa-angle-left"></i>
											</a>
										</li>
										<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
												
											<li class="page-item ${pageMaker.cri.page == pageNum?'active':''}">
												<a class="page-link" href="javascript:list_go('${pageNum}');" >${pageNum }</a>
											</li>
											
										</c:forEach>
										<li class="page-item">
											<a class="page-link" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page}');">
												<i class="fas fa-angle-right" ></i>
											</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="javascript:list_go('${pageMaker.realEndPage}');">
												<i class="fas fa-angle-double-right"></i>
											</a>
										</li>	
									</ul>
								</nav>
				            </div>
				         </div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
				   			<div class="card card-outline card-dark">
				   			
				   			<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
    						   <div class="row">
				               <h3 class="card-title">
									<i class="fa-solid fa-person-chalkboard"></i>
				<!-- 					<i class="fa-solid fa-1"></i> -->
									&nbsp;
									선생님 선택&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   </h3>
    						   </div>
				               <div class="card-tools" style="margin: 0;">
				                  <div class="row">
				                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<input id="searchTeacherInput" type="text" class="form-control float-right" placeholder="교사명 검색" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<div class="input-group-append">
											<button id="searchTeacherBtn" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
												<i class="fas fa-search" aria-hidden="true"></i>
											</button>
										</div>
									</div>
								  </div>
				               </div>
				            </div>
				            <div class="card-body">
				            	<div class="row table1">
									<div id="teacherListDiv" class="card-body p-0">
										<table id="teacherListTable" class="table table-head-fixed table-bordered">
											<thead>
												<tr>
													<th style="width: 40%">과목</th>
													<th style="width: 60%">선생님</th>
												</tr>
											</thead>
											<tbody>
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
				   		
				   		<div class="col-sm-8">
				   			<div class="card card-outline card-dark">
				            <div class="card-header">
				               <h3 class="card-title">
									<i class="fa-solid fa-person-chalkboard"></i>
				<!-- 					<i class="fa-solid fa-1"></i> -->
									&nbsp;
									선생님 상세정보
							   </h3>
				               <h3 class="card-title"></h3>
				               <div class="card-tools">
				                  <div class="row">
								  </div>
				               </div>
				            </div>
				            <div class="card-body">
				            	<div id="teacherInfoDiv" class="row">
				            		<table id="teacherInfoTable" class="table table-bordered">
				            			<tr>
				            				<td style="width: 20%">이름</td>
				            				<td style="width: 30%"></td>
				            				<td style="width: 20%">과목</td>
			            					<td style="width: 30%"></td>
				            			</tr>
				            			<tr>
				            				<td>전공</td>
				            				<td></td>
				            				<td>졸업일</td>
			            					<td></td>
				            			</tr>
				            			<tr>
				            				<td>경력년수</td>
				            				<td></td>
				            				<td>근무년수</td>
			            					<td></td>
				            			</tr>
				            		</table>
								</div>
				            </div>
				         </div>
							
				   		</div>
					</div>
							
				</div>
				<div class="tab-pane fade" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile-tab">
					<div class="row">
						<div class="col-sm-1">
							<button id="secondPrevBtn" class="btn btn-block btn-secondary">이전</button>
						</div>
						<div class="col-sm-10">
							<div class="row">
								<div class="col-sm-12" style="padding-top: 10px;">
									<div class="stepper-wrapper">
									  <div class="stepper-item completed">
									    <div class="step-counter">
									    	<i class="fa-solid fa-1"></i>
									    </div>
									    <div class="step-name">선생님선택</div>
									  </div>
									  <div id="" class="stepper-item second">
									    <div class="step-counter">
										    <i class="fa-solid fa-2"></i>
									    </div>
									    <div class="step-name">수업시간선택</div>
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
							<button id="secondNextBtn" class="btn btn-block btn-dark">다음</button>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<div class="row">
								<div class="card card-outline card-dark">
						           <div class="card-header">
						               <h3 class="card-title">
											<i class="fas fa-list" aria-hidden="true"></i>
						<!-- 					<i class="fa-solid fa-2"></i> -->
											&nbsp;
											수업기간, 강의실 선택
									   </h3>
						               <h3 class="card-title"></h3>
						               <div class="card-tools">
						               </div>
						            </div>
						            <div class="card-body">
						            	<div id="" class="row table2">
						            		<table id="" class="table table-bordered">
						            			<tr>
						            				<td style="">시작일</td>
						            				<td style=""><input style="" id="settingStartdate" class="form-control" type="date"></td>
						            			</tr>
						            			<tr>
						            				<td style="width: 35%;">종료일</td>
						            				<td style=""><input style="" id="settingEnddate" class="form-control" type="date"></td>
						            			</tr>
						            			<tr>
						            				<td>강의실</td>
						            				<td style="" id="avLessonRoomListTd">
						            					<div id="ghostDiv">
							            					<select id="avLessonRoomList" class="form-control" >
							            						<option>기간을 선택해주세요</option>
							            					</select>
						            					</div>
						            				</td>
						            			</tr>
											</table>
						            	</div>
						            </div>
						         <table>
						         	<tr>
						         	<td style="width:40%; background-color: rgb(128, 128, 128, 0.3);">
						         	</td>
						         	<td style="text-align: left;">선택불가</td>
						         	</tr>
						         	<tr>
						         	<td style="width:40%; background-color: blue;">
						         	</td>
						         	<td style="text-align: left;">선택시간</td>
						         	</tr>
						         </table>
						         </div>
						         <div class="col-sm-12">
				       			  </div>
							</div>
				   		</div>
					  <div id="lessonSelectArea" class="col-sm-9">
						<div class="card card-outline card-dark">
				           <div class="card-header">
				               <h3 class="card-title">
									<i class="fas fa-list" aria-hidden="true"></i>
				<!-- 					<i class="fa-solid fa-2"></i> -->
									&nbsp;수업시간 선택
							   </h3>
				               <h3 class="card-title"></h3>
				               <div class="card-tools">
				               </div>
				            </div>
				            <div class="card-body">
				            	<div id="lessonTimeRegistWeekDayForm" class="row">
				            	<table id="lessonTimeRegistWeekDayFormTable" class="table table-bordered">
										<tbody>
											<tr>
												<td class="backgroundTd">목표 시수</td>
												<td colspan="3" id="targetHours"></td>
												<td class="backgroundTd" colspan="2">현재 시수</td>
												<td colspan="3" id="actualHours"></td>
											</tr>
											<tr>
												<th class="backgroundTd" style="width: 100px;">
													</th>
												<th class="backgroundTd" >월</th>
												<th class="backgroundTd" >화</th>
												<th class="backgroundTd" >수</th>
												<th class="backgroundTd" >목</th>
												<th class="backgroundTd" >금</th>
												<th class="backgroundTd" >토</th>
												<th class="backgroundTd" >일</th>
											</tr>
											<c:forEach items="${ttMap.weekDayList}" var="wdList">
												<tr>
													<td  class="backgroundTd" style="width: 22%;" >
														${wdList.timetablePeriod}교시 (${wdList.timetableStartTime }~ ${wdList.timetableEndTime })
													</td>
													<td id="mon${wdList.timetablePeriod }" class="notReadyTd"></td>
													<td id="tue${wdList.timetablePeriod }" class="notReadyTd"></td>
													<td id="wed${wdList.timetablePeriod }" class="notReadyTd"></td>
													<td id="thu${wdList.timetablePeriod }" class="notReadyTd"></td>
													<td id="fri${wdList.timetablePeriod }" class="notReadyTd"></td>
													<td id="sat${wdList.timetablePeriod }" class="notReadyTd"></td>
													<td id="sun${wdList.timetablePeriod }" class="notReadyTd"></td>
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
				<div class="tab-pane fade" id="custom-tabs-four-third" role="tabpanel" aria-labelledby="custom-tabs-four-info-tab">
				<div class="row">
					<div class="col-sm-1">
						<button id="thirdPrevBtn" class="btn btn-block btn-secondary">이전</button>
					</div>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-12" style="padding-top: 10px;">
								<div class="stepper-wrapper">
								  <div class="stepper-item completed">
								    <div class="step-counter">
								    	<i class="fa-solid fa-1"></i>
								    </div>
								    <div class="step-name">선생님선택</div>
								  </div>
								  <div id="" class="stepper-item second" >
								    <div class="step-counter">
									    <i class="fa-solid fa-2"></i>
								    </div>
								    <div class="step-name">수업시간선택</div>
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
						<input class="btn btn-block btn-dark" type="button" onclick="lessonformSubmit()" value="완료">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
			          <div class="card card-outline card-dark">
			          	 <div class="card-header">
			               <h3 class="card-title">
								<i class="fa-solid fa-pen-to-square"></i>
			<!-- 					<i class="fa-solid fa-3"></i> -->
								&nbsp;
								수업정보 입력
						   </h3>
			               <h3 class="card-title"></h3>
			               <div class="card-tools">
			               		<div class="input-group input-group-sm">
									<!-- <button type="submit" class="btn btn-dark">
										수업개설
									</button> -->
								</div>
			               </div>
			            </div>
			            <div class="card-body">
			            	<div class="row">
			            		<div class="col-sm-12">
					            	<div id="lessonRegistFormDiv" class="col-sm-12">
						            	<form id="lessonRegistForm" action="/manager/lesson/realRegist.do" method="post" name="lessonRegistForm">
							            	<table id="lessonRegistFormTable" class="table table-bordered">
												<tr>
													<td class="nameTd">수업명</td>
													<td colspan="5"></td>
													<td class="nameTd">강의금액</td>
													<td><input required class="form-control" type="number" min="0"></td>
												</tr>
												<tr>
													<td class="nameTd" style="width: 10%">과목</td>
													<td style="width: 10%"></td>
													<td class="nameTd" style="width: 10%">선생님</td>
													<td style="width: 10%"></td>
													<td style="width: 20%" colspan="2"></td>
													<td class="nameTd" style="width: 10%">시작일</td>
													<td style="width: 10%">
														<input required class="form-control" type="date">
													</td>
												</tr>
												<tr>
													<td class="nameTd">강의시간</td>
													<td colspan="3"></td>
													<td class="nameTd">최대인원</td>
													<td><input required class="form-control" type="number" min="0" max="15"></td>
													<td class="nameTd">종료일</td>
													<td>
														<input required class="form-control" type="date">
													</td>
												</tr>
												<tr>
													<td class="nameTd">강의실</td>
													<td colspan="3">
														<select required class="form-control">
															<c:forEach items="${ScodeValues.lessonRoomList}" var="LR">
																<option value="${LR.lRoomId }">${LR.lRoomId }</option>
															</c:forEach>
														</select>
													</td>
													<td class="nameTd">대상</td>
													<td>
														<select required class="form-control">
															<c:forEach items="${ScodeValues.StudentGradeCategoryCodeList}" var="SG">
																<option value="${SG.scodeKey }">${SG.scodeValue }</option>
															</c:forEach>
														</select>
													</td>
													<td class="nameTd">학년</td>
													<td>
														<input required class="form-control" type="number" min="1" max="6" placeholder="1~6 숫자입력">
													</td>
												</tr>	
												<tr>
													<td class="nameTd">강의소개</td>
													<td colspan="9"><textarea required rows="4" class="form-control"></textarea></td>
												</tr>
											</table>
						            	</form>
					            	</div>
			            		</div>
			            	</div>
			            </div>
			         </div>
					</div>  
				</div>
				<div class="row">
					<div id="lessonTargetArea" class="col-sm-12">
						
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
   </div>
</section>

	<!-- Large modal -->
<div id="lessonListModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
		<div class="card card-dark card-outline">
			<div class="card-header">
				<h3 class="card-title">
					<i class="fas fa-table" aria-hidden="true"></i>
					&nbsp;
					수업목록
				</h3>
			</div>
			<div class="card-body" style="padding-top: 5px; padding-bottom: 5px;">
				<div class="row table3">
					<div class="card-body table p-0">
						<table class="table table-head-fixed table-bordered table-hover">
							<thead>
								<tr>
									<th>과목</th>
									<th>수업명</th>
									<th>강의실</th>
									<th>선생님</th>
									<th>강의기간</th>
									<th>상세보기</th>
								</tr>
							</thead>
							<tbody id = "lessonListTableInModal">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
    </div>
  </div>
</div>
<div id="dataSource">
</div>

<script>
	let subject = "";
	let grade = "";
	let lessonName = "";
	window.onload=function(){
		
		$(document).on("click",".viewDetailBtn",function(){
	    	 let lessonAssignmentId = $(this).attr("id"); 
	    	 OpenWindow('/common/lesson/detail.do?lessonAssignmentId='+lessonAssignmentId,'강의 상세정보',800,700);
	    });
		
		$(document).on("click",".notReadyTd",function(){
			Swal.fire({
 			   title: '수업기간을 선택해주세요',
	   			icon: 'warning'
 		   });
		});
		
		let timeKorArr = [];
		let timeArr = [];
		
		let targetLessonHours;
		let dayHours = 0;
		
		$(document).on("click",".clickableTd",function(){
			$(this).attr("class","selectedTd");
			
			var timeKor = $(this).attr("id").replace('mon','월').replace('tue','화').replace('wed','수').replace('thu','목').replace('fri','금').replace('sat','토');
			var time = $(this).attr("id");
			
			timeKorArr.push(timeKor);
			timeArr.push(time)
			
			$("#lessonTime").text(timeKorArr);
			$("#lessonTimeTarget").attr("value",timeArr);
			$("#lessonTimeA").attr("value",timeKorArr);
			console.log(timeArr);
			CalculateTime();
		});
		
		$(document).on("click",".selectedTd",function(){
			$(this).attr("class","clickableTd");
			
			var timeKor = $(this).attr("id").replace('mon','월').replace('tue','화').replace('wed','수').replace('thu','목').replace('fri','금').replace('sat','토');
			var time = $(this).attr("id");
			
			timeKorArr.splice(timeArr.indexOf(timeKor),1);
			timeArr.splice(timeArr.indexOf(time),1);
			
			$("#lessonTime").text(timeKorArr);
			$("#lessonTimeTarget").attr("value",timeArr);
			$("#lessonTimeA").attr("value",timeKorArr);
			console.log(timeArr);
			CalculateTime();
		});
		
		function CalculateTime(){
			let timeCalArr = [0,0,0,0,0,0,0];
			console.log(timeArr);
			console.log(timeArr[0]);
			for(var i = 0 ; i<timeArr.length;i++){
				console.log("mon1".indexOf("mon")>-1);
				
				if(timeArr[i].indexOf("mon")>-1){
					timeCalArr[1]++;
				}
				if(timeArr[i].indexOf("tue")>-1){
					timeCalArr[2]++;
				}
				if(timeArr[i].indexOf("wed")>-1){
					timeCalArr[3]++;
				}
				if(timeArr[i].indexOf("thu")>-1){
					timeCalArr[4]++;
				}
				if(timeArr[i].indexOf("fri")>-1){
					timeCalArr[5]++;
				}
				if(timeArr[i].indexOf("sat")>-1){
					timeCalArr[6]++;
				}
				if(timeArr[i].indexOf("sun")>-1){
					timeCalArr[0]++;
				}
			}
			
			console.log(timeCalArr);
			console.log(dayCalArr);
			
			dayHours=0;
			for(var i = 0 ; i<7; i++){
				let a = parseInt(dayCalArr[i]);
				let b = parseInt(timeCalArr[i]);
				dayHours += (a*b);
			}
			
			$("#actualHours").text(dayHours);
		}
		
		$(document).on("click","#searchTeacherBtn",function(){
			let name = $(this).parent().parent().children().first().val();
			console.log(name);
			
			$.ajax({
		        type: "post"
		       ,url : "/manager/lesson/teacherList.do"
		       ,data : {"name" : name,
		    	   		"subject": subject
		    	   		}
		       ,success : function (data){
		    	   printData(data,$('#teacherListTable'),$('#teacherListDiv'),$('#teacherList-template'));
		        }
		       ,error : function(e){
		        }
			});
		});
		
		let managerId;
		$(document).on("click",".leftclickableTr",function(){
			$(".leftSelectedTr").css("background-color","white");
			$(".leftSelectedTr").css("color","black");
			$(".leftSelectedTr").attr("class","leftclickableTr")
			$(this).attr("class","leftSelectedTr")
			$(this).css("background-color","rgb(32 73 105)");
			$(this).css("color","rgb(253 251 216)");
			managerId = $(this).attr('data-id');
			$.ajax({
		        type: "post"
		       ,url : "/manager/lesson/getInfo.do"
		       ,data : {"managerId" : managerId}
		       ,success : function (data){
// 		    	   console.log(data.teacherSchedule);
		    	   data.teacherSchedule = data.teacherSchedule.toString();
// 		    	   console.log(data.teacherSchedule);
		    	   printData(data,$('#teacherInfoTable'),$('#teacherInfoDiv'),$('#teacherInfo-template'));
		    	   printData(data,$('#lessonRegistForm'),$('#lessonRegistFormDiv'),$('#lessonRegistForm-template'));
		        }
		       ,error : function(e){
		        }
			});
		});
		
		let price;
		let lessonName;
		let target;
		let dayCalArr = [];
		let lessonId;
		
		$(document).on("click",".lessonLine",function(){
			price = $(this).children().eq(3).text().trim()+"원";
			lessonName = $(this).children().eq(2).text().trim();
			target = $(this).children().eq(4).text();
			targetLessonHours = $(this).children().eq(5).text();
			lessonId = ""+$(this).children().eq(0).text();
			subject = $(this).children().eq(1).attr("data-id");
			
			$(".selectedLesson").attr("class","lessonLine");
			$(this).attr("class","selectedLesson");
			$.ajax({
		        type: "post"
		       ,url : "/manager/lesson/teacherList.do"
		       ,data : {"subject" : subject}
		       ,success : function (data){
	    	   		printData(data,$('#teacherListTable'),$('#teacherListDiv'),$('#teacherList-template'));
		        }
		       ,error : function(e){
		        }
			});
		});
		
		$("#subjectSel").on("change",function(){
			subject = $("#subjectSel option:selected").val();
			grade = $("#gradeSel option:selected").val();
			lessonName = $("#searchlessonInput").val();
			
			list_go(1);
		});
		$("#gradeSel").on("change",function(){
			subject = $("#subjectSel option:selected").val();
			grade = $("#gradeSel option:selected").val();
			lessonName = $("#searchlessonInput").val();
			
			list_go(1);
		});
		$("#searchlessonBtn").on("click",function(){
			subject = $("#subjectSel option:selected").val();
			grade = $("#gradeSel option:selected").val();
			lessonName = $("#searchlessonInput").val();
			
			list_go(1);
		});
		
		$("#searchlessonInput").on("keyup",function(key){
			if(key.keyCode==13) {
				subject = $("#subjectSel option:selected").val();
				grade = $("#gradeSel option:selected").val();
				lessonName = $("#searchlessonInput").val();
				
				list_go(1);
	        }
		});
		
		
		let oriStartDate;
		let startDate;
		let oriEndDate;
		let endDate;
		let lessonRoom;
		$("#settingStartdate").on("change",function(){
			oriStartDate = $(this).val();
			startDate = oriStartDate.replaceAll("-","");
			if(startDate!=null && endDate!=null && lessonRoom!=null){
				getSchedule($(this));
			}
		});
		
		$("#settingEnddate").on("change",function(){
			oriEndDate = $(this).val();
			endDate = oriEndDate.replaceAll("-","");
			if(startDate!=null && endDate!=null && lessonRoom!=null){
				getSchedule($(this));
			}
		});
		
		$(document).on("change","#avLessonRoomList",function(){
			lessonRoom = $("#avLessonRoomList option:selected").val();
			getSchedule();
		});
		
		let lessonHours;
		
		function getSchedule(obj){
			if(oriStartDate>oriEndDate){
				Swal.fire({
	    			   title: '종료일은 시작일 이후여야 합니다',
		   				icon: 'warning'
	    		   });
				obj.val("");
				return;
			}
			
			let sdataSet = {
					"managerId" : managerId
				   ,"startDate" : startDate
				   ,"endDate" : endDate
				   ,"lessonRoom" : lessonRoom
			};
			
			sdataSet = JSON.stringify(sdataSet);
			
			
			$.ajax({
		        type: "post"
		       ,url : "/manager/lesson/getSchudule.do"
		       ,contentType: 'application/json'
		       ,data : sdataSet
		       ,success : function (data){
				   console.log(data);		    	   
				   printAppendData(data,$('.timedataSourceToLessonInfo'),$('#dataSource'),$('#timeDatasource-template'));
				   setTimeout(function() {
					   printlessonTimeInfo();
					}, 500);
		        }
		       ,error : function(e){
		        }
			});
			
			
			timeArr = [];
			timeKorArr = [];
			$("#lessonTime").text(timeKorArr);
			$("#lessonTimeTarget").attr("value",timeArr);
			$("#lessonTimeA").attr("value",timeKorArr);
			
			let startDate2 = new Date(oriStartDate);
			let endDate2 = new Date(oriEndDate);
			let period = endDate2 - startDate2;
			let DayArr = ["sun","mon","tue","wed","thu","fri","sat"];
			let periodDay = period/(1000*60*60*24);
			let periodWeek = Math.floor(period/(1000*60*60*24*7));
			let reminderDay = (periodDay % 7)+1;
			
			for(var i = 0; i<7; i++){
				dayCalArr[i] = periodWeek;
			}
			for(var i = 0; i<reminderDay;i++){
				var abc = startDate2.getDay()+i;
				if(abc>=7){
					abc=abc-7;
				}
				dayCalArr[abc]++;
			}
			
			setTimeout(function() {
				$("#targetHours").text(targetLessonHours);
			}, 500);
		}
		
		function printlessonRoomList(){
			let sdataSet = {
					"managerId" : managerId
				   ,"startDate" : startDate
				   ,"endDate" : endDate
				   ,"lessonRoom" : lessonRoom
			};
			
			sdataSet = JSON.stringify(sdataSet);
			
			$.ajax({
		        type: "post"
		       ,url : "/manager/lesson/getLessonRoom.do"
		       ,contentType: 'application/json'
		       ,data : sdataSet
		       ,success : function (data){
		    	   printData(data,$('#avLessonRoomList'),$('#ghostDiv'),$('#lessonRoomList-template'));
		        }
		       ,error : function(e){
		        }
			});
		}
		
		$("#firstNextBtn").on("click",function(){
			
			if(!managerId){
				Swal.fire({
	    			   title: '선생님을 선택해주세요',
		   				icon: 'warning'
	    		   });
				return;
			}
			printlessonRoomList();
			$("#custom-tabs-four-home-tab").attr("class","nav-link");
			$("#custom-tabs-four-profile-tab").attr("class","nav-link active");
			$("#custom-tabs-four-home-tab").attr("aria-selected","false");
			$("#custom-tabs-four-profile-tab").attr("aria-selected","true");
			$("#custom-tabs-four-home").attr("class","tab-pane fade");
			$("#custom-tabs-four-profile").attr("class","tab-pane fade active show");
			
			$("#targetHours").text(targetLessonHours);
			$(".second").attr("class","stepper-item second completed");
		});
		
		$("#secondPrevBtn").on("click",function(){
			$("#custom-tabs-four-profile-tab").attr("class","nav-link");
			$("#custom-tabs-four-home-tab").attr("class","nav-link active");
			$("#custom-tabs-four-profile-tab").attr("aria-selected","false");
			$("#custom-tabs-four-home-tab").attr("aria-selected","true");
			$("#custom-tabs-four-profile").attr("class","tab-pane fade");
			$("#custom-tabs-four-home").attr("class","tab-pane fade active show");
			$(".second").attr("class","stepper-item second");
		});
		
		$("#secondNextBtn").on("click",function(){
			
			if(targetLessonHours!=dayHours){
				Swal.fire({
	    			   title: '수업시수를 확인해주세요!',
		   				icon: 'warning'
	    		   });
				return;
			}
				
			$("#custom-tabs-four-profile-tab").attr("class","nav-link");
			$("#custom-tabs-four-third-tab").attr("class","nav-link active");
			$("#custom-tabs-four-profile-tab").attr("aria-selected","false");
			$("#custom-tabs-four-third-tab").attr("aria-selected","true");
			$("#custom-tabs-four-profile").attr("class","tab-pane fade");
			$("#custom-tabs-four-third").attr("class","tab-pane fade active show");
			$(".third").attr("class","stepper-item third completed");
			$(".second").attr("class","stepper-item second completed");
			
			
			$("#lessonStartDateView").text(oriStartDate);
			console.log(startDate);
			$("#lessonStartDate").attr("value",startDate);
			$("#lessonEndDateView").text(oriEndDate);
			$("#lessonEndDate").attr("value",endDate);
			
			$("#lessonRoomView").text($("#avLessonRoomList").val());
			$("#lessonRoom").attr("value",$("#avLessonRoomList").val());
			$("#lessonMaxNo").text($("#avLessonRoomList option:selected").attr("id"));
			
			$("#lessonNameView").text(lessonName);
			$("#lessonName").attr("value",lessonName);
			$("#lessonPriceView").text(price);
			$("#lessonPrice").attr("value",price);
			
			$("#lessonGradeCategoryCode").text(target.split(" ")[0]);
			$("#lessonGrade").text(target.split(" ")[1]);
			
			$("#lessonId").attr("value",lessonId);
			$("#lessonHoursView").text(targetLessonHours);
			
			let timeTableDivHTML = $("#lessonSelectArea").html();
			$("#lessonTargetArea").html(timeTableDivHTML);
			
			$(".selectedTd").attr("class","copiedSelectedTd");
			$(".clickableTd").attr("class","copiedClickableTd");
		});
		
		$("#thirdPrevBtn").on("click",function(){
			$("#custom-tabs-four-third-tab").attr("class","nav-link");
			$("#custom-tabs-four-profile-tab").attr("class","nav-link active");
			$("#custom-tabs-four-third-tab").attr("aria-selected","false");
			$("#custom-tabs-four-profile-tab").attr("aria-selected","true");
			$("#custom-tabs-four-third").attr("class","tab-pane fade");
			$("#custom-tabs-four-profile").attr("class","tab-pane fade active show");
			$(".third").attr("class","stepper-item third");
			$(".copiedSelectedTd").attr("class","selectedTd");
			$(".copiedClickableTd").attr("class","clickableTd");
		});
		
		$(document).on("click",".disabledTd",function(){
			
			let lessonAssignmentid = $(this).attr("data-lessonAssignmentId");
			let str =""; 
			
			$(".timedataSourceToLessonInfo").each(function(){
				let lRoomId = $(this).attr("data-lRoomId");
				let lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월','mon').replaceAll('화','tue').replaceAll('수','wed').replaceAll('목','thu').replaceAll('금','fri').replaceAll('토','sat').replaceAll('일','sun');
				let subjectTypeName = $(this).attr("data-subjectTypeName");
				let lessonascAssignmentid = $(this).attr("data-lessonAssignmentid");
				let mngName = $(this).attr("data-mngName");
				let lessonName = $(this).attr("data-lessonName");
				let period = $(this).attr("data-lessonStartDate") + "~" + $(this).attr("data-lessonEndDate");
				if(lessonAssignmentid.indexOf(lessonascAssignmentid)>=0){
					str += "<tr><td>"+subjectTypeName+"</td><td style='text-align:left;max-width: 200px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;'>"+lessonName+"</td><td>";
					str += lRoomId+"</td><td>"+mngName+"T</td>";
					str += "<td>"+period+"</td><td><button id='"+lessonascAssignmentid+"' type='button' class='btn btn-sm btn-dark viewDetailBtn'>상세보기</button>";
					str += "</td></tr>";
				}
			});
			
			$("#lessonListTableInModal").html(str);
			$('#lessonListModal').modal({
		        show: true
		    });
		});
		
	}
	
	function list_go(page){
		
		$.ajax({
	        type: "post"
	       ,url : "/manager/lesson/searchLessonList.do"
	       ,data : {
	    	   "Search1" : subject
	    	  ,"Search2" : grade
	    	  ,"Search3" : lessonName
	    	  ,"Search4" : page
	       }
	       ,success : function (data){
	    	   printData(data,$('#lessonListTable'),$('#lessonListTableDiv'),$('#lessonList-template'));
	        }
	       ,error : function(e){
	        }
		});
	}
</script>
<script>
	function lessonformSubmit(){
		console.log(document.forms["lessonRegistForm"]);
		document.forms["lessonRegistForm"].submit();
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
function printAppendData(data,delArea,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	delArea.remove();
	target.append(html);
}
</script>
<script>
function printlessonTimeInfo(){
	resetTd();
	
	let lessonTimeInfoArr = [];
	
	$(".timedataSourceToLessonInfo").each(function(){
		let lessonTimeInfo = new Object();
		lessonTimeInfo.lRoomId = $(this).attr("data-lRoomId");
		lessonTimeInfo.lessonTimeTarget = $(this).attr("data-lessonTimeTarget").replaceAll('월','mon').replaceAll('화','tue').replaceAll('수','wed').replaceAll('목','thu').replaceAll('금','fri').replaceAll('토','sat').replaceAll('일','sun');
		lessonTimeInfo.subjectTypeName = $(this).attr("data-subjectTypeName");
		lessonTimeInfo.lessonAssignmentid = $(this).attr("data-lessonAssignmentid");
		lessonTimeInfo.mngName = $(this).attr("data-mngName");
		lessonTimeInfoArr.push(lessonTimeInfo);
	});
	
	let integratedTimeStr = "";
	for(var i = 0; i < lessonTimeInfoArr.length; i++){
		integratedTimeStr += ","+lessonTimeInfoArr[i].lessonTimeTarget;
	}
	integratedTimeStr+= ",";
	console.log("integratedTimeStr="+integratedTimeStr);
	
	$(".notReadyTd").each(function(){
		let tdId = $(this).attr("id");
		if(integratedTimeStr.indexOf(tdId+",")>=0){
			$(this).attr("class","disabledTd");
			var cnt = 0;
			for(var i = 0; i < lessonTimeInfoArr.length ; i++){
				if (cnt == 0){
					if (lessonTimeInfoArr[i].lessonTimeTarget.indexOf(tdId)>=0){
						$(this).attr("data-lessonAssignmentId",lessonTimeInfoArr[i].lessonAssignmentid);
						cnt++;
					}
				} else {
					if (lessonTimeInfoArr[i].lessonTimeTarget.indexOf(tdId)>=0){
						$(this).attr("data-lessonAssignmentId",$(this).attr("data-lessonAssignmentId")+","+lessonTimeInfoArr[i].lessonAssignmentid)
						cnt++;
					}
				}
			}
		} else {
			$(this).attr("class","clickableTd")
		}
	 });
}

function resetTd(){
	$("#actualHours").text("0");
	$(".disabledTd").each(function(){
		$(this).attr("class","notReadyTd");
		$(this).attr("data-lessonAssignmentId","");
	});
	$(".clickableTd").each(function(){
		$(this).attr("class","notReadyTd");
		$(this).attr("data-lessonAssignmentId","");
	});
	$(".selectedTd").each(function(){
		$(this).attr("class","notReadyTd");
		$(this).attr("data-lessonAssignmentId","");
	});
}
</script>

<script type="text/x-handlebars-template"  id="lessonRoomList-template" >
<select id="avLessonRoomList" class="form-control" >
{{#each lessonRoomList}}
	<option id={{lRoomMaxNo}}>{{lRoomId}}</option>
{{/each}}
</select>
</script>
<script type="text/x-handlebars-template"  id="timeDatasource-template" >
{{#each scheduleList}}
	<div class="timedataSourceToLessonInfo" data-lRoomId="{{lRoomId}}" data-lessonTimeTarget="{{lessonTimeTarget }}" data-subjectTypeName="{{lessonSubjectTypeName }}"
		 data-lessonAssignmentId="{{lessonAssignmentId }}" data-lessonSubjectType="{{lessonSubjectType}} " data-mngName="{{mngName}}"
		data-lessonName="{{lessonName}}" data-lessonStartDate="{{lessonStartDate}}" data-lessonEndDate="{{lessonEndDate}}">
	</div>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="lessonList-template" >
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
	<tbody>
{{#each lessonList}}
		<tr class="lessonLine">
			<td>{{lessonId}}</td>
			<td data-id="{{lessonSubjectType }}">{{lessonSubjectTypeName}}</td>
			<td style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">&nbsp;&nbsp;{{lessonName}}</td>
			<td>{{lessonPrice}}
			</td>
			<td>{{lessonGradeInteGrate}}</td>
			<td>{{lessonHours}}</td>
		</tr>
{{/each}}
	</tbody>
</table>
</script>

<script type="text/x-handlebars-template"  id="teacherList-template" >
<table id="teacherListTable" class="table table-head-fixed table-bordered">
	<thead>
		<tr>
			<th style="width: 30%">과목</th>
			<th style="width: 40%">선생님</th>
		</tr>
	</thead>
	<tbody>
{{#each teacherList}}
		<tr  data-id="{{id}}" class="leftclickableTr" studentId="{{id}}">
			<td>{{mngSubjectKor}}</td>
			<td>{{mngName}}T</td>
			</td>
		</tr>
{{/each}}
	</tbody> 
</table>
</script>

<script type="text/x-handlebars-template"  id="teacherInfo-template" >
<table id="teacherInfoTable" class="table table-bordered">
<tr>
	<td style="width: 20%">이름</td>
	<td style="width: 30%">{{teacherInfo.mngName}}</td>
	<td style="width: 20%">과목</td>
	<td style="width: 30%">{{teacherInfo.mngSubjectKor}}</td>
</tr>
<tr>
	<td>전공</td>
	<td>{{teacherInfo.mngMajor}}</td>
	<td>졸업일</td>
	<td>{{teacherInfo.mngGraduatedYear}}</td>
</tr>
<tr>
	<td>경력년수</td>
	<td>{{teacherInfo.mngCarrerYear}}</td>
	<td>입사일</td>
	<td>{{teacherInfo.mngDeleteDate}}</td>
</tr>
</table>
</script>

<script type="text/x-handlebars-template"  id="lessonRegistForm-template" >
<form id="lessonRegistForm" action="/manager/lesson/realRegist.do" method="post" name="lessonRegistForm">
<table id="lessonRegistFormTable" class="table table-bordered">
<tr>
	<td class="nameTd">수업명</td>
	<td colspan="5" id="lessonNameView"><input required id="lessonName" name="lessonName" class="form-control" type="hidden" min="0"></td>
	<td class="nameTd">강의금액</td>
	<td id="lessonPriceView"></td>
</tr>
<tr>
	<td class="nameTd" style="width: 10%">과목</td>
	<td style="width: 10%">{{teacherInfo.mngSubjectKor}}</td>
	<td class="nameTd" style="width: 10%">선생님</td>
	<td style="width: 10%">{{teacherInfo.mngName}}</td>
		<input required type="hidden" id="mngId" name="mngId" value="{{teacherInfo.id}}">
	<td class="nameTd" style="width: 10%">수업시수</td>
	<td style="width: 10%" id="lessonHoursView">
	</td>
	<td class="nameTd" style="width: 10%">시작일</td>
	<td style="width: 10%" id="lessonStartDateView"></td>
	<input required id="lessonStartDate" name="laStartDate" class="form-control" type="hidden">
</tr>
<tr>
	<td class="nameTd">강의시간</td>
	<td id="lessonTime" colspan="3"></td>
	<input id="lessonTimeTarget" name="laTimeInfo" type="hidden">
	<input id="lessonTimeA" name="lessonDetail" type="hidden">
	<td class="nameTd">최대인원</td>
	<td id="lessonMaxNo"></td>
	<td class="nameTd">종료일</td>
	<td id="lessonEndDateView"></td>
	<input required id="lessonEndDate" name="laEndDate" class="form-control" type="hidden">
</tr>
<tr>
	<td class="nameTd">강의실</td>
	<td colspan="3" id="lessonRoomView"></td>
	<input required id="lessonRoom" name="lroomId" class="form-control" type="hidden">
	<td class="nameTd">대상</td>
	<td id="lessonGradeCategoryCode">
	</td>
	<td class="nameTd">학년</td>
	<td id="lessonGrade">
	</td>
	<input required id="lessonId" name="lessonId" class="form-control" type="hidden">
</tr>	
</table>
</form>
</script>
<script type="text/x-handlebars-template"  id="lessonTimeWeekDayRegistForm-template" >
<table id="lessonTimeRegistWeekDayFormTable" class="table table-bordered">
<tbody>
		<td class="backgroundTd">목표 시수</td>
		<td id="targetHours" colspan="3"></td>
		<td class="backgroundTd" colspan="2">현재 시수</td>
		<td id="actualHours" colspan="3"></td>
	</tr>
	<tr>
		<th class="backgroundTd" style="width: 100px;">
			</th>
		<th class="backgroundTd" >월</th>
		<th class="backgroundTd" >화</th>
		<th class="backgroundTd" >수</th>
		<th class="backgroundTd" >목</th>
		<th class="backgroundTd" >금</th>
		<th class="backgroundTd" >토</th>
		<th class="backgroundTd" >일</th>
	</tr>
	<c:forEach items="${ttMap.weekDayList}" var="wdList">
		<tr>
			<td class="backgroundTd" style="width: 23%;" >
				${wdList.timetablePeriod}교시 (${wdList.timetableStartTime }~ ${wdList.timetableEndTime })
			</td>
			<td id="mon${wdList.timetablePeriod}" class="{{isSchudule teacherSchedule 'mon' ${wdList.timetablePeriod} }}"></td>
			<td id="tue${wdList.timetablePeriod}" class="{{isSchudule teacherSchedule 'tue' ${wdList.timetablePeriod} }}"></td>
			<td id="wed${wdList.timetablePeriod}" class="{{isSchudule teacherSchedule 'wed' ${wdList.timetablePeriod} }}"></td>
			<td id="thu${wdList.timetablePeriod}" class="{{isSchudule teacherSchedule 'thu' ${wdList.timetablePeriod} }}"></td>
			<td id="fri${wdList.timetablePeriod}" class="{{isSchudule teacherSchedule 'fri' ${wdList.timetablePeriod} }}"></td>
			<td id="sat${wdList.timetablePeriod}" class="{{isSchudule teacherSchedule 'sat' ${wdList.timetablePeriod} }}"></td>
			<td id="sun${wdList.timetablePeriod}" class="{{isSchudule teacherSchedule 'sun' ${wdList.timetablePeriod} }}"></td>
		</tr>
	</c:forEach>
</tbody>
</table>
</script>
<script type="text/x-handlebars-template"  id="lessonTimeWeekEndRegistForm-template" >
<table id="lessonTimeRegistWeekEndFormTable" class="table table-bordered">
	<tbody><tr>
		<th style="width: 25%;"></th>
		<th style="width: 40%;">시간</th>
		<th style="width: 35%;">토</th>
	</tr>
	<c:forEach items="${ttMap.weekEndList}" var="weList">
		<tr>
			<td>
				${weList.timetablePeriod}교시
			</td>
			<td>
				${weList.timetableStartTime }~ ${weList.timetableEndTime }
			</td>
			<td id="sat${weList.timetablePeriod}" class="{{isSchudule teacherSchedule 'sat' ${weList.timetablePeriod}}}"></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</script>
</body>
</html>