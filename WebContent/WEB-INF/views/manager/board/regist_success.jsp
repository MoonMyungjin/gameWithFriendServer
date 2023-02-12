<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>




	<script>
// 		alert("공지사항 등록이 성공했습니다.");
// 		window.close();
// 		window.opener.location.reload();	
		
		
		 Swal.fire({
		       icon: 'success',
		       title: '공지사항 등록이 완료되었습니다.',
		   });

		 setTimeout(function() {
				window.close();
				window.opener.location.reload(true);
		}, 900);
	</script>





<%-- 
<script>



	alert("등록이 완료되었습니다.");
	window.close();
	window.opener.parent.location.href="<%=request.getContextPath() %>/manager/board/notice.do";
</script> --%>

