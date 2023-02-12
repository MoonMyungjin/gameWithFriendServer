<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="school" value="${dataMap.school }" />
<c:set var="cri" value="${pageMaker.cri }" />




<head>
	<style>
		* {
			font-size: 14px;
		}
		
		label {
			margin-bottom: 0;
		}
		
		div.table1 {
			
			overflow-y: auto;
		}
		
		div.table2 {
			max-height: 180px;
			overflow-y: scroll;
		}
		
		div.table3 {
			max-height: 568px;
			overflow-y: scroll;  
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
		
		
		.alert {
			text-align: center;
		}
		.alert {
			font-size: 15px;
		}
		
		.alert-dismissible {
	    	padding-right: 0;
	    	padding-left: 0;
		}
	</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6" style="display: flex;">
					<h1 data-userId="${loginUser.id }">학교정보관리</h1>
					<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '학교정보관리') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '학교정보관리') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
					
				</div>
				
			</div>
		</div>
	</section>
	<section class="content">
		<div class="container-fluid">
			<div class="row">

				<!-- 좌측 영역 -->
				<div class="col-sm-12">
					<div class="card card-dark card-outline">

						<div class="card-header">
							<h3 class="card-title">
								<i class="nav-icon fas fa-search"></i> &nbsp;&nbsp; 학교 정보 검색 옵션
							</h3>
						</div>

						<div class="card-body" style="padding-top: 5px;">

							
							<div class="row">
							<div class="col-sm-3">
							</div>
							<div class="col-sm-3">
							</div>
							<div class="col-sm-3">
							</div>
							<div class="col-sm-3">
								<div class="input-group" style="padding: 5px;">
						
									
								 <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }" >
									<div class="input-group-append">
										<button type="button" class="btn btn-dark"
											style="height: 35px;" onclick="list_go(1)">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</div>
							</div>
							<div class="row"></div>
						</div>
						<!-- card body -->
					</div>
					<!-- card-outline -->
					
					
					<br />
					
				
					<div class="card card-dark card-outline">

						<div class="card-header">
							<div class="row">
								<div class="col-sm-3">
									<h3 class="card-title">
										<i class="fas fa-list" aria-hidden="true"></i> &nbsp;&nbsp; 학교 리스트
									</h3>
								</div>
								<div class="col-sm-1">
									
								</div>
								<div class="col-sm-3">
									<input id="pomNum" type="text" class="form-control float-right" placeholder="폼 갯수 입력" style="width: 9vh; height: 3vh;">
								</div>
								<div class="col-sm-1">
									<button type="button" class="btn btn-block btn-dark btn-xs" onclick="rowAdd()">폼추가</button>
								</div>
								<div class="col-sm-1">
									<button type="button" id="deletepom" class="btn btn-block btn-danger btn-xs">폼삭제</button>
								</div>	
							
								<div class="col-sm-1">
									<button type="button" id="save" class="btn btn-block btn-dark btn-xs">저장</button>
								</div>
								<div class="col-sm-1">
									<button type="button" id="delete" class="btn btn-block btn-danger btn-xs">삭제</button>
								</div>
								
								<div class="col-sm-1">
									<button id="listSaveExcelBtn" type="button" class="btn btn-block btn-info btn-xs">EXCEL</button>
								</div>
							</div>
							
						</div>
						<div class="card-body" >
							
								
								
								
							
							<div class="row table1" style="height: 56vh;">
								<div class="card-body table p-0">
									<table id="tb1" class="table table-head-fixed table-bordered"  >
										<thead >
										
											<tr >
												<th class="excludeThisClass" ><input  type="checkbox"  value="option1" onclick="checkAll()"></th>
												<th style="background-color:rgb(32 73 105); color: white;">NO</th>
												<th style="background-color:rgb(32 73 105); color: white;">학교명</th>
												<th style="background-color:rgb(32 73 105); color: white;">URL</th>
												<th style="background-color:rgb(32 73 105); color: white;">주소</th>
												
												<th style="background-color:rgb(32 73 105); color: white;">구분1</th>
												<th style="background-color:rgb(32 73 105); color: white;">구분2</th>
												<th style="background-color:rgb(32 73 105); color: white;">구분3</th>
												
											</tr>
										</thead>
										<tbody id="body">
										<c:forEach items="${school}" var="school" varStatus="loop" >
											<tr style="max-height: 4vh;">
												<td class="testd excludeThisClass"  style="max-height: 4vh;"><input id="${loop.index}"  class="tes"  type="checkbox"  value="option1" style="margin-top: 2vh;"></td>
												<td style="padding: 0px; margin: 0px; max-height: 4vh;"><input id="scid" class="form-control" type="text" value="${school.schoolId }" width="100%" readonly="readonly"></td>
												<td style="padding: 0px; margin: 0px; max-height: 4vh;"><input id="scname"  class="form-control" type="text" value="${school.schoolName }" width="100%"></td>
												<td style="padding: 0px; margin: 0px; max-height: 4vh;"><input id="scurl" class="form-control" type="text" value="${school.schoolURL }" width="100%"></td>
												<td style="padding: 0px; margin: 0px; max-height: 4vh;"><input id="scaddr" class="form-control" type="text" value="${school.schoolAddress }" width="100%"></td>
												
												<td style="padding: 0px; margin: 0px; max-height: 4vh;;"><input id="sctype" class="form-control" type="text" value="${school.schoolType }" width="100%"></td>
												<td style="padding: 0px; margin: 0px; width: 15vh; max-height: 4vh;"><input id="scgrade" class="form-control" type="text" value="${school.schoolGrade }" width="100%"></td>
												<td style="padding: 0px; margin: 0px; width: 10vh; max-height: 4vh;" ><input id="scgender" class="form-control" type="text" value="${school.schoolGender }" width="100%"></td>
												
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>







				</div>
			</div>
		</div>
	</section>
	
	<form id="jobForm">	
		<input type='hidden' name="page" value="" />
		<input type='hidden' name="perPageNum" value="300"/>
		<input type='hidden' name="searchType" value="" />
		<input type='hidden' name="keyword" value="" />
	</form>
	
	
