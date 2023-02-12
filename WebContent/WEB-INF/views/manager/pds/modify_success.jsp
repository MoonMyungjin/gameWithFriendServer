<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<script>
Swal.fire({
    icon: 'success',
    title: '퇴근 완료 되었습니다.',
    text: '오늘도 고생 많으셨습니다 ^^',
});

// 	alert("수정이 완료되었습니다.");
	location.href="/common/pdsDetail.do?pdsId=${pds.pdsId}&from=modify"
</script>
