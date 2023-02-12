<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
 
<head>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">

<style>
	
</style>

</head>

<title>자료등록</title> 

<body> 
   <!-- Content Header (Page header) -->
    <section class="content-header">
    	<div class="container-fluid">
    		<div class="row mb-2">
    			<div class="col-sm-6">
	      			<h1>자료등록</h1>
	      		</div>	      		
	    	
	       		
<!-- 	       		<div class="col-sm-6"> -->
<!-- 			      <ol class="breadcrumb float-sm-right"> -->
<!-- 			        <li class="breadcrumb-item"><a href="list.do"><i class="fa fa-dashboard"></i>학습자료실</a></li> -->
<!-- 			        <li class="breadcrumb-item active">자료등록</li>		         -->
<!-- 			      </ol> -->
<!-- 		      	</div> -->
	     	</div>	     	
      	</div>
    </section>


    <section class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-dark card-outline">
					<div class="card-header">
						<h5>자료등록</h5>
					</div><!--end card-header  -->
					<div class="card-body">
<!-- 					enctype="multipart/form-data" -->
						<form enctype="multipart/form-data" role="form" method="post" action="/manager/pds/regist.do" name="registForm">
<!-- 							<div class="form-group"> -->
<!-- 								<label for="mngId">작성자</label>  -->
								<input type="text" id="mngId" style="display: none;"
									name="mngId" class="form-control" value="${loginUser.id }">
<!-- 							</div> -->
							
							<div class="form-group">
								<label for="title">제 목</label> 
								<input type="text" id="title"
									name='pdsTitle' class="form-control" placeholder="제목을 쓰세요">
							</div>
							<div class="form-group">
								<label for="content">내 용</label>
								<textarea class="form-control" name="pdsContent" id="content" rows="5"
									placeholder="1000자 내외로 작성하세요."></textarea>
							</div>
							<div class="form-group">								
								<div class="card card-outline card-dark">
									<div class="card-header">
										<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>
										&nbsp;&nbsp;
										<button class="btn btn-xs btn-dark" onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
									</div>									
									<div class="card-footer fileInput">
									</div>
								</div>
							</div>
						</form>
					</div><!--end card-body  -->
					<div class="card-footer">
						<button type="button" class="btn btn-dark" id="registBtn" onclick="regist_go();">등 록</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-secondary" id="cancelBtn" onclick="CloseWindow();">취 소</button>
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
	

<script>
	window.onload=function(){
		summernote_go($('#content'),'<%=request.getContextPath()%>');		
	}	
	
	
</script>    
 
<script>
var dataNum=0;

function addFile_go(){
	//alert('add file btn');
	
	if($('input[name="uploadFile"]').length >=5){
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

function regist_go(){
// 	alert("regist btn click");
	
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
	
	$("form[role='form']").submit()

	
}

</script> 
    
</body>






