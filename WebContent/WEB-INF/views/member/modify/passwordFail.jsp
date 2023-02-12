<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>



<body>
<script>
	alert("비밀번호가 일치하지 않습니다.");
	
	window.location.href="<%=request.getContextPath()%>/member/modify/passwordCheckForm.do";
</script>

</body>