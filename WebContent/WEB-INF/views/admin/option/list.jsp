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

.lineTr:hover {
	cursor: pointer;
	color: #fdfbd7;
    background-color: #60b3ac;
    border-color: white;
    box-shadow: none;
}
.lineTrTwo:hover {
	cursor: pointer;
	color: #fdfbd7;
    background-color: #60b3ac;
    border-color: white;
    box-shadow: none;
}
.lineTrThree:hover {
	cursor: pointer;
	color: #fdfbd7;
    background-color: #60b3ac;
    border-color: white;
    box-shadow: none;
}
.selected {
	color: #fdfbd7;
    background-color: #60b3ac;
    border-color: white;
    box-shadow: none;
}
.Underselected {
	color: #fdfbd7;
    background-color: #60b3ac;
    border-color: white;
    box-shadow: none;
}
.UnderUnderselected {
	color: #fdfbd7;
    background-color: #60b3ac;
    border-color: white;
    box-shadow: none;
}
.selectedTable Th{
	background-color: #60b3ac !important;
	color: white;
}

.listTable th{
	background-color: rgb(32, 73, 105) !important;
	color: white;
}
.tright{
	text-align: right;
}
#image-show{
	background-size: cover;
}
img{
	height: 100%;
	width: 100%;
}
.listColor{
	background-color: rgb(32, 73, 105) !important;
}
</style>
</head>
<body>
<form action="insert.do" id="form" enctype="multipart/form-data" method="post">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6" style="display: flex;">
					<h1>옵션 정보관리</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6">
					<div style="width: 100%;">
						<div class="row">
							<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
								<input id="searchName" type="text" class="form-control float-right" value="${searchMap.SEARCH_KEY }" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
								<div class="input-group-append">
									<span id="IncludeListSearchBtn" onclick="search()" class="btn btn-dark listColor" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<i class="fas fa-search" aria-hidden="true"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div id="image-show">
									<!-- server.xml 파일 내 추가 필요 -->
									<!-- <Context docBase="C:\java\file" path="/tomcatImg/" reloadable="true"/> -->
									<c:forEach items="${selectedOption.image}" var="img">
										<img src="/tomcatImg/${img.flPath}/${img.flUniqueName}" alt="">
									</c:forEach>
								</div>
							</div>
							<div class="col-sm-6">
								<table class="table selectedTable table-bordered">
									<thead>상위옵션</thead> 
									<tbody>
										<tr>
											<th>옵션코드번호</th>
											<td>
												<input type="hidden" name="CD_DTL_ID" value="${selectedOption.option.CD_DTL_ID }">
												<c:out value="${selectedOption.option.CD_DTL_ID}"/>
											</td>
										</tr>
										<tr>
											<th>옵션상위코드번호</th>
											<td><input type="hidden" name="CD_DTL_PARENT_ID"  value="${selectedOption.option.CD_DTL_PARENT_ID }">
												<c:out value="${selectedOption.option.CD_DTL_PARENT_ID}"/>
											</td>
										</tr>
										<tr>
											<th>옵션이름</th>
											<td><input type="text" name="CD_DTL_NAME" value="${selectedOption.option.CD_DTL_NAME }"></td>
										</tr>
										<tr>
											<th>옵션설명</th>
											<td><input type="text" name="CD_DTL_DESC" value="${selectedOption.option.CD_DTL_DESC }"></td>
										</tr>
										<tr>
											<td>
												<c:choose>
													<c:when test="${fn:length(selectedOption.image) eq 0}">
														<label for="chooseFile" class="btn btn-dark">파일찾기</label> 
														<span style="display: none;">
															<input type="file" id="chooseFile" name="file" accept="image/*" onchange="loadFile(this)">
														</span>
													</c:when>
													<c:when test="${fn:length(selectedOption.image) gt 0}">
														<label for="chooseFile" class="btn btn-dark">파일변경</label> 
														<span style="display: none;">
															<input type="file" id="chooseFile" name="file" accept="image/*" onchange="loadFile(this)">
														</span>
													</c:when>
												</c:choose>
												<c:if test="${fn:length(selectedOption.image) eq 0}">
													
												</c:if>
											</td>
											<td id="fileName">
												<c:choose>
													<c:when test="${fn:length(selectedOption.image) eq 0}">
														등록된 파일 없음
													</c:when>
													<c:when test="${fn:length(selectedOption.image) gt 0}">
														<c:forEach items="${selectedOption.image}" var="img">
															${img.flOriginName}
														</c:forEach>
													</c:when>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<span onclick="clearInput()" class="btn btn-dark">
													입력초기화
												</span>
												<span onclick="doSubmit()" class="btn btn-dark">
													저장
												</span>
											</td>
										</tr>
									</tbody>
								</table>
								
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div id="image-show-under">
									<!-- server.xml 파일 내 추가 필요 -->
									<!-- <Context docBase="C:\java\file" path="/tomcatImg/" reloadable="true"/> -->
									<c:forEach items="${selectedUnderOption.image}" var="img">
										<img src="/tomcatImg/${img.flPath}/${img.flUniqueName}" alt="">
									</c:forEach>
								</div>
							</div>
							<div class="col-sm-6">
								<table class="table selectedTable table-bordered">
									<thead>하위옵션</thead>
									<tbody>
										<tr>
											<th>옵션코드번호</th>
											<td>
												<input type="hidden" name="CD_DTL_ID_UNDER" value="${selectedUnderOption.option.CD_DTL_ID }">
												<c:out value="${selectedUnderOption.option.CD_DTL_ID}"/>
											</td>
										</tr>
										<tr>
											<th>옵션상위코드번호</th>
											<td>
												<input type="hidden" name="CD_DTL_PARENT_ID_UNDER"  value="${selectedUnderOption.option.CD_DTL_PARENT_ID }">
												<span><c:out value="${selectedUnderOption.option.CD_DTL_PARENT_ID}"/></span>
											</td>
										</tr>
										<tr>
											<th>옵션이름</th>
											<td><input type="text" name="CD_DTL_NAME_UNDER" value="${selectedUnderOption.option.CD_DTL_NAME }"></td>
										</tr>
										<tr>
											<th>옵션설명</th>
											<td><input type="text" name="CD_DTL_DESC_UNDER" value="${selectedUnderOption.option.CD_DTL_DESC }"></td>
										</tr>
										<tr>
											<td>
												<c:choose>
													<c:when test="${fn:length(selectedUnderOption.image) eq 0}">
														<label for="chooseFileUnder" class="btn btn-dark">파일찾기</label> 
														<span style="display: none;">
															<input type="file" id="chooseFileUnder" name="fileUnder" accept="image/*" onchange="loadFileUnder(this)">
														</span>
													</c:when>
													<c:when test="${fn:length(selectedUnderOption.image) gt 0}">
														<label for="chooseFileUnder" class="btn btn-dark">파일변경</label> 
														<span style="display: none;">
															<input type="file" id="chooseFileUnder" name="fileUnder" accept="image/*" onchange="loadFileUnder(this)">
														</span>
													</c:when>
												</c:choose>
												<c:if test="${fn:length(selectedUnderOption.image) eq 0}">
													
												</c:if>
											</td>
											<td id="fileNameUnder">
												<c:choose>
													<c:when test="${fn:length(selectedUnderOption.image) eq 0}">
														등록된 파일 없음
													</c:when>
													<c:when test="${fn:length(selectedUnderOption.image) gt 0}">
														<c:forEach items="${selectedUnderOption.image}" var="img">
															${img.flOriginName}
														</c:forEach>
													</c:when>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<span onclick="clearInputUnder()" class="btn btn-dark">
													입력초기화
												</span>
												<span onclick="doSubmitUnder()" class="btn btn-dark">
													저장
												</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-6">
								<div id="image-show-under-under">
									<!-- server.xml 파일 내 추가 필요 -->
									<!-- <Context docBase="C:\java\file" path="/tomcatImg/" reloadable="true"/> -->
									<c:forEach items="${selectUnderUnderOption.image}" var="img">
										<img src="/tomcatImg/${img.flPath}/${img.flUniqueName}" alt="">
									</c:forEach>
								</div>
							</div>
							<div class="col-sm-6">
								<table class="table selectedTable table-bordered">
									<thead>최하위옵션</thead>
									<tbody>
										<tr>
											<th>옵션코드번호</th>
											<td>
												<input type="hidden" name="CD_DTL_ID_UNDER_UNDER" value="${selectUnderUnderOption.option.CD_DTL_ID }">
												<c:out value="${selectUnderUnderOption.option.CD_DTL_ID}"/>
											</td>
										</tr>
										<tr>
											<th>옵션상위코드번호</th>
											<td>
												<input type="hidden" name="CD_DTL_PARENT_ID_UNDER_UNDER"  value="${selectUnderUnderOption.option.CD_DTL_PARENT_ID }">
												<span><c:out value="${selectUnderUnderOption.option.CD_DTL_PARENT_ID}"/></span>
											</td>
										</tr>
										<tr>
											<th>옵션이름</th>
											<td><input type="text" name="CD_DTL_NAME_UNDER_UNDER" value="${selectUnderUnderOption.option.CD_DTL_NAME }"></td>
										</tr>
										<tr>
											<th>옵션설명</th>
											<td><input type="text" name="CD_DTL_DESC_UNDER_UNDER" value="${selectUnderUnderOption.option.CD_DTL_DESC }"></td>
										</tr>
										<tr>
											<td>
												<c:choose>
													<c:when test="${fn:length(selectUnderUnderOption.image) eq 0}">
														<label for="chooseFileUnderUnder" class="btn btn-dark">파일찾기</label> 
														<span style="display: none;">
															<input type="file" id="chooseFileUnderUnder" name="fileUnderUnder" accept="image/*" onchange="loadFileUnderUnder(this)">
														</span>
													</c:when>
													<c:when test="${fn:length(selectUnderUnderOption.image) gt 0}">
														<label for="chooseFileUnderUnder" class="btn btn-dark">파일변경</label> 
														<span style="display: none;">
															<input type="file" id="chooseFileUnderUnder" name="fileUnderUnder" accept="image/*" onchange="loadFileUnderUnder(this)">
														</span>
													</c:when>
												</c:choose>
												<c:if test="${fn:length(selectUnderUnderOption.image) eq 0}">
													
												</c:if>
											</td>
											<td id="fileNameUnderUnder">
												<c:choose>
													<c:when test="${fn:length(selectUnderUnderOption.image) eq 0}">
														등록된 파일 없음
													</c:when>
													<c:when test="${fn:length(selectUnderUnderOption.image) gt 0}">
														<c:forEach items="${selectUnderUnderOption.image}" var="img">
															${img.flOriginName}
														</c:forEach>
													</c:when>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<span onclick="clearInputUnderUnder()" class="btn btn-dark">
													입력초기화
												</span>
												<span onclick="doSubmitUnderUnder()" class="btn btn-dark">
													저장
												</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6"  >
						<div class="table1">
							<table class="table listTable table-head-fixed table-bordered">
								<thead >상위옵션</thead>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상위 옵션 변경
									<select id="selectOption">
									  <option value='' selected>-- 선택 --</option>
									  <c:forEach items="${selectMegaOptionList}" var="optionMega" varStatus="i">
									  	<option value='${optionMega.C_ID}'>${optionMega.C_NAME}</option>
									  </c:forEach>
									</select> 
								<thead>
									<tr>
										<th>옵션코드번호</th>
										<th>옵션상위코드번호</th>
										<th>옵션네임</th>
										<th>옵션설명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${selectOptionList}" var="option" varStatus="i">
										<tr class="lineTr <c:if test="${option.CD_DTL_ID eq selectedOption.option.CD_DTL_ID}">selected</c:if>">
											<td>${option.CD_DTL_ID}</td>
											<td>${option.CD_DTL_PARENT_ID}</td>
											<td>${option.CD_DTL_NAME}</td>
											<td>${option.CD_DTL_DESC}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="table1">
							<table class="table listTable table-head-fixed table-bordered">
								<thead>하위옵션</thead>
								<thead>
									<tr>
										<th>옵션코드번호</th>
										<th>옵션상위코드번호</th>
										<th>옵션네임</th>
										<th>옵션설명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${selectOptionUnderList}" var="optionUnder" varStatus="i">
										<tr class="lineTrTwo <c:if test="${optionUnder.CD_DTL_ID eq selectedUnderOption.option.CD_DTL_ID}">Underselected</c:if>">
											<td>${optionUnder.CD_DTL_ID}</td>
											<td>${optionUnder.CD_DTL_PARENT_ID}</td>
											<td>${optionUnder.CD_DTL_NAME}</td>
											<td>${optionUnder.CD_DTL_DESC}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="table1">	
							<table class="table listTable table-head-fixed table-bordered">
								<thead>초하위옵션</thead>
								<thead>
									<tr>
										<th>옵션코드번호</th>
										<th>옵션상위코드번호</th>
										<th>옵션네임</th>
										<th>옵션설명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${selectUnderUnderOptionList}" var="optionUnderUnder" varStatus="i">
										<tr class="lineTrThree <c:if test="${optionUnderUnder.CD_DTL_ID eq selectUnderUnderOption.option.CD_DTL_ID}">UnderUnderselected</c:if>">
											<td>${optionUnderUnder.CD_DTL_ID}</td>
											<td>${optionUnderUnder.CD_DTL_PARENT_ID}</td>
											<td>${optionUnderUnder.CD_DTL_NAME}</td>
											<td>${optionUnderUnder.CD_DTL_DESC}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</form>	
	
