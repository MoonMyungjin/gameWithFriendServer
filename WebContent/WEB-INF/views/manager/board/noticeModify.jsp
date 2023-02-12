<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
 <!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
</head>

<title>자료 수정</title>

<body>
	<!-- Main content -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-sm-12">
					<h1>공지 수정</h1>
				</div>
			</div>
		</div>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12" style="max-width: 960px;">
					<div class="card card-dark card-outline">
						<div class="card-header">
							<h3 class="card-title p-1">공지 수정</h3>
							<div class="card-tools">
								<button type="button" class="btn btn-dark" id="modifyBtn"
									onclick="modify_submit();">저장</button>
								&nbsp;&nbsp;
								
								<button type="button" class="btn btn-secondary" id="cancelBtn"
									onclick="history.go(-1);">취소</button>
							</div>
						</div>
						<!--end card-header  -->
						<!-- enctype="multipart/form-data" -->
						<form role="form" method="post" action="/manager/board/notice/modify.do" name="modifyForm">
							<input type="hidden" name="noticeId" value="${notice.noticeId }" />
						<div class="card-body pad">
							<div class="row">
								<div class="col-sm-12">
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="title">작성자</label>
											
												<input type="text" id="writer" value="${notice.mngId }"
													class="form-control" 
													readonly>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="title">날짜</label>
												<div><fmt:formatDate value="${notice.noticeRegdate }" pattern="yyyy-MM-dd" /></div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-sm-12">
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<label for="content">제목</label>
												<input type="text" id="title" value="${notice.noticeTitle }"
													name='noticeTitle' class="form-control">
											</div>
										</div>
									</div>
								</div>

								<div class="col-sm-12">
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<label for="content">내용</label> 
												<textarea id="content" name="noticeContent">${notice.noticeContent }</textarea>
											</div>
										</div>
									</div>
								</div>
								</div>
								</div>
								</form>

							</div>
						</div>

					
					
					</div>
				</div>

	</section>



	<script>
	window.onload=function(){
		summernote_go($('#content'));
	}
	
	
</script>
	<script>

	//submit =============================================
	function modify_submit(){
// 		alert("modify btn click");
		
		var form = $('form[name="modifyForm"]');
		//제목 유효성확인
		if($("input[name='title']").val()==""){
			alert(input.name+"은 필수입니다.");
			$("input[name='title']").focus();
			return;
		}
		
		 //파일 첨부확인
// 		var files = $('input[name="uploadFile"]');
// 		for(var file of files){
// 			console.log(file.name+" : "+file.value);
// 			if(file.value==""){
// 				alert("파일을 선택하세요.");
// 				file.focus();
// 				return false;
// 			}
// 		}	 
		
		form.submit();
	}
</script>



</body>












