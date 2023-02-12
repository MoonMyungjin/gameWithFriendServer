<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<head>
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
.error_next_box {
	color: red;
}

.success_next_box {
	color: green;
}
</style>
</head>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6" style="display: flex;">
				<h1 data-userId="${loginUser.id }">비밀번호변경</h1>
				
				<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '비밀번호변경') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '비밀번호변경') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
				
			</div>
		</div>
	</div>
</section>

<section class="content">
	<div class="container-fluid">
	<div class="card">
		<div class="card-body" style="height: 90vh;">
			<div style="height:20vh;"></div>
			<div class="row" style="display: flex; justify-content: center;">
				<div class="col-md-5" style="vertical-align: center;">
					<!-- 비밀번호 보여주기 및 변경 -->
					<div class="card card-dark card-outline">
						<div class="card-header">
							<h3 class="card-title">비밀번호 확인</h3>
						</div>
	
						<form id="passwordCheck" method="post">
							<div class="card-body" >
							<input type="hidden" name="id" value="${loginUser.id}">
								<div class="form-group">
									<span>현재 비밀번호를 입력해주세요.</span>
									<br><br>
									<label for="password">현재 비밀번호</label> 
									<input
										type="password" class="form-control" id="password"
										placeholder="Password" name="pw" onkeypress="enterkey();"> 
								</div>
							</div>
							<div class="card-footer">
								<button type="button" class="btn btn-dark" onclick="submitPwd();">입력</button>
							</div>
						</form>
					</div>
				</div>
				
			</div>
		</div>
	</div>
		
	</div>
</section>

<script>

function enterkey() {
	if (window.event.keyCode == 13) {
    	// 엔터키가 눌렸을 때
    	submitPwd();
    }
}

function submitPwd(){
	if($('input[name="pw"]').val() === ""){
		//alert("비밀번호를 입력해주세요.");
		 Swal.fire({
	        icon: 'error',
	        title: '비밀번호를 입력해주세요.',
	    });
		return;
	}
	
// 	var id = $('input[name="id"]').val();
// 	console.log(id);
// 	alert('submitPwd click!');
	var form = document.getElementById('passwordCheck');
	form.action = "/manager/mypage/modify/passwordCheck.do";
	form.submit();
	
}

</script>