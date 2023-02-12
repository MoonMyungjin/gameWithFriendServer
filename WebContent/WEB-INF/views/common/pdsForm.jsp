<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="pdsList" value="${dataMap.pdsList }" /> 
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var= "category" value="${category }" />

<head>
  <title>학습자료실</title>
  
 <c:if test="${category eq 'm' }">
  <style>
    .page-item.active .page-link {
      z-index: 3;
      color: #fff;
      background-color: #395d83;
      border-color: #395d83;
    }

    .page-link {
      color: #8c8588;
    }

    #title {
      font-size: 15px;
      text-align: center;
    }

  </style>
</c:if>

 <c:if test="${category eq 's' or category eq 'p'}">
  <style>
    .page-item.active .page-link {
      z-index: 3;
      color: #fff;
      background-color: #9674d3cf;
      border-color: #9674d3cf;
    }

    .page-link {
      color: #8c8588;
    }

    #title {
      font-size: 15px;
      text-align: center;
    }
  </style>
</c:if>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>

<%--  data-userId=${loginUser.id } data-MenuId=${favoriteMenuIdListStr } --%>
<body>

<div id="load">
    <img src="/resources/images/Book.gif" alt="loading">
</div>



	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6" style="display: flex;">
					<h2 data-userId="${loginUser.id }">학습자료실</h2>
					
<!-- 					즐겨찾기에 존재 -->
					<c:if test="${fn:indexOf(favoriteMenuListStr, '학습자료실') != -1}">
						<i id="star" class="fa-solid fa-star on fa-2x" ></i>
					</c:if>
					
<!-- 					즐겨찾기에 존재하지 않음 -->
					<c:if test="${fn:indexOf(favoriteMenuListStr, '학습자료실') == -1}">
						<i id="star" class="fa-regular fa-star off fa-2x" ></i>
					</c:if>
			
				</div>
			</div>
		</div>
	</section>

<!-- 매니저 -->
<c:if test="${category eq 'm' }">

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-sm-12">
					<div class="card card-dark card-outline" id="form">

						<div class="card-header">
							<div style="margin-top: 5px;">
								<h3 class="card-title">
									<i class="fas fa-search" aria-hidden="true"></i> 자료리스트
								</h3>
							</div>
							
							<div id="keyword" class="card-tools" style="width: 450px;">
								<div class="input-group row">
									<select class="form-control col-md-3" name="perPageNum"
										id="perPageNum" onchange="list_go();">
										<option value="10" ${cri.perPageNum==10 ? 'selected' :'' }>정렬개수</option>
										<option value="20" ${cri.perPageNum==20 ? 'selected' :'' }>20개씩</option>
										<option value="30" ${cri.perPageNum==30 ? 'selected' :'' }>30개씩</option>
										<option value="50" ${cri.perPageNum==50 ? 'selected' :'' }>50개씩</option>

									</select> 
									<select class="form-control col-md-3" name="searchType" id="searchType">
										<option value="tcw"
											${cri.searchType eq 'tcw' ? 'selected' :'' }>전 체</option>
										<option value="t" ${cri.searchType eq 't' ? 'selected' :'' }>제
											목</option>
										<option value="c" ${cri.searchType eq 'c' ? 'selected' :'' }>내
											용</option>
									</select> 
									
									<input class="form-control" type="text" id="searchkeyword" name="keyword" placeholder="검색어를 입력하세요." size="20px;" value="${param.keyword }" /> 
									<span class="input-group-append">
										<button class="btn btn-dark" type="button" onclick="list_go(1);" data-card-widget="search">
											<i class="fa fa-fw fa-search"></i>
										</button>
									</span>
								</div>
							</div>
						</div>

						<!--               header end -->

						<div class="card-body">
							<div class="row">
								<div class="col-sm-12"
									style="margin-bottom: 10px; margin-top: 0px;">
									<div class="row">

										<div class="col-sm-3">

<%-- 											<c:if test="${category eq 'm' }"> --%>
												<button type="button" class="btn btn-dark btn-md"
													id="registBtn"
													onclick="OpenWindow('/manager/pds/registForm.do','자료등록',800,800);">자료등록</button>

