<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>ID 변경 신청 확인</h1>
			</div>
		</div>
	</div>
</section>


<div class="card card-dark card-outline card-tabs" >
	<div class="card-header p-0 pt-1" >
		<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				id="custom-tabs-one-home-tab" data-toggle="pill"
				href="#custom-tabs-one-home" role="tab"
				aria-controls="custom-tabs-one-home" aria-selected="true" >변경 신청 현황</a></li>
			<li class="nav-item"><a class="nav-link"
				id="custom-tabs-one-profile-tab" data-toggle="pill"
				href="#custom-tabs-one-profile" role="tab"
				aria-controls="custom-tabs-one-profile" aria-selected="false">변경 완료 내역</a>
			</li>
		</ul>
	</div>
	<div class="card-body">
		<div class="tab-content" id="custom-tabs-one-tabContent">
			<div class="tab-pane fade active show" id="custom-tabs-one-home"
				role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
				<table class="table table-hover table-bordered table-head-fixed text-center" >					
						<thead>
						<tr>
							<th style="width:20%;">신청자 이름</th>
							<th style="width:30%;">이전 전화번호</th>
							<th style="width:30%;">변경 요청 전화번호</th>
							<th style="width:20%;">변경 확인</th>
						</tr>
						</thead>
						<tbody>				
						<tr >
							<td>김선정</td>
							<td>010-2222-5555</td>
							<td>010-3333-4444</td>
							<td><button type="button" class="btn btn-dark btn-xs" id="checkBtn" onclick="modifyCheck();">변경확인</button></td>
						</tr>
						<tr >
							<td>문명진</td>
							<td>010-1111-2222</td>
							<td>010-4455-4564</td>
							<td><button type="button" class="btn btn-dark btn-xs" id="checkBtn" onclick="modifyCheck();">변경확인</button></td>
						</tr>
						<tr >
							<td>김종휘</td>
							<td>010-2939-2842</td>
							<td>010-2949-2849</td>
							<td><button type="button" class="btn btn-dark btn-xs" id="checkBtn" onclick="modifyCheck();">변경확인</button></td>
						</tr>
						<tr>
							<td>정태형</td>
							<td>010-9381-3818</td>
							<td>010-3534-8274</td>
							<td><button type="button" class="btn btn-dark btn-xs" id="checkBtn" onclick="modifyCheck();">변경확인</button></td>
						</tr>
						<tr >
							<td>정유진</td>
							<td>010-2949-5837</td>
							<td>010-1293-2144</td>
							<td><button type="button" class="btn btn-dark btn-xs" id="checkBtn" onclick="modifyCheck();">변경확인</button></td>
						</tr>
						<tr>
							<td>정현아</td>
							<td>010-1294-5932</td>
							<td>010-1040-2194</td>
							<td><button type="button" class="btn btn-dark btn-xs" id="checkBtn" onclick="modifyCheck();">변경확인</button></td>
						</tr>
						</tbody>
				</table>
				</div>
			<div class="tab-pane fade" id="custom-tabs-one-profile"
				role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
						<table class="table table-hover table-bordered table-head-fixed text-center" >					
						<thead>
						<tr>
							<th style="width:20%;">신청자 이름</th>
							<th style="width:30%;">이전 전화번호</th>
							<th style="width:30%;">변경 요청 전화번호</th>
							<th style="width:20%;">변경 상태</th>
						</tr>
						</thead>
						<tbody>				
						<tr >
							<td>김선정</td>
							<td>010-2222-5555</td>
							<td>010-3333-4444</td>
							<td><span class="badge badge-success">변경완료</span></td>
						</tr>
						<tr >
							<td>문명진</td>
							<td>010-1111-2222</td>
							<td>010-4455-4564</td>
							<td><span class="badge badge-success">변경완료</span></td>
						</tr>
						<tr >
							<td>김종휘</td>
							<td>010-2939-2842</td>
							<td>010-2949-2849</td>
							<td><span class="badge badge-success">변경완료</span></td>
						</tr>
						<tr>
							<td>정태형</td>
							<td>010-9381-3818</td>
							<td>010-3534-8274</td>
							<td><span class="badge badge-success">변경완료</span></td>
						</tr>
						<tr >
							<td>정유진</td>
							<td>010-2949-5837</td>
							<td>010-1293-2144</td>
							<td><span class="badge badge-success">변경완료</span></td>
						</tr>
						<tr>
							<td>정현아</td>
							<td>010-1294-5932</td>
							<td>010-1040-2194</td>
							<td><span class="badge badge-success">변경완료</span></td>
						</tr>
						</tbody>
				</table>
			</div>
	</div>

	</div>
</div>

<script>


function modifyCheck() {
	if(confirm("변경 하시겠습니까?")){
		alert("변경 되었습니다");
		document.getElementById('custom-tabs-one-profile-tab').click();
	}
}
</script>