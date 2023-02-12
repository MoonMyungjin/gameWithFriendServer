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
					<h1>자료 수정</h1>
				</div>
			</div>
		</div>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12" style="max-width: 960px;">
				<form enctype="multipart/form-data" role="form" method="post" action="/manager/pds/modify.do" name="modifyForm">
					<div class="col-sm-12">
<!-- 						본문 -->
					<div class="card card-dark card-outline card-info">
						<div class="card-header">
							<h3 class="card-title p-1">자료수정</h3>
							<div class="card-tools">
								<button type="button" class="btn btn-dark" id="modifyBtn" onclick="modify_submit();">확 인</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-warning" id="cancelBtn" onclick="history.go(-1);">취소</button>
							</div>
						</div>
						<div class="card-body pad">
								<div class="row">
									<div class="col-sm-12">
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<label for="title">작성자</label> 
													<input type="hidden" name="pdsId" value="${pds.pdsId }" />
													<input type="text" id="writer" value="${pds.mngName }" class="form-control" readonly>
												</div>
											</div>
											
											<div class="col-sm-6">
												<div class="form-group">
													<label for="title">날짜</label>
													<div>
														<fmt:formatDate value="${pds.pdsWriteDate }" pattern="yyyy-MM-dd" /> 
													</div>
												</div>
											</div>
										</div>
									</div>


									<div class="col-sm-12">
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
													<label for="content">제목</label> <input type="text" id="title" value="${pds.pdsTitle }" name='pdsTitle' class="form-control">
												</div>
											</div>
										</div>
									</div>

									<div class="col-sm-12">
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
													<label for="content">내용</label>
													<textarea id="content" name="pdsContent">${pds.pdsContent }</textarea>
												</div>
											</div>
										</div>
									</div>
									
								</div>
<!-- 								row end -->
						</div>
<!-- 						body end -->
					</div>
<!-- 					card end -->
					</div>
					
					
					<div class="col-sm-12">
<!-- 					파일 -->
						<div class="form-group">
							<div class="card card-outline card-dark">
							
							
								<div class="card-header">
									<h5 class="card-title p-1" style="display: inline;">첨부파일 :</h5>
									<h5 style="display: inline; line-height: 30px;">첨부파일 :</h5>
									&nbsp;&nbsp;
									<button class="btn btn-sm btn-dark" onclick="addFile_go()" type="button" id="addFileBtn">Add File</button>
								</div>
								
								<div class="card-body fileInput">
									<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
										<c:forEach items="${pds.attachList }" var="attach">
											<li class="attach-item thumb${attach.attachId }" attachName="${attach.attachName }" target-attachId="${attach.attachId }" data-attachGroupId="${attach.attachGroupId }">
												<div class="mailbox-attachment-info">
													<a class="mailbox-attachment-name" id="downFile" name="attachedFile" data-path="${attach.attachPath }" data-originName="${attach.attachOrigin }" attach-attachName="${attach.attachName }" attach-attachId="${attach.attachId }">
														<i class="fas fa-paperclip"></i> 
															${attach.attachName }&nbsp;&nbsp;
														<button type="button" onclick="removeFile_go('thumb${attach.attachId}');return false;" style="border: 0; outline: 0;" class="badge bg-red">X</button>
													</a>
												</div>
											</li>
										</c:forEach>
									</ul>
									<br />
								</div>
<!-- 								footer end -->
							</div>
						</div>
<!-- 						form group end -->
					</div>
					</form>
				</div>
			</div>
	</div>
	</section>		

	<script>
	window.onload=function(){
		summernote_go($('#content'));
		
		 $(document).on("click","#downFile",function(){
	 		  console.log(this);
	  		download_go($(this));
	  	});
		 
		    function download_go(obj){
		 		console.log(obj[0]);
				
				let attachName = obj.attr("data-originName");
				let attachPath = obj.attr("data-path");
				
				location.href = "/download.do?attachName="+attachName+"&attachPath="+attachPath;
				
			}
	}
	
	
</script>
	<script>
	function removeFile_go(className){
		
		//alert("X btn click");
		var li = $('li.'+className);
		if(!confirm(li.attr("attachName")+"을 정말 삭제하시겠습니까?")){
			return;
		}    			
		li.remove();
		
		var input=$('<input>').attr({"type":"hidden",
									 "name":"deleteFile",
									 "value":li.attr("target-attachId") + "&" + li.attr("data-attachGroupId")
			}); 
		$('form[role="form"]').prepend(input);
	}
	
	var dataNum=0;    	
	function addFile_go(){
		//alert("click add file btn");
		
		var attachedFile=$('a[name="attachedFile"]').length; //기존파일
		var inputFile=$('input[name="uploadFile"]').length;	 //추가된 파일
		var attachCount=attachedFile+inputFile; //기존파일 + 추가된파일 개수
		
		if(attachCount >=5){
			alert("파일추가는 5개까지만 가능합니다.");
			return;
		}
		
		var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
		
		div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");    		   		
		$('.fileInput').append(div);
		
		dataNum++;
		
	}
	
	function remove_go(dataNum){
		$('div[data-no="'+dataNum+'"]').remove();
	}
	
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
		var files = $('input[name="uploadFile"]');
		for(var file of files){
			console.log(file.name+" : "+file.value);
			if(file.value==""){
				alert("파일을 선택하세요.");
				file.focus();
				return false;
			}
		}	 
		
		form.submit();
	}
</script>



</body>












