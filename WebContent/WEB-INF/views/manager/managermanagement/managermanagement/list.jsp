<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="managerList" value="${dataMap.managerList}" />
<c:set var="mngGenderList" value="${dataMap.mngGenderList}" />
<c:set var="mngDeleteList" value="${dataMap.mngDeleteList}" />
<c:set var="deptIdList" value="${dataMap.deptIdList}" />
<c:set var="mngSubjectList" value="${dataMap.mngSubjectList}" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="menuList" value="${menuList}"/>

<title>직원 관리</title>

<head>
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<style>
		* {
			font-size: 14px;
		}
		
		label {
			margin-bottom: 0;
		}
		
		div.table2 {
			max-width : 700px;
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
		
		#profile{
			 background-image: url("../../../../../resources/images/bros_blank.jpg");
       		 background-repeat: no-repeat;
       		 background-position: center center;
       		 background-size: cover;
		}
	</style>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
</head>

<body>
	
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6" style="display: flex;">
					<h1 data-userId="${loginUser.id }">직원정보관리</h1>
					
					<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '직원정보관리') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '직원정보관리') == -1}">
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
				<div class="col-sm-4">
						<div class="card card-dark card-outline" style="height: 88vh;">
								<div class="card-header">
									<div class="row" style="display: flex; align-items: center;">
									<div class="col-sm-5">
											<h3 class="card-title">
												<i class="fas fa-list"></i>
												&nbsp;&nbsp;
												직원 목록
											</h3>
									</div>
									<div class="col-sm-7">
										<div class="input-group">
												<select class="form-control form-control-sm" name="searchType" id="searchType">
												<option value=""  ${cri.searchType eq '' ? 'selected':''}>구분</option>
												<option value="n"  ${cri.searchType eq 'n' ? 'selected':''}>이름</option>
												<option value="d"  ${cri.searchType eq 'd' ? 'selected':''}>직분</option>
												<option value="e"  ${cri.searchType eq 'e' ? 'selected':''}>이메일</option>
												<option value="i"  ${cri.searchType eq 'i' ? 'selected':''}>아이디</option>
												<option value="g"  ${cri.searchType eq 'g' ? 'selected':''}>성별</option>
												<option value="s"  ${cri.searchType eq 's' ? 'selected':''}>상태</option>
												<option value="u"  ${cri.searchType eq 'u' ? 'selected':''}>과목</option>
												<option value="m"  ${cri.searchType eq 'm' ? 'selected':''}>전공</option>
												<option value="p"  ${cri.searchType eq 'p' ? 'selected':''}>연락처</option>
												</select>
												<input type="text"  id="listSearchKeyword" onkeyup="list_go2(1)"  class="form-control form-control-sm" name="keyword" placeholder="검색어" value="${param.keyword }">
												<div class="input-group-append">
													<button id="keyupButton" type="button" class="btn btn-dark btn-sm" id="listSearchBtn" onclick="list_go(1)">
														<i class="fas fa-search"></i>
													</button>
												</div>
										</div>
									</div>
									</div>
								</div>
							<div class="card-body" style="padding-top: 5px;">
								<div class="row table2">
											<div class="card-body p-0">
												<table class="table table-hover table-head-fixed table-bordered">
													<thead>
														<tr>
															<th>이름</th>
															<c:if test="${cri.searchType eq 'd'}">
															<th>직분</th>
															</c:if>
															<c:if test="${cri.searchType eq 'e'}">
															<th>이메일</th>
															</c:if>
															<c:if test="${cri.searchType eq 'i'}">
															<th>아이디</th>
															</c:if>
															<c:if test="${cri.searchType eq 'g'}">
															<th>성별</th>
															</c:if>
															<c:if test="${cri.searchType eq 's'}">
															<th>상태</th>
															</c:if>
															<c:if test="${cri.searchType eq 'u'}">
															<th>과목</th>
															</c:if>
															<c:if test="${cri.searchType eq 'm'}">
															<th>전공</th>
															</c:if>
															<c:if test="${cri.searchType ne 'i' && cri.searchType ne 'e'}">
															<th>연락처</th>
															</c:if>
														</tr>
													</thead>
													<tbody id="searchResultTable">
													<c:if test="${empty managerList}">
														<tr>
															<td colspan="3" class="text-center">
																해당 내용이 없습니다.
															</td>
														</tr>
													</c:if>
													<c:if test="${!empty managerList}">
														<c:forEach items="${managerList}" var="manager">
															<tr class="clickable" onclick='detail_go("${manager.id}");' style="cursor: pointer;">
																<td>${manager.mngName }</td>
																<c:if test="${cri.searchType eq 'd'}">
																<td>${manager.deptId }</td>
																</c:if>
																<c:if test="${cri.searchType eq 'e'}">
																<td>${manager.mngEmail }</td>
																</c:if>
																<c:if test="${cri.searchType eq 'i'}">
																<td>${manager.id }</td>
																</c:if>
																<c:if test="${cri.searchType eq 'g'}">
																<td>${manager.mngGender }</td>
																</c:if>
																<c:if test="${cri.searchType eq 's'}">
																<td>${manager.mngDelete }</td>
																</c:if>
																<c:if test="${cri.searchType eq 'u'}">
																<td>${manager.mngSubject }</td>
																</c:if>
																<c:if test="${cri.searchType eq 'm'}">
																<td>${manager.mngMajor }</td>
																</c:if>
																<c:if test="${cri.searchType ne 'i' && cri.searchType ne 'e'}">
																<td>${manager.mngHp }</td>
																</c:if>
															</tr>
														</c:forEach>
													</c:if>	
													</tbody>
												</table>
											</div>
									</div>
								
							</div> <!-- card body -->
							<div class=card-footer style="color:#395d83;">
							검색결과 : ${pageMaker.totalCount}행
							</div>
						</div> <!-- card-outline -->
				</div>
				
				<!-- 우측영역  -->
				<div class="col-sm-8">
					<div class="card card-dark card-outline" style="height: 88vh; overflow-y: auto;">
						<div class="card-header">
							<div class="row" style="display: flex; align-items: center;">
								<div class="col-sm-8" style="height: 20px;">
								<h3 class="card-title">
									<i class="fas fa-regular fa-address-card"></i>
									&nbsp;&nbsp;
									직원 상세정보
								</h3>
								</div>
								<div class="col-sm-4" style="text-align: right">
									<button type="button" class="btn btn-dark btn-sm" onclick="regist_go();">
									저장
									</button>
									<button id="pdfSaveBtn" type="button" class="btn btn-danger btn-sm">
									PDF
									</button>
									<button type="button" class="btn btn-dark btn-sm" onclick="resetForm();">
									초기화
									</button>
								</div>
							</div>
						</div>
						<div id="pdfPrintArea" class="card-body">
							<ul class="nav nav-tabs" id="custom-content-below-tab" role="tablist">
								<li class="nav-item">
								<a class="nav-link active" id="custom-content-below-home-tab" data-toggle="pill" href="#custom-content-below-home" role="tab" aria-controls="custom-content-below-home" aria-selected="true">상세정보</a>
								</li>
								<li class="nav-item">
								<a class="nav-link" id="custom-content-below-profile-tab" data-toggle="pill" href="#custom-content-below-profile" role="tab" aria-controls="custom-content-below-profile" aria-selected="false">권한</a>
								</li>
							</ul>
						<div class="tab-content" id="custom-content-below-tabContent">
							<div class="tab-pane fade active show" id="custom-content-below-home" role="tabpanel" aria-labelledby="custom-content-below-home-tab">
								<form role="form1" id="form1" method="post">
								<input type="hidden" name="mngPicture" />
								<input type="hidden" id="pwd" name="pw" value="">
								<fieldset class="form-group border p-3" >
                        			<legend class="w-auto" style="font-size: 15px; font-weight: bold; margin: 0px;">개인 정보</legend>
								<div class="row col-sm-12" style="display: flex; justify-content: space-between; margin: 0px;" >
								<div class="row col-sm-3">
									<div id="profile" style="border: solid 1px black; width: 130px; height: 130px">
										
									</div>
									<div class="input-group input-group-sm" style="padding-top: 5px;">
											<label for="inputFile" class=" btn btn-dark btn-sm input-group-addon">파일선택</label>
											<input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled/>
											<span class="input-group-append-sm">											
												<button type="button" class="btn btn-dark btn-sm btn-append" onclick="upload_go();">업로드</button>											
											</span>
											<span class="input-group-append-sm">											
												<button type="button" class="btn btn-dark btn-sm btn-append" onclick="OpenWindow('/manager/membermanagement/membermanagement/takePicture.do','사진찍기',1000,600);">사진찍기</button>											
											</span>
									</div>
								</div>
									
								<div class="row col-sm-9" >
									<div class="form-group col-md-4">
											<label for="id">아이디</label><label style="color: red;">&nbsp;&nbsp;*</label>
											<button type="button" class="btn btn-dark btn-xs" onclick="idCheck();">
											중복확인
											</button>
											<input type="text" class="form-control" id="id" name="id" placeholder="아이디(email)" onchange="change(this);">
											<label for="name">이름</label><label style="color: red;">&nbsp;&nbsp;*</label>
											<input type="text" class="form-control" id="name" name="mngName" placeholder="이름" onchange="inputValueChange(this);">
											<label for="gender">성별</label>
												<select id="gender" class="form-control" name="mngGender" onchange="inputValueChange(this);">
													<c:forEach items="${mngGenderList}" var="gender">
														<option value="${gender.sCodeKey }">${gender.sCodeValue }</option>
													</c:forEach>
												</select>
									</div>
									<div class="form-group col-md-4" style="padding-left: 2px; padding-right: 0px;">
											<label for="hp">전화번호</label><label style="color: red;">&nbsp;&nbsp;*</label>
											<input type="text" class="form-control" id="hp" name="mngHp" placeholder="전화번호(01012345678)" onchange="inputValueChange(this);">
											<label for="email">이메일</label><label style="color: red;">&nbsp;&nbsp;*</label>
											<input type="email" class="form-control" id="email" name="mngEmail" placeholder="이메일" onchange="inputValueChange(this);">
											<label for="birthdate">생년월일</label>
											<input type="text" class="form-control" id="birthdate" name="mngBirthDate" placeholder="생년월일(20000101)" onchange="inputValueChange(this);">
									</div>
									<div class="form-group col-md-4" style="padding-left: 10px; padding-right: 0px;">
											<label for="zip">우편번호</label>
											<button type="button" class="btn btn-dark btn-xs" onclick="sample6_execDaumPostcode()">
											검색
											</button>
											<input type="text" class="form-control" id="zip" name="mngZipCode" placeholder="우편번호" onchange="inputValueChange(this);">
											<label for="address">주소</label>
											<input type="text" class="form-control" id="address"  name="mngAddress" placeholder="주소" onchange="inputValueChange(this);">
											<label for="address2">상세주소</label>
											<input type="text" class="form-control" id="address2" name="mngAddress2" placeholder="상세주소" onchange="inputValueChange(this);">
									</div>
								</div>
							</div>
							</fieldset>
							<fieldset class="border p-3" >
                        	<legend class="w-auto" style="font-size: 15px; font-weight: bold; margin: 0px;">재직 정보</legend>
							<div class="row col-sm-12" style="margin: 0px;">
								<div class="form-group col-sm-6" style="padding: 0px; margin: 0px;">
											<label for="status">상태</label><label style="color: red;">&nbsp;&nbsp;*</label>
											<select id="status" class="form-control" name="mngDelete" onchange="selectValueChange(this);">
												<c:forEach items="${mngDeleteList}" var="delete">
													<option value="${delete.sCodeKey }">${delete.sCodeValue }</option>
												</c:forEach>
											</select>
											<label for="regDate">상태변경일</label>
											<input type="text" class="form-control" id="regDate" name="mngDeleteDate" placeholder="상태변경일(20220412)" disabled="disabled">
											<label for="deptId">직분</label><label style="color: red;">&nbsp;&nbsp;*</label>
											<select id="deptId" class="form-control" name="deptId" onchange="inputValueChange(this);">
												<c:forEach items="${deptIdList}" var="dept">
													<option value="${dept.sCodeKey }">${dept.sCodeValue }</option>
												</c:forEach>
											</select>
											<label for="mngEducation">학력</label>
											<input type="text" class="form-control" id="mngEducation" name="mngEducation" placeholder="학력" onchange="inputValueChange(this);">
											<label for="mngMajor">전공</label>
											<input type="text" class="form-control" id="mngMajor" name="mngMajor" placeholder="전공" onchange="inputValueChange(this);">
								</div>	
								<div class="form-group col-sm-6" style="padding-left: 10px;  margin: 0px;">		
											<label for="mngGraduatedYear">졸업연도</label>
											<input type="text" class="form-control" id="mngGraduatedYear" name="mngGraduatedYear" placeholder="졸업연도만(2020)" maxlength="4" onchange="inputValueChange(this);" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣A-Za-z]/g, &#39;&#39;);">
											<label for="mngCarrerYear">경력</label>
											<input type="text" class="form-control" id="mngCarrerYear" name="mngCarrerYear" placeholder="경력" onchange="inputValueChange(this);" maxlength="3" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣A-Za-z]/g, &#39;&#39;);">
											<label for="mngSubject">과목</label><label style="color: red;">&nbsp;&nbsp;*</label>
											<select id="mngSubject" class="form-control" name="mngSubject" onchange="inputValueChange(this);">
												<c:forEach items="${mngSubjectList}" var="subject">
													<option value="${subject.sCodeKey }">${subject.sCodeValue }</option>
												</c:forEach>
											</select>
											<label for="mngCertificate">자격증</label>
											<input type="text" class="form-control" id="mngCertificate" name="mngCertificate" placeholder="자격증" onchange="inputValueChange(this);">
											<label for="mngAccountNo">계좌번호</label>
											<input type="text" class="form-control" id="mngAccountNo" name="mngAccountNo" placeholder="(은행명)12345678901" onchange="inputValueChange(this);">
								</div>	
							</div>
							</fieldset>
							</form>
							<form role="imageForm" method="post" 
										  enctype="multipart/form-data">
								<input id="inputFile" name="pictureFile" type="file" class="form-control"
									   onchange="picture_go();"	style="display:none;">
								<input id="oldFile" type="hidden" name="oldPicture" value="" />
								<input type="hidden" name="checkUpload" value="0" />	
							</form>
							<form id="UserRegistManager" method="post">
								<input id="userId" name="id" type="hidden">
								<input id="userPw" name="pw" type="hidden">
								<input id="userCategory" name="category" type="hidden" value="m">
								<input id="userIsFirstLogin" name="isFirstLogin" type="hidden" value="N">
							</form>
						</div>
							<div class="tab-pane fade" id="custom-content-below-profile" role="tabpanel" aria-labelledby="custom-content-below-profile-tab">
								<div class="row" style="height: 50vh; padding-top: 15px; display: flex; justify-content: space-between;">
								<div class="col-sm-5">
								<div class="card card-outline card-dark" style="width:100%; height: 60vh">
									<div class="card-header">
										<h3 class="card-title">
										<i class="fas fa-list" aria-hidden="true"></i>
											&nbsp;
											메뉴목록
										</h3>
										 <div class="card-tools">
						               </div>
									</div>
									
									<div class="card-body" >
											<div id="notAuthorityMenuListDiv" class="row table2" >
												<table id="notAuthorityMenuList" class="table table-hover table-head-fixed table-bordered">
													<tbody>
													<c:if test="${empty menuList}">
														<tr>
															<td class="text-center">
																모든 메뉴에 권한이 있습니다.
															</td>
														</tr>
													</c:if>
													<c:if test="${!empty menuList}">
														
															<tr id = "leftGhostTr"></tr>
														<c:forEach items="${menuList}" var="menu">
															<tr class="leftclickableTr" menuId="${menu.menuId }" style="cursor: pointer;">
																<td>${menu.menuName }</td>
															</tr>
														</c:forEach>
													</c:if>	
													</tbody>
												</table>
											</div>
									</div>
								</div>
							</div>
							<div class="col-sm-2" style="vertical-align: center;">
							<br><br><br><br><br><br><br><br>
								<button id="moveRight" class="btn btn-block btn-dark btn-flat"><i class="fa-solid fa-angle-right"></i></button>
								<button id="moveAllRight" class="btn btn-block btn-dark btn-flat"><i class="fa-solid fa-angles-right"></i></button>
								<button id="moveLeft" class="btn btn-block btn-dark btn-flat"><i class="fa-solid fa-angle-left"></i></button>
								<button id="moveAllLeft" class="btn btn-block btn-dark btn-flat"><i class="fa-solid fa-angles-left"></i></button>
							</div>
							<div class="col-sm-5" >
								<div class="card card-outline card-dark" style="width:100%; height: 60vh">
									<div class="card-header">
										<h3 class="card-title">
										<i class="fas fa-list" aria-hidden="true"></i>
											&nbsp;
											권한 부여된 메뉴
										</h3>
										 <div class="card-tools">
						               </div>
									</div>
									
									<div class="card-body">
										<div id="AuthorityMenuListDiv" class="row table2" >
													
												<table id="AuthorityMenuList" class="table table-hover table-head-fixed table-bordered">
													<tbody>
													<c:if test="${empty menuList}">
														<tr>
															<td class="text-center">
																모든 메뉴에 권한이 없습니다.
															</td>
														</tr>
													</c:if>
													<c:if test="${!empty menuList}">
															<tr id = "rightGhostTr"></tr>

													</c:if>	
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
			
			
		</div>
	</section>
	
	<form id="jobForm">	
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value="300"/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
	</form>
	
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
function idCheck() {
	//alert("click!");
	var id = document.getElementById('id');
	
	if(!id.value){
	 // alert("아이디를 입력하시오");
	 // id.focus();
	  Swal.fire({icon: 'error',
			title: '아이디를 입력하세요.',
				}).then(function(){
					 id.focus();
				});
	  return;
	}
	
	$.ajax({
	 url : "/manager/mamagermanagement/idCheck.do?id="+id.value.trim(),
   	 method : "get",	
   	 success : function(result){
  		   if(result.toUpperCase() == "DUPLICATED"){
             //alert("이미 있는 아이디 입니다.\n입력 정보가 수정 됩니다.");
             Swal.fire({icon: 'info',
     			title: '이미 있는 아이디 입니다.',
     			text: '입력 정보가 수정 됩니다.',
     				}).then(function(){
     					
     				});
          }else{
            // alert("사용가능한 아이디 입니다.\n입력 정보가 새로 등록 됩니다.");
             Swal.fire({icon: 'info',
      			title: '사용가능한 아이디 입니다.',
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

<script>
function authority() {
	//alert("click");
	
	var rightTrs = [];
	var rightIds = [];
	 
	 rightTrs.push($(".rightselectedTr"));
	 rightTrs.push($(".rightclickableTr"));
	 
	 for (var i=0; i<rightTrs[1].length; i++) {
		 rightIds.push(rightTrs[1][i].getAttribute("menuId"));
	 }
		var id = document.getElementById('id').value;
		
	 	 let dataItem = {
			  authorityList : rightIds
			  ,id : id
		 };
	 	 
	 	//console.log(dataItem);
 	 	dataItem = JSON.stringify(dataItem);
	 	
	 	$.ajax({
       type: "post"
      ,url : "/manager/managermanagement/authority/regist.do"
      ,contentType: 'application/json'
      ,data : dataItem
      ,success : function (data){
       	//alert("성공했당!");
       }
      ,error : function(e){
       }
	});   		 	
}
</script>

<!-- 로드할때 상태 변경일 날짜를 오늘로 설정(input 타입에) -->
<script>
window.onload=function() {
	
	$("#pdfSaveBtn").on("click",function(){
		PDFSave($("#pdfPrintArea"),'직원 상세정보.pdf');
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
	
	var tDay = new Date();
	var tMonth = tDay.getMonth()+1;
	var tDate = tDay.getDate();
	if ( tMonth < 10) tMonth = "0"+tMonth;
	if ( tDate < 10) tDate = "0"+tDate;
	document.getElementById("regDate").value = tDay.getFullYear()+tMonth+tDate;
	
	$(document).on('click','.leftclickableTr',function(){
		 $(this).css("background-color","#395d83");
		 $(this).css("color","white");
		 $(this).attr("class","leftselectedTr");
	 });
	 $(document).on('click','.leftselectedTr',function(){
		 $(this).css("background-color","white");
		 $(this).css("color","black");
		 $(this).attr("class","leftclickableTr");
	 });
	 $(document).on('click','.rightclickableTr',function(){
		 $(this).css("background-color","#395d83");
		 $(this).css("color","white");
		 $(this).attr("class","rightselectedTr");
	 });
	 $(document).on('click','.rightselectedTr',function(){
		 $(this).css("background-color","white");
		 $(this).css("color","black");
		 $(this).attr("class","rightclickableTr");
	 });
	 
	 $(document).on("click",".clickable",function(){
			$(".clicked").attr("class","clickable");
			$(this).attr("class","clicked");
	 });
	 $(document).on("onkeypress","#listSearchKeyword",function(){
			//alert("test");
	 });
	 
	 
	 $("#moveLeft").click(function(){
		 $("#leftGhostTr").after($(".rightselectedTr"));
		 $(".rightselectedTr").css("background-color","white");
		 $(".rightselectedTr").css("color","black");
		 $(".rightselectedTr").attr("class","leftclickableTr");
		 $(".rightselectedTr").remove();
	 });
	 $("#moveRight").click(function(){
		 $("#rightGhostTr").after($(".leftselectedTr"));
		 $(".leftselectedTr").css("background-color","white");
		 $(".leftselectedTr").css("color","black");
		 $(".leftselectedTr").attr("class","rightclickableTr");
		 $(".leftselectedTr").remove();
	 });
	 $("#moveAllRight").click(function(){
		 $("#rightGhostTr").after($(".leftselectedTr"));
		 $("#rightGhostTr").after($(".leftclickableTr"));
		 $(".leftselectedTr").css("background-color","white");
		 $(".leftselectedTr").css("color","black");
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
		 $(".rightselectedTr").css("color","black");
		 $(".rightselectedTr").attr("class","rightclickableTr");
		 $(".rightselectedTr").remove();
		 $(".rightclickableTr").css("background-color","white");
		 $(".rightclickableTr").attr("class","leftclickableTr");
		 $(".rightclickableTr").remove();
	 });
	
 }
</script>

<script>
	function list_go(page,url){
		if(!url) url="list.do";
		
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
	function list_go2(page,url){
		if (window.event.keyCode == 13) {

		if(!url) url="list.do";
		
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
	}
</script>
<script>

function resetForm(){
	//window.location.hash = 'reload';
	window.location.reload();
}

function change(obj){
	//alert('change');
	obj.style.borderColor = '#28a745';
	obj.style.borderWidth = '3px';
	obj.style.backgroundColor = '#e8f0fe';
	// 직원 아이디 입력시 이메일 값 자동 입력
	var email = $('input[name="mngEmail"]');
	var id = document.getElementById('id').value;
	email.val(id);
		
}

function selectValueChange(obj){
	var tDay = new Date();
	var tMonth = tDay.getMonth()+1;
	var tDate = tDay.getDate();
	if ( tMonth < 10) tMonth = "0"+tMonth;
	if ( tDate < 10) tDate = "0"+tDate;
	document.getElementById("regDate").value = tDay.getFullYear()+tMonth+tDate;
}

function inputValueChange(obj){
	obj.style.borderColor = '#28a745';
	obj.style.backgroundColor = '#e8f0fe';
	obj.style.borderWidth = '3px';
}

function regist_go(){
	//alert("btn click");
	
	// 직원 비밀번호를 이메일 주소에서 @ 앞부분만 추출해서 넣어준다(Resist할 경우)
	$('input[id="regDate"]').attr("disabled", false);
	$('input[id="id"]').attr("disabled", false);
	var pwd =  $('input[name="pw"]');
	var id = document.getElementById('id').value;
	var arr = id.split("@");
	
	if(pwd.val() === ""){
		pwd.val(arr[0]);
	}
	
	// 직원 아이디 비밀번호 값 받아서 user input에 넣어주고 user 등록한다.
	var userIds = $('input[id="userId"]');
	var userPws = $('input[id="userPw"]');
	userIds.val(id);
	userPws.val(arr[0]);
	var form1 = $('form#UserRegistManager').serialize();
	
	$.ajax({
	  url:"/manager/membermanagement/user/registUser",
      data:form1,
      type:'post',
      success:function(){
    	  
      },
      error:function(error){
         //alert("현재 유저(직원) 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
         
      }
   });
	
	authority();
	
	var form = document.getElementById('form1');
	form.action = "/manager/managermanagement/managermanagement/regist";
	if($('#id').val() == '${loginUser.id}'){
		
	}
	
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
	  url:"/manager/mamagermanagement/managerPicture",
      data:formData,
      type:'post',
      processData:false,
      contentType:false,
      success:function(data){
    	  //업로드 확인변수 세팅
          $('input[name="checkUpload"]').val(1);
          //저장된 파일명 저장.
          $('input#oldFile').val(data); // 변경시 삭제될 파일명	          
          $('input[name="mngPicture"]').val(data);	    	  
    	  //alert("사진이 업로드 되었습니다.");
    	  Swal.fire({icon: 'success',
  			title: '사진이 업로드 되었습니다.',
  			//text: '입력 정보가 새로 등록 됩니다.',
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
	  url:"/manager/managermanagement/managermanagement/detail.do",
	  type:'post',
	  data:{"id" : data},
      success:function(data){
     	  //console.log(data);
//     	  alert("정보를 로드합니다.");
    	  
    	  $('input[id="id"]').val(data.manager.id);
    	  $('input[id="id"]').attr("disabled", true);
    	  $('input[id="name"]').val(data.manager.mngName);
    	  $('select[id="gender"]').val(data.manager.mngGender);
    	  $('input[id="hp"]').val(data.manager.mngHp);
    	  $('input[id="email"]').val(data.manager.mngEmail);
    	  $('input[id="birthdate"]').val(data.manager.mngBirthDate);
    	  $('input[id="zip"]').val(data.manager.mngZipCode);
    	  $('input[id="address2"]').val(data.manager.mngAddress2);
    	  $('input[id="address"]').val(data.manager.mngAddress);
    	  $('select[id="status"]').val(data.manager.mngDelete);
    	  $('input[id="regDate"]').val(data.manager.mngDeleteDate);
    	  $('select[id="deptId"]').val(data.manager.deptId);
    	  $('input[id="mngEducation"]').val(data.manager.mngEducation);
    	  $('input[id="mngMajor"]').val(data.manager.mngMajor);
    	  $('input[id="mngGraduatedYear"]').val(data.manager.mngGraduatedYear);
    	  $('input[id="mngCarrerYear"]').val(data.manager.mngCarrerYear);
    	  $('select[id="mngSubject"]').val(data.manager.mngSubject);
    	  $('input[id="mngCertificate"]').val(data.manager.mngCertificate);
    	  $('input[id="mngAccountNo"]').val(data.manager.mngAccountNo);
    	  $('input[name="mngPicture"]').val(data.manager.mngPicture);

    	  getPicture(data);
    	 
    	  printData(data,$('#notAuthorityMenuList'),$('#notAuthorityMenuListDiv'),$('#notAuthorityMenuList-template'));
    	  printData(data,$('#AuthorityMenuList'),$('#AuthorityMenuListDiv'),$('#AuthorityMenuList-template'));
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
	var managerId = data.manager.id;
	//alert('get picture 실행 테스트');
	 $('div#profile').css({'background-image':'url('+"/manager/mamagermanagement/getManagerPicture.do?id="+managerId+')',
         'background-position':'center',
         'background-size':'cover',
         'background-repeat':'no-repeat'
         });
	 $('input[id="inputFileName"]').val(data.manager1.mngPicture);
}

</script>


<script>
// handlebars 관련
function printData(data,delArea,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	delArea.remove();
	target.after(html);
}
</script>
<script type="text/x-handlebars-template"  id="notAuthorityMenuList-template" >
<table id="notAuthorityMenuList" class="table table-hover table-head-fixed table-bordered">
	<tbody>
		<tr id = "leftGhostTr"></tr>
{{#each notAuthorityMenuList}}
		<tr class="leftclickableTr" menuId="{{menuId}}">
			<td>{{menuName}}</td>
		</tr>
{{/each}}
	</tbody>
</table>
</script>   
<script type="text/x-handlebars-template"  id="AuthorityMenuList-template" >
<table id="AuthorityMenuList" class="table table-hover table-head-fixed table-bordered">
	<tbody>
		<tr id = "rightGhostTr"></tr>
{{#each AuthorityMenuList}}
		<tr class="rightclickableTr" menuId="{{menuId}}">
			<td>{{menuName}}</td>
		</tr>
{{/each}}
	</tbody>
</table>
</script>  
</body>