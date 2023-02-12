<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="studentList" value="${dataMap.studentList}" />
<c:set var="genderCodeList" value="${dataMap.genderCodeList}" />
<c:set var="gradeCodeList" value="${dataMap.gradeCodeList}" />
<c:set var="gradeCategoryCodeList" value="${dataMap.gradeCategoryCodeList}" />
<c:set var="statusCodeList" value="${dataMap.statusCodeList}" />
<c:set var="school" value="${dataMap1.school}" />
<c:set var="cri" value="${pageMaker.cri }" />

<title>학생정보관리</title>

<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

	<style>
	
		.clickable {
		cursor: pointer;
		}
		.clickable:hover {
			background-color: #395d83;
			color: rgb(253 251 216);
			cursor: pointer;
		}
		.clicked{
			background-color: #395d83;
			color: rgb(253 251 216);
			cursor: pointer;
		}
		
		* {
			font-size: 14px;
		}
		
		label {
			margin-bottom: 0;
		}
				
		div.table2 {
			max-height: 100%;
			overflow-y: auto;
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
		
		table:hover tbody tr:hover td {
   			 background: #395d83;
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
		.form-group{
			padding-top: 3px;
		}
		#profile{
			 background-image: url("../../../../../resources/images/bros_blank.jpg");
       		 background-repeat: no-repeat;
       		 background-position: center center;
       		 background-size: cover;
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
</head>

<body>
	
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6" style="display: flex;">
					<h1 data-userId="${loginUser.id }">학생정보관리</h1>
					
					<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '학생정보관리') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '학생정보관리') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
					
				</div>
			</div>
		</div>
	</section>
	
	<section id="testSection" class="content">
		<div class="container-fluid">
		<div class="card">
			<div class="card-body">
			<ul class="nav nav-tabs" id="custom-content-below-tab1" role="tablist">
				<li class="nav-item">
				<a class="nav-link active" id="custom-content-below-home-tab1" data-toggle="pill" href="#custom-content-below-home1" role="tab" aria-controls="custom-content-below-home1" aria-selected="true">목록</a>
				</li>
				<li class="nav-item">
				<a class="nav-link" id="custom-content-below-profile-tab1" data-toggle="pill" href="#custom-content-below-profile1" role="tab" aria-controls="custom-content-below-profile1" aria-selected="false">상세정보</a>
				</li>
			</ul>
			<div class="tab-content" id="custom-content-below-tabContent1">
				<div class="tab-pane fade active show" id="custom-content-below-home1" role="tabpanel" aria-labelledby="custom-content-below-home-tab1">
					<div class="row" style="padding-top: 10px;">
				
				<!-- 우측영역  -->
				<div class="col-sm-12">
					<div class="card card-dark card-outline" style="height: 58vh; overflow-y: auto;">
								<div class="card-header">
									<div class="row" style="display: flex; align-items: center;">
										<div class="col-sm-2" style="height: 20px;">
												<h3 class="card-title">
													<i class="fas fa-list"></i>
													&nbsp;&nbsp;
													학생 목록
												</h3>
										</div>
										<div class="col-sm-4">
