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
							<h1>신고 목록</h1>
						</div>
<!-- 						<div class="col-sm-12"> -->
<!-- 							셀렉트박스 변경 시 바로 저장됩니다. -->
<!-- 						</div> -->
					</div>
				</div>
				<div class="col-sm-6 tright">
					<div class="row">
						<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
							
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
							<th>
								<div class="row">
									<div class="col-sm-6">
										RE_SEQ
									</div>
<!-- 									<div class="col-sm-6 float-right"> -->
<!-- 										<div class="row"> -->
<%-- 											<input id="searchId" type="text" class="form-control" placeholder="ID 검색" value="${params.searchId }" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;"> --%>
<!-- 											<div class="input-group-append"> -->
<!-- 												<span id="searchBtn" onclick="search()" class="btn btn-dark listColor" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;"> -->
<!-- 													<i class="fas fa-search" aria-hidden="true"></i> -->
<!-- 												</span> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
								</div>
							</th>
							<th>RE_SEND_ID</th>
							<th>RE_TARGET_ID</th>
							<th>RE_CONT</th>
							<th>RE_RED_ID</th>
							<th>RE_REG_DT</th>
							<th>RE_MOD_ID</th>
							<th>RE_MOD_DT</th>
							<th>RE_DEL_YN </th>
							<th>RE_CHECK_YN </th>
							<th>RE_TYPE </th>
<!-- 							<th> -->
<!-- 								상태 -->
<!-- 								<select id="searchState" onchange="search()"> -->
<!-- 									<option value="">전체</option> -->
<%-- 									<c:forEach var="state" items="${stateList}"> --%>
<%-- 										<option value="${state.CD_DTL_ID }" <c:if test="${state.CD_DTL_ID eq params.searchState}">selected="selected" </c:if> >${state.CD_DTL_NAME }</option> --%>
<%-- 									</c:forEach>	 --%>
<!-- 								</select> -->
<!-- 							</th> -->
<!-- 							<th> -->
<!-- 								구분 -->
<!-- 								<select id="searchType" onchange="search()"> -->
<!-- 									<option value="">전체</option> -->
<%-- 									<c:forEach var="type" items="${typeList}"> --%>
<%-- 										<option value="${type.CD_DTL_ID }" <c:if test="${type.CD_DTL_ID eq params.searchType}">selected="selected" </c:if> >${type.CD_DTL_NAME }</option> --%>
<%-- 									</c:forEach>	 --%>
<!-- 								</select> -->
<!-- 							</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reportList}" var="report" varStatus="i">
							<tr>
								<td>${report.reSeq}</td>
								<td>${report.reSendId}</td>
								<td>${report.reTargetId}</td>
								<td>${report.reCont}</td>
								<td>${report.reRegId}</td>
								<td>
									<fmt:formatDate value="${report.reRegDt}" pattern="YYYY-MM-dd"/>
								</td>
								<td>${report.reModId}</td>
								<td>
									<fmt:formatDate value="${report.reModDt}" pattern="YYYY-MM-dd"/>
								</td>
								<td>${report.reDelYn}</td>
								<td>${report.reCheckYn}</td>
								<td>${report.reType}</td>
<!-- 								<td> -->
<%-- 									<select id="state_${user.UIntgId}" class="dropdown"> --%>
<%-- 										<c:forEach var="state" items="${stateList}"> --%>
<%-- 											<option value="${state.CD_DTL_ID }" <c:if test="${state.CD_DTL_ID eq user.UStateCd}">selected="selected" </c:if> >${state.CD_DTL_NAME }</option> --%>
<%-- 										</c:forEach> --%>
<!-- 									</select> -->
<!-- 								</td> -->
<!-- 								<td> -->
<%-- 									<select id="type_${user.UIntgId}" class="dropdown"> --%>
<%-- 										<c:forEach var="type" items="${typeList}"> --%>
<%-- 											<option value="${type.CD_DTL_ID }" <c:if test="${type.CD_DTL_ID eq user.UTypeCd}">selected="selected" </c:if> >${type.CD_DTL_NAME }</option> --%>
<%-- 										</c:forEach> --%>
<!-- 									</select> -->
<!-- 								</td> -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	
	</section>
	
<script>

var prev_val;

$('.dropdown').focus(function() {

    prev_val = $(this).val();

}).change(function() {

    $(this).blur();
    
    var success = confirm("사용자 상태를 정말 변경 하시곘습니까?");

    if(!success) {
        $(this).val(prev_val);
        return false; 
    }
    
    var id = $(this).attr("id");
    var uIntgId = id.split('_')[1];
	var selectedVal = $(this).val();
	var cate = id.split('_')[0];
	
	var data = {
	 		 	 "id" : uIntgId
		 		,"cate" : cate
		 		,"val" : selectedVal
		 	 }
	
	$.ajax({
		 type: "post"
		,url : "/admin/userUpdate.do"
		,data : data
		,success : function (data){
			alert("["+id+"] : 상태변경 완료");
		     }
		,error : function(e){
		 	 }
	}); 
});

function search(){
	var searchId = $("#searchId").val();
	var searchState = $("#searchState").val();
	var searchType = $("#searchType").val();
	window.location.href = "/admin/userList.do?searchId="+searchId+"&searchState="+searchState+"&searchType="+searchType;
}

</script>

</body>
</html>