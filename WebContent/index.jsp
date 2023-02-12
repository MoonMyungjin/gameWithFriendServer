<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<script>
	if('${loginStudent.id}'){
		location.href="member/index.do";
	} else if('${loginManager.id}') {
		location.href="manager/index.do";
	} else if('${loginParent.id}'){
		location.href="parent/index.do";
	} else {
		location.href="common/loginForm.do";
	}
	
	
	/* location.href="/member/index.do"; */
</script>