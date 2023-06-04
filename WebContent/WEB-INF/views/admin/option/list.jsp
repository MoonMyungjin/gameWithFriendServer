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
.selected {
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
					<div style="position: fixed; width: 45%;">
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
									<c:forEach items="${selectedchampion.image}" var="img">
										<img src="/tomcatImg/${img.flPath}/${img.flUniqueName}" alt="">
									</c:forEach>
								</div>
							</div>
							<div class="col-sm-6">
								<table class="table selectedTable table-bordered">
									<tbody>
										<tr>
											<th>시스템 Key</th>
											<td>
												<input type="hidden" name="CH_INDEX" value="${selectedchampion.champ.CH_INDEX }">
												<c:out value="${selectedchampion.champ.CH_INDEX}"/>
											</td>
										</tr>
										<tr>
											<th>이름(영문)</th>
											<td><input type="text" name="CH_NAME" value="${selectedchampion.champ.CH_NAME }"></td>
										</tr>
										<tr>
											<th>이름(한글)</th>
											<td><input type="text" name="CH_NAME_K" value="${selectedchampion.champ.CH_NAME_K }"></td>
										</tr>
										<tr>
											<th>Riot Key</th>
											<td><input type="text" name="CH_KEY" value="${selectedchampion.champ.CH_KEY }"></td>
										</tr>
										<tr>
											<td>
												<c:choose>
													<c:when test="${fn:length(selectedchampion.image) eq 0}">
														<label for="chooseFile" class="btn btn-dark">파일찾기</label> 
														<span style="display: none;">
															<input type="file" id="chooseFile" name="file" accept="image/*" onchange="loadFile(this)">
														</span>
													</c:when>
													<c:when test="${fn:length(selectedchampion.image) gt 0}">
														<label for="chooseFile" class="btn btn-dark">파일변경</label> 
														<span style="display: none;">
															<input type="file" id="chooseFile" name="file" accept="image/*" onchange="loadFile(this)">
														</span>
													</c:when>
												</c:choose>
												<c:if test="${fn:length(selectedchampion.image) eq 0}">
													
												</c:if>
											</td>
											<td id="fileName">
												<c:choose>
													<c:when test="${fn:length(selectedchampion.image) eq 0}">
														등록된 파일 없음
													</c:when>
													<c:when test="${fn:length(selectedchampion.image) gt 0}">
														<c:forEach items="${selectedchampion.image}" var="img">
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
					</div>
				</div>
				<div class="col-sm-6" >
					<div class="table1">
						<table class="table listTable table-head-fixed table-bordered">
							<thead>
								<tr>
									<th>시스템 Key</th>
									<th>Riot Key</th>
									<th>이름(영문)</th>
									<th>이름(한글)</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${championList}" var="champ" varStatus="i">
									<tr class="lineTr <c:if test="${champ.CH_INDEX eq selectedchampion.champ.CH_INDEX}">selected</c:if>">
										<td>${champ.CH_INDEX}</td>
										<td>${champ.CH_KEY}</td>
										<td>${champ.CH_NAME}</td>
										<td>${champ.CH_NAME_K}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</form>	
	
<script>
	$(document).ready(function(){
		$('.selected').attr('tabindex','0').focus();
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
	
	$(".lineTr").click(function(){
		
		var chIndex = $(this).children().eq(0).text();
		
		window.location.href = "/admin/champion/list.do?CH_INDEX="+chIndex+"&SEARCH_KEY="+$('#searchName').val();
		
	});
	
	function search(){
		
		var chIndex = $('.selected').children().eq(0).text();
		window.location.href = "/admin/champion/list.do?CH_INDEX="+chIndex+"&SEARCH_KEY="+$('#searchName').val();
	}
	
	$("#searchName").on("keyup",function(key){
		if(key.keyCode==13) {
			var chIndex = $('.selected').children().eq(0).text();
			window.location.href = "/admin/champion/list.do?CH_INDEX="+chIndex+"&SEARCH_KEY="+$('#searchName').val();
		}
	});
	
	function clearInput(){
// 		console.log($(".selectedTable")[0])
		$(".selectedTable").find("td").eq(0).html("저장시 채번");
		$(".selectedTable").find("input[name=CH_NAME]").val("");
		$(".selectedTable").find("input[name=CH_NAME_K]").val("");
		$(".selectedTable").find("input[name=CH_KEY]").val("");
		$(".selectedTable").find("label").html("파일찾기");
		$("#fileName").html("");
		$("#image-show").html("");
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
</script>

</body>
</html>