<!-- 										<button type="button" class="btn btn-dark btn-sm" onclick="test();">클릭</button> -->
										</div>
										<div class="col-sm-2" style="text-align: right; padding-top: 7px;">
										
											<h6 style="color:#395d83;">검색 결과 : ${pageMaker.totalCount}행</h6>
											
										</div>
										<div class="col-sm-4">
											<div class="input-group">
												<input id="listSearchKeyword" type="text" class="form-control form-control-sm" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }">
												<div class="input-group-append">
													<button id="listSearchBtn" type="button" class="btn btn-dark btn-sm" onclick="list_go(1)">
														<i class="fas fa-search"></i>
													</button>
												</div>&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn btn-dark btn-sm" onclick="registForm_go();">등록</button>
											<button id="listSavePdf" type="button" class="btn btn-danger btn-sm">PDF</button>
											</div>
										</div>
									</div>
								</div>
							<div class="card-body" style="padding-top: 5px;">
								<div class="row table2">
											<div class="card-body p-0">
												<table id="studentListTable" class="table table-hover table-head-fixed table-bordered">
													<thead>
														<tr>
															<th>학생명</th>
															<th>성별</th>
															<th>아이디</th>
															<th>학교</th>
															<th>학년</th>
															<th>반</th>
															<th>연락처</th>
															<th>부모명</th>
															<th>등록일</th>
															<th>상태</th>
														</tr>
													</thead>
													<tbody id="searchResultTable">
													<c:if test="${empty studentList}">
														<tr>
															<td colspan="10" class="text-center" style="background-color: white; color:black;">
																해당 내용이 없습니다.
															</td>
														</tr>
													</c:if>
													<c:if test="${!empty studentList}">
														<c:forEach items="${studentList}" var="student">
															<tr class="clickable" onclick='detail_go("${student.id}");' style="cursor: pointer;">
																<td>${student.name }</td>
																<td>${student.genderCode }</td>
																<td>${student.id }</td>
																<td>${student.schoolNo }</td>
																<td>${student.gradeCategoryCode }&nbsp;${student.grade }</td>
																<td>${student.sibling }</td>
																<td>${student.hp }</td>
																<td>${student.parentId }</td>
																<td>${fn:substring(student.academyRegDate,0,4)}-${fn:substring(student.academyRegDate,4,6)}-${fn:substring(student.academyRegDate,6,8)}</td>
																<td>${student.stateCode}</td>
															</tr>
														</c:forEach>
													</c:if>	
													</tbody>
												</table>
											</div>
									</div>
								
							</div> <!-- card body -->
							<div class="card-footer">
									<!-- pagination -->
    								<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
							</div>
						</div> <!-- card-outline -->
					</div>
				</div>
			</div>
			
			<div class="tab-pane fade" id="custom-content-below-profile1" role="tabpanel" aria-labelledby="custom-content-below-profile-tab1">
					
			<!-- 하단 영역 -->	
			<div class="row" style="padding-top: 10px;">
				<div class="col-sm-12">
					<div class="card card-dark card-outline" style="height: 74vh; overflow-y: auto;">
						<div class="card-header">
							<div class="row">
								<div class="col-sm-8" style="height: 20px;">
								<h3 class="card-title">
									<i class="fas fa-regular fa-address-card"></i>
									&nbsp;&nbsp;
									학생 상세정보
								</h3>
								</div>
								<div class="col-sm-4" style="text-align: right">
									<button type="button" class="btn btn-dark btn-sm" onclick="regist_go();">
									저장
									</button>
									<button id="studentDetailSavePdf" type="button" class="btn btn-danger btn-sm">
									PDF
									</button>
									<button type="button" class="btn btn-dark btn-sm" onclick="resetForm();">
									초기화
									</button>
									<button type="button" class="btn btn-dark btn-sm" onclick="list_go1();">
									목록으로
									</button>
								</div>
							</div>
						</div>
						<div class="card-body" >
							<ul class="nav nav-tabs" id="custom-content-below-tab" role="tablist">
								<li class="nav-item">
								<a class="nav-link active" id="custom-content-below-home-tab" data-toggle="pill" href="#custom-content-below-home" role="tab" aria-controls="custom-content-below-home" aria-selected="true">학생</a>
								</li>
								<li class="nav-item">
								<a class="nav-link" id="custom-content-below-profile-tab" data-toggle="pill" href="#custom-content-below-profile" role="tab" aria-controls="custom-content-below-profile" aria-selected="false">부모</a>
								</li>
							</ul>
							
						<div class="tab-content" id="custom-content-below-tabContent">
								<div class="tab-pane fade active show" id="custom-content-below-home" role="tabpanel" aria-labelledby="custom-content-below-home-tab">
							<form role="form1" id="form1" method="post">
									<div id="studentDetailTable" class="row col-sm-12" style="padding-top: 10px; display: flex; justify-content: center;">
										<div class="row col-sm-2">
											<div class="row col-sm-12" style="height:200px">
												<input type="hidden" name="studentPicture" />
												<input type="hidden" id="pwd" name="pw" value="">
													<div id="profile" style="border: solid 1px black; width: 130px; height: 130px">
														
													</div>
													<div class="input-group input-group-sm">
														<label for="inputFile" class=" btn btn-dark btn-sm input-group-addon">파일선택</label>
														<input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled/>
														<span class="input-group-append-sm">											
															<button type="button" class="btn btn-dark btn-sm btn-append" onclick="upload_go();">업로드</button>											
														</span>
														<span class="input-group-append-sm">											
															&nbsp;&nbsp;<button type="button" class="btn btn-dark btn-sm btn-append" onclick="OpenWindow('/manager/membermanagement/membermanagement/takePicture.do','사진찍기',1000,510);">사진찍기</button>											
														</span>
													</div>
											</div>		
												
										</div>
											<div class="row col-sm-9" style="display: flex; justify-content: space-evenly; margin: 0px;">
												<div class="row col-sm-7" >
												<fieldset class="form-group border p-3" style="padding-bottom: 0px; margin: 0px; height: 434px;">
                        						<legend class="w-auto" style="font-size: 15px; font-weight: bold; margin: 0px;">개인 정보</legend>	
												<div class="row col-sm-12" style="padding: 0px; margin: 0px;">
												<div class="form-group col-sm-6" style="margin: 0px;">
														<label for="id">아이디</label><label style="color: red;">&nbsp;&nbsp;*</label>
														<button type="button" class="btn btn-dark btn-xs" onclick="idCheck();">
														중복확인
														</button>
														<div class="input-group">
														<input type="text" class="form-control" id="id" name="id" placeholder="아이디(email)" onchange="change(this);">
														</div>
														<label for="name" style="margin-top: 5px;">이름</label><label style="color: red;">&nbsp;&nbsp;*</label>
														<input type="text" class="form-control" id="name" name="name" placeholder="이름" onchange="inputValueChange(this);">
														<label for="gender" style="margin-top: 5px;">성별</label><label style="color: red;">&nbsp;&nbsp;*</label>
														<select id="gender" class="form-control" name="genderCode" onchange="inputValueChange(this);">
															<c:forEach items="${genderCodeList}" var="gender">
																<option value="${gender.sCodeKey }">${gender.sCodeValue }</option>
															</c:forEach>
														</select>
														<label for="zip" style="margin-top: 5px;">우편번호</label>
														<button type="button" class="btn btn-dark btn-xs" onclick="sample6_execDaumPostcode()">
															검색
														</button>
														<input type="text" class="form-control" id="zip" name="zipCode" placeholder="우편번호" onchange="inputValueChange(this);">
														<label for="address" style="margin-top: 5px;">주소</label>
														<input type="text" class="form-control" id="address"  name="address" placeholder="주소" onchange="inputValueChange(this);">
														<label for="address2" style="margin-top: 5px;">상세주소</label>
														<input type="text" class="form-control" id="address2" name="address2" placeholder="상세주소" onchange="inputValueChange(this);">
														</div>
													<div class="form-group col-sm-6" style="margin: 0px;">
														<label for="email">이메일</label><label style="color: red;">&nbsp;&nbsp;*</label>
														<div class="input-group">
														<input type="text" class="form-control" id="email" name="email" placeholder="이메일" onchange="inputValueChange(this);">
														</div>
														<label for="hp" style="margin-top: 5px;">전화번호</label>
														<input type="text" class="form-control" id="hp" name="hp" placeholder="전화번호(01012345678)" onchange="inputValueChange(this);">
														<label for="birthdate" style="margin-top: 5px;">생년월일</label>
														<input type="text" class="form-control" id="birthdate" name="birthDate" placeholder="생년월일(20000101)" onchange="inputValueChange(this);">
														
														<div style="margin-top: 6px; margin-bottom: 2px;">
														<div class="custom-control custom-radio" style="display: inline; ">
														<input class="custom-control-input" type="radio" id="pather1" name="parent1" value="papa" onchange="change(this);"> 
														<label for="pather1" class="custom-control-label">부</label>
														</div>
														&nbsp;&nbsp;
														<div class="custom-control custom-radio" style="display: inline;">
															<input class="custom-control-input" type="radio" id="mother1" name="parent1" checked="checked" value="mama" onchange="change(this);"> 
															<label for="mother1" class="custom-control-label">모</label>
														</div>
														&nbsp;&nbsp;
														<div class="custom-control custom-radio" style="display: inline;">
															<input class="custom-control-input" type="radio" id="other1" name="parent1" value="other" onchange="change(this);"> 
															<label for="other1" class="custom-control-label">기타</label>
														</div>
														</div>
														<input type="text" class="form-control parentName" id="parentName1"  placeholder="부모명" onchange="change(this);">
														<label for="parentId1" style="margin-top: 5px;">부모아이디</label><label style="color: red;">&nbsp;&nbsp;*</label>
														<div class="input-group">
														<input type="text" class="form-control" id="parentId1" name="parentId" placeholder="아이디(email)" onchange="change(this);">
														</div>
														<label for="parentHp" style="margin-top: 5px;">부모 연락처</label><label style="color: red;">&nbsp;&nbsp;*</label>
														<input type="text" class="form-control" id="parentHp1" placeholder="부모 연락처(01012345678)" onchange="change(this);">
													</div>
													</div>
												</fieldset>
													</div>
													
												<div class="form-group col-sm-4">
												<fieldset class="form-group border p-3" >
                        						<legend class="w-auto" style="font-size: 15px; font-weight: bold; margin: 0px;">학원 정보</legend>	
														<label for="grade">학년</label><label style="color: red;">&nbsp;&nbsp;*</label>
														<div class="input-group">
														<select id="gradeCode" class="form-control" name="gradeCategoryCode" onchange="inputValueChange(this);">
																<c:forEach items="${gradeCategoryCodeList}" var="gradeCategory">
																<option value="${gradeCategory.sCodeKey }">${gradeCategory.sCodeValue }</option>
																</c:forEach>
														</select>
														<select id="grade" class="form-control" name="grade" onchange="inputValueChange(this);">
																<c:forEach items="${gradeCodeList}" var="gradeCode">
																	<option value="${gradeCode.sCodeKey }">${gradeCode.sCodeValue }</option>
																</c:forEach>
														</select>
														</div>
														<label for="school">학교</label><label style="color: red;">&nbsp;&nbsp;*</label>
														<select id="school" name="schoolNo" class="form-control" onchange="inputValueChange(this);" required="required">
															<c:forEach items="${school}" var="school">
																<option value="${school.schoolId }">${school.schoolName }</option>
															</c:forEach>
														</select>
														<label for="regDate">등록일</label>
														<input type="text" class="form-control" id="regDate" name="academyRegDate" placeholder="등록일(20220101)" onchange="inputValueChange(this);">
														<label for="payDueDate">결제예정일</label>
														<input type="text" class="form-control" id="payDueDate" name="payDueDate" placeholder="결제예정일(20220101)" onchange="inputValueChange(this);">
														<label for="status">상태</label><label style="color: red;">&nbsp;&nbsp;*</label>
														<select id="status" class="form-control" name="stateCode" onchange="inputValueChange(this);">
															<c:forEach items="${statusCodeList}" var="status">
																<option value="${status.sCodeKey }">${status.sCodeValue }</option>
															</c:forEach>
														</select>
														<label for="sibling">형제여부</label>
														<div class="input-group">
														<input type="text" class="form-control" id="sibling" name="sibling" placeholder="형제이름" onchange="inputValueChange(this);">
														</div>
														<label for="discountrate">할인율/사유</label>
														<div class="input-group">
														<select class="form-control" id="discountRate" name="discountRate" onchange="inputValueChange(this);">
															<option value="0">없음</option>
															<option value="0.1">10%</option>
															<option value="0.2">20%</option>
															<option value="0.3">30%</option>
														</select>
														<input type="text" class="form-control" id="discountReason" name="discountReason" placeholder="사유" onchange="inputValueChange(this);">
														</div>
													</fieldset>
												</div>
											</div>
										</div>
									</form>
									<form role="imageForm" action="upload/picture" method="post" 
										  enctype="multipart/form-data">
										<input id="inputFile" name="pictureFile" type="file" class="form-control"
											   onchange="picture_go();"	style="display:none;">
										<input id="oldFile" type="hidden" name="oldPicture" value="" />
										<input type="hidden" name="checkUpload" value="0" />	
										<input type="hidden" name="checkRegist" value="0" />	
									</form>
									<form id="UserRegistStudent" method="post">
										<input id="userId" name="id" type="hidden">
										<input id="userPw" name="pw" type="hidden">
										<input id="userCategory" name="category" type="hidden" value="s">
										<input id="userIsFirstLogin" name="isFirstLogin" type="hidden" value="N">
									</form>
								</div>
									<div class="tab-pane fade" id="custom-content-below-profile" role="tabpanel" aria-labelledby="custom-content-below-profile-tab">
										<form role="form3" id="form3" method="post">
											<div class="row col-sm-12" style="padding-top: 5px; height: 30%">
													<div class="form-group col-sm-3">
													</div>
													<div class="form-group col-sm-6">
													
														
														<div class="custom-control custom-radio" style="display: inline;">
														<input class="custom-control-input" type="radio" id="pather" name="parentDivisionCode" value="papa" onchange="inputValueChange(this);"> 
														<label for="pather" class="custom-control-label">부</label>
														</div>
														&nbsp;&nbsp;
														<div class="custom-control custom-radio" style="display: inline;">
															<input class="custom-control-input" type="radio" id="mother" name="parentDivisionCode" checked="checked" value="mama" onchange="inputValueChange(this);"> 
															<label for="mother" class="custom-control-label">모</label>
														</div>
														&nbsp;&nbsp;
														<div class="custom-control custom-radio" style="display: inline;">
															<input class="custom-control-input" type="radio" id="other" name="parentDivisionCode" value="other" onchange="inputValueChange(this);"> 
															<label for="other" class="custom-control-label">기타</label>
														</div><br>
													<label for="parentId" style="padding-top: 10px;">아이디</label>
													<input type="text" class="form-control" id="parentId" name="id" placeholder="아이디(email)" style="width: 250px;" onchange="changeReverse(this);"><br>
													<label for="parentName">이름</label>
													<input type="text" class="form-control" id="parentName" name="parentName" placeholder="이름" style="width: 250px;" onchange="changeReverse(this);"><br>
													<label for="parentHP">전화번호</label>
													<input type="text" class="form-control" id="parentHp" name="parentHp" placeholder="전화번호" style="width: 250px;" onchange="changeReverse(this);"><br>
													<label for="email">이메일</label>
													<input type="text" class="form-control" id="parentEmail" name="parentEmail" placeholder="이메일" style="width: 250px;"><br>
														<div style="display: none;">
														<label class="col-sm-3">알림 수신 방법</label>
														<div class="custom-control custom-radio col-xs-3" style="display: inline;">
															<input class="custom-control-input" type="radio" id="emailAlarm" value="email" name="parentAlarmMethodCode" checked="checked" onchange="inputValueChange(this);"> 
															<label for="emailAlarm" class="custom-control-label">이메일</label>
															</div>
															&nbsp;&nbsp;
															<div class="custom-control custom-radio" style="display: inline;">
																<input class="custom-control-input" type="radio" id="smsAlarm" value="sms" name="parentAlarmMethodCode" onchange="inputValueChange(this);"> 
																<label for="smsAlarm" class="custom-control-label">SMS</label>
															</div>
															&nbsp;&nbsp;
															<div class="custom-control custom-radio" style="display: inline;">
																<input class="custom-control-input" type="radio" id="kakaoAlarm" value="kakao" name="parentAlarmMethodCode" onchange="inputValueChange(this);"> 
																<label for="kakaoAlarm" class="custom-control-label">카카오톡</label>
															</div>
															&nbsp;&nbsp;
															<div class="custom-control custom-radio" style="display: inline;">
																<input class="custom-control-input" type="radio" id="noAlarm" value="no" name="parentAlarmMethodCode" onclick="allNo()" onchange="inputValueChange(this);"> 
																<label for="noAlarm" class="custom-control-label">받지 않음</label>
															</div>
															<input type="hidden" id="parentAlarmYn" name="parentAlarmYn" value="yes">
															<input type="hidden" id="parentPw" name="pw" value="">
														<br><br>
														
															<input type="hidden" name="parentAlarmGetOn" value="N">
															<input type="hidden" name="parentAlarmGetOff" value="N">
															<input type="hidden" name="parentAlarmGo" value="N">
															<input type="hidden" name="parentAlarmOut" value="N">
															
														<label class="col-sm-3">알림 수신 종류</label>
														&nbsp;&nbsp;
														<div class="custom-control custom-checkbox" style="display: inline;">
															<input class="custom-control-input" type="checkbox"
																id="parentAlarmGo" checked="checked" onchange="inputValueChange(this);"> <label
																for="parentAlarmGo" class="custom-control-label">등원
																</label>
														</div>&nbsp;&nbsp;
														<div class="custom-control custom-checkbox" style="display: inline;">
														<input class="custom-control-input" type="checkbox"
																id="parentAlarmOut" checked="checked" onchange="inputValueChange(this);"> <label
																for="parentAlarmOut" class="custom-control-label">하원
																</label>
														</div>
														</div>
													</div>
													<div class="form-group col-sm-3">
													</div>
												
										</div>
									</form>	
								</div>
								<form id="UserRegistParent" method="post">
										<input id="userId" name="id" type="hidden">
										<input id="userPw" name="pw" type="hidden">
										<input id="userCategory" name="category" type="hidden" value="p">
										<input id="userIsFirstLogin" name="isFirstLogin" type="hidden" value="N">
								</form>
							</div>
						</div>
					
					</div> <!-- card body 끝 -->
				</div> <!-- card 끝 -->
			</div> 
			
				</div>
			</div>	
			</div>
		</div>
		
		
			
			
		</div>
	</section>

