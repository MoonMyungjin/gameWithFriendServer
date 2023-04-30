<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<head>
<style>
a{
	color: black;
	cursor: default;
}
a:hover {
	color: black;
}
</style>
</head>

<title>Login Page</title>
<body>

<!-- <div id="load"> -->
<!--     <img src="/resources/images/Book.gif" alt="loading"> -->
<!-- </div> -->

	<div class="hold-transition login-page">
		<div class="col-12 col-sm-3">
			<div class="card-body login-card-body">
				<a href="/admin/userList.do"><p class="login-box-msg">패스워드를 입력하세요</p></a>
				<div class="form-group has-feedback">
					<div class="input-group mb-3">
						<input id="password" type="password" class="form-control" name="pw" placeholder="Password" value="">
						<div class="input-group-append">
							<span class="input-group-text"><i id="showPW" class="fa-regular fa-eye"></i></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  
 	<script>

 	function studentAction() {
		$("#formId").attr("action", "<%=request.getContextPath() %>/member/login.do");
	}
 	function studentAction2() {
		$("#formId").attr("action", "<%=request.getContextPath() %>/memberq/loginq.do");
	}
 	
 	function managerAction() {
 		$("#formId").attr("action", "<%=request.getContextPath() %>/manager/login.do");
 	}
 	function parentAction() {
 		$("#formId").attr("action", "<%=request.getContextPath() %>/parent/login.do");
 	}
 	
	</script> 
</body>