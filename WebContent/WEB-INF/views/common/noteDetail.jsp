0<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head></head>

<title>상세 보기</title>

<body>
  <!-- Main content -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row">
<!--       	<div class="col-sm-1"></div> -->
<!--         <div class="col-sm-10"> -->
<!--           <h1>상세 보기</h1> -->
<!--         </div> -->
<!--         <div class="col-sm-1"></div> -->
      </div>
    </div>
  </section>


<c:if test="${category eq 'm' }">
  <!-- Main content -->
  <section class="content container-fluid">
    <div class="row justify-content-center">
      <div class="col-md-9" style="max-width:960px;">
        <div class="card card-outline card-dark">
          <div class="card-header">
            <h3 class="card-title p-1" style="margin-top: 5px;">상세보기</h3>
            <div class="card-tools">
              <button type="button" class="btn btn-dark" id="replyBtn" onclick="reply_go('${note.noteSendUserId}')">답장</button>
              &nbsp;&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-danger" id="removeBtn" onclick="remove_go('${note.noteId}');">삭 제</button>
              &nbsp;&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-secondary" id="cancelBtn" onclick="CloseWindow();">취 소</button>
            </div>
          </div>
          <!--end card-header  -->
          <div class="card-body pad">
			<div class="row">
			
			<div class="col-sm-6">
	            <div class="form-group">
	              <label for="title">날짜</label>
	              <div id="date" name="date">
	              	<fmt:formatDate value="${note.noteSendDate}" pattern="yy-MM-dd hh:mm:ss" />
<!-- 	              	<div style="display: none;">$</div> -->
	              </div>
	            </div>
			</div>

			<div class="col-sm-6">
	            <div class="form-group">
	              <label for="writer">보낸 사람</label>
	              <div id="writer" name="writer">${note.noteSendUserName }</div>
	            </div>
			</div>
           
           <div class="col-sm-12">
	            <div class="form-group">
	              <label for="content">제목</label>
	              <div>${note.noteTitle }</div>
	            </div>
            </div>
            
             <div class="col-sm-12">
	            <div class="form-group">
	              <label for="content">내용</label>
	              <div>${note.noteContent }</div>
	            </div>
            </div>
            
            <div style="display: none;">
            	 <input type="hidden" name="loginUserId" value="${loginUser.id }">
            </div>
            
		</div>
          </div>
          <!--end card-body  -->
          <div class="card-footer" style="display:none">

          </div>
          <!--end card-footer  -->
        </div><!-- end card -->
      </div><!-- end col-md-12 -->
    </div><!-- end row -->
  </section>
  <!-- /.content -->
</c:if>


<c:if test="${category eq 's' or category eq 'p' }">
  <!-- Main content -->
  <section class="content container-fluid">
    <div class="row justify-content-center">
      <div class="col-md-9" style="max-width:960px;">
        <div class="card card-outline card-light">
          <div class="card-header">
            <h3 class="card-title p-1" style="margin-top: 5px;">상세보기</h3>
            <div class="card-tools">
              <button type="button" class="btn btn-light" id="replyBtn" onclick="reply_go('${note.noteSendUserId}')">답장</button>
              &nbsp;&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-danger" id="removeBtn" onclick="remove_go('${note.noteId}');">삭 제</button>
              &nbsp;&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-secondary" id="cancelBtn" onclick="CloseWindow();">취 소</button>
            </div>
          </div>
          <!--end card-header  -->
          <div class="card-body pad">
			<div class="row">
			
			<div class="col-sm-6">
	            <div class="form-group">
	              <label for="title">날짜</label>
	              <div id="date" name="date">
	              	<fmt:formatDate value="${note.noteSendDate}" pattern="yy-MM-dd hh:mm:ss" />
<!-- 	              	<div style="display: none;">$</div> -->
	              </div>
	            </div>
			</div>

			<div class="col-sm-6">
	            <div class="form-group">
	              <label for="writer">보낸 사람</label>
	              <div id="writer" name="writer">${note.noteSendUserName }</div>
	            </div>
			</div>
           
           <div class="col-sm-12">
	            <div class="form-group">
	              <label for="content">제목</label>
	              <div>${note.noteTitle }</div>
	            </div>
            </div>
            
             <div class="col-sm-12">
	            <div class="form-group">
	              <label for="content">내용</label>
	              <div>${note.noteContent }</div>
	            </div>
            </div>
            
            <div style="display: none;">
            	 <input type="hidden" name="loginUserId" value="${loginUser.id }">
            </div>
            
		</div>
          </div>
          <!--end card-body  -->
          <div class="card-footer" style="display:none">

          </div>
          <!--end card-footer  -->
        </div><!-- end card -->
      </div><!-- end col-md-12 -->
    </div><!-- end row -->
  </section>
  <!-- /.content -->
</c:if>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  <script>
    function remove_go(noteId) {
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
    			location.href = "/common/noteRemove.do?noteId=" + noteId;
          		window.opener.location.reload(); 
 	}, 1300);  	

}
});


    } 
  </script>
  
  
  <script>
    function reply_go(noteSendUserId){
//     	alert(noteSendUserId);
		location.href = "/common/noteReplyForm.do?noteSendUserId=" + noteSendUserId;
    }
  </script>
</body>