<!-- 주소 입력 관련 -->	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                   // document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                   // document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    }
</script>

<script>
window.onload=function(){
	
	$('#listSavePdf').click(function() { // pdf저장 button id
		
		PDFSave($('#studentListTable'),'StudentList.pdf');
		
	});
	
	$('#studentDetailSavePdf').click(function() { // pdf저장 button id
		
// 		PDFSave($('#studentDetailTable'),'StudentDetailnfo.pdf');
		PDFSave($("#testSection"),'StudentDetailnfo.pdf');

	});
	
	 $(document).on("click",".clickable",function(){
			$(".clicked").attr("class","clickable");
			$(this).attr("class","clicked");
	 });
	
	
	setTimeout(function() {
		let searchKeyword = $("#listSearchKeyword").val();
		let searchResultTableStr = $("#searchResultTable").html();
// 		console.log(searchResultTableStr);
		if(!(searchKeyword == 'undefined' || searchKeyword=='')){
			let result = HighLightSearchResult($("searchResultTable"),searchResultTableStr,searchKeyword);
			$("#searchResultTable").html(result);
		}
	}, 200);
	
	
	if (window.location.hash == '#reload') {
		  registForm_go();
	}
}


function inputValueChange(obj){
	obj.style.borderColor = '#28a745';
	obj.style.backgroundColor = '#e8f0fe';
	obj.style.borderWidth = '3px';
}

