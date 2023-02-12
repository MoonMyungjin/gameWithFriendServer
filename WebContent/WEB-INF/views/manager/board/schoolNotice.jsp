<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="noticeList" value="${dataMap.noticeList }" /> 
<c:set var= "category" value="${category }" />

<head>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>

<body>



	<!-- Main content -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-10" style="display: flex;">
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
				<c:if test="${category eq 'm' }"> 
					<button type="button" class="btn btn-dark btn-smx"
							id="registBtn"
							style="width: 11vh; height: 5vh; font-size: .875rem;"
							onclick="OpenWindow('/manager/board/notice/registForm.do','게시물 등록',800,700);">공지 등록</button>
			</c:if> 
			</div>
		</div>
	</section>


	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">

			<div class="row" style="">
				<div class="col-sm-12">
					<div class="card card-light card-outline" >
						<div class="card-header" style="border-bottom-color: white; height: 50px;">
							<div class="row" >
								<div class="col-sm-6">
										<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="custom-tabs-one-home-tab" data-toggle="pill"
									href="#custom-tabs-one-home" role="tab"
									aria-controls="custom-tabs-one-home" aria-selected="true" >학원</a></li>
								
								<li class="nav-item"><a class="nav-link"
									id="custom-tabs-one-profile-tab" data-toggle="pill"
									href="#custom-tabs-one-profile" role="tab"
									aria-controls="custom-tabs-one-profile" aria-selected="false">학교</a>
								</li>
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
											<input class="form-control" type="text" name="keyword"
												placeholder="검색어를 입력하세요." size="20px;" value="${param.keyword }" /> <span
												class="input-group-append">
												<button class="btn btn-dark" type="button"
													onclick="list_go(1);" data-card-widget="search">
													<i class="fa fa-fw fa-search"></i>
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="card-body">
						<div class="tab-content" id="custom-tabs-one-tabContent">
						<div class="tab-pane fade active show table1" id="custom-tabs-one-home"
						role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">

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
                   <tbody>
                   <c:forEach items="${noticeList}" var="notice">
                    <tr
					 	onclick="location.href='/manager/board/notice/modify.do?from=list&noticeId='+${notice.noticeId};"
						style="cursor: pointer">
                     <td>${notice.noticeId}</td>
                     <td>${notice.mngName}</td>
                     <td>${notice.noticeTitle}</td>
                     <td><fmt:formatDate value="${notice.noticeRegdate }" pattern="yyyy-MM-dd" /></td>
                    </tr>
                    </c:forEach>
                   </tbody>
                   
                   
                   
                   </table>
                   
                   
                   
                 </div>
                  
                  
<%-- 
							<div class="col-12" id="accordion">
							<c:forEach items="${noticeList }" var="notice">
								<div class="card card-outline">
									<a class="d-block w-100 collapsed" data-toggle="collapse"
										href="#abc${notice.noticeId }" aria-expanded="false">
										<div class="card-header">
										
										
										<div class="row">
								    	<div class="col-sm-8">
								    	
											<h4 class="card-title w-100" style="color: black;">${notice.noticeTitle}
										</h4>
										</div>
										<div class="col-sm-2">
										<h4 class="card-title w-100" style="color: black;">
										<fmt:formatDate value="${notice.noticeRegdate }" pattern="yyyy-MM-dd" /></h4>
										</div>
										<div class="col-sm-2">
										<h4 class="card-title w-100" style="color: black;">${notice.mngName}</h4>
										</div>
										</div>
											</div>
											
									</a>
									<div id="abc${notice.noticeId }"  class="collapse" data-parent="#accordion"
										style="">
										<div class="card-body"> ${notice.noticeContent }
												     <br>
												     <div class="row">
												     <div class="col-sm-10">
												     </div>
												     <div class="col-sm-2">
											    	<button type="button" id="modifyBtn" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;" onclick="modify_go('${notice.noticeId}');">
										                                수정
										            </button>
										          <button type="button" id="removeBtn" class="btn btn-danger" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;" onclick="remove_go('${notice.noticeId}');">
											                        삭제
									             	</button>
									             	  </div>
												</div>
												 </div>
												
									</div>
								</div>
							
	                        	</c:forEach>
							</div> --%>
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
								    	alert("수정되었습니다.");
								    </c:if>


						 	  	<c:if test = "${from eq 'remove' }" >
									    alert("삭제되었습니다.");
									  	window.close();
									  	window.opener.location.reload(); 
								    </c:if>

								
							</script>
				
						<div class="col-sm-2"></div>
					</div>
				</div>
			</div>

		</div>

	</section>




<!--  학교 텝 -->
	    <div class="tab-pane fade table1" id="custom-tabs-one-profile"
			role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
				<div class="row">
			            
					 </div>
		</div>

</body>
