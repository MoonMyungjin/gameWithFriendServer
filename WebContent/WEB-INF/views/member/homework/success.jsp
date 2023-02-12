<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


	<script>
	Swal.fire({
		   title: '과제 제출에 성공했습니다.',
			icon: 'success'
	   });
	setTimeout(function() {
		window.close();
		window.opener.location.reload();	
		}, 1000);
	</script>





<%-- 
<script>



	alert("등록이 완료되었습니다.");
	window.close();
	window.opener.parent.location.href="<%=request.getContextPath() %>/manager/board/notice.do";
</script> --%>
</body>
