<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="academyinfoList" value="${dataMap.academyinfoList }" />
<c:set var="SMenuList" value="${SMenu.SMenuList }" />
<meta charset="UTF-8">
<head>
<style>
		* {
			font-size: 14px;
		}
		
		label {
			margin-bottom: 0;
		}
		
		div.table1 {
			max-height: 450px;
			overflow-y: scroll;
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
		.form-control {
			border: white;
		}
	</style>

<title></title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6" style="display: flex;">
					<h1 data-userId="${loginUser.id }">홈페이지관리</h1>
					<!--                즐겨찾기에 존재 -->
					<c:if test="${fn:indexOf(favoriteMenuListStr, '홈페이지관리') != -1}">
						<i id="star" class="fa-solid fa-star on fa-2x"></i>
					</c:if>

					<!--                즐겨찾기에 존재하지 않음 -->
					<c:if test="${fn:indexOf(favoriteMenuListStr, '홈페이지관리') == -1}">
						<i id="star" class="fa-regular fa-star off fa-2x"></i>
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
					<div class="row">
						<div class="col-sm-8">
							<div class="card card-dark card-outline">
								<div class="card-header">
									<div class="row">
										<div class="col-sm-10">
											<h3 class="card-title">
												<i class="fas fa-list"></i> &nbsp;&nbsp; 메뉴정보
											</h3>
										</div>
										<div class="col-sm-2">
											<button type="button" class="btn btn-block btn-dark btn-xs"
												id="menuInfoBtn">저장</button>
										</div>
									</div>
								</div>

								<div class="card-body" style="padding-top: 5px;">
									<div class="row table1">
										<div class="card-body p-0" id="examListDiv">
											<table
												class="table table-head-fixed table-bordered table-hover"
												id="examList">
												<thead>
													<tr>
														<th>메뉴명</th>
														<th style="display: none;">메뉴아이디</th>
														<th>학생</th>
														<th>학부모</th>
														<th>직원</th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${empty SMenuList }">
														<tr>
															<td colspan="7" class="text-center">해당내용이 없습니다.</td>
														</tr>
													</c:if>
													<c:if test="${!empty SMenuList }">
														<c:forEach items="${SMenuList }" var="SMenuList">
															<tr id="${SMenuList.menuCategory }" class="menuCategory">
																<td onclick='subMenuList("${SMenuList.menuId }");' style="width: 40%; text-align: center; padding-top: 10px; cursor: pointer;" id="menuName" name="menuName">
																	${SMenuList.menuName }
																</td>
																<td id="menuId" style="display: none;">${SMenuList.menuId }</td>
																<td><input type="checkbox" id="student"
																	name="student" style="margin-top: 10px;"></td>
																<td><input type="checkbox" id="parent"
																	name="parent" style="margin-top: 10px;"></td>
																<td><input type="checkbox" id="manager"
																	name="manager" style="margin-top: 10px;"></td>
															</tr>
														</c:forEach>
													</c:if>

												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!-- 					body end -->
							</div>
							<!-- 					card1 end -->
						</div>
						<div class="col-sm-4">
							<div class="card card-dark card-outline">
								<div class="card-header">
									<div class="row">
										<div class="col-sm-9">
											<h3 class="card-title">
												<i class="fas fa-list"></i> &nbsp;&nbsp; 메뉴수정
											</h3>
										</div>
										<div class="col-sm-3">
											<button type="button" class="btn btn-block btn-dark btn-xs" id="subMenuBtn">저장</button>
										</div>
									</div>
								</div>

								<div class="card-body" style="padding-top: 5px;">
									<div class="row table1">
										<div class="card-body p-0" id="examListDiv">
											<table class="table table-head-fixed table-bordered table-hover" id="examList">
												<thead>
													<tr>
														<th colspan="3">메뉴명</th>
														<th style="display: none;">메뉴아이디</th>
													</tr>
												</thead>
												<tbody id="subMenuTarget">
													<tr id="subMenu">
														<td id="subMenuRemove" style="width: 40%; text-align: center; padding-top: 10px;">
															좌측에서 메뉴를 클릭해주세요!
														</td>
<!-- 														<td id="menuId" name="menuName" style="display: none;"></td> -->
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!-- 					body end -->
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-12">
						<div class="card card-dark card-outline">
							<div class="card-header">
								<div class="row">
								<div class="col-sm-11">
									<h3 class="card-title">
										<i class="fas fa-check"></i> &nbsp;&nbsp; 학원상세정보
									</h3>
								</div>	
								<div class="col-sm-1">
									<button type="button" class="btn btn-block btn-dark btn-xs" onclick="modify_go();">저장</button>
								</div>
								</div>
							</div>
<!-- 							header end -->
							
							
							<div class="card-body" style="padding-top: 5px; max-height: 50vh;">
								<div class="row">
									<div class="col-sm-12">
										<form role="form" class="form-horizontal" action="modify.do" method="post">
											<c:forEach items="${academyinfoList}" var="academyinfoList" varStatus="loop">
												<table class="table table-head-fixed table-bordered">
	
													<tbody>
														<tr>
															<td style="display: none;"><input type="text" class="form-control" name="acaIpoId" value="${academyinfoList.acaIpoId}"></td>
															
															<td style="background-color: rgb(32, 73, 105); color: white; padding-top: 10px;">학원명</td>
															<td style="width: 150px;">
																<input type="text" class="form-control" name="acaIpoName" id="acaIpoName" value="${academyinfoList.acaIpoName}">
															</td>
	
															<td style="background-color: rgb(32, 73, 105); color: white; padding-top: 10px;">대표명</td>
															<td style="width: 150px;">
																<input type="text" class="form-control"	name="acaIpoCeoName" id="acaIpoCeoName" value="${academyinfoList.acaIpoCeoName}">
															</td>
															
															<td style="background-color: rgb(32, 73, 105); color: white; padding-top: 10px;">학원전화</td>
															<td>
																<input type="text" class="form-control" name="acaIpoPhone" id="acaIpoPhone" value="${academyinfoList.acaIpoPhone}">
															</td>
														</tr>
	
														<tr>
															<td style="background-color: rgb(32, 73, 105); color: white; padding-top: 10px;">사업자등록번호</td>
															<td>
																<input type="text" class="form-control" name="acaIpoOnNumber" id="acaIpoOnNumber" value="${academyinfoList.acaIpoOnNumber}"></td>
															<td style="background-color: rgb(32, 73, 105); color: white; padding-top: 10px;">FAX</td>
															<td>
																<input type="text" class="form-control" name="acaIpoFax" id="acaIpoFax" value="${academyinfoList.acaIpoFax}">
															</td>
															<td style="background-color: rgb(32, 73, 105); color: white; padding-top: 10px;">COPYRIGHT</td>
															<td colspan="2">
																<input type="text" class="form-control" name="acaIpoCopy" id="acaIpoCopy" value="${academyinfoList.acaIpoCopy}">
															</td>
														</tr>
	
														<tr>
															<td style="background-color: rgb(32, 73, 105); color: white; padding-top: 10px;">학원주소</td>
															<td colspan="5">
																<input type="text" class="form-control" name="acaIpoAddress" id="acaIpoAddress" value="${academyinfoList.acaIpoAddress}">
															</td>
														</tr>
													</tbody>
												</table>
									</div>
									</c:forEach>
									</form>
								</div>
							</div>
<!-- 							body end -->
						</div>
<!-- 						card2 end -->
						
				</div>
				
			</div>
<!-- 			큰 row end -->
		</div>
	</section>
	  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script>
		window.onload = function(){
// 			포커스
			let acaIpoName = $('#acaIpoName');
			let acaIpoCeoName = $('#acaIpoCeoName');
			let acaIpoPhone = $('#acaIpoPhone');
			let acaIpoOnNumber = $('#acaIpoOnNumber');
			let acaIpoFax = $('#acaIpoFax');
			let acaIpoCopy = $('#acaIpoCopy');
			let acaIpoAddress = $('#acaIpoAddress');
			
			acaIpoName.focus(function(){
				$(this).css("background-color","#e8f0fe");	
			});
			
			acaIpoName.blur(function(){
				$(this).css("background-color","white");	
			});
			
			acaIpoCeoName.focus(function(){
				$(this).css("background-color","#e8f0fe");	
			});
			
			acaIpoCeoName.blur(function(){
				$(this).css("background-color","white");	
			});
			
			acaIpoPhone.focus(function(){
				$(this).css("background-color","#e8f0fe");	
			});
			
			acaIpoPhone.blur(function(){
				$(this).css("background-color","white");	
			});
			
			acaIpoOnNumber.focus(function(){
				$(this).css("background-color","#e8f0fe");	
			});
			
			acaIpoOnNumber.blur(function(){
				$(this).css("background-color","white");	
			});
			
			acaIpoFax.focus(function(){
				$(this).css("background-color","#e8f0fe");	
			});
			
			acaIpoFax.blur(function(){
				$(this).css("background-color","white");	
			});
			
			acaIpoCopy.focus(function(){
				$(this).css("background-color","#e8f0fe");	
			});
			
			acaIpoCopy.blur(function(){
				$(this).css("background-color","white");	
			});
			
			acaIpoAddress.focus(function(){
				$(this).css("background-color","#e8f0fe");	
			});
			
			acaIpoAddress.blur(function(){
				$(this).css("background-color","white");	
			});
				
			
			$(".menuCategory").each(function(){
				let id = $(this).attr("id");

					if(id.indexOf("STUDENT")>=0){
						$(this).children().eq(2).children().attr("checked","checked");
					}
					if(id.indexOf("PARENT")>=0){
						$(this).children().eq(3).children().attr("checked","checked");
					}
					if(id.indexOf("MANAGER")>=0){
						$(this).children().eq(4).children().attr("checked","checked");
					}
			});
			
			
			$("#menuInfoBtn").click(function(){
				let menuId = [];
				let menuCategory = [];
				let menuName = [];
				let student = [];
				let parent = [];
				let manager = [];
				
				let menuInfoArr = new Array();
	
				$(".menuCategory").each(function(){
					let menuInfo = new Object();
					
					menuCategory = $(this).attr('id');
					menuId = $(this).children().eq(1).text();
// 					menuName = $(this).children().eq(0).children().text();
					student = $(this).children().eq(2).children().is(":checked");
					parent = $(this).children().eq(3).children().is(":checked");
					manager = $(this).children().eq(4).children().is(":checked");
					


					if(student){
						student = "STUDENT,";
					} else {
						student = "DISABLED,";
					}
					
					if(parent){
						student += "PARENT,";
					} else {
						student += "DISABLED,";
					}
					
					if(manager){
						student += "MANAGER";
					} else{
						student += "DISABLED";
					}
					
					menuInfo.menuCategory = menuCategory;
					menuInfo.menuId = menuId;
// 					menuInfo.menuName = menuName;
					menuInfo.category = student;
// 					menuInfo.parent = parent;
// 					menuInfo.manager = manager;
					
// 					console.log(menuInfo);
					
					menuInfoArr.push(menuInfo);
					
				});
				
				let dataItem = {
						menuInfoList : menuInfoArr
				}
				
				dataItem = JSON.stringify(dataItem);
				console.log(dataItem);
				
				$.ajax({
			        type: "post"
			       ,url : "/manager/academyinfo/update.do"
			       ,contentType: 'application/json'
			       ,data : dataItem
			       ,success : function (data){
			    	   Swal.fire({
			    	        icon: 'success',
			    	        title: '완료!',
			    	        text: '메뉴가 저장되었습니다',
			    	    });
			    	   parent.document.location.reload();
			        }
			       ,error : function(e){
			        }
				});
				
			});
			
			
			$('#subMenuBtn').click(function(){
				
// 				alert("aa");
				
				let menuName = [];
				let menuId = [];
				
				let subMenuArr = new Array();
				
				$(".subMenu").each(function(){
					let subMenuInfo = new Object();
					
					
					menuName = $(this).children().children().val();
					menuId = $(this).children().children().attr("data-id");
					console.log(menuName);
					console.log(menuId);

					subMenuInfo.menuId = menuId;
					subMenuInfo.menuName = menuName;
					
					subMenuArr.push(subMenuInfo);
									
				});
				
				let dataItem = {
						subMenuList : subMenuArr
				}
				
				dataItem = JSON.stringify(dataItem);
				console.log(dataItem);
				
				$.ajax({
			        type: "post"
			       ,url : "/manager/academyinfo/menuNameUpdate.do"
			       ,contentType: 'application/json'
			       ,data : dataItem
			       ,success : function (data){
			    	   Swal.fire({
			    	        icon: 'success',
			    	        title: '완료!',
			    	        text: '메뉴이름이 저장되었습니다',
			    	    });
			    	   setTimeout(function() {
			    	   	parent.document.location.reload();
			    	}, 1300);
			        }
			       ,error : function(e){
			        }
				});
				
			});
			
			
			
			
		}
	</script>

	<script>
	
	function subMenuList(menuId){
		console.log(menuId);
		
		$.ajax({
	        type: "post"
	       ,url : "/manager/academyinfo/subMenu.do"
	       ,data : {"menuId" : menuId}
	       ,success : function (data){
// 	    	   alert("성공!");
	    	   console.log(data);
	    	   printData(data,$('#subMenuRemove'),$('#subMenuTarget'),$('#subMenuList-template'));
	    	   
	        }
	       ,error : function(e){
	        }
		});
	}
	
	
	
	function modify_go(){
		//alert("modify btn click");
		var form=$('form[role="form"]');	
		form.submit();
		parent.document.location.reload();

	}

</script>

<script>
function printData(data,delArea,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	delArea.remove();
	target.html(html);
}
</script>

<script type="text/x-handlebars-template"  id="subMenuList-template" >

{{#each subMenuList}}
<tr class="subMenu">
	<td id="subMenuRemove" style="text-align: center;">
			<input type="text" class="form-control" id="menuName" name="menuName" value="{{menuName}}" data-id="{{menuId}}">
			
	</td>
 </tr>                
{{/each}}

</script>

</body>
</html>