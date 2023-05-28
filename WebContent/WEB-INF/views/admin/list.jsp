<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title></title>
<style>
* {
	font-size: 14px;
}

.table th{
	background-color: rgb(32, 73, 105) !important;
	color: white;
}

.lineTr:hover {
	cursor: pointer;
	color: #fdfbd7;
    background-color: rgb(32 73 105);
    border-color: white;
    box-shadow: none;
}
.selectedTr {
	color: #fdfbd7;
    background-color: rgb(32 73 105);
    border-color: white;
    box-shadow: none;
}
.tright{
	text-align: right;
}
</style>
</head>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6" style="display: flex;">
					<h1>회원관리</h1>
				</div>
				<div class="col-sm-6 tright">
					수정을 원하시는 회원 정보를 더블클릭 해주세요
				</div>
			</div>
		</div>
	</section>
	<section class="content">
		<div class="container-fluid">
			<div class="row table1">
				<table class="table table-head-fixed table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>NAME</th>
							<th>NICKNAME</th>
							<th>마지막 로그인 IP</th>
							<th>최종접속일</th>
							<th>상태코드</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList}" var="user" varStatus="i">
							<tr>
								<td>${user.UIntgId}</td>
								<td>${user.UName}</td>
								<td>${user.UNickname}</td>
								<td>${user.ULastLoginIp}</td>
								<td>
									<fmt:formatDate value="${user.ULastLoginDttm}" pattern="YYYY-MM-DD"/>
								</td>
								<td>${user.UStateCd}</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</div>
	
	</section>
	
	<script>
		 
		 
	window.onload = function(){

		
		$("#searchBtn").on("click",function(){
			var search = $(this).parent().parent().children().val();
			
			location.href = "/manager/consulting/list.do?search="+search;
			 
		});

		
	let cnsltId;
	$(document).on("click",".lineTr",function(){
		$(".selectedTr").attr("class","lineTr");
		$(this).attr("class","selectedTr")
		
		cnsltId = $(this).attr("data-id");
		console.log(cnsltId);
		
		
		$.ajax({
		     type: "post"
		    ,url : "/manager/consulting/finishDetail.do"
		    ,data : {"cnsltId" : cnsltId}
		    ,success : function (data){
			 	   console.log(data.finishDetail.parentName);
			 	   console.log(data.finishDetail);
			 	   console.log(data);
			 	   
			 	   
			 	   let studentHpStr = data.finishDetail.studentHp
			 	   studentHpStr = studentHpStr.substr(0,3)+"-"+studentHpStr.substr(3,4)+"-"+studentHpStr.substr(7,4);
			 		console.log(studentHpStr);
			 		let modifyDay = data.finishDetail.cnsltSchDate
			 		let modifiedDay = parseInt(modifyDay.split("-")[2])+1;
			 		if(modifiedDay < 10){
			 			modifiedDay = "0"+modifiedDay;
			 		}
		 	 		modifyDay = modifyDay.split("-")[0]+"-"+modifyDay.split("-")[1]+"-"+modifiedDay;
			 		console.log(modifyDay);
			 		
			 		
			    	if(data.finishDetail.parentName == null ){
			    	
		 	    	$("#cnsltSchDate").text(modifyDay);
		 			$("#scodeValue").attr("data-id",cnsltId);
			 		$("#scodeValue").text(data.finishDetail.scodeValue);
			 		$("#cnsltSchTime").text(data.finishDetail.cnsltSchTime);
			 		$("#parentName").text(data.finishDetail.studentName);
			 		$("#parentHp").text(studentHpStr);
			 		$("#studentName").text(data.finishDetail.studentName);
			 		$("#studentHp").text(studentHpStr);
			 		$("#schoolName").text(data.finishDetail.schoolName);
			 		$("#grade").text(data.finishDetail.grade);
			 		$("#className").text(data.finishDetail.className); 
			 		$("#cnsltContent").text(data.finishDetail.cnsltContent); 
			 		$("#cnsltAs").text(data.finishDetail.cnsltAs); 
			 	
			 		
			    }else{ 
			 		let parentHpStr = data.finishDetail.parentHp
			 		parentHpStr = parentHpStr.substr(0,3)+"-"+parentHpStr.substr(3,4)+"-"+parentHpStr.substr(7,4);
			 		console.log(parentHpStr);
			 		
			 		$("#cnsltSchDate").text(modifyDay);
			 		$("#scodeValue").attr("data-id",cnsltId);
			 		$("#scodeValue").text(data.finishDetail.scodeValue);
			 		$("#cnsltSchTime").text(data.finishDetail.cnsltSchTime);
			 		$("#parentName").text(data.finishDetail.parentName);
			 		$("#parentHp").text(parentHpStr);
			 		$("#studentName").text(data.finishDetail.studentName);
			 		$("#studentHp").text(studentHpStr);
			 		$("#schoolName").text(data.finishDetail.schoolName);
			 		$("#grade").text(data.finishDetail.grade);
			 		$("#className").text(data.finishDetail.className);
			 		$("#cnsltContent").text(data.finishDetail.cnsltContent); 
			 		$("#cnsltAs").text(data.finishDetail.cnsltAs); 
			    }
		     }
		    ,error : function(e){
		     }
			});

	     });
	
	
	$("#registBtn").click(function(){
	 let cnsltContent = $("#cnsltContent").val();
	 let cnsltAs = $("#cnsltAs").val();
	 
	 console.log(cnsltId);
	
	let dataItem = {
			"cnsltContent" : cnsltContent,
			"cnsltAs" : cnsltAs,
			"cnsltId" : cnsltId
		};
	console.log(dataItem);
	
	
	
		  $.ajax({
	          type: "post"
	         ,url : "/manager/consulting/updateRegist.do"
	         ,data : dataItem
	         ,success : function (data){
	        	 console.log(data);
	        		Swal.fire({
				        icon: 'success',
				        title: '저장이 완료 되었습니다!'
				    });
			    	setTimeout(function() {
				    	location.reload();
			    		}, 2000);
	        	 
			     }
	         ,error : function(e){
	          }
	  		}); 
	
	});
	}	
	

</script>

<script>
function list_go(page,url){
      if(!url) url="/manager/consulting/list.do";
      
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