function resetForm(){
	window.location.hash = 'reload';
	window.location.reload();
}

function list_go1(){
	document.getElementById('custom-content-below-home-tab1').click();
}

function registForm_go() {
	//alert("regist btn click!");
	document.getElementById('custom-content-below-profile-tab1').click();
}

function change(obj){
	//alert('change');
	obj.style.borderColor = '#28a745';
	obj.style.backgroundColor = '#e8f0fe';
	obj.style.borderWidth = '3px';
	// 학생 아이디 입력시 이메일 값 자동 입력
	var email = $('input[name="email"]');
	var id = document.getElementById('id').value;
	email.val(id);
	
	// 학생 부모 아이디 입력시 부모 탭 아이디 값 자동 입력
	var parentId1 = $('input[id="parentId1"]').val();
	var parentId = $('input[id="parentId"]');
	var parentEmail = $('input[id="parentEmail"]');
	
	parentId.val(parentId1);
	parentEmail.val(parentId1);
	
	// 학생 부모 이름 입력시 부모 탭 이름 값 자동 입력 
	var parentName1 = $('input[id="parentName1"]').val();
	var parentName = $('input[id="parentName"]');
	
	parentName.val(parentName1);
	
	// 학생 부모 전화번호 입력시 부모 탭 전화번호 값 자동 입력
	var parentHp1 = $('input[id="parentHp1"]').val();
	var parentHp = $('input[id="parentHp"]');
	
	parentHp.val(parentHp1);
	
	// 학생 탭에서 부모 구분 선택시 부모 탭 구분 자동 선택
	var parentDivision1 = $('input[id="mother1"]');
	var parentDivision2 = $('input[id="pather1"]');
	var parentDivision3 = $('input[id="other1"]');
	var parentDivision4 = $('input[id="mother"]');
	var parentDivision5 = $('input[id="pather"]');
	var parentDivision6 = $('input[id="other"]');
	
	if(parentDivision1.is(':checked')){
		parentDivision4.attr('checked','ture');
	}
	
	if(parentDivision2.is(':checked')){
		parentDivision5.attr('checked','ture');
	}
	
	if(parentDivision3.is(':checked')){
		parentDivision6.attr('checked','ture');
	}
}

