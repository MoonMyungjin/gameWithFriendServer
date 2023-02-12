<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<head>
<meta charset="UTF-8">
<title>등원 QR 체크</title>
</head>
<body>
	<h1 style="text-align: center;">등원 QR 체크</h1>
	
	 
	 <div class="col-sm-12" id="qrcode"></div>
 	
 
<script src="<%=request.getContextPath() %>/resources/js/qrcode.js"></script>
<script>

 var today = new Date();
 var year = today.getFullYear();
 var month = ('0' + (today.getMonth() + 1)).slice(-2);
 var day = ('0' + today.getDate()).slice(-2);
 var dateString = year + '-' + month  + '-' + day;
var qrcode = new QRCode(document.getElementById("qrcode"), {
 text: "${loginUser.id}"+dateString ,
 width: 350,  //가로
 height: 500, //세로
 colorDark : "#000000", //qr에서 어두운 색 (보통 검은색) 
 colorLight : "#ffffff", //qr에서 밝은 색 (보통 하얀색) colorDark 보다 옅어야한다.
 correctLevel : QRCode.CorrectLevel.H //qr코드 오류복원능력임 (L->M->Q->H)
 });
</script>
</body>
</html>