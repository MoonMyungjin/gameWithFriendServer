<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<title>상세 보기</title>

<body>
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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

  <!-- Main content -->
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-sm-12">
			<c:if test="${category eq 'p' && category eq 's' }">
				<div class="card card-light card-outline card-info">
			</c:if>
			<c:if test="${category eq 'm'}">
				<div class="card card-dark card-outline card-info">
			</c:if>
					<div class="card-header">
						<div class="card-title" style="display: inline-block;">
							<label for="title">제목</label> &nbsp;&nbsp;&nbsp;&nbsp;
							<div style="display: inline-block;">${fn:replace(notice.noticeTitle, "제목" , "")}</div>
						</div>
						
						<div class="card-tools">
							<c:if test="${loginUser.id eq notice.mngId }">
							<button type="button" class="btn btn-dark" id="modifyBtn" onclick="modify_go(${notice.noticeId});">수 정</button>
             		 &nbsp;&nbsp;&nbsp;&nbsp;
            		<button type="button" class="btn btn-danger" id="removeBtn"
									onclick="remove_go('${notice.noticeId}');">삭 제</button>
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
											<label for="title">날짜</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<div style="display: inline-block;">
												<fmt:formatDate value="${notice.noticeRegdate }"
													pattern="yyyy-MM-dd" />
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										
									</div>
								</div>
							</div>



							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="content">내용
											</label>
											<a href="${notice.contentUrl }"  target="_blank" style="float: right;">원문보기</a> 
											<div>${fn:replace(notice.noticeContent, "qxad" , "<br>")}</div>
											
										</div>
										
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
						<button type="button" class="btn btn-sm btn-warning"  onclick="location.href='/manager/board/notice.do'">목록으로</button>
			</div>
			<!-- end col-md-12 -->
		</div>
		<!-- end row -->
		
		<div class="modifyForm" style="display: none;">
			<div class="col-sm-12">
			<c:if test="${category eq 'p' && category eq 's' }">
				<div class="card card-light card-outline card-info">
			</c:if>
			<c:if test="${category eq 'm'}">
				<div class="card card-dark card-outline card-info">
			</c:if>
					<div class="card-header">
						<div class="card-tools">
							<c:if test="${loginUser.id eq notice.mngId }">
							<button type="button" class="btn btn-dark" id="modifyGoBtn">수 정</button>
		             		 &nbsp;&nbsp;&nbsp;&nbsp;
		            		<button type="button" class="btn btn-secondary" id="cancelBtn">취 소</button>
							</c:if>

						</div>
					</div>
					<!--end card-header  -->
					<div class="card-body pad">
						<div class="row">
							<form id="submitBtn" role="form" method="post" action="/manager/board/notice/modify.do" name="modifyForm">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-6">
										<div class="card-title" style="display: inline-block;">
											<label for="title">제목</label> &nbsp;&nbsp;&nbsp;&nbsp;
											<div style="display: inline-block;"><input id="noticeTitle" name="noticeTitle" class="form-control" value="${notice.noticeTitle}"></div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="writer">작성자</label>&nbsp;&nbsp;&nbsp;&nbsp;
											<div style="display: inline-block;">${notice.mngName}</div>
											<input type="hidden" id="noticeId" name="noticeId" value="${notice.noticeId }">
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
											<div ><textarea id="noticeContent" name="noticeContent">${notice.noticeContent }</textarea></div>
										</div>
									</div>
								</div>
							</div>
							</form>
						</div>
					</div>
					<!--end card-body  -->
					<div class="card-footer" style="display: none">

					</div>
					<!--end card-footer  -->
				</div>
				<!-- end card -->
						<button type="button" class="btn btn-sm btn-warning" id="cancelBtn" onclick="location.href='/manager/board/notice.do'">목록으로</button>
			</div>
			<!-- end col-md-12 -->
		</div>
	</section>
	<!-- /.content -->

  <script>
  
  window.onload=function(){
	  summernote_go($('#noticeContent'),'<%=request.getContextPath()%>',500);		

    $("#cancelBtn").on("click",function(){
  		$(".justify-content-center").css("display","block");
  		$(".modifyForm").css("display","none");
  	 });	
    
    $("#modifyGoBtn").on("click",function(){
    	$("form[role='form']").submit();
//     	$("#submitBtn").submit();
  	 });	
	  	
  }
	  	</script>
	  	<script>
	  	
	  	 function modify_go() {
	  		$(".justify-content-center").css("display","none");
	  		$(".modifyForm").css("display","block");
//	       location.href = "/manager/board/noticeModify.do?noticeId=" + noticeId;
	    }
	  	 
	  	function remove_go(noticeId) {
	    	
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
				location.href = "/manager/board/notice/remove.do?noticeId="+noticeId;
			}
			
			});
	    } 
	  	</script>


</body>