<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<meta charset="UTF-8">
<title>하원 QR 체크</title>
</head>
<body>
	<h1>하원 QR 체크</h1>
	 <div class="col-sm-12" id="qrcode"></div>
<script src="<%=request.getContextPath() %>/resources/js/qrcode.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>

var today = new Date();
var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
var dateString = year + '-' + month  + '-' + day;
if('${selectAtt}' === 'Y'){
	
	var qrcode = new QRCode(document.getElementById("qrcode"), {
	 text: "${loginUser.id}z"+dateString,
	 width: 400,  //가로
	 height: 600, //세로
	 colorDark : "#000000", //qr에서 어두운 색 (보통 검은색) 
	 colorLight : "#ffffff", //qr에서 밝은 색 (보통 하얀색) colorDark 보다 옅어야한다.
	 correctLevel : QRCode.CorrectLevel.H //qr코드 오류복원능력임 (L->M->Q->H)
	 });
}else{
	Swal.fire({
        icon: 'error',
        title: '등원을 먼저 해주세요!',
//	        text: '문항정보가 저장되었습니다.',
        showConfirmButton: false,
    });
	 setTimeout(function() {
			window.close();
			
	}, 1000);
		
	/* var check= document.getElementById("qrcode");
	check.innerHTML="<h1>아직 등원을 하지 않았습니다.<br> 등원을 먼저 해주세요 </h1>" */
}

</script>
</body>
</html>