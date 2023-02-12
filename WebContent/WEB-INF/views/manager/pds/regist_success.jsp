<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>

// Swal.fire({
// 	'Alert가 실행되었습니다.', 
// 	'이곳은 내용이 나타나는 곳입니다.', 
// 	'success' ,
// 	});

 Swal.fire({
       icon: 'success',
       title: '완료!',
       text: '글이 정상적으로 등록되었습니다.',
   });

 setTimeout(function() {
		window.close();
		window.opener.location.reload(true);
}, 1300);
</script>