function changeReverse(){
	
	// 부모 아이디 입력시 학생 탭 부모 아이디 값 자동 입력
	var parentId1 = $('input[id="parentId1"]');
	var parentId = $('input[id="parentId"]').val();
	var parentEmail = $('input[id="parentEmail"]');
	
	parentId1.val(parentId);
	parentEmail.val(parentId);
	
	// 부모 이름 입력시 학생 탭 부모 이름 값 자동 입력
	var parentName = $('input[id="parentName"]').val();
	var parentName1 = $('input[id="parentName1"]');
	
	parentName1.val(parentName);
	
	// 부모 전화번호 입력시 학생 탭 전화번호 값 자동 입력
	var parentHp = $('input[id="parentHp"]').val();
	var parentHp1 = $('input[id="parentHp1"]');
	
	parentHp1.val(parentHp);
	
}

function allNo() {
	$('input[id="parentAlarmGetOn"]').attr('checked',false);
	$('input[id="parentAlarmGetOff"]').attr('checked',false);
	$('input[id="parentAlarmGo"]').attr('checked',false);
	$('input[id="parentAlarmOut"]').attr('checked',false);

}

function regist_go(){
	//alert("btn click");
	var checkUpload = $('input[name="checkUpload"]').val();
	
	if(checkUpload != 1){
		 Swal.fire({
	        icon: 'error',
	        title: '사진 업로드를 먼저 해주세요.',
		  });
		 return;
	}
	// 학생 비밀번호를 이메일 주소에서 @ 앞부분만 추출해서 넣어준다(Resist할 경우)
	$('input[id="id"]').attr("disabled", false);
	var pwd =  $('input[name="pw"]');
	var id = document.getElementById('id').value;
	var arr = id.split("@");
	
	if(pwd.val() === ""){
		pwd.val(arr[0]);
	}
	
	// 학생 아이디 비밀번호 값 받아서 user input에 넣어주고 user 등록한다.
	var userIds = $('input[id="userId"]');
	var userPws = $('input[id="userPw"]');
	userIds.val(id);
	userPws.val(arr[0]);
	var form1 = $('form#UserRegistStudent').serialize();
	
	$.ajax({
	  url:"/manager/membermanagement/user/registUser",
      data:form1,
      type:'post',
      success:function(){
    	// alert("유저(학생) 정보가 업로드 되었습니다.");
      },
      error:function(error){
        // alert("현재 유저(학생) 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
      }
   });
	
	// 부모 비밀번호를 이메일 주소에서 @ 앞부분만 추출해서 넣어준다(Resist할 경우) 
	var parentPwd =  $('input[id="parentPw"]');
	var parentId =  $('input[id="parentId"]').val();
	var arr1 = parentId.split("@");
	
	if(parentPwd.val() === ""){
		parentPwd.val(arr1[0]);
	}
	userIds.val(parentId);
	userPws.val(arr1[0]);
	
	// 부모 알림 설정 여부 값 입력 
	var alarmNo = $('input[id="noAlarm"]');
	var parentAlarmGetOn = $('input[id="parentAlarmGetOn"]');
	var parentAlarmGetOff = $('input[id="parentAlarmGetOff"]');
	var parentAlarmGo = $('input[id="parentAlarmGo"]');
	var parentAlarmOut = $('input[id="parentAlarmOut"]');
	
	if(alarmNo.is(':checked')){
		$('input[id="parentAlarmYn"]').val(alarmNo.val());
	}
	
	if(parentAlarmGo.is(':checked')){
		$('input[name="parentAlarmGo"]').val("Y");
	}
	
	if(parentAlarmOut.is(':checked')){
		$('input[name="parentAlarmOut"]').val("Y");
	}
	
	var form2 = $('form#UserRegistParent').serialize();
	
	$.ajax({
		  url:"/manager/membermanagement/user/registUser",
	      data:form2,
	      type:'post',
	      success:function(){
	    	// alert("유저(부모) 정보가 업로드 되었습니다.");
	      },
	      error:function(error){
	         //alert("현재 유저(부모) 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
	      }
	   });
	
	var form3 = $('form#form3').serialize();
	console.log(form3);
	$.ajax({
		  url:"/manager/membermanagement/membermanagement/registParent",
	      data:form3,
	      type:'post',
	      success:function(){
	    	// alert("부모 정보가 업로드 되었습니다.");
	      },
	      error:function(error){
	        // alert("현재 부모 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
	      }
	   });
	

// 	alert(userIds.val());
// 	alert(userPws.val());
	
	//console.log(pwd);
	//alert(pwd);	
	var form = document.getElementById('form1');
	form.action = "/manager/membermanagement/membermanagement/regist";
	form.submit();
	
}

