<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<head>
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>

<body>
<script>
	//alert("비밀번호가 일치하지 않습니다.");
	Swal.fire({icon: 'error',
		title: '비밀번호가 일치하지 않습니다.',
			}).then(function(){
			window.location.href="<%=request.getContextPath()%>/manager/mypage/modify/passwordCheckForm.do";
		});
	
</script>

</body>