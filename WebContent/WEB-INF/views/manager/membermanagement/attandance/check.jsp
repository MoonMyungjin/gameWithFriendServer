<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div id="title">

</div>

	<form role="form" class="form-horizontal" action="check.do"  method="post" >
			<input type="hidden" value="${studentById.name}" name="studentId">
	</form>	
</body>
<script>
window.onload=function(){

	alert('${id }'+"님 QR 체크가 확인되었습니다. 데스크 선생님께 출석 확인을 받으러 가주세요!");
	window.location.href = '/manager/membermanagement/attandance/reader';
}
</script>
</html>