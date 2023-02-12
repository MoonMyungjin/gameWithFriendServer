<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="kakaoSendList" value="${dataMap.kakaoSendList}" />
<c:set var="cri" value="${pageMaker.cri }" />

<head>
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
table:hover tbody tr:hover td {
   	background: #395d83;
   	color: white;
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
<meta charset="UTF-8">
<title></title>
</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6" style="display: flex;">
              <h1 data-userId="${loginUser.id }" >보낸메세지내역</h1>
              <!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '보낸메세지내역') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '보낸메세지내역') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
                            
           </div>
         
        </div>
   </div>
</section>
<section class="content">
  <div class="container-fluid" style="padding-left: 20px; padding-right: 20px;">
   <div class="card card-dark card-outline" >
   		<div class="card-header">
   			<div class="row" style="display: flex; align-items: center;">
										<div class="col-sm-2" style="height: 20px;">
												<h3 class="card-title">
													<i class="fas fa-list"></i>
													&nbsp;&nbsp;
													보낸 메세지 내역
												</h3>
										</div>
										<div class="col-sm-5">
										</div>
										<div class="col-sm-2" style="text-align: right; padding-top: 7px;">
										
											<h6 style="color:#395d83;">검색 결과 : ${pageMaker.totalCount}행</h6>
											
										</div>
										<div class="col-sm-3">
											<div class="input-group">
												<input id="listSearchKeyword" type="text" class="form-control form-control-sm" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }">
												<div class="input-group-append">
													<button id="listSearchBtn" type="button" class="btn btn-dark btn-sm" onclick="list_go(1)">
														<i class="fas fa-search"></i>
													</button>
												</div>&nbsp;&nbsp;&nbsp;&nbsp;
											<button id="listSavePdf" type="button" class="btn btn-danger btn-sm">PDF</button>
											</div>
										</div>
									</div>
   		</div>
		<div class="card-body" style="padding-top: 5px;">
					<div class="row table2">
								<div class="card-body p-0">
									<table id="kakaoSendListTable" class="table table-hover table-head-fixed table-bordered">
										<thead>
											<tr>
												<th>수신대상</th>
												<th>수신자</th>
												<th>수신번호</th>
												<th>발신아이디</th>
												<th>발송수단</th>
												<th>발송일</th>
											</tr>
										</thead>
										<tbody id="searchResultTable">
										<c:if test="${empty kakaoSendList}">
											<tr >
												<td colspan="6" class="text-center" style="background-color: white; color:black;">
													해당 내용이 없습니다.
												</td>
											</tr>
										</c:if>
										<c:if test="${!empty kakaoSendList}">
											<c:forEach items="${kakaoSendList}" var="sendList">
												<tr class="clickable" onclick="kakaoSendDetail(${sendList.kakaoSendId});">
													<td>${sendList.kakaoReceiverType }</td>
													<td style="cursor: pointer;"><strong>${sendList.kakaoReceiverName }</strong></td>
													<td>${sendList.kakaoReceiverHp }</td>
													<td>${sendList.mngId }</td>
													<td>${sendList.kakaoSendType }</td>
													<td>${fn:substring(sendList.kakaoSendDate,0,10)}</td>
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
	</div>
   </div>
</section>
   
<script>
 window.onload=function(){
	 $('#listSavePdf').click(function() { // pdf저장 button id
			PDFSave($('#kakaoSendListTable'),'MessageSendList.pdf');
	});
		
	 setTimeout(function() {
			let searchKeyword = $("#listSearchKeyword").val();
			let searchResultTableStr = $("#searchResultTable").html();
//	 		console.log(searchResultTableStr);
			if(!(searchKeyword == 'undefined' || searchKeyword=='')){
				let result = HighLightSearchResult($("searchResultTable"),searchResultTableStr,searchKeyword);
				$("#searchResultTable").html(result);
			}
		}, 200);	
 }
</script>
<script>
function kakaoSendDetail(kakaoSendId){
	//alert(kakaoSendId);
	
}
</script>   
</body>
</html>