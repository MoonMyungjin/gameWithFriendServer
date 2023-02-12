<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="utf-8">
  <title>jsQR Demo</title>
  <script src="<%=request.getContextPath() %>/resources/js/jsQR.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Ropa+Sans" rel="stylesheet">
  <style>
    body {
      font-family: 'Ropa Sans', sans-serif;
      color: #333;
      max-width: 80%;
      margin: 0 auto;
      position: relative;
    }

    #githubLink {
      position: absolute;
      right: 0;
      top: 12px;
      color: #2D99FF;
    }

    h1 {
      margin: 10px 0;
      font-size: 40px;
    }

    #loadingMessage {
      text-align: center;
      padding: 40px;
      background-color: #eee;
    }

    #canvas {
      width: 100%;
    }

    #output {
      margin-top: 20px;
      background: #eee;
      padding: 10px;
      padding-bottom: 0;
    }

    #output div {
      padding-bottom: 10px;
      word-wrap: break-word;
    }

    #noQRFound {
      text-align: center;
    }
  </style>
</head>
<body>
   <h1 style="text-align: center;">등원/하원 QR을 체크해주세요!</h1> 
<!--   <a id="githubLink" href="https://github.com/cozmo/jsQR">View documentation on Github</a>
  <p>Pure JavaScript QR code decoding library.</p> -->
  <div id="loadingMessage">ð¥ Unable to access video stream (please make sure you have a webcam enabled)</div>
  <canvas id="canvas" hidden></canvas>
  <div id="output" hidden>
    <div id="outputMessage">No QR code detected.</div>
    <div hidden><b>Data:</b> <span id="outputData"></span></div>
  </div>
  <script>
    var video = document.createElement("video");
    var canvasElement = document.getElementById("canvas");
    var canvas = canvasElement.getContext("2d");
    var loadingMessage = document.getElementById("loadingMessage");
   /*  var outputContainer = document.getElementById("output"); */
    var outputMessage = document.getElementById("outputMessage");
    var outputData = document.getElementById("outputData");
    var today = new Date();
    var year = today.getFullYear();
    var month = ('0' + (today.getMonth() + 1)).slice(-2);
    var day = ('0' + today.getDate()).slice(-2);
    var dateString = year + '-' + month  + '-' + day;

    function drawLine(begin, end, color) {
      canvas.beginPath();
      canvas.moveTo(begin.x, begin.y);
      canvas.lineTo(end.x, end.y);
      canvas.lineWidth = 4;
      canvas.strokeStyle = color;
      canvas.stroke();
    }

    // Use facingMode: environment to attemt to get the front camera on phones
    navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } }).then(function(stream) {
      video.srcObject = stream;
      video.setAttribute("playsinline", true); // required to tell iOS safari we don't want fullscreen
      video.play();
      requestAnimationFrame(tick);
    });

    function tick() {
      loadingMessage.innerText = ""
      if (video.readyState === video.HAVE_ENOUGH_DATA) {
        loadingMessage.hidden = true;
        canvasElement.hidden = false;
       /*  outputContainer.hidden = false;
 */
        canvasElement.height = video.videoHeight;
        canvasElement.width = video.videoWidth;
        canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
        var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
        var code = jsQR(imageData.data, imageData.width, imageData.height, {
          inversionAttempts: "dontInvert",
        });
        if (code) {
          drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF3B58");
          drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF3B58");
          drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF3B58");
          drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF3B58");
          /* outputMessage.hidden = true; */
          outputData.parentElement.hidden = false;
          var olddata=code.data;
          var data=olddata.slice(-10)
          console.log(data);
          var data3 = olddata.slice(0,-10);
         
          var data2= olddata.substr(-11);
          var data4= data2.substr(0,1);
          console.log(data2);
          console.log(data3);
          console.log(data4);
          if(data4=='z'&& data === dateString){
        	  window.location.href = '/manager/membermanagement/attandance/checkz?id='+data3.slice(0, -1);
        	  console.log("hawon");
          }else if(data4!=='z' && data === dateString ){
        	  
          	window.location.href = '/manager/membermanagement/attandance/check?id='+data3;
          	console.log("dwon");
          }else{
        	  /* window.location.href = '/manager/membermanagement/attandance/fail'; */
        	  alert('잘못된 QR코드 입니다.');
        	  window.location.reload;
          }
          outputData.innerText = code.data;
        } else {
          outputMessage.hidden = false;
          
          outputData.parentElement.hidden = true;
        }
      }
      requestAnimationFrame(tick);
    }
  </script>
</body>
</html>