var formData = "";	

function picture_go(){
	//alert("file change!");
	
   var form = $('form[role="imageForm"]');
   var picture = form.find('[name=pictureFile]')[0];
	   
   formData = new FormData($('form[role="imageForm"]')[0]);
   
   //이미지 확장자 jpg 확인
   var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
	if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
   		//alert("이미지는 jpg/jpeg 형식만 가능합니다.");
   		  Swal.fire({icon: 'error',
			title: '이미지는 jpg/jpeg 형식만 가능합니다.',
				}).then(function(){
   					picture.value="";      
				});
   		return;
	} 

	//이미지 파일 용량 체크
   if(picture.files[0].size>1024*1024*1){
      //alert("사진 용량은 1MB 이하만 가능합니다.");
       Swal.fire({icon: 'error',
			title: '사진 용량은 1MB 이하만 가능합니다.',
				}).then(function(){
   					picture.value="";      
				});
      return;
   };
	
   //업로드 확인변수 초기화 (사진변경)
   form.find('[name="checkUpload"]').val(0);	
   document.getElementById('inputFileName').value=picture.files[0].name;
   
   
   if (picture.files && picture.files[0]) {
	
		var reader = new FileReader();
		
		reader.onload = function (e) {
			 $('div#profile').css({'background-image':'url('+e.target.result+')',
                 'background-position':'center',
                 'background-size':'cover',
                 'background-repeat':'no-repeat'
                 });
		}
		
		reader.readAsDataURL(picture.files[0]);
	}
}

