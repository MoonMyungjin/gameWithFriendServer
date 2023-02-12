<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">

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
 <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
</head>
<c:choose>
	<c:when test="${empty from}">
		<title>답장</title> 
	</c:when>
	<c:when test="${not empty from}">
		<title>쪽지 쓰기</title> 
	</c:when>
</c:choose>

<body> 
   <!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
      	<c:choose>
			<c:when test="${empty from}">
				<h1>답장</h1>
			</c:when>
			<c:when test="${not empty from}">
				<h1>쪽지 쓰기</h1>
			</c:when>
		</c:choose>
   	 </div>
    </div>
  </div>
</section>



<!-- 매니저 -->
<c:if test="${category eq 'm' }">
<section class="content container-fluid">
  <div class="row">
    <div class="col-sm-12">
      <div class="card card-dark card-outline card-info">
        <div class="card-header">
          <div class="card-title" style="display: inline-block; margin-top: 3px;">
          	<c:choose>
				<c:when test="${empty from}">
					<h5>답장</h5>
				</c:when>
				<c:when test="${not empty from}">
					<h5>쪽지 쓰기</h5>
				</c:when>
			</c:choose>

          </div>
          <div class="card-tools">
            <button type="button" class="btn btn-sm btn-dark" id="registBtn">보내기</button>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-sm btn-secondary" id="cancelBtn" onclick="CloseWindow();">취 소</button>
          </div>
        </div>
        <!--end card-header  -->
        <div class="card-body">
<!--           <form role="form" method="post" action="/common/noteReply.do" name="registForm"> -->

            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="writer">보내는 사람</label>
                  <input type="text" id="writer" readonly name="writer" class="form-control" value="${loginUser.id }" style="width: 80%;">
                </div>
              </div>

              <div class="col-sm-6">
              	<div class="form-group">
                  <label for="writer">받는 사람</label>
                  <input type="text" id="noteSendUserId" readonly name="noteSendUserId" class="form-control" value="${noteSendUserId }" style="width: 80%;">
                </div>
               
              </div>
            </div>


            <div class="form-group">
              <label for="title">제 목</label>
              <c:choose>
				<c:when test="${empty from}">
        		    <input type="text" id="title" name='title' class="form-control" placeholder="제목을 쓰세요" value="[답장]" style="text-align: left;">
				</c:when>
				<c:when test="${not empty from}">
		            <input type="text" id="title" name='title' class="form-control" placeholder="제목을 쓰세요" value="">
				</c:when>
			</c:choose>
            </div>

            <div class="form-group">
              <label for="content">내 용</label>
              <textarea class="form-control" name="content" id="content" rows="5" placeholder="1000자 내외로 작성하세요."></textarea>
            </div>
<!--           </form> -->
        </div>
        <!--end card-body  -->
      </div><!-- end col-md-12 -->
    </div><!-- end row -->
  </div>

</section>
</c:if>


<c:if test="${category eq 's' or category eq 'p' }">
<section class="content container-fluid">
  <div class="row">
    <div class="col-sm-12">
      <div class="card card-light card-outline card-info">
        <div class="card-header">
          <div class="card-title" style="display: inline-block; margin-top: 3px;">
          	<c:choose>
				<c:when test="${empty from}">
					<h5>답장</h5>
				</c:when>
				<c:when test="${not empty from}">
					<h5>쪽지 쓰기</h5>
				</c:when>
			</c:choose>

          </div>
          <div class="card-tools">
            <button type="button" class="btn btn-sm btn-light" id="registBtn">보내기</button>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-sm btn-secondary" id="cancelBtn" onclick="CloseWindow();">취 소</button>
          </div>
        </div>
        <!--end card-header  -->
        <div class="card-body">
<!--           <form role="form" method="post" action="/common/noteReply.do" name="registForm"> -->

            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="writer">보내는 사람</label>
                  <input type="text" id="writer" readonly name="writer" class="form-control" value="${loginUser.id }" style="width: 80%;">
                </div>
              </div>

              <div class="col-sm-6">
              	<div class="form-group">
                  <label for="writer">받는 사람</label>
                  <input type="text" id="noteSendUserId" readonly name="noteSendUserId" class="form-control" value="${noteSendUserId }" style="width: 80%;">
                </div>
               
              </div>
            </div>


            <div class="form-group">
              <label for="title">제 목</label>
              <c:choose>
				<c:when test="${empty from}">
        		    <input type="text" id="title" name='title' class="form-control" placeholder="제목을 쓰세요" value="[답장]" style="text-align: left;">
				</c:when>
				<c:when test="${not empty from}">
		            <input type="text" id="title" name='title' class="form-control" placeholder="제목을 쓰세요" value="">
				</c:when>
			</c:choose>
            </div>

            <div class="form-group">
              <label for="content">내 용</label>
              <textarea class="form-control" name="content" id="content" rows="5" placeholder="1000자 내외로 작성하세요."></textarea>
            </div>
<!--           </form> -->
        </div>
        <!--end card-body  -->
      </div><!-- end col-md-12 -->
    </div><!-- end row -->
  </div>

</section>
</c:if>

 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
 <script>
 window.onload=function(){
		summernote_go($('#content'),'<%=request.getContextPath()%>');		
		
	 $("#registBtn").click(function(){
// 		 var rightTrs = [];
// 		 var rightIds = [];
		
// 		alert("aaa");
		 
		 var title = $("#title").val();
		 var content = $("#content").val();
		 var writer = $("#writer").val();
		 var noteSendUserId = $("#noteSendUserId").val();
		 
		 console.log(writer);
		 console.log(noteSendUserId);
		 console.log(title);
		 console.log(content);
		 
		 
		 let noteInfoArr = new Array();
		 
		 

		 
// 		 for (var i=0; i<rightTrs[1].length; i++) {
			 let noteInfo = new Object();	// vo
			 noteInfo.title = title;
			 noteInfo.content = content;
			 noteInfo.receiveUser = noteSendUserId;
			 noteInfo.loginUserId = writer;
			 noteInfoArr.push(noteInfo);
// 		 }
		
		console.log(noteInfoArr);
		
		let dataItem = {
				userList : noteInfoArr
		};
		
		console.log(dataItem); 
		dataItem = JSON.stringify(dataItem);
		 	
		 	$.ajax({
	        type: "post"
	       ,url : "/noteReply.do"
	       ,contentType: 'application/json'
	       ,data : dataItem
	       ,success : function (data){
	    	  
	    	   Swal.fire({
	    	        icon: 'success',
	    	        title: '완료!',
	    	        text: '답장을 보냈습니다!',
	    	    });
	    	    
	    	    setTimeout(function() {
	    			window.close();
	    			window.opener.location.reload(true);
	    	}, 1300);


	        }
	       ,error : function(e){
	        }
		});   	
	 });
	 
 
	}	
</script>
</body>