<script>
var box = document.getElementById('body');
var boxCount= box.childElementCount;
var addrowCount =0;
function rowAdd() {
	++addrowCount;
	var schoolListNum = Number($("#pomNum").val());
	
	if(schoolListNum < 1){
		schoolListNum = 1;
	}
	
	var trNum = $("#tb1>tbody tr").length;
	
	var test1 = trNum + 1;
	var test2 = trNum + schoolListNum;
	
	for(var i = test1; i <= test2; i++) {
		$("#tb1>tbody").append("<tr>"
							 +     "<td><input type='checkbox' class='tes'  value='option1' style='margin-top: 2vh;'></td>"
							 +     "<td  style='padding: 0px; margin: 0px;'><input id='scid' class='form-control' type='text'  width='100%' readonly='readonly'></td>"
							 +     "<td  style='padding: 0px; margin: 0px;'><input id='scname' class='form-control' type='text'  width='100%'></td>"
							 +     "<td  style='padding: 0px; margin: 0px;'><input id='scurl' class='form-control' type='text'  width='100%'></td>"
							 +     "<td  style='padding: 0px; margin: 0px;'><input id='scaddr' class='form-control' type='text'  width='100%'></td>"
							 
							 +     "<td  style='padding: 0px; margin: 0px;'><input id='sctype'  class='form-control' type='text'  width='100%'></td>"
							 +     "<td  style='padding: 0px; margin: 0px;'><input id='scgrade' class='form-control' type='text'  width='100%'></td>"
							 +     "<td  style='padding: 0px; margin: 0px;'><input id='scgender' class='form-control' type='text'  width='100%'></td>"
							
							 +    												
							 + "</tr>");
		schoolListNum = 1;
	}
	box = document.getElementById('body'); 
	boxCount = box.childElementCount;
	for(var i =0; i < boxCount; i++){
		
		var test =$("#body").children('tr:eq('+i+')').children('td:eq(0)').children().attr("id",i);

		
	
	}
}



</script>
<script>








//CheckAll 메서드
var ischeck = false;

function checkAll() {
	
	if(ischeck == false) {
		$('.tes').prop("checked", true);
		ischeck = true	;
	} else {
		$('.tes').prop("checked", false);
		ischeck = false;
	}
	
}
 

