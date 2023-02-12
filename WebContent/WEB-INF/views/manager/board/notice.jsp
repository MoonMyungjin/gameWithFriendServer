<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.dataMap.pageMaker.cri }" />
<c:set var="noticeList" value="${dataMap.dataMap.noticeList }" /> 
<c:set var="category" value="${category }" />

<head>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <style>
<c:if test="${category eq 'p' || category eq 's' }">
  .page-item.active .page-link {
		    z-index: 3;
		    color: #fff;
		    background-color: #9674d3cf;
		    border-color: #9674d3cf;
		}
		.page-link{
		color: #9674d3cf;
		}
</c:if>  

<c:if test="${category eq 'm'}">
	.page-item.active .page-link {
		    z-index: 3;
		    color: #fff;
		    background-color: #395d83;
		    border-color: #395d83;
		}
		.page-link{
		color: #395d83;
		}
</c:if>

  </style>
</head>

<body>




	<!-- Main content -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-9" style="display: flex;">
					<h1 data-userId="${loginUser.id}">공지사항</h1>
<!-- 					즐겨찾기에 존재 -->
					<c:if test="${fn:indexOf(favoriteMenuListStr, '공지사항') != -1}">
						<i id="star" class="fa-solid fa-star on fa-2x" ></i>
					</c:if>
					