function upload_go(){
	//alert('upload btn click');
	
   if(!$('input[name="pictureFile"]').val()){
	  //alert("사진을 선택하세요.");
	      Swal.fire({icon: 'error',
			title: '사진을 선택하세요.',
				}).then(function(){
				  $('input[name="pictureFile"]').click();
				});
	  return;
   	}  
   if($('input[name="checkUpload"]').val()==1){
      //alert("이미업로드 된 사진입니다.");
        Swal.fire({icon: 'error',
			title: '이미업로드 된 사진입니다.',
				}).then(function(){
				
				});
      return;      
	}
   
   $.ajax({
	  url:"/manager/membermanagement/picture",
      data:formData,
      type:'post',
      processData:false,
      contentType:false,
      success:function(data){
    	  //업로드 확인변수 세팅
          $('input[name="checkUpload"]').val(1);
          //저장된 파일명 저장.
          $('input#oldFile').val(data); // 변경시 삭제될 파일명	          
          $('input[name="studentPicture"]').val(data);	    	  
          //alert("사진이 업로드 되었습니다.");
          Swal.fire({icon: 'success',
  			title: '사진이 업로드 되었습니다.',
  				}).then(function(){
  				
  				});
      },
      error:function(error){
         //alert("현재 사진 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
    	  Swal.fire({icon: 'error',
    			title: '현재 사진 업로드가 불가합니다.',
    			text: '관리자에게 연락바랍니다.',
    				}).then(function(){
    				
    				});
      }
   });
}

