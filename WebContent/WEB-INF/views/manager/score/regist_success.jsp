<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

	<script>
// 	alert("시험등록에 성공");
	 Swal.fire({
	       icon: 'success',
	       title: '완료!',
	       text: '시험 등록에 성공했습니다.',
	   });
setTimeout(function() {
// 	window.close();
// 	window.opener.location.reload(true);
		location.href="<%=request.getContextPath()%>/manager/score/examMngm.do";
}, 1300);
	</script>
