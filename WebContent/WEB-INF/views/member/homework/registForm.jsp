<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<meta charset="UTF-8">
<title></title>
<style>
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
	}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	}
	/* named upload */
	.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
	}


</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
</head>
<body>
<section class="content-header">
   <div class="container-fluid">
   </div>
</section>
<section class="content">
   <div class="card-header">
      <div class="row">
      	<div class="col-sm-12">
      		<div class="card card-outline card-light">
					<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
		 				<div class="row">
			               <h3 class="card-title">
								<i class="fa-solid fa-file-signature" aria-hidden="true"></i>
								&nbsp;
								과제제출&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						   </h3>
		 				</div>
			               <div class="card-tools" style="margin: 0;">
			                  <div class="row">
			                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
									<div class="input-group-append">
										<c:if test="${btnName eq '1'}">
											<button class="btn btn-light formSubmitBtn" id="formSubmitBtn" type="submit">
												작성완료
											</button>
						               </c:if>
										<c:if test="${btnName eq '2'}">
											<button class="btn btn-light formSubmitBtn" id="formSubmitBtn" type="submit">
												수정하기
											</button>
						               </c:if>
										<button id="cancelBtn" type="submit" class="btn btn-secondary" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											취소
										</button>
									</div>
								</div>
							  </div>
			               </div>
			            </div>
		            <form enctype="multipart/form-data" role="form" method="post" action="/member/homework/studentRegist.do" name="registForm">
						<div class="card-body">
							<div class="row table1">
								<div class="card-body p-0">
									<table id="example1" class="table table-bordered dataTable dtr-inline" style="text-align : center">
										<tr>
											<td>과제명</td>
											<td colspan="3">${homeworkVO.hwkName }</td>
										</tr>
									</table>
									<textarea id="givenHwkContent" name="givenHwkContent" class="form-control" rows="15" cols="">
									${homeworkVO.givenHwkContent }
									</textarea>
								</div>
							</div>
							<div>
								<c:forEach items="${attachFileList}" var="fileList">
									<div class="row">
										<div class="appendList" style="text-align:left;">
											<span>
												<a class="link-black text-sm" data-attachName="${fileList.attachName}" data-attachPath="${fileList.attachPath}">
												<i class="fas fa-link mr-1"></i>${fn:split(fileList.attachName,'$$')[1]}</a>
												<button data-attachGroupId="${fileList.attachGroupId}" data-attachId="${fileList.attachId}" onclick="remove_old($(this));" style="border:0;outline:0;" class="badge bg-red" type="button">X</button>
											</span>
										</div>
									</div>
								</c:forEach>
									<div class="col-sm-1">
									  <button id="fileAddBtn" type="button" class="btn btn-block btn-light"><i class="fas fa-plus"></i></button>
									</div>
							</div>
						</div>
						<input type="hidden" id="hwkId" name="hwkId">
						<input type="hidden" id="hwkIsComplete" name="hwkIsComplete">
						<input type="hidden" id="givenHwkBadge" name="givenHwkBadge">
						<input type="hidden" id="studentId" name="studentId">
					</form>
				</div>
			</div>
      </div>
   </div>
   
   <div class="card-body">
   
   </div>
   <div class="card-footer">
   </div>
   <div id="userId" style="display: none;">
   		${loginUser.id }
   </div>
   <div style="display: none;" id="homeworkInfo" data-hwkId=${homeworkVO.hwkId } data-hwkDuedate="${homeworkVO.hwkDuedate}" data-btnName="${btnName }" style="display: none;">
   		
   </div>
   
</section>
<script>
 	window.onload=function(){
 		
 		renderFileTag();
		
 		summernote_go($('#givenHwkContent'),'<%=request.getContextPath()%>');	
 		
 		$("#fileAddBtn").on("click",function(){
 			renderFileInput($(this));
 		});
 		
 		$("#cancelBtn").on("click",function(){
 			window.close();
 		});
 		$(".formSubmitBtn").on("click",function(){
 			regist_go();
 		});
 		$(document).on("click",".text-sm",function(){
    		download_go($(this));
    	});
   }
</script>
<script>
function renderFileTag(){
	 $(document).on('change','.filebox .upload-hidden', function(){// 값이 변경되면
	  if(window.FileReader){// modern browser
		 var filename = $(this)[0].files[0].name;
	 } else {// old IE	 
		 var filename = $(this).val().split('/').pop().split('\\').pop();// 파일명만 추출 
	 }// 추출한 파일명 삽입
	  $(this).siblings('.upload-name').val(filename);
	 });
}
</script>
<script>
	function renderFileInput(obj){
		
		if($('.filebox').length >=5){
			alert("파일추가는 5개까지만 가능합니다.");
			return;
		}
		
		let fileInput = `<div class="row" ><div class="filebox" > <input class="upload-name" value="파일선택" disabled="disabled"> <label for='uploadFile'>업로드</label> <input type="file" id="uploadFile" name="uploadFile" class="upload-hidden"><button onclick="remove_go($(this));" style="border:0;outline:0;" class="badge bg-red" type="button">X</button></div></div>`;
		obj.parent().parent().prepend(fileInput);
	}
	
	function remove_go(obj){
		console.log(obj);
		obj.parent().remove();
	}
	
	
</script>
<script>
function regist_go(){
	
	$("#hwkId").val($("#homeworkInfo").attr("data-hwkId"));
	$("#studentId").val($("#userId").text().trim());
	
	let comparisonTarget = $("#homeworkInfo").attr("data-hwkDuedate").replace("T"," ");
	let today = moment();
	let comparisonVal = moment(comparisonTarget, "YYYYMMDD hh:mm");
	let val = comparisonVal.diff(today);
	if(val<0){
		$("#hwkIsComplete").val("지연");
		$("#givenHwkBadge").val("badge bg-secondary");
	}
	if(val>0){
		$("#hwkIsComplete").val("대기");
		$("#givenHwkBadge").val("badge bg-info");
	}
	
	var files = $('input[name="uploadFile"]');
	for(var file of files){
		console.log(file.name+" : "+file.value);
		if(file.value==""){
			alert("파일을 선택하세요.");
			file.focus();
			file.click();
			return;
		}
	}	
	
	if($("input[name='title']").val()==""){ //form.title.value
		alert("제목은 필수입니다.");
		$("input[name='title']").focus();
		return;
	}
	
	$("form[role='form']").submit();
	
}

</script>
<script>
	function download_go(obj){
		
		let attachName = obj.attr("data-attachname");
		let attachPath = obj.attr("data-attachpath");
		
		location.href = "/download.do?attachName="+attachName+"&attachPath="+attachPath;
		
	}
	function remove_old(obj){
		obj.parent().remove();
		
		var input=$('<input>').attr({"type":"hidden",
									 "name":"deleteFile",
									 "value":obj.attr("data-attachgroupId")+"&"+obj.attr("data-attachId")
										});
		$('form[role="form"]').prepend(input);
	}
</script>

</body>
</html>