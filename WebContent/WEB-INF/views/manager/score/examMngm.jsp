<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>시험지 관리</title>

<head>
<style>

	* {
		font-size: 14px;
	}
	.table-head-fixed th {
		padding-top: 0.3em;
		padding-bottom: 0.3em;
	}
	.table-head-fixed td {
		padding-top: 0.3em;
		padding-bottom: 0.3em;
	}
	.card-body.p-0 .table thead>tr>th:first-of-type {
		padding-left: 12px;
	}
		.card-body.p-0 .table tbody>tr>td:first-of-type {
		padding-left: 12px;
	}
	.card-body.p-0 .table thead>tr>th:last-of-type {
		padding-right: 12px;
	}
		.card-body.p-0 .table tbody>tr>td:last-of-type {
		padding-right: 12px;
	}
	th, td {
		text-align: center;
	}
	#tb1 td, #td1 th {
		padding:0;
	}
	div.table1 {
		max-height: 400px;
		overflow-y: scroll;
	}
	div.table2 {
		max-height: 300px;
		overflow-y: scroll;
	}
	.editable {
		width: 100%;
		border: 0;
    	/* padding: 0px 0.75rem; */
    	height: 2em;
	}
	.editText1 {
		padding-left: 20px;
	}
	.editText2 {
		padding-left: 16px;
	}
	.clickableLine:hover{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
	.selectedLine{
		background-color: rgb(32 73 105);
		color: rgb(253 251 216);
		cursor: pointer;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
        
        Handlebars.registerHelper("deleteTime", function(targetStr) {
            
 	        return targetStr.substr(0,10);
        });
        Handlebars.registerHelper("replaceT", function(targetStr) {
            
        	let resultStr;
        	
        	resultStr = targetStr.substr(0,4)+"-"+targetStr.substr(4,2)+"-"+targetStr.substr(6,2)+" "+targetStr.substr(9,5)
        	
        	
 	        return resultStr;
        });
        Handlebars.registerHelper("cutUUID", function(targetStr) {
            
        	let resultStr;
        	
        	resultStr = targetStr.split("$$")[1];
        	
 	        return resultStr;
        });
 
</script>

</head>

<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6" style="display: flex;">
					<h1 data-userId="${loginUser.id }">시험지관리</h1>
					 <c:if test="${fn:indexOf(favoriteMenuListStr, '과제관리') != -1}">
	                  	<i id="star" class="fa-solid fa-star on fa-2x" ></i>
	               	 </c:if>
	               	 <c:if test="${fn:indexOf(favoriteMenuListStr, '과제관리') == -1}">
	                  	<i id="star" class="fa-regular fa-star off fa-2x" ></i>
	               	 </c:if>
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
								<i class="fas fa-plus"></i>
								&nbsp;
								시험 등록
							</h3>
						</div>
						
						<div class="card-body" style="padding-top: 5px">
							
							<form role="examRegistForm" class="form-horizontal" action="examRegist.do" method="post">
							<div class="row">
								<div class="form-group" style="margin-bottom: 3px; margin-left: 6px;">
									<div class="custom-control custom-radio col-xs-3" style="display: inline;">
										<input class="custom-control-input" type="radio" value="학교" id="customRadio1" name="examGroup" checked> 
										<label for="customRadio1" class="custom-control-label">학교</label>
									</div>
									&nbsp;&nbsp;
									<div class="custom-control custom-radio" style="display: inline;">
										<input class="custom-control-input" type="radio" value="학원" id="customRadio2" name="examGroup"> 
										<label for="customRadio2" class="custom-control-label">학원</label>
									</div>
								</div>
							</div> <!-- row1 -->
							
							<div class="row">
								<div class="form-group col-sm-3">
									<label>시험일</label>
									<div class="input-group">
										
										<input id="examDate" name="examDate" type="date" class="form-control float-right">
									</div>
								</div>
								<div class="form-group col-xs-2">
									<label>학년</label> 
									<select id="examGrade" name="examGrade" class="form-control">
										<option>중1</option>
										<option>중2</option>
										<option>중3</option>
									</select>
								</div>
								<div class="form-group col-xs">
									<label>학기</label> 
									<select id="examSemester" name="examSemester" class="form-control">
										<option>1학기</option>
										<option>2학기</option>
									</select>
								</div>
								<div class="form-group col-xs">
									<label>구분</label> 
									<select id="examQuarter" name="examQuarter" class="form-control">
										<option>중간고사</option>
										<option>기말고사</option>
										<option>월말고사</option>
										<option>기타시험</option>
									</select>
								</div>
								<div class="form-group col-xs">
									<label>과목분류</label> 
									<select id="examSeg" name="examSeg" class="form-control">
										<option>국어</option>
										<option>수학</option>
										<option>사회</option>
										<option>과학</option>
										<option>영어</option>
									</select>
								</div>
								<div class="form-group col-sm">
									<label>시험명</label>
									<div class="input-group">
										<input id="examName" name="examName" type="text" class="form-control">
										<div class="input-group-append">
<!-- 											<button class="btn btn-dark" type="button" onclick="examSearch()">검색</button> -->
											<button class="btn btn-dark" type="button" onclick="examRegist_go();">등록</button>
										</div>
										&nbsp;&nbsp;
<!-- 										<button class="btn btn-info" type="button" onclick="examAdd()">Add</button> -->
										<button class="btn btn-danger" type="button" onclick="examDelete_go();">삭제</button>
									</div>
								</div>
							</div> <!-- row2 -->
							</form>
						</div> <!-- card-body -->
						
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-8">
					<div class="card card-dark card-outline" style="height: 110%;">
						<div class="card-header" style="vertical-align: center;display: flex;align-items: center;justify-content: space-between;padding: 0.47rem 1.25rem;">
    						   <div class="row">  
				               <h3 class="card-title">
									<i class="fas fa-list"></i>
									&nbsp;
									Exam List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   </h3>
    						   </div>
    						   
				               <div class="card-tools" style="margin: 0;">
				                  <div class="row">
				                  	<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<input id="examSearch" type="text" class="form-control float-right" placeholder="키워드 검색" style="width: 100px; padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										<div class="input-group-append">
											<button id="examSearchBtn" type="submit" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
												<i class="fas fa-search" aria-hidden="true"></i>
											</button>
										</div>
									</div>
								  </div>
				               </div>
				            </div>
						
						<div class="card-body">
							<div class="row table1">
								<div class="card-body p-0" id="examListDiv">
									<table class="table table-head-fixed table-bordered" id="examList">
										<thead>
											<tr>
												<th>시험일</th>
												<th>구분</th>
												<th>학년</th>
												<th>학기</th>
												<th>분기</th>
												<th>과목</th>
												<th>시험명</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty examList }" >
							            		<tr>
							            			<td colspan="7" class="text-center">
							            				해당내용이 없습니다.
							            			</td>
							            		</tr>
							            	</c:if>
							            	<c:if test="${!empty examList }" >
			            						<c:forEach items="${examList }" var="exam">
			            							<tr class="clickableLine" style="cursor:pointer;" onclick="questionList_go('${exam.examId}');" ondblclick="examDetail('${exam.examId}');">
			            								<td>${exam.examDate }</td>
			            								<td>${exam.examGroup }</td>
			            								<td>${exam.examGrade }</td>
			            								<td>${exam.examSemester }</td>
			            								<td>${exam.examQuarter }</td>
			            								<td>${exam.examSeg }</td>
			            								<td>${exam.examName }</td>
			            							</tr>
			            						</c:forEach>
		            						</c:if>
				
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="col-sm-4">
					<div class="row">
						<div class="col-sm-12">
							<div class="card card-dark card-outline" style="height: 110%;">
								<div class="card-header">
									<h3 class="card-title">
										<i class="fas fa-plus"></i>
										&nbsp;
										시험지
									</h3>
									<div class="card-tools" style="margin: 0;">
										<div class="row">
											<div class="input-group input-group-sm" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
												<button style="display: none;" class="btn btn-xs btn-dark" onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
												
												<div class="input-group-append">
													<button id="submitFormBtn" type="submit" class="btn btn-dark" style="display: none;">저장</button>
												</div>
											</div>
										</div>
									</div>

									
								</div>
								<div class="card-body" style="padding-bottom: 0;">
									<div class="card-body p-0">
										<form enctype="multipart/form-data" role="form" method="post" action="/manager/score/fileRegist.do" name="registForm">			
											<div class="form-group">
												<input type="hidden" id="subExamId" name="subExamId" value="">
												<input type="hidden" id="attachGroupId" name="attachGroupId" value="">
												
												<div class="fileInput">
												</div>
												<div id="attachListDiv">
													<tr id="attachList">
													
													</tr>
												</div>
											</div>
											
										</form>
									</div>
								</div>
							</div>
						</div>
					<div class="col-sm-12">
					 	<div class="card card-dark card-outline" style="height: 110%;">
							<div class="card-header">
								<h3 class="card-title">
									<i class="fas fa-plus"></i>
									&nbsp;
									문항 추가
								</h3>
								<div class="card-tools">
									<div class="input-group input-group-sm">
										<input id="questionNum" type="text" class="form-control float-right" placeholder="문항 갯수 입력" style="width: 100px;">
										<div class="input-group-append">
											<button type="submit" class="btn btn-dark" onclick="rowAdd()">
												<!-- <i class="fas fa-plus"></i> -->
												Add
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body" style="padding-bottom: 0;">
								<div class="row table2">
									<div class="card-body p-0">
										<table id="tb1" class="table table-head-fixed table-bordered text-nowrap table-hover">
											<thead>
												<tr>
													<th style="width:10%">
														<input class="" type="checkbox" onclick="checkAll()">
													</th>
													<th style="width:10%">번호</th>
													<th style="width:10%">점수</th>
													<th style="width:50%">문항 영역</th>
													<th style="width:20%">난이도</th>
												</tr>
											</thead>
											<tbody id="tblShow" class="questionList">
							            		<tr id="noQuestion" class="question">
							            			<td colspan="5" class="text-center">
							            				시험을 선택해주세요.
							            			</td>
							            		</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row" style="margin-top: 1em;">
									<div class="col-sm-3"></div>
									<div class="col-sm-9">
										<button type="submit" class="btn btn-dark" onclick="saveQuestionList()">
										저장
										</button>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="submit" class="btn btn-danger" onclick="deleteQuestionList()">
										삭제
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
	</section>

<script>
window.onload = function(){
	
	$(".clickableLine").on("click",function(){
		$(".selectedLine").attr("class","clickableLine");
		$(this).attr("class","selectedLine");
	});
	
	$(document).on("click",".text-sm",function(){
		let attachName = $(this).attr("data-attachname");
		let attachPath = $(this).attr("data-attachpath");
		
		window.open('/manager/lesson/viewTestPaper.do?attachPath='+encodeURI(attachPath)+'&attachName='+encodeURI(attachName),'pop_Notice','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=440,height=610,top=200,left=200');
	});
	
	
	$(document).on("click", "#examSearchBtn", function(){

			let value = $("#examSearch").val();
			
// 			console.log(value);
			
			$.ajax({
		        type: "post"
		       ,url : "/manager/score/examSearch.do"
		       ,data : {"value" : value,
		    	   
		    	   		}
		       ,success : function (data){
		    	   console.log(data);
		    	   printData(data,$('#examListDiv'),$('#examList-template'),$('#examList'));
		        }
		       ,error : function(e){
		        }
			});
			
			
		});
	
	$("#submitFormBtn").on("click",function(){
// 		let examId = $("#examId").text();
		regist_go();
	});
}
	

function download_go(obj){
	console.log(obj[0]);
	
	let attachName = obj.attr("data-attachname");
	let attachPath = obj.attr("data-attachpath");
	
	location.href = "/download.do?attachName="+attachName+"&attachPath="+attachPath;
	
}
</script>

	
	
	
	<script>

	var dataNum = 0;
	
	function addFile_go(){
		//alert('add file btn');
		
		if($('input[name="uploadFile"]').length >=5){
			alert("파일추가는 5개까지만 가능합니다.");
			return;
		}
		
		var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
// 		var save = $('<button>').attr({"type":"button", "id":"saveBtn"}).css("width","20px;");

		div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");  
		
		$('.fileInput').append(div);
		
		dataNum++;
	}
	
	function remove_go(dataNum){
		$('div[data-no="'+dataNum+'"]').remove();
	}
	
	function remove_old(obj){
		console.log(obj);
		obj.parent().remove();
		
		var input=$('<input>').attr({"type":"hidden",
									 "name":"deleteFile",
									 "value":obj.attr("data-attachgroupId")+"&"+obj.attr("data-attachId")
										});
		$('form[role="form"]').prepend(input);
	}
	
	
	// 파일 등록
	function regist_go(){
		
		var files = $('input[name="uploadFile"]');
		for(var file of files){
			console.log(file.name+" : "+file.value);
			if(file.value==""){
				alert("파일을 선택하세요.");
				file.focus();
				file.click();
				return;
			}
		}	
		
// 		console.log($("form[role='form']"));
		$("form[role='form']").submit();
		
	}
	
		// 추가할 시험의 정보를 출력하는 메서드
		function examAdd() {
			var examGroup = $('input[name="examGroup"]:checked').val();
			var examDate = $("#examDate").val();
			var examGrade = $("#examGrade option:selected").val();
			var examSemester = $("#examSemester option:selected").val();
			var examQuarter = $("#examQuarter option:selected").val();
			var examSeg = $("#examSeg option:selected").val();
			var examName = $("#examName").val();
			
			$("#examInfo").val(examGroup + " / " + examDate + " / " + examGrade + " / " + examSemester + " / " + examQuarter + " / " + examSeg + " / " + examName);
		}
		
		// 실제 시험을 등록하는 메서드
		function examRegist_go() {
			var examRegistForm = $('form[role="examRegistForm"]');
			
			
			examDate = $("#examDate").val();
			examName = $("#examName").val();
			
			if(examDate == "") {
				alert("시험일을 입력해주세요.");
				return;
			}
			
			if(examName == "") {
				alert("시험명을 입력해주세요.");
				return;
			}
			
			examRegistForm.submit();
		}
		
		function examDelete_go() {
			$("#examDate").val("");
			$("#examName").val("");
		}

		// 시험 상세정보 메서드
		function examDetail(examId) {
			OpenWindow('/manager/score/examDetail.do?examId='+examId,'시험 상세정보',800,700);
		}
		
		var examIdF = "";
		
		// 해당 시험의 문항 리스트를 조회하는 메서드
		function questionList_go(examId) {
			examIdF = parseInt(examId);
			
			$.getJSON("<%=request.getContextPath()%>/manager/score/questionList.do?examId="+examId, function(data) {
				printData(data,$('.questionList'),$('#question-list-template'),'.question');
				
			});
			
			$("#submitFormBtn").css("display","block");
			$("#addFileBtn").css("display","block");
			$("#subExamId").val(examId);
			$(".attachList").remove();
			$(".inputRow").remove();
// 			let attachGroupId;
			
			$.ajax({
		        type: "post"
		       ,url : "/manager/score/attachList.do"
// 		       ,contentType: 'application/json'
		       ,data : {"examId" : examId}
		       ,success : function (data){
		    	   console.log(data);
// 		           alert("성공.");
//  				 attachGroupId = data.attachList[0].attachGroupId;
// 		           $("#attachGroupId").val(attachGroupId);
		           printData(data,$('#attachListDiv'),$('#attachList-template'),$('#attachList'));
		           if( data.attachList == "" || data.attachList == null || data.attachList == undefined || ( data.attachList != null && typeof data.attachList == "object" && !Object.keys(data.attachList).length ) ){
		        	   $("#attachGroupId").val(null);
	        	   } else {
			           $("#attachGroupId").val(data.attachList[0].attachGroupId);
	        	   }

		        } 
		       ,error : function(e){
		        }
			});
			
		}
		
		// 해당 시험의 문항을 추가하는 메서드
		function rowAdd() {
			
			if(examIdF == "") {
				alert("시험을 선택해주세요.");
				return;
			}
			
			var questionNum = Number($("#questionNum").val());
			
			if(questionNum < 1) {
				questionNum = 1;
			}
			
 			// 문항리스트 없으면 테이블 비워주는 메서드
			if("$('#noQuestion')") {
				$('#noQuestion').remove();
			}
			
			var trNum = $("#tb1>tbody tr").length;
			
			var test1 = trNum + 1;
			var test2 = trNum + questionNum;
			
			$.getJSON("<%=request.getContextPath()%>/manager/score/questionList.do?examId="+examIdF, function(data) {
				printData(data,$('.addQuesArea'),$('#addQuesArea-list-template'),'.test555');
			});
			
			// 입력 갯수만큼 문항 입력 폼 추가해주는 메서드
			for(var i = test1; i <= test2; i++) {
				
				$("#tb1>tbody").append("<tr class='question questionValue'>"
									 +	   "<td><input class='selectObj' type='checkbox'></td>"
									 +     "<td><input type='text' class='form-control editable editText1' value='"+i+"'></td>"
									 +     "<td>"
									 +         "<input type='text' class='form-control editable editText2'>"
									 +     "</td>"
									 +	   "<td class='addQuesArea'>"

									 +     "</td>"
									 +	   "<td>"
									 +	       "<select class='form-control editable'>"
									 +	           "<option>상</option>"
									 +	           "<option>중</option>"
									 +	           "<option>하</option>"
									 +	       "</select>"
									 +	   "</td>"
									 + "</tr>");
				questionNum = 1;
			}
		}
		
		// 문항 저장 메서드
		function saveQuestionList() {
			
			if(examIdF == "") {
				alert("시험을 선택해주세요.");
				return;
			}
			
			//alert(examIdF + "저장 버튼 클릭");
			
			let newQuesNo = [];
			let newQuesScore = [];
			let newQuesArea= [];
			let newQuesDifficult = [];
			let questionArr = new Array();
			
			var sumScore = 0;
			
			
			$(".questionValue").each(function(i) {
				let questionInfo = new Object();
				
				newQuesNo = parseInt($(this).children().eq(1).children().val());
				newQuesScore = parseInt($(this).children().eq(2).children().val());
				
				if(newQuesScore < 0 || newQuesScore > 100) {
					alert("점수는 0~100 사이만 입력 가능합니다.");
					return;
				}
				
				sumScore += newQuesScore;
				
				if($(this).children().eq(2).children().val() == "") {
					newQuesScore = 0;
				}
				newQuesArea = $(this).children().eq(3).children().val();
				newQuesDifficult = $(this).children().eq(4).children().val();
				
				questionInfo.examId = examIdF;
				questionInfo.quesNo = newQuesNo;
				questionInfo.quesScore = newQuesScore;
				questionInfo.quesArea = newQuesArea;
				questionInfo.quesDifficult = newQuesDifficult;
				
				questionArr.push(questionInfo);
			});
			
			
			if(sumScore > 100) {
				alert("합산 점수가 100점 이상("+sumScore+")입니다. \n입력점수를 확인하고 다시 시도해주세요.");
				return;
			}
			
			if(sumScore < 0) {
				alert("합산 점수가 0점 이하("+sumScore+")입니다. \n입력점수를 확인하고 다시 시도해주세요.");
				return;
			}
			
			
			let dataItem = {
					examId : examIdF,
					questionList : questionArr
			}
			
			dataItem = JSON.stringify(dataItem);
			console.log(dataItem)
			
			$.ajax({
		        type: "post"
		       ,url : "/manager/score/updateQuestion.do"
		       ,contentType: 'application/json'
		       ,data : dataItem
		       ,success : function (data){
		    	   Swal.fire({
		    	        icon: 'success',
		    	        title: '완료!',
// 		    	        text: '문항정보가 저장되었습니다.',
		    	    });
		    	    setTimeout(function() {
		    			window.close();
		    			window.opener.location.reload(true);
		    	}, 1000);
		        }
		       ,error : function(e){
		        }
			});
		}
		
		// 문항 삭제 메서드
		function deleteQuestionList() {
			
			if(examIdF == "") {
				alert("시험을 선택해주세요.");
				return;
			}
			
			checkedQuestion = $("input:checkbox[class=selectObj]:checked").parent().parent();
			checkedQuestion.remove();
			
			var trNum = $("#tb1>tbody tr").length;
			
			$(".questionValue").each(function(i) {
				$(this).children().eq(1).children().val(i+1);
			});
			
			saveQuestionList();
			
		}
		
		
		// CheckAll 메서드
		var ischeck = false;
		
		function checkAll() {
			
			if(ischeck == false) {
				$('.selectObj').prop("checked", true);
				ischeck = true	;
			} else {
				$('.selectObj').prop("checked", false);
				ischeck = false;
			}
			
		}
		
		
		function printData(dataArr,target,templateObject,removeClass){
			var template=Handlebars.compile(templateObject.html());
			var html = template(dataArr);
			$(removeClass).remove();
			target.append(html);
		}
		
		function printHtmlData(data,target,templateObject){
			var template=Handlebars.compile(templateObject.html());
			var html = template(data);	
			target.html(html);
		}
		function printAfterData(data,delArea,target,templateObject){
			var template=Handlebars.compile(templateObject.html());
			var html = template(data);
			delArea.remove();
			target.after(html);
		}
		
	</script>
	
	
	<script>
		// 불러온 값 select option 체크해주는 메서드
		window.Handlebars.registerHelper('select', function( value, options ){
	        var $el = $('<select />').html( options.fn(this) );
	        $el.find('[value="' + value + '"]').attr({'selected':'selected'});
	        return $el.html();
	    });
	
	</script>
	
	
	
	<script type="text/x-handlebars-template"  id="examList-template">
		<table class="table table-head-fixed table-bordered table-hover" id="examList">
			<thead>
				<tr>
					<th>시험일</th>
					<th>구분</th>
					<th>학년</th>
					<th>학기</th>
					<th>분기</th>
					<th>과목</th>
					<th>시험명</th>
				</tr>
			</thead>
			<tbody>
	       					{{#if examList}}	
									
								{{#each examList}}

	       							<tr style="cursor:pointer;" onclick="questionList_go('{{examId}}');" ondblclick="examDetail('{{examId}}');">
	       								<td>{{examDate }}</td>
	       								<td>{{examGroup }}</td>
	       								<td>{{examGrade }}</td>
	       								<td>{{examSemester }}</td>
	       								<td>{{examQuarter }}</td>
	       								<td>{{examSeg }}</td>
	       								<td>{{examName }}</td>
	       							</tr>

	       						{{/each}}

							{{else}}
									<tr>
					           			<td colspan="7" class="text-center">
					           				해당내용이 없습니다.
					           			</td>
					           		</tr>

							{{/if}}		
			</tbody>
		</table>
	</script>
	
	
<script type="text/x-handlebars-template"  id="attachList-template" >
	
	{{#each attachList}}
	<tr class="attachList">
		<td colspan='2' style="text-align:left; cursor:pointer;">
			<a class="link-black text-sm" data-attachName="{{attachName}}" data-attachPath="{{attachPath}}"><i class="fas fa-link mr-1"></i>{{cutUUID attachName}}</a>
			<button data-attachGroupId="{{attachGroupId}}" data-attachId="{{attachId}}" onclick="remove_old($(this));" style="border:0;outline:0;" class="badge bg-red" type="button">X</button>
		</td>
	</tr>
	<div>
	{{/each}}
</script>
	
	<script type="text/x-handlebars-template"  id="question-list-template">
		{{#if questionList}}
			{{#each questionList}}
				<tr class="question questionValue">
					<td>
						<input class='selectObj' type='checkbox'>
						<input type='hidden' value='{{quesId}}'>
					</td>
					<td><input type='text' class='form-control editable editText1' value='{{quesNo}}'></td>
					<td>
						<input type='text' class='form-control editable editText2' value='{{quesScore}}'>
					</td>
					<td>
						<select class='form-control editable'>
							{{#select quesArea}}
								{{#each ../quesAreaList}}
									<option value='{{subjArea}}'>{{subjArea}}</option>
								{{/each}}
							{{/select}}
						</select>
					</td>
					<td>
						<select class='form-control editable'>
							{{#select quesDifficult}}
							<option value="상">상</option>
							<option value="중">중</option>
							<option value="하">하</option>
							{{/select}}
						</select>
					</td>
				</tr>
				{{/each}}
		{{else}}
			<tr id="noQuestion" class="question">
				<td colspan="5" class="text-center">
					문항 정보가 없습니다.
				</td>
			</tr>
		{{/if}}
	</script>
	
	<script  type="text/x-handlebars-template"  id="addQuesArea-list-template">
		<select class='form-control editable test555'>
			{{#each quesAreaList}}
				<option value='{{subjArea}}'>{{subjArea}}</option>
			{{/each}}
		</select>
	</script>
	
</body>