function detail_go(data){
	//alert('click!!!');
	$.ajax({
	  url:"/manager/membermanagement/membermanagement/detail.do",
	  type:'post',
	  data:{"id" : data},
      success:function(data){
    	  //console.log(data);
    	  //alert("정보를 로드합니다.");
    	 $('input[name="checkUpload"]').val(1);
    	  $('input[id="id"]').val(data.student.id);
    	  $('input[id="id"]').attr("disabled", true);
    	  $('input[id="name"]').val(data.student.name);
    	  $('select[id="gender"]').val(data.student.genderCode);
    	  $('input[id="email"]').val(data.student.email);
    	  $('input[id="hp"]').val(data.student.hp);
    	  $('input[id="birthdate"]').val(data.student.birthDate);
    	  $('select[id="gradeCode"]').val(data.student.gradeCategoryCode);
    	  $('select[id="grade"]').val(data.student.grade);
    	  $('select[id="school"]').val(data.student.schoolNo);
    	  $('input[id="zip"]').val(data.student.zipCode);
    	  $('input[id="address2"]').val(data.student.address2);
    	  $('input[id="address"]').val(data.student.address);
    	  $('input[id="regDate"]').val(data.student.academyRegDate);
    	  $('input[id="payDueDate"]').val(data.student.payDueDate);
    	  $('input[id="sibling"]').val(data.student.sibling);
    	  $('select[id="status"]').val(data.student.stateCode);
    	  $('input[id="parentId1"]').val(data.student.parentId);
    	  $('select[id="discountRate"]').val(data.student.discountRate);
    	  $('input[id="discountReason"]').val(data.student.discountReason);
    	  $('input[name="studentPicture"]').val(data.student.studentPicture);
		  
    	  $('input[id="parentHp1"]').val(data.parent.parentHp);
    	  $('input[id="parentName1"]').val(data.parent.parentName);
    	  $('input[id="parentId"]').val(data.parent.id);
    	  $('input[id="parentName"]').val(data.parent.parentName);
    	  $('input[id="parentHp"]').val(data.parent.parentHp);
    	  $('input[id="parentEmail"]').val(data.parent.parentEmail);
    	  
    	  if(data.student.studentPicture !=null){
    	  	getPicture(data);
    	  }
    	  
    	  registForm_go();
      },
      error:function(error){
        // alert("현재 로드가 불가합니다.\n 관리자에게 연락바랍니다.");
    	  Swal.fire({icon: 'error',
  			title: '현재 로드가 불가합니다.',
  			text: '관리자에게 연락바랍니다.',
  				}).then(function(){
  				
  				});
      }
	 });
}


function getPicture(data){
	var studentId = data.student.id;
	//alert('get picture 실행 테스트');
	 $('div#profile').css({'background-image':'url('+"/manager/membermanagement/getPicture.do?id="+studentId+')',
         'background-position':'center',
         'background-size':'cover',
         'background-repeat':'no-repeat'
         });
	 $('input[id="inputFileName"]').val(data.student1.studentPicture);
	 $('input[name="checkRegist"]').val(1);
}

function idCheck() {
	//alert("click!");
	var id = document.getElementById('id');
	
	if(!id.value){
	 // alert("아이디를 입력하시오");
	   Swal.fire({icon: 'error',
    			title: '아이디를 입력하세요.',
    				}).then(function(){
	  				id.focus();
    				});
	  return;
	}
	
	$.ajax({
	 url : "/manager/membermanagement/studentIdCheck.do?id="+id.value.trim(),
   	 method : "get",	
   	 success : function(result){
  		   if(result.toUpperCase() == "DUPLICATED"){
             //alert("이미 있는 아이디 입니다.\n입력 정보가 수정 됩니다.");
  			  Swal.fire({icon: 'info',
      			title: '이미 있는 아이디 입니다.',
      			text: '입력 정보가 수정됩니다.',
      				}).then(function(){
      				
      				});
          }else{
            // alert("사용가능한 아이디 입니다.\n입력 정보가 새로 등록 됩니다.");
              Swal.fire({icon: 'info',
    			title: '사용 가능한 아이디 입니다.',
    			text: '입력 정보가 새로 등록 됩니다.',
    				}).then(function(){
    				
    				});
          } 
   	 },
        error:function(error){
         // alert("시스템장애로 가입이 불가합니다.");
       	 AjaxErrorSecurityRedirectHandler(error.status);
        }			 
	 });
}

</script>
</body>