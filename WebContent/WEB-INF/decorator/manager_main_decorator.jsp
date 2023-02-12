<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title><decorator:title default="HEXA System"/></title>

	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  	<!-- sweetalert -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  	<decorator:head />
  	<style>
  		[class*=sidebar-dark-] {
		    background-color: rgb(32 73 105);
		}
		[class*=sidebar-dark-] .sidebar a {
		    color: rgb(253 251 216);
		}
		/* [class*=sidebar-dark-] {
		    background-color: rgb(168 210 168);
		}
		[class*=sidebar-dark-] .sidebar a {
		    color: #011d4e;
		}
		[class*=sidebar-dark-] .nav-treeview>.nav-item>.nav-link {
		    color: #011d4e;
		} */
		[class*=sidebar-dark] .brand-link {
		    border-bottom: rgb(32 73 105);
		}
		
  	</style>
  	
</head>

<body>
	<div class="wrapper" >
		<%@ include file="/WEB-INF/include/header.jsp" %>
		
		<%@ include file="/WEB-INF/include/manager_aside.jsp" %>
			
			<div class="content-wrapper">
				<decorator:body />
			</div>
		
		<%@ include file="/WEB-INF/include/footer.jsp" %>
	</div>
	
	
	<!-- jQuery -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
	
	<script>
	$('div.wrapper').css({
		"max-width":"1280px",
		"margin":"0 auto"
	});
	</script>
	<script>
	let calpId;
	let calpStTime;
	let calpFinTime;
	let calpContent;
	let calpStart;
	let calpEnd;
	let calpTitle;
function testclick(detailId,detailStTime,detailFinTime,detailContent,detailStart,detailEnd,detailTitle) {
		calpId = detailId;
		calpStTime = detailStTime;
		calpFinTime = detailFinTime;
		calpContent = detailContent;
		calpStart = detailStart;
		calpEnd = detailEnd;
		calpTitle = detailTitle;
		
		
	Swal.fire({
		  title: '<일정 상세정보>',
		  html: `	
			  	
			  일정명&nbsp;&nbsp;&nbsp;<input type="text" id="calpTitle" class="swal2-input" value=`+calpTitle+` readonly="readonly"> <br>
			  시작일&nbsp;&nbsp;&nbsp;<input type="text" id="calpStart" class="swal2-input" value=`+calpStart+` readonly="readonly"><br>
			  시작시간<input type="time" id="calpStTime" class="swal2-input" value=`+calpStTime+` style="width:12vh;" ><br>
			  종료일&nbsp;&nbsp;&nbsp;<input type="text" id="calpEnd" class="swal2-input" value=`+calpEnd+` readonly="readonly"><br>
			  종료시간<input type="time" id="calpFinTime" class="swal2-input" value=`+calpFinTime+` style="width:12vh;"><br>
			    일정내용<input type="text" id="calpContent" class="swal2-input" value=`+calpContent+`><br>
			 <input type="hidden" id="calpId" class="swal2-input" value=`+calpId+`><br>
			 <button id="modifyUp" type="submit" class="btn btn-dark" >
				수정
			</button>
			 <button id="deleteUp" type="submit" class="btn btn-danger" >
				삭제
			</button>
			 <button id="closeUp" type="submit" class="btn btn-secondary" >
				닫기
			</button>
		  	  `,
		  /* confirmButtonText: '수정', */
		  focusConfirm: false
		 
	})
/* 		  preConfirm: () => {
		    const login = Swal.getPopup().querySelector('#calpId').value
		    const password = Swal.getPopup().querySelector('#calpStTime').value
		   
		    if (!login || !password) {
		      Swal.showValidationMessage(`Please enter login and password`)
		    }
		    return { login: login, password: password }
		  }
		}).then((result) => {
		  Swal.fire(`
		    Login: ${result.value.login}
		    Password: ${result.value.password}
		  `.trim())
		}) */
		$('#calpStTime').css({
			"height":"5vh",
			"width":"27vh"		
		});
		$('#calpFinTime').css({
			"height":"5vh",
			"width":"27vh"		
		});
		
		$('.swal2-actions').css('display','none');
		
		
		$(document).delegate('#closeUp', 'click', function () {
			console.log("test");
			
			$('.swal2-container').css('position','unset');
		});
		$(document).delegate('#deleteUp', 'click', function () {
			calpId = $('#calpId').val();
			 let dataItem7 = {
						
					  acaScheId : calpId
					  
				};
			 dataItem7= JSON.stringify(dataItem7);
				console.log(dataItem7);
				 $.ajax({
				     type: "post"
				    ,url : "/manager/academysche/deleteDetail.do"
				    ,contentType: 'application/json'
				    ,data : dataItem7
				    ,success : function (data){
				 	  
				 	 document.getElementById('managerifr').contentDocument.location.reload(true);
				 	 
				 	  $('.swal2-container').css('position','unset');
				 		     }
				    ,error : function(e){
				    }
				});
		});
		$(document).delegate('#modifyUp', 'click', function () {
			calpId = $('#calpId').val();
			calpStTime = $('#calpStTime').val();
			calpFinTime = $('#calpFinTime').val();
			calpStart = $('#calpStart').val();
			calpEnd = $('#calpEnd').val();
			calpContent = $('#calpContent').val();
			calpTitle = $('#calpTitle').val();
			console.log(calpId);
			console.log(calpStTime);
			console.log(calpFinTime);
			console.log(calpStart);
			console.log(calpEnd);
			console.log(calpContent);
			console.log(calpTitle);
			  let dataItem6 = {
						
					  acaScheId : calpId,
					  title : calpTitle,
					  acaScheContent : calpContent,
					  start: calpStart,
					  end: calpEnd,
					  acaScheStTime : calpStTime,
					  acaScheFinTime : calpFinTime
				};
				dataItem6 = JSON.stringify(dataItem6);
				console.log(dataItem6);
				 $.ajax({
				     type: "post"
				    ,url : "/manager/academysche/updateDetail.do"
				    ,contentType: 'application/json'
				    ,data : dataItem6
				    ,success : function (data){
				 	  
				 	 document.getElementById('managerifr').contentDocument.location.reload(true);
				 	  
				 	
				 		     }
				    ,error : function(e){
				    }
			});
		}); 

};

 
	</script>  
	
	<script>
			
	
	
	</script>
</body>
</html>