let schoolVOList2 = new Map();

let schoolId2;
let schoolName2;
let schoolURL2;
let schoolAddress2;
let schoolType2;
let schoolGrade2;
let schoolGender2;
let schoolVOList3 =[];
let checkNum=0;
window.onload=function(){
	
	$(document).on("click","#listSaveExcelBtn",function(){
			$("#tb1").table2excel({
		        exclude: ".excludeThisClass",
		        name: "sheet1",
		        filename: "학교List", 
		        preserveColors: false 
		 	});
	 });
	
$(document).delegate('.tes', 'change', function () {
    // From the other examples
    

   
   
});
$(document).delegate('#save','click',function(){
		
		
	   
	     for(var i=0; i<boxCount; ++i){ 
	    	 let ifcheck = i.toString();
	    	 
	    	 if(document.getElementById(ifcheck).checked) {
	    		
	    		 	let schoolVO ={};
	    
	    	   
	    	        
	    	       schoolId2 = $("#"+ifcheck+"").parent().parent().children('td:eq(1)').children().val();
	    	       schoolName2 = $("#"+ifcheck+"").parent().parent().children('td:eq(2)').children().val();
	    	       schoolURL2 = $("#"+ifcheck+"").parent().parent().children('td:eq(3)').children().val();
	    	       schoolAddress2 = $("#"+ifcheck+"").parent().parent().children('td:eq(4)').children().val();
	    	       schoolType2 = $("#"+ifcheck+"").parent().parent().children('td:eq(5)').children().val(); 
	    	       schoolGrade2 = $("#"+ifcheck+"").parent().parent().children('td:eq(6)').children().val();
	    	       schoolGender2 = $("#"+ifcheck+"").parent().parent().children('td:eq(7)').children().val();
	    	       
	    	       
	    	       schoolVO.schoolGender = schoolGender2;
	    	       schoolVO.schoolId = schoolId2;
	    	       schoolVO.schoolName = schoolName2;
	    	       schoolVO.schoolURL = schoolURL2;
	    	       schoolVO.schoolAddress = schoolAddress2;
	    	       schoolVO.schoolType = schoolType2;
	    	       schoolVO.schoolGrade = schoolGrade2;
	    	       checkNum = i.toString();
	    	        
	    	       schoolVOList2.set(checkNum.toString(),schoolVO);
	    	    }else{
	    	    	
	    	       checkNum = i.toString();
	    	       
	    	       schoolVOList2.delete(checkNum.toString());
	    	    }
	      } 
		
		
		
		
		var i= 1;
		
	 	for(var value of schoolVOList2 ){
			for(var value2 of value){
				if(i%2 ===0){
					
			 		schoolVOList3.push(value2);					
				}
			
				++i;
			}
			
		}
	 	let schoolVOListInsert =[];
	 	let schoolVOListUpdate =[];
	 	
	 	for(var i =0; i < schoolVOList3.length; i++){
	 			let vo = schoolVOList3[i];
	 			let meid = vo['schoolId'];
	 			
	 			console.log(meid);
				if(meid === ""){
					schoolVOListInsert.push(vo);
				}else{
					schoolVOListUpdate.push(vo);
				}		
	 	}	
	 		
	 			
				let dataItem = {
							schoolVOList : schoolVOListInsert
						  
				};
					 	
				 dataItem = JSON.stringify(dataItem);
				console.log(dataItem);
				$.ajax({
			        type: "post"
			       ,url : "/manager/school/regist.do"
			       ,contentType: 'application/json'
			       ,data : dataItem
			       ,success : function (data){
			        	
			    	   location.href = "/manager/school/list.do";
			        }
			       ,error : function(e){
			        }
				});
				
				
				
				let dataItem2 = {
							schoolVOList : schoolVOListUpdate
						  
				};
					 	
				 dataItem2 = JSON.stringify(dataItem2);
				 console.log(dataItem2);
				$.ajax({
			        type: "post"
			       ,url : "/manager/school/update.do"
			       ,contentType: 'application/json'
			       ,data : dataItem2
			       ,success : function (data){
			        	
			    	   location.href = "/manager/school/list.do";
			        }
			       ,error : function(e){
			        }
				});
				
	 		
	});
	
	$("#delete").click(function(){
		
		for(var i=0; i<boxCount; ++i){ 
	    	 let ifcheck = i.toString();
	    	 
	    	 if(document.getElementById(ifcheck).checked) {
	    		
	    		 	let schoolVO ={};
	    
	    	   
	    	        
	    	       schoolId2 = $("#"+ifcheck+"").parent().parent().children('td:eq(1)').children().val();
	    	       schoolName2 = $("#"+ifcheck+"").parent().parent().children('td:eq(2)').children().val();
	    	       schoolURL2 = $("#"+ifcheck+"").parent().parent().children('td:eq(3)').children().val();
	    	       schoolAddress2 = $("#"+ifcheck+"").parent().parent().children('td:eq(4)').children().val();
	    	       schoolType2 = $("#"+ifcheck+"").parent().parent().children('td:eq(5)').children().val(); 
	    	       schoolGrade2 = $("#"+ifcheck+"").parent().parent().children('td:eq(6)').children().val();
	    	       schoolGender2 = $("#"+ifcheck+"").parent().parent().children('td:eq(7)').children().val();
	    	       
	    	       
	    	       schoolVO.schoolGender = schoolGender2;
	    	       schoolVO.schoolId = schoolId2;
	    	       schoolVO.schoolName = schoolName2;
	    	       schoolVO.schoolURL = schoolURL2;
	    	       schoolVO.schoolAddress = schoolAddress2;
	    	       schoolVO.schoolType = schoolType2;
	    	       schoolVO.schoolGrade = schoolGrade2;
	    	       checkNum = i.toString();
	    	        
	    	       schoolVOList2.set(checkNum.toString(),schoolVO);
	    	    }else{
	    	    	
	    	       checkNum = i.toString();
	    	       
	    	       schoolVOList2.delete(checkNum.toString());
	    	    }
	      } 
		
		
		var i= 1;
		
	 	for(var value of schoolVOList2 ){
			for(var value2 of value){
				if(i%2 ===0){
					console.log(value2);
			 		schoolVOList3.push(value2);					
				}
			
				++i;
			}
			
		} 
			
		let dataItem2 = {
					schoolVOList : schoolVOList3
				  
		};
		 	
		 dataItem2 = JSON.stringify(dataItem2);
		console.log(dataItem2);
		$.ajax({
	        type: "post"
	       ,url : "/manager/school/delete.do"
	       ,contentType: 'application/json'
	       ,data : dataItem2
	       ,success : function (data){
	    	   
	    	   location.reload();
	        }
	       ,error : function(e){
	        }
		});
	});
	
$(document).delegate('#deletepom','click',function(){
			let count =1;
		/* 	box = document.getElementById('body');
			boxCount = box.childElementCount; */
			console.log(boxCount);
			let boxCountNew = (boxCount-1).toString();
		for(var i=0; i<boxCount; ++i){
			console.log("new box"+boxCountNew)
	    	let ifcheck = i.toString();
	    	console.log(ifcheck);
	    	console.log(document.getElementById(0));
	    	console.log(document.getElementById(1));
	    	console.log(document.getElementById(2));
	    	console.log(document.getElementById(3));
	    	console.log(document.getElementById(4));
	    	if(document.getElementById(boxCountNew).checked) {
	    		
	    		schoolId2 = $("#"+boxCountNew+"").parent().parent().children('td:eq(1)').children().val();
	    		
	    		if(schoolId2 === ""){
	    			
					$("#"+boxCountNew+"").parent().parent().parent().children('tr:eq('+boxCountNew+')').remove();
	    		}else{
	    			
	    			
	    			if(count <2){
	    				
	    				alert("정보가 들어간 폼은 삭제하실수 없습니다.");
	    			}	
	    			count++;
	    		}
				
	    	}
	    	--boxCountNew;
		}
	});
}
function list_go(page,url){
	if(!url) url="list.do";
	
	var jobForm=$('#jobForm');
	
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val(300);
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());

	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
}




</script>

</body>
</html>