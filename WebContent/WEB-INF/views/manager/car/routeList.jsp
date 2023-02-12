<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="UTF-8">
<title></title>
<style>
	tr{
		font-size : 15px;
	}
	td{
		font-size : 14px;
	}
</style>
</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6">
              <h1>운행일정관리</h1>              
           </div>
           <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                 <li class="breadcrumb-item">
                    <a href="list.do">
                       <i class="fa fa-dashboard"></i>운행일정관리
                    </a>
                 </li>
               </ol>
           </div>
        </div>
   </div>
</section>
<section class="content">
   <div class="card-header">
      <div class="card card-outline card-dark">
		<div class="card-header">
			<h3 class="card-title">운행일정 List</h3>
			<div class="card-tools">
				<div class="row">
					<div class="col-xs-6">
						<button type="button" class="btn btn-block btn-dark btn-xs">추가</button>
					</div>
					<div class="col-xs-6">
						<button type="button" class="btn btn-block btn-dark btn-xs">등록</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="card-body" style="padding: 0px; margin: 0px;">
			<form action="">
				<div class="card-body table-responsive p-0" style="height: 300px;">
					<table class="table table-head-fixed text-nowrap table-bordered">
						<thead style="color: rgb(253 251 216);">
							<tr>
								<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">NO</th>
								<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">차량</th>
								<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">노선</th>
								<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">기사</th>
								<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">기사H.P.</th>
								<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">운행요일</th>
								<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">출발시간</th>
								<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">도착시간</th>
								<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" begin="1" end="20" step="1">
									<tr>
										<td style="padding: 0px; margin: 0px; vertical-align: center;">${i }</td>
										<td style="padding: 0px; margin: 0px; width:10%;"><input class="form-control" type="text" value="1호차" width="100%"></td>
										<td style="padding: 0px; margin: 0px; width:10%;"><input class="form-control" type="text">
											<select class="form-control" style="display: inline; ">
												<option>1</option>
												<option>2</option>
												<option>3</option>
											</select>
										</td>
										<td style="padding: 0px; margin: 0px; width:10%;"><input class="form-control" type="text" value="김운행"></td>
										<td style="padding: 0px; margin: 0px; width:20%;"><input class="form-control" type="text" value="010-0000-0000"></td>
										<td style="padding: 0px; margin: 0px; width:15%;"><input class="form-control" type="text" value="월,화,수,목,금"></td>
										<td style="padding: 0px; margin: 0px; width:10%;"><input class="form-control" type="text" value="15:30"></td>
										<td style="padding: 0px; margin: 0px; width:10%;"><input class="form-control" type="text" value="15:50"></td>
										<td style="padding: 0px; margin: 0px; width:5%;">
											<a class="btn btn-danger btn-xs" href="#">
											<i class="fas fa-trash"></i>Del
											</a>
										</td>
									</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
   </div>
   <div class="card-body">
   	<div class="row">
   		<div class="col-6">
			<span style="color:red;font-size:12px;">** 노선은 5개 까지만 추가 가능합니다.</span>
	   		<div class="col-12">
	   			<div class="card card-outline card-dark">
					<div class="card-header">
						<h3 class="card-title">노선 수정</h3>
						<div class="card-tools">
						</div>
					</div>
				<div class="card-body">
					<form action="">
						<div class="card-body table-responsive p-0" style="height: 300px;">
							<table class="table table-head-fixed text-nowrap table-bordered">
								<thead style="color: rgb(253 251 216);">
									<tr>
										<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">NO</th>
										<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">차량</th>
										<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">노선</th>
										<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">기사</th>
										<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">기사H.P.</th>
										<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">운행요일</th>
										<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">출발시간</th>
										<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">도착시간</th>
										<th style="background-color: rgb(32 73 105);padding: 2px; margin: 2px;">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="i" begin="1" end="20" step="1">
											<tr>
												<td style="padding: 0px; margin: 0px; vertical-align: center;">${i }</td>
												<td style="padding: 0px; margin: 0px; width:10%;"><input class="form-control" type="text" value="1호차" width="100%"></td>
												<td style="padding: 0px; margin: 0px; width:10%;"><input class="form-control" type="text" value="00동~00동"></td>
												<td style="padding: 0px; margin: 0px; width:10%;"><input class="form-control" type="text" value="김운행"></td>
												<td style="padding: 0px; margin: 0px; width:20%;"><input class="form-control" type="text" value="010-0000-0000"></td>
												<td style="padding: 0px; margin: 0px; width:15%;"><input class="form-control" type="text" value="월,화,수,목,금"></td>
												<td style="padding: 0px; margin: 0px; width:10%;"><input class="form-control" type="text" value="15:30"></td>
												<td style="padding: 0px; margin: 0px; width:10%;"><input class="form-control" type="text" value="15:50"></td>
												<td style="padding: 0px; margin: 0px; width:5%;">
													<a class="btn btn-danger btn-xs" href="#">
													<i class="fas fa-trash"></i>Del
													</a>
												</td>
											</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						</form>
					</div>
				</div>
	   		</div>
   		</div>
   		<div class="col-6">
   			<div class="card card-outline card-dark">
				<div class="card-header">
					<h3 class="card-title">기사님list</h3>
					<div class="card-tools">
					</div>
				</div>
			<div class="card-body">
			The body of the card
			</div>
			</div>
   		</div>
   	</div>
   </div>
   <div class="card-footer" style="border: 5px solid black; height: 20vh;">
   </div>
</section>
   
   
   
</body>
</html>