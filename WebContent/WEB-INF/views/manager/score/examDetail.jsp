<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험 상세</title>
	<style>
		.editable {
			width: 100%;
			border: 0;
	    	/* padding: 0px 0.75rem; */
	    	height: 2em;
		}
		.card-body {
			padding-top: 0px;
			padding-bottom: 0px;
			padding-left: 7.4px;
			padding-right: 7.4px;
		}
		
		
		.table td, .table th {
		    padding: 0.3rem;
		    vertical-align: top;
		    border-top: 1px solid #dee2e6;
		}
		
		.table1 label{
		    margin-top: 5px;
		}
		
		label {
			margin: 0;
			margin-top: 3px;
		}
	</style>
</head>
<body>
	<section class="content-header">
	   <div class="container-fluid">
	        <div class="row md-2">
	           <div class="col-sm-6">
	              <h1>시험상세보기</h1>              
	           </div>
	           <div class="col-sm-6">
	              <ol class="breadcrumb float-sm-right">
	                 <li class="breadcrumb-item">
	                 </li>
	               </ol>
	           </div>
	        </div>
	   </div>
	</section>
	
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<div class="card card-dark card-outline" >
						
						<div class="card-header">
							<h3 class="card-title">
								<i class="fas fa-info"></i>
								&nbsp;
								시험 정보
							</h3>
							<div class="card-tools" style="padding: 3px;">
								<div class="input-group input-group-sm">
									<div class="input-group">
										<button type="button" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;" onclick="saveExam('${exam.examId}');">
											저장
										</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-danger" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;" onclick="alert('삭제 버튼 클릭');">
											삭제
										</button>
									</div>
								</div>
							</div>
						</div>
						
						<div class="card-body">
							<div class="row">
								<table class="table table-bordered table1" style="margin: 0px;">
									<tbody>
									
										<tr>
											<td><label>구분</label></td>
											<td width="10%" style="padding-top: 8px;">${exam.examGroup }</td>
											
											<td><label>학년</label></td>
											<td style="padding-top: 8px;">
												${exam.examGrade}
											</td>
											
											<td><label>학기</label></td>
											<td style="padding-top: 8px;">
												${exam.examSemester}
											</td>
											
											<td><label>분기</label></td>
											<td style="padding-top: 8px;">
												${exam.examQuarter}
											</td>
										</tr>
										
										<tr>
											<td><label>시험일</label></td>
											<td>
												<input id="examDate" class="form-control editable" type="date" value="${exam.examDate }">
											</td>
											<td><label>시험명</label></td>
											<td colspan="3">
												<input id="examName" class='form-control editable' type="text" value="${exam.examName }">
											</td>
											<td><label>과목분류</label></td>
											<td style="padding-top: 8px;">
												${exam.examSeg}
											</td>
										</tr>
										
									</tbody>
								</table>
							</div>				
						</div>
						
					</div>
				</div>
				
				<div class="col-sm-12">
					<div class="card card-dark card-outline" >
						
						<div class="card-header">
							<h3 class="card-title">
								<i class="fas fa-list"></i>
								&nbsp;
								성적 리스트
							</h3>
							<div class="card-tools" style="padding: 3px;">
								<div class="input-group input-group-sm">
									<div class="input-group">
										<button id="listSaveExcelBtn" type="button" class="btn btn-info" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											EXCEL
										</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button id="ListPrintBtn" type="button" class="btn btn-danger" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											PDF
										</button>
									</div>
								</div>
							</div>
						</div>
						
						<div class="card-body">
							<div id="pdfPrintArea" class="row">
								<table id="excelPrintTargetTable" class="table table-bordered">
									<thead>
										<tr>
											<th>학년</th>
											<th>반</th>
											<th>학생명</th>
											<th>점수</th>
											<th>석차</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty scoredStudentList }" >
						            		<tr>
						            			<td colspan="5" class="text-center">
						            				해당 시험의 성적이 입력된 학생이 존재하지 않습니다.
						            			</td>
						            		</tr>
						            	</c:if>
						            	<c:if test="${!empty scoredStudentList }" >
											<c:forEach items="${scoredStudentList }" var="scoredStudent">
												<tr class="scoreList">
													<td>${scoredStudent.grade }</td>
													<td>${scoredStudent.className }</td>
													<td>${scoredStudent.name }</td>
													<td data-score="${scoredStudent.score }">${scoredStudent.score }점</td>
													<td>${scoredStudent.examRank }</td>
												</tr>
											</c:forEach>
										</c:if>
											<tr>
												<td colspan="2"></td>
												<td><label>평균 - 총원</label></td>
												<td id="avgScore">80점</td>
												<td id="scorePeople">25명</td>
											</tr>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-sm-4"></div>
								<div class="col-sm-4 float-right">
									<div class="row">
										<div class="col-sm-4"></div>
										<div class="col-sm-4" style="padding-bottom: 15px;">
											<button type="button" class="btn btn-primary" onclick="CloseWindow();" >
												닫기
											</button>
										</div>
										<div class="col-sm-4"></div>
									</div>
								</div>
								<div class="col-sm-4"></div>
							</div>
						</div>
						
					</div>
				</div>
				
			</div>
		</div>
		
		<form id="saveForm" action="<%=request.getContextPath()%>/manager/score/saveExam.do" method="post">
			<input id="examId" type="hidden" name="examId">
			<input id="examDateF" type="hidden" name="examDate">
			<input id="examNameF" type="hidden" name="examName">
		</form>
	</section>
<script>
	window.onload = function(){
		$("#ListPrintBtn").on('click',function(){
			PDFSave($("#pdfPrintArea"),"성적 list.pdf");
		});
		
		$("#listSaveExcelBtn").on("click",function(){
   			$("#excelPrintTargetTable").table2excel({
   		        exclude: ".excludeThisClass",
   		        name: "sheet1",
   		        filename: "수업List", 
   		        preserveColors: false 
   		 	});
    	});
		
		var scoreListLength = $('.scoreList').length;
		var avgScore = 0;
		var sumScore = 0;
		
		$(".scoreList").each(function() {
			var score = parseInt($(this).children().eq(3).attr("data-score"));
			
			sumScore += score;
		});
		
		avgScore = sumScore / scoreListLength;
		
		$("#avgScore").text(avgScore + "점");
		$("#scorePeople").text(scoreListLength + "명");
		
		
		
	}

</script>
	<script>
		
		function saveExam(examId) {
			
			var examDate = $("#examDate").val();
			var examName = $("#examName").val();
			
			$("#examId").val(examId);
			$("#examDateF").val(examDate);
			$("#examNameF").val(examName);
			
			$("#saveForm").submit();
		}
	
	
		function CloseWindow(){
			window.opener.location.reload(true);		
			window.close();
		}
	</script>
</body>
</html>