<!-- 					즐겨찾기에 존재하지 않음 -->
					<c:if test="${fn:indexOf(favoriteMenuListStr, '공지사항') == -1}">
						<i id="star" class="fa-regular fa-star off fa-2x" ></i>
					</c:if>
				</div>
				<div class="col-sm-2" style="display: flex;">
				<c:if test="${category eq 'm' || category eq 'p'}"> 
					<select id="schoolSelectBox" class="form-control" id="schoolInfo">
						<c:forEach items="${schoolList}" var="school">
							<option ${school.schoolName eq schoolInfo.schoolName ? 'selected':'' } id="${fn:substring(school.schoolURL,0,15) }">${school.schoolName }</option>
						</c:forEach>
					</select>
				</c:if>
				</div> 
				<div class="col-sm-1" style="display: flex;">
				<c:if test="${category eq 'm' }"> 
					<button type="button" class="btn btn-dark btn-smx"
							id="registBtn"
							style="width: 11vh; height: 5vh; font-size: .875rem;"
							onclick="OpenWindow('/manager/board/notice/registForm.do','게시물 등록',800,700);">새 글</button>
				</c:if> 
				</div>
			</div>
		</div>
	</section>


	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row" style="">
				<div class="col-sm-12">
					<c:if test="${category eq 'm' }"> 
						<div class="card card-dark card-outline" >
					</c:if>
					<c:if test="${category eq 'p' || category eq 's'}"> 
						<div class="card card-light card-outline" >
					</c:if>
						<div class="card-header" style="border-bottom-color: white; height: 50px;">
							<div class="row" >
								<div class="col-sm-6">
										<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
								<li class="nav-item"><a class="nav-link"
									id="custom-tabs-one-profile-tab" data-toggle="pill"
									href="#custom-tabs-one-profile" role="tab"
									aria-controls="custom-tabs-one-profile" aria-selected="false">학원</a>
								</li>
								<li class="nav-item"><a class="nav-link active"
									id="custom-tabs-one-home-tab" data-toggle="pill"
									href="#custom-tabs-one-home" role="tab"
									aria-controls="custom-tabs-one-home" aria-selected="true" >학교</a></li>
								
							</ul>
								</div>

								<div class="col-sm-6">
									<div id="keyword" class="card-tools" style="width: 60vh;">
										<div class="input-group row">
											<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="list_go();">
												<option value="6" ${cri.perPageNum==6 ? 'selected':'' }>정렬개수</option>
												<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
												<option value="10" ${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>
												<option value="15" ${cri.perPageNum == 15 ? 'selected':''}>15개씩</option>
											</select>
											<select class="form-control col-md-3" name="searchType" id="searchType">
												<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
												<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
												<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
											</select> 
											<input id="listSearchKeyword" class="form-control" type="text" name="keyword"
												placeholder="검색어를 입력하세요." size="20px;" value="${param.keyword }" /> <span
												class="input-group-append">
												<c:if test="${category eq 's' || category eq 'p'}">
												<button class="btn btn-light" type="button"
													onclick="list_go(1);" data-card-widget="search">
													<i class="fa fa-fw fa-search"></i>
												</button>
												</c:if>
												<c:if test="${category eq 'm' }">
												<button class="btn btn-dark" type="button"
													onclick="list_go(1);" data-card-widget="search">
													<i class="fa fa-fw fa-search"></i>
												</button>
												</c:if>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="card-body">
						<div class="tab-content" id="custom-tabs-one-tabContent">
												<div class="tab-pane fade" id="custom-tabs-one-profile"
					role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
					<div class="col-sm-12">
	                   <table class="table table-hover table-bordered text-nowrap">
	                   <thead>
	                   <tr>
		                 <th>NO</th>
	    	             <th>작성자</th>
	        	         <th>제목</th>
	            	     <th>날짜</th>
	                   </tr>
	                   </thead>
	                   <tbody id="searchResultTable">
	                   <c:forEach items="${noticeList}" var="notice">
	                    <tr
						 	onclick="location.href='/manager/board/notice/detail.do?from=list&noticeId='+${notice.noticeId};"
							style="cursor: pointer">
	                     <td>${notice.noticeId}</td>
	                     <td style="cursor: pointer;"><strong>${notice.mngName}</strong></td>
	                     <td style="text-align:left;max-width: 200px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${notice.noticeTitle}</td>
	                     <td><fmt:formatDate value="${notice.noticeRegdate }" pattern="yyyy-MM-dd" /></td>
	                    </tr>
	                    </c:forEach>
	                   </tbody>
	                   
	                   
	                   
	                   </table>
	                   
	                   
	                   
	                 </div>
	                  
					</div>
				
				<div class="tab-pane fade active show table1" id="custom-tabs-one-home"
						role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
				
					<div class="col-sm-12">
						<h4>${schoolInfo.schoolName }</h4>
	                   <table class="table table-hover table-bordered text-nowrap">
	                   <thead>
	                   <tr>
	        	         <th>제목</th>
	            	     <th>날짜</th>
	                   </tr>
	                   </thead>
	                   <tbody id="crawlSearchResult">
	                   <c:forEach items="${dataMap.schoolNoticeList}" var="schoolNoticeList">
	                    <tr data-noticeId="${schoolNoticeList.noticeId }" data-crawlUrl ="${schoolInfo.schoolURL }" class="noticeLine" style="cursor: pointer">
	                     <td style="text-align:left;max-width: 200px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${fn:replace(schoolNoticeList.noticeTitle,'제목','')}</td>

	                     <td><fmt:formatDate value="${schoolNoticeList.noticeRegdate }" pattern="yyyy-MM-dd" /></td>
	                    </tr>
	                    </c:forEach>
	                   </tbody>
	                   
	                   
	                   
	                   </table>
	                   
	                   
	                   
	                 </div>
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


							<form id="jobForm">
								<input type='hidden' name="page" value="" /> <input
									type='hidden' name="perPageNum" value="" /> <input
									type='hidden' name="searchType" value="" /> <input
									type='hidden' name="keyword" value="" />
							</form>

							<script>
								function list_go(page, url) {
									if (!url)
										url = "notice.do";

									var jobForm = $('#jobForm');

									jobForm.find("[name='page']").val(page);
									jobForm.find("[name='perPageNum']").val(
											$('select[name="perPageNum"]')
													.val());
									jobForm.find("[name='searchType']").val(
											$('select[name="searchType"]')
													.val());
									jobForm.find("[name='keyword']")
											.val(
													$(
															'div.input-group>input[name="keyword"]')
															.val());
										console.log(jobForm);
									jobForm.attr({
										action : url,
										method : 'get'
									}).submit();
								}
								
								
								  function modify_go(noticeId) {
								      location.href = "/manager/board/notice/modifyForm.do?noticeId=" + noticeId;
								    }

								    function remove_go(noticeId) {
								      location.href = "/manager/board/notice/remove.do?noticeId=" + noticeId;
								    } 
								    
								    
								    <c:if test = "${from eq 'modify' }" >
								    	Swal.fire('완료되었습니다.', '수정완료!', 'success');
								    </c:if>


						 	  		<c:if test = "${from eq 'remove' }" >
							 	  		Swal.fire('완료되었습니다.', '삭제완료!', 'success');
								    </c:if>

								
							</script>
				
						<div class="col-sm-2"></div>
					</div>
				</div>
			</div>

		</div>

	</section>
<script>
	window.onload=function(){
		$(".noticeLine").on("click",function(){
			let noticeId = $(this).attr("data-noticeId");
			let crawlUrl = $(this).attr("data-crawlUrl");
		    location.href="/manager/board/notice/crawlDetail.do?noticeId="+noticeId;
		});
		
		$("#schoolSelectBox").on("change",function(){
			let schoolName = $("#schoolSelectBox option:selected").text();
			let schoolUrl = $("#schoolSelectBox option:selected").attr("id");
		    location.href="/manager/board/notice.do?schoolUrl="+schoolUrl+"&schoolName="+schoolName;
		});

		setTimeout(function() {
			let searchKeyword = $("#listSearchKeyword").val();
			let searchResultTableStr = $("#searchResultTable").html();
//	 		console.log(searchResultTableStr);
			if(!(searchKeyword == 'undefined' || searchKeyword=='')){
				let result = HighLightSearchResult($("searchResultTable"),searchResultTableStr,searchKeyword);
				$("#searchResultTable").html(result);
			}
			
			searchResultTableStr = $("#crawlSearchResult").html();
//	 		console.log(searchResultTableStr);
			if(!(searchKeyword == 'undefined' || searchKeyword=='')){
				let result = HighLightSearchResult($("crawlSearchResult"),searchResultTableStr,searchKeyword);
				$("#crawlSearchResult").html(result);
			}
		}, 200);
		
		$("#listSearchKeyword").on("keyup",function(key){
 			if(key.keyCode==13) {
 				
 				list_go(1);
 	        }
 		});
	}

</script>



<!--  학교 텝 -->
	    <div class="tab-pane fade table1" id="custom-tabs-one-profile"
			role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
				<div class="row">
			            
					 </div>
		</div>
<script>
	console.log("${dataMap}");
</script>
</body>
