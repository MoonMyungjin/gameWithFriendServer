<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

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
			<div class="col-sm-6">
				<h1>비밀번호변경</h1>
			</div>
		</div>
	</div>
</section>

<section class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3">
			</div>
			<div class="col-md-6">
				<div style="height: 20vh;"></div>
				<!-- 비밀번호 보여주기 및 변경 -->
					<div class="card card-dark card-outline">
						<div class="card-header">
							<h3 class="card-title">비밀번호변경</h3>
						</div>
	
						<form id="passwordChange" method="post">
							<div class="card-body" >
							<input type="hidden" name="id" value="${loginUser.id}">
								<div class="form-group">
									<label for="modifyPassword1">새로운 비밀번호</label> <input
										type="password" class="form-control" id="modifyPassword1"
										placeholder="Password" name="pw" onkeyup="checkPwd();" > 
										<span
										class="error_next_box" id="pswd1Msg" style="display: none">비밀번호를
										입력해주세요.</span>
								</div>
								<div class="form-group">
									<label for="modifyPassword2">새로운 비밀번호 확인</label> <input
										type="password" class="form-control" id="modifyPassword2"
										placeholder="PasswordCheck" onkeyup="checkPwd();" onkeypress="enterkey();">
								</div>
								<div>
									<span class="error_next_box" id="pswd2Msg" style="display: none">비밀번호가
									일치하지 않습니다.</span> 
									<span class="success_next_box" id="pswd3Msg"
									style="display: none">비밀번호가 일치합니다.</span>
								</div>
							</div>
							<div class="card-footer">
								<button type="button" class="btn btn-dark" onclick="submitPwd();">수정</button>
							</div>
						</form>
					</div>
			</div>
			<div class="col-md-3">
			</div>
		</div>
		
	</div>
</section>


<script>
	var pw = document.getElementById('modifyPassword1');
	var pw2 = document.getElementById('modifyPassword2');
	var oMsg = document.getElementById('pswd1Msg');
	var oMsg2 = document.getElementById('pswd2Msg');
	var oMsg3 = document.getElementById('pswd3Msg');

	function checkPwd() {
		
		if (pw.value == "") {
			oMsg2.style.display = "none";
			oMsg3.style.display = "none";
			oMsg.style.display = "";
			return;
		}

		if (pw.value != pw2.value) {
			oMsg.style.display = "none";
			oMsg3.style.display = "none";
			oMsg2.style.display = "";
			return;
		}

		if (pw.value == pw2.value) {
			oMsg.style.display = "none";
			oMsg2.style.display = "none";
			oMsg3.style.display = "";
			return;
		}

	}
</script>

<script>
function enterkey() {
	if (window.event.keyCode == 13) {
    	// 엔터키가 눌렸을 때
    	submitPwd();
    }
}


function submitPwd(){
	
	var pw = document.getElementById('modifyPassword1');
	var pw2 = document.getElementById('modifyPassword2');
	
	if (pw.value == "" || pw2.value == "") {
		//alert("비밀번호를 입력해 주세요.");
		Swal.fire({icon: 'error',
      			title: '비밀 번호를 입력해 주세요.',
      				}).then(function(){
      					
      				});
		return;
	}
	
	if(pw.value != pw2.value){
		//alert("비밀 번호가 일치하지 않습니다");
		Swal.fire({icon: 'error',
      			title: '비밀 번호가 일치하지 않습니다.',
      				}).then(function(){
      					
      				});
		return;
	} 
	
	var id = $('input[name="id"]').val();
	//console.log(id);
	//alert('submitPwd click!');
	var form = document.getElementById('passwordChange');
	form.action = "/manager/mypage/modify/passwordModify.do";
	form.submit();
	
}


</script>