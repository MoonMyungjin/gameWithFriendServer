<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>



<script>

 Swal.fire({
       icon: 'success',
       title: '상담 신청이 완료되었습니다.',
   });

 setTimeout(function() {
 location.href="/member/consulting/history.do";
}, 900);
</script>

