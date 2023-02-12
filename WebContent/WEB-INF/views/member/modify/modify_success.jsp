<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<head>
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>


<body>
<script>
Swal.fire({icon: 'success',
	title: '비밀번호 변경을 성공했습니다.',
	text: '로그인 화면으로 이동합니다.',
		}).then(function(){
			window.parent.location.href="<%=request.getContextPath()%>/common/loginForm.do";
		});
	//alert("비밀번호 변경을 성공했습니다. \n 로그인 화면으로 이동합니다.");
	
</script>

</body>