<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<title>상세 보기</title>

<body>
  <!-- Main content -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-sm-12">
          <h1></h1>
        </div>
      </div>
    </div>
  </section>



<c:if test="${category eq 'm' }">
  <!-- Main content -->
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-sm-12">
				<div class="card card-dark card-outline card-info">
					<div class="card-header">
						<div class="card-title" style="display: inline-block;">
							<label for="title">제목</label> &nbsp;&nbsp;&nbsp;&nbsp;
							<div>${pds.pdsTitle }</div>
						</div>
						
						<div class="card-tools">

							<c:if test="${loginUser.id eq pds.mngId }">
								<button type="button" class="btn btn-dark" id="modifyBtn"
									onclick="modify_go(${pds.pdsId});">수 정</button>
             	 &nbsp;&nbsp;&nbsp;&nbsp;
            	<button type="button" class="btn btn-danger" id="removeBtn"
									onclick="remove_go('${pds.pdsId}');">삭 제</button>
							</c:if>

						</div>
					</div>
					<!--end card-header  -->
					<div class="card-body pad">
						<div class="row">

							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="writer">작성자</label>
											<div>${pds.mngName }</div>
											<%-- 											<input type="text" id="title" value="${notice.title }" name='title' class="form-control" placeholder="000" readonly> --%>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="title">날짜</label>
											<div>
												<fmt:formatDate value="${pds.pdsWriteDate }"
													pattern="yyyy-MM-dd" />
											</div>
											<%-- 											<input type="text" id="title" value="${notice.title }" name='title' class="form-control" placeholder="000" readonly> --%>
										</div>
									</div>
								</div>
							</div>

							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="content">첨부파일</label>
											<c:forEach items="${pds.attachList }" var="attach">
												<div class="col-md-4 col-sm-4 col-xs-12" style="cursor: pointer;">
													<div class="info-box">
														<span class="info-box-icon bg-yellow"> <i
															class="fa fa-copy"></i>
														</span>
														<div class="info-box-content">
															<span class="info-box-text"> 
																<fmt:formatDate value="${attach.attachDate }" pattern="yyyy-MM-dd" />
															</span> 
															<span id="downFile" data-originName="${attach.attachOrigin }" data-path="${attach.attachPath }" class="info-box-number">${attach.attachName }</span>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>



							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="content">내용</label> 
<%-- 											<input type="text" id="content" value="${pds.pdsContent }" name='content' class="form-control" readonly /> --%>
											<div>${pds.pdsContent }</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!--end card-body  -->
					<div class="card-footer" style="display: none">

					</div>
					<!--end card-footer  -->
				</div>
				<!-- end card -->
						<button type="button" class="btn btn-sm btn-warning" id="cancelBtn" onclick="location.href='/common/pdsForm.do'">목록으로</button>
			</div>
			<!-- end col-md-12 -->
		</div>
		<!-- end row -->
	</section>
	<!-- /.content -->
</c:if>


<!-- 학생, 학부모 -->
<c:if test="${category eq 's' or category eq 'p' }">
  <!-- Main content -->
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-sm-12">
				<div class="card card-light card-outline card-info">
					<div class="card-header">
						<div class="card-title" style="display: inline-block;">
							<label for="title">제목</label> &nbsp;&nbsp;&nbsp;&nbsp;
							<div>${pds.pdsTitle }</div>
						</div>
						
						<div class="card-tools">
							<c:if test="${loginUser.id eq pds.mngId }">
								<button type="button" class="btn btn-light" id="modifyBtn" onclick="modify_go(${pds.pdsId});">수 정</button>
             	 					&nbsp;&nbsp;&nbsp;&nbsp;
            					<button type="button" class="btn btn-danger" id="removeBtn" onclick="remove_go('${pds.pdsId}');">삭 제</button>
							</c:if>
						</div>
					</div>
					<!--end card-header  -->
					<div class="card-body pad">
						<div class="row">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="writer">작성자</label>
											<div style="cursor: pointer;"><strong>${pds.mngName }</strong></div>
											<%-- 											<input type="text" id="title" value="${notice.title }" name='title' class="form-control" placeholder="000" readonly> --%>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="title">날짜</label>
											<div>
												<fmt:formatDate value="${pds.pdsWriteDate }"
													pattern="yyyy-MM-dd" />
											</div>
											<%-- 											<input type="text" id="title" value="${notice.title }" name='title' class="form-control" placeholder="000" readonly> --%>
										</div>
									</div>
								</div>
							</div>

							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="content">첨부파일</label>
											<c:forEach items="${pds.attachList }" var="attach">
												<div class="col-md-4 col-sm-4 col-xs-12" style="cursor: pointer;">
													<div class="info-box">
														<span class="info-box-icon bg-yellow"> <i
															class="fa fa-copy"></i>
														</span>
														<div class="info-box-content">
															<span class="info-box-text"> 
																<fmt:formatDate value="${attach.attachDate }" pattern="yyyy-MM-dd" />
															</span> 
															<span id="downFile" data-originName="${attach.attachOrigin }" data-path="${attach.attachPath }" class="info-box-number">${attach.attachName }</span>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>



							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="content">내용</label> 
<%-- 											<input type="text" id="content" value="${pds.pdsContent }" name='content' class="form-control" readonly /> --%>
											<div>${pds.pdsContent }</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!--end card-body  -->
					<div class="card-footer" style="display: none">

					</div>
					<!--end card-footer  -->
				</div>
				<!-- end card -->
						<button type="button" class="btn btn-sm btn-warning" id="cancelBtn" onclick="location.href='/common/pdsForm.do'">목록으로</button>
			</div>
			<!-- end col-md-12 -->
		</div>
		<!-- end row -->
	</section>
	<!-- /.content -->
</c:if>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <script>
  
  window.onload=function(){
	  $(document).on("click","#downFile",function(){
// 		  console.log(this);
  		download_go($(this));
  	});
  }
  
  
  function modify_go(pdsId) {
      location.href = "/manager/pds/modifyForm.do?pdsId=" + pdsId;
    }

  
  
    function remove_go(pdsId) {
    	
    	Swal.fire({
			title: '정말 삭제 하시겠습니까?',
			text: '',
			icon: 'warning',
			showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			confirmButtonText: '승인', // confirm 버튼 텍스트 지정
			cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		 // 버튼 순서 거꾸로
		}).then(result => {
		// 만약 Promise리턴을 받으면,
		if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
		Swal.fire('완료되었습니다.', '삭제완료!', 'success');
		    	 setTimeout(function() {
		          		window.close();
			      		location.href = "/manager/pds/remove.do?pdsId=" + pdsId;
		          		window.opener.location.reload(); 
		 	}, 1300);  	
		
		}
		});
    } 
    
    function download_go(obj){
// 		console.log(obj[0]);
		
		let attachName = obj.attr("data-originName");
		let attachPath = obj.attr("data-path");
		
		location.href = "/download.do?attachName="+attachName+"&attachPath="+attachPath;
		
	}
    
 </script>

</body>