<script>
	$(document).ready(function(){
		$('.selected').attr('tabindex','0').focus();
		if($(".lineTrTwo").length == 0){
			findUnderKey();
		}
		if($("input[name=CD_DTL_PARENT_ID_UNDER_UNDER]").val() ==""){
			findUnderUnderUpperKey();	
		}
		
		
	});

	function loadFile(input) {
	    var file = input.files[0];	//선택된 파일 가져오기
	    
	  	//새로운 이미지 div 추가
	    var newImage = document.createElement("img");
	    newImage.setAttribute("class", 'img');

	    //이미지 source 가져오기
	    newImage.src = URL.createObjectURL(file);   

	    newImage.style.objectFit = "contain";

	    //이미지를 image-show div에 추가
	    var container = $('#image-show').html(newImage);
	    $('#fileName').html(file.name);
	};
	
	function loadFileUnder(input) {
	    var file = input.files[0];	//선택된 파일 가져오기
	    
	  	//새로운 이미지 div 추가
	    var newImage = document.createElement("img");
	    newImage.setAttribute("class", 'img');

	    //이미지 source 가져오기
	    newImage.src = URL.createObjectURL(file);   

	    newImage.style.objectFit = "contain";

	    //이미지를 image-show div에 추가
	    var container = $('#image-show-under').html(newImage);
	    $('#fileNameUnder').html(file.name);
	};
	
	function loadFileUnderUnder(input) {
	    var file = input.files[0];	//선택된 파일 가져오기
	    
	  	//새로운 이미지 div 추가
	    var newImage = document.createElement("img");
	    newImage.setAttribute("class", 'img');

	    //이미지 source 가져오기
	    newImage.src = URL.createObjectURL(file);   

	    newImage.style.objectFit = "contain";

	    //이미지를 image-show div에 추가
	    var container = $('#image-show-under-under').html(newImage);
	    $('#fileNameUnderUnder').html(file.name);
	};
	
	$(".lineTr").click(function(){
		
		var opIndex = $(this).children().eq(0).text();
		var opParentIndex = $(this).children().eq(1).text();
		window.location.href = "/admin/option/list.do?CD_DTL_ID="+opIndex+"&CD_DTL_PARENT_ID="+opParentIndex+"&SEARCH_KEY="+$('#searchName').val();
		
	});
	
	$(".lineTrTwo").click(function(){
		
		var opIndex = $(".selected").children().eq(0).text();
		var opTwoIndex =$(this).children().eq(0).text();
		window.location.href = "/admin/option/list.do?CD_DTL_ID="+opIndex+"&CD_DTL_ID_UNDER="+opTwoIndex+"&SEARCH_KEY="+$('#searchName').val();
		
	});
	
	$(".lineTrThree").click(function(){
		
		var opIndex = $(".selected").children().eq(0).text();
		var opTwoIndex =$(".Underselected").children().eq(0).text();
		var opThreeIndex =$(this).children().eq(0).text();
		window.location.href = "/admin/option/list.do?CD_DTL_ID="+opIndex+"&CD_DTL_ID_UNDER="+opTwoIndex+"&CD_DTL_ID_UNDER_UNDER="+opThreeIndex+"&SEARCH_KEY="+$('#searchName').val();
		
	});
	
	$("#selectOption").on("change", function(){
		var opIndex = $(this).val();
		var opTwoIndex = $(".lineTrTwo").children().eq(0).text();
		window.location.href = "/admin/option/list.do?CD_DTL_PARENT_ID="+opIndex;
	});
	
	function search(){
		
		var chIndex = $('.selected').children().eq(0).text();
		window.location.href = "/admin/option/list.do?CD_DTL_ID="+opIndex+"&SEARCH_KEY="+$('#searchName').val();
	}
	
	$("#searchName").on("keyup",function(key){
		if(key.keyCode==13) {
			var chIndex = $('.selected').children().eq(0).text();
			window.location.href = "/admin/option/list.do?CD_DTL_ID="+opIndex+"&SEARCH_KEY="+$('#searchName').val();
		}
	});
	
	function clearInput(){
// 		console.log($(".selectedTable")[0])
		$(".selectedTable").find("td").eq(0).html("저장시 채번");
		$(".selectedTable").find("input[name=CD_DTL_NAME]").val("");
		$(".selectedTable").find("input[name=CD_DTL_DESC]").val("");
		$(".selectedTable").find("label").html("파일찾기");
		$("#fileName").html("");
		$("#image-show").html("");
	}
	
	function clearInputUnder(){
// 		console.log($(".selectedTable")[0])
		$(".selectedTable").find("input[name=CD_DTL_ID_UNDER]").parent().html("저장시 채번");
		$(".selectedTable").find("input[name=CD_DTL_NAME_UNDER]").val("");
		$(".selectedTable").find("input[name=CD_DTL_DESC_UNDER]").val("");
		$(".selectedTable").find("label").html("파일찾기");
		$("#fileNameUnder").html("");
		$("#image-show-under").html("");
	}
	
	
	function clearInputUnderUnder(){
// 		console.log($(".selectedTable")[0])
		$(".selectedTable").find("input[name=CD_DTL_ID_UNDER_UNDER]").parent().html("저장시 채번");
		$(".selectedTable").find("input[name=CD_DTL_NAME_UNDER_UNDER]").val("");
		$(".selectedTable").find("input[name=CD_DTL_DESC_UNDER_UNDER]").val("");
		$(".selectedTable").find("label").html("파일찾기");
		$("#fileNameUnderUnder").html("");
		$("#image-show-under-under").html("");
	}
	
	function doSubmit(){
		
		var form = $("#form")[0];
		var data = new FormData(form)

		if($('input[type=file]')[0].files[0] == undefined){
		    $("#chooseFile").attr("disabled",true);
		}
		
		$.ajax({
			url : "insert.do"
			,enctype: 'multipart/form-data'
			,type : 'POST' 
			,data : data 
			,contentType : false
			,processData : false
			,success : function(data) {
				location.reload();
			}
			,error : function(xhr, status) {
				console.log(xhr);
			    alert(xhr + " : " + status);
			}
		});

	}
	
	function doSubmitUnder(){
		
		var form = $("#form")[0];
		var data = new FormData(form)

		if($('input[type=file]')[0].files[0] == undefined){
		    $("#chooseFileUnder").attr("disabled",true);
		}
		
		$.ajax({
			url : "insertUnder.do"
			,enctype: 'multipart/form-data'
			,type : 'POST' 
			,data : data 
			,contentType : false
			,processData : false
			,success : function(data) {
				location.reload();
			}
			,error : function(xhr, status) {
				console.log(xhr);
			    alert(xhr + " : " + status);
			}
		});

	}
	
	function doSubmitUnderUnder(){
		
		var form = $("#form")[0];
		var data = new FormData(form)

		if($('input[type=file]')[0].files[0] == undefined){
		    $("#chooseFileUnderUnder").attr("disabled",true);
		}
		
		$.ajax({
			url : "insertUnderUnder.do"
			,enctype: 'multipart/form-data'
			,type : 'POST' 
			,data : data 
			,contentType : false
			,processData : false
			,success : function(data) {
				location.reload();
			}
			,error : function(xhr, status) {
				console.log(xhr);
			    alert(xhr + " : " + status);
			}
		});

	}
	
	function findUnderKey(){
		
		let uppperKey = $(".selected").children('td:eq(2)').text();
		
		$.ajax({
			url : "findUnderKey.do?upperKey="+uppperKey+""
			,enctype: 'multipart/form-data'
			,type : 'POST' 
			,contentType : false
			,processData : false
			,dataType: 'text'
			,success : function(data) {
				$(".selectedTable").find("input[name=CD_DTL_PARENT_ID_UNDER]").val(data);
				$(".selectedTable").find("input[name=CD_DTL_PARENT_ID_UNDER]").next().text(data);
			}
			,error : function(xhr, status) {
				console.log(xhr);
			    alert(xhr + " : " + status);
			}
		});

	}
	
	function findUnderUnderUpperKey(){
		let upperKey = $(".Underselected").children('td:eq(0)').text();
		$("input[name=CD_DTL_PARENT_ID_UNDER_UNDER]").val(upperKey);
		$("input[name=CD_DTL_PARENT_ID_UNDER_UNDER]").next().text(upperKey);
	}
</script>

</body>
</html>