<%-- 											</c:if> --%>


										</div>


										<div class="col-sm-3"></div>

										<div class="col-sm-6"></div>

									</div>
								</div>

								<div class="col-sm-12">
									<div class="card-body p-0">
										<table class="table table-hover table-bordered text-nowrap">
											<thead>
												<tr>
													<th style="width: 10%">NO</th>
													<th style="width: 15%">작성자</th>
													<th style="width: 40%">제목</th>
													<th>첨부파일</th>
													<th>날짜</th>
													<th style="width: 10%">조회수</th>
												</tr>
											</thead>

											<tbody id="searchResultTable">
												<c:if test="${empty pdsList}">
														<tr>
															<td colspan="6" class="text-center">
																해당 내용이 없습니다.
															</td>
														</tr>
													</c:if>
											
												<c:if test="${!empty pdsList}">
												<c:forEach items="${pdsList }" var="pds">
													<tr onclick="location.href='/common/pdsDetail.do?from=list&pdsId='+${pds.pdsId};" style="cursor: pointer">
														<td>${pds.pdsId }</td>
														<td class="managerDetail" data-id= "${pds.mngId}" style="height: 3vh; width: 8vh;"><strong>${pds.mngName }</strong></td>
														<td style="text-align:left;max-width: 120px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${pds.pdsTitle }</td>
														<td><c:if test="${!empty pds.attachList }">
																<i class="nav-icon fas fa-file"></i>
															</c:if> <c:if test="${empty pds.attachList }">
																<span>-</span>
															</c:if></td>
														<td><fmt:formatDate value="${pds.pdsWriteDate }"
																pattern="yyyy-MM-dd" /></td>
														<td>${pds.pdsViews }</td>
														<%--                              <td style="display: none;"><input type="hidden" id="loginUserId" name="loginUserId" value="${loginUser.id }"></td> --%>
													</tr>

												</c:forEach>
												</c:if>
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
									<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">

										<li	class="page-item ${pageMaker.cri.page == pageNum?'active':''}">
											<a class="page-link" href="javascript:list_go('${pageNum}');">${pageNum }</a>
										</li>
									</c:forEach>
									<li class="page-item">
										<a class="page-link" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page}');">
												<i class="fas fa-angle-right"></i>
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
							<input type='hidden' name="page" value="" /> 
							<input type='hidden' name="perPageNum" value="" /> 
							<input type='hidden' name="searchType" value="" /> 
							<input type='hidden' name="keyword" value="" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</c:if>

<!-- 학생, 부모 -->

<c:if test="${category eq 's' or category eq 'p' }">

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-sm-12">
					<div class="card card-light card-outline" id="form">

						<div class="card-header">
							<div style="margin-top: 5px;">
								<h3 class="card-title">
									<i class="fas fa-search" aria-hidden="true"></i> 자료리스트
								</h3>
							</div>
							
							<div id="keyword" class="card-tools" style="width: 450px;">
								<div class="input-group row">
									<select class="form-control col-md-3" name="perPageNum"
										id="perPageNum" onchange="list_go();">
										<option value="10" ${cri.perPageNum==10 ? 'selected' :'' }>정렬개수</option>
										<option value="20" ${cri.perPageNum==20 ? 'selected' :'' }>20개씩</option>
										<option value="30" ${cri.perPageNum==30 ? 'selected' :'' }>30개씩</option>
										<option value="50" ${cri.perPageNum==50 ? 'selected' :'' }>50개씩</option>

									</select> 
									<select class="form-control col-md-3" name="searchType"
										id="searchType">
										<option value="tcw"
											${cri.searchType eq 'tcw' ? 'selected' :'' }>전 체</option>
										<option value="t" ${cri.searchType eq 't' ? 'selected' :'' }>제
											목</option>
										<option value="c" ${cri.searchType eq 'c' ? 'selected' :'' }>내
											용</option>
									</select> 
									
									<input class="form-control" type="text" id="searchkeyword" name="keyword" placeholder="검색어를 입력하세요." size="20px;" value="${param.keyword }" /> 
									<span class="input-group-append">
										<button class="btn btn-light" type="button" onclick="list_go(1);" data-card-widget="search">
											<i class="fa fa-fw fa-search"></i>
										</button>
									</span>
								</div>
							</div>



						</div>

						<!--               header end -->

						<div class="card-body">
							<div class="row">
								<div class="col-sm-12"
									style="margin-bottom: 10px; margin-top: 0px;">
									<div class="row">

										<div class="col-sm-3">

<%-- 											<c:if test="${category eq 'm' }"> --%>
<!-- 												<button type="button" class="btn btn-light btn-md" id="registBtn" -->
<!-- 													onclick="OpenWindow('/manager/pds/registForm.do','자료등록',800,800);">자료등록</button> -->

