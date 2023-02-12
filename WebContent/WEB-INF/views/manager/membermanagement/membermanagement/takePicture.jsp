<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-12">
			<div class="col-sm-6">
				<h1><i class="fas fa-solid fa-camera-retro" style="font-size: 30px;"></i>&nbsp;&nbsp;사진 찍기</h1>
			</div>
			<div class="col-sm-5"></div>
			<div class="col-sm-1" style="text-align: right;">
				<button type="button" class="btn btn-dark" onclick="window.close()">닫기</button>
			</div>
		</div>
	</div>
</section>

<section class="content">
	<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<div class="row" style="display: flex; justify-content: space-between;">
				<div class="col-md-5">
					<!-- 사진찍기 화면 출력 -->
					<div class="card card-dark card-outline">
						<div class="card-header">
							<h3 class="card-title">
							<i class="fas fa-solid fa-camera"></i>&nbsp;&nbsp;카메라 화면</h3>
						</div>
							<div class="card-body" style="text-align: center; height: 280px;">
								<video playsinline autoplay style="width:300px; height: 250px; text-align: center;"></video>
							</div>
						<div class="card-footer">
							<button id="shot" type="button" class="btn btn-dark">찰칵!</button>
						</div>	
					</div>
				</div>
				<div style="display: flex; align-items: center;"><i class="fas fa-solid fa-circle-chevron-right" style="font-size: 50px;"></i></div>
				<div class="col-md-5">
					<!-- 사진찍은 화면 출력 -->
					<div class="card card-dark card-outline">
						<div class="card-header">
							<h3 class="card-title">
							<i class="fas fa-solid fa-image"></i>&nbsp;&nbsp;미리 보기</h3>
						</div>
							<div class="card-body" style="text-align: center; height: 280px;">
								<canvas id="myCanvas"></canvas>
							</div>
						<div class="card-footer" style="display: flex;">
						<div id="fileSave" style="visibility : hidden">
						<input type="text" id="fileName" placeholder="파일명">
						<a id="download">
							<button type="button" class="btn btn-dark" onClick="download()">저장</button>
						</a>
						</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
		
	</div>
</section>
<script src="<%=request.getContextPath() %>/resources/js/main.js"></script>

<script>
function download() {
    var download = document.getElementById("download");
    var image = document.getElementById("myCanvas")
        .toDataURL("image/jpeg")
        .replace("image/jpeg", "image/octet-stream");
    var fileName = document.getElementById("fileName").value;
    if(!fileName){
    	alert('파일 이름은 필수입니다');
    	return;
    }
   // console.log(fileName);
    download.setAttribute("href", image);
    download.setAttribute("download",fileName+".jpg");
}
</script>
