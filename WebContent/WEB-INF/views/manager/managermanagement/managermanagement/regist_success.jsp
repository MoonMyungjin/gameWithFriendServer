<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<body>
<script>
	Swal.fire({
		icon: 'success',  
		title: '저장 성공했습니다.',
	  	showConfirmButton: false,
	})
	
	setTimeout(function() {
<%-- 		window.location.href="<%=request.getContextPath()%>/manager/managermanagement/managermanagement/list.do"; --%>
		window.parent.location.reload();
		}, 300);
</script>

</body>