<%-- 											</c:if> --%>


										</div>


										<div class="col-sm-3"></div>

										<div class="col-sm-6"></div>

									</div>
								</div>

								<div class="col-sm-12">
									<div class="card-body p-0">
										<table class="table table-hover table-bordered text-nowrap">
											<thead>
												<tr>
													<th style="width: 10%">NO</th>
													<th style="width: 15%">작성자</th>
													<th style="width: 40%">제목</th>
													<th>첨부파일</th>
													<th>날짜</th>
													<th style="width: 10%">조회수</th>
												</tr>
											</thead>

											<tbody id="searchResultTable">
												<c:if test="${empty pdsList}">
														<tr>
															<td colspan="6" class="text-center">
																해당 내용이 없습니다.
															</td>
														</tr>
													</c:if>
											
												<c:if test="${!empty pdsList}">
												<c:forEach items="${pdsList }" var="pds">
													<tr onclick="location.href='/common/pdsDetail.do?from=list&pdsId='+${pds.pdsId};" style="cursor: pointer">
														<td>${pds.pdsId }</td>
														<td>${pds.mngName }</td>
														<td>${pds.pdsTitle }</td>
														<td>
														    <c:if test="${!empty pds.attachList }">
																<i class="nav-icon fas fa-file"></i>
															</c:if> 
															<c:if test="${empty pds.attachList }">
																<span>-</span>
															</c:if>
														</td>
														<td><fmt:formatDate value="${pds.pdsWriteDate }" pattern="yyyy-MM-dd" /></td>
														<td>${pds.pdsViews }</td>
													</tr>
												</c:forEach>
												</c:if>
											</tbody>
										</table>
									</div>

								</div>
							</div>

						</div>

						<div class="card-footer">
							<nav aria-label="Navigation">
								<ul class="pagination justify-content-center m-0">
									<li class="page-item"><a class="page-link"
										href="javascript:list_go(1);"> <i
											class="fas fa-angle-double-left"></i>
									</a></li>
									<li class="page-item"><a class="page-link"
										href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page}');">
											<i class="fas fa-angle-left"></i>
									</a></li>
									<c:forEach var="pageNum" begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }">

										<li
											class="page-item ${pageMaker.cri.page == pageNum?'active':''}">
											<a class="page-link" href="javascript:list_go('${pageNum}');">${pageNum }</a>
										</li>

									</c:forEach>
									<li class="page-item"><a class="page-link"
										href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page}');">
											<i class="fas fa-angle-right"></i>
									</a></li>
									<li class="page-item"><a class="page-link"
										href="javascript:list_go('${pageMaker.realEndPage}');"> <i
											class="fas fa-angle-double-right"></i>
									</a></li>
								</ul>
							</nav>
						</div>

						<form id="jobForm">
							<input type='hidden' name="page" value="" /> <input
								type='hidden' name="perPageNum" value="" /> <input
								type='hidden' name="searchType" value="" /> <input
								type='hidden' name="keyword" value="" />
						</form>


					</div>

				</div>

			</div>
		</div>
	</section>
</c:if>



<script>
	window.onload=function(){
		
// 		 $('#load').hide();
setTimeout(function(){
	$('#load').hide();
},1000);
		
		setTimeout(function() {
			let searchKeyword = $("#searchkeyword").val();
			let searchResultTableStr = $("#searchResultTable").html();
			console.log(searchKeyword);
			if(!(searchKeyword == 'undefined' || searchKeyword=='')){
				let result = HighLightSearchResult($("searchResultTable"),searchResultTableStr,searchKeyword);
				$("#searchResultTable").html(result);
			}
		}, 200);
		
		
		$(".managerDetail").on("click",function(e){
	          e.stopImmediatePropagation(); 
	          let managerId = $(this).attr("data-id");
	          OpenWindow('/common/totalDetail.do?id='+managerId,'회원상세보기',600,400);
	          console.log(managerId);
	        });
	}
</script>


	<script>
		function list_go(page, url) {
			if (!url)
				url = "/common/pdsForm.do";

			var jobForm = $('#jobForm');

			jobForm.find("[name='page']").val(page);
			jobForm.find("[name='perPageNum']").val(
					$('select[name="perPageNum"]')
							.val());
			jobForm.find("[name='searchType']").val(
					$('select[name="searchType"]')
							.val());
			jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
					console.log(jobForm);
			jobForm.attr({
				action : url,
				method : 'get'
			}).submit();
		}
		
	</script>
    


</body>