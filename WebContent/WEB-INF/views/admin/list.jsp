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

.table th{
	background-color: rgb(32, 73, 105) !important;
	color: white;
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
.tright{
	text-align: right;
}
</style>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-12">
							<h1>회원관리</h1>
						</div>
						<div class="col-sm-12">
							셀렉트박스 변경 시 바로 저장됩니다.
						</div>
					</div>
				</div>
				<div class="col-sm-6 tright">
					<div class="row">
						<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
							<input id="searchName" type="text" class="form-control float-right" placeholder="ID 검색" value="${searchMap.SEARCH_KEY }" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
							<div class="input-group-append">
								<span id="searchBtn" onclick="search()" class="btn btn-dark listColor" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
									<i class="fas fa-search" aria-hidden="true"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content">
		<div class="container-fluid">
			<div class="row table1">
				<table class="table table-head-fixed table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>최근로그인IP</th>
							<th>최근로그인일시</th>
							<th>최근로그인기종 </th>
							<th>
								상태
								<select id="searchState">
									<option value="">전체</option>
									<c:forEach var="state" items="${stateList}">
										<option value="${state.CD_DTL_ID }">${state.CD_DTL_NAME }</option>
									</c:forEach>	
								</select>
							</th>
							<th>
								구분
								<select id="searchType">
									<option value="">전체</option>
									<c:forEach var="type" items="${typeList}">
										<option value="${type.CD_DTL_ID }">${type.CD_DTL_NAME }</option>
									</c:forEach>	
								</select>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList}" var="user" varStatus="i">
							<tr>
								<td>${user.UIntgId}</td>
								<td>${user.ULastLoginIp}</td>
								<td>
									<fmt:formatDate value="${user.ULastLoginDttm}" pattern="YYYY-MM-dd"/>
								</td>
								<td>${user.ULastTerminalKind}</td>
								<td>
									<select id="state_${user.UIntgId}">
										<c:forEach var="state" items="${stateList}">
											<option value="${state.CD_DTL_ID }" <c:if test="${state.CD_DTL_ID eq user.UStateCd}">selected="selected" data-sel="Y"</c:if> >${state.CD_DTL_NAME }</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<select id="type_${user.UIntgId}">
										<c:forEach var="type" items="${typeList}">
											<option value="${type.CD_DTL_ID }" <c:if test="${type.CD_DTL_ID eq user.UTypeCd}">selected="selected" data-sel="Y"</c:if> >${type.CD_DTL_NAME }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	
	</section>
	
	<script>
		 
	$("select[id^=state]").on("change",function(){
		var id = $(this).attr("id");
		var selectedVal = $(this).val();
		var beforeVal = $("#"+id).find("option[data-sel='Y']").val();
		
		if(!confirm("사용자 상태를 정말 변경 하시곘습니까?")){
			return false;
		}
		
		console.log(id);
		console.log(beforeVal);
	});
	
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
	

</script>

</body>
</html>