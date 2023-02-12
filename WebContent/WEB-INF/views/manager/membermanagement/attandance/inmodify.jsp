<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="IdList" value="${dataMap.IdList }" />
<c:set var="studentById" value="${dataMap.studentById }" />
<c:set var="att" value="${dataMap.att }" />
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<meta charset="UTF-8">
<title>등원</title>
</head>
<body>

	<section class="content">
		<div class="container-fluid">
			<div class="card-body table-responsive p-0">
				<div id="attandance big" class="row" style="max-width: 100%;">
					<div class="col-sm-12">
						<div class="card card-dark card-outline" style="margin-top: 2vh;">
							<div class="card-header" style="display: flex;">
								<h1 class="card-title" style="font-size: 1.8rem;" data-userId="${loginUser.id }">
									<i class="fa-solid fa-image-portrait fa-lg"></i> &nbsp;&nbsp; 등원
								</h1>
								<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '등원') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '등원') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
								
							</div>
							<div class="row">
								<div id="profile" class="col-sm-6" style=" background-size: 80% 80%; height: 85vh;">
								</div>
								<div class="col-sm-6" style="height: 100%;">
									<div class="col-sm-12">
										<h3 style="text-align: center; margin-top: 10vh">${studentById.name}</h3>

										<table class="table table-hover text-nowrap">
											<tbody>
												<tr>
													<td>학교명</td>
													<c:if test="${empty studentById.schoolName}"><td id="schoolName"> </td></c:if>
													<c:if test="${!empty studentById.schoolName}">					
													<td id="schoolName">${studentById.schoolName}</td>
													</c:if>
												</tr>
												<tr>
													<td>학년</td>
													<td>${studentById.grade}</td>
												</tr>
												<tr>
													<td>반</td>
													<td>${studentById.className}</td>
												</tr>
												<tr>
													<td>담임선생님</td>
													<td>${studentById.mngId}</td>
												</tr>
												<tr>
													<td>출석시간</td>
													<td>${att.atnGoTime}</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="col-sm-12"
										style="text-align: center; margin-top: 5vh;">
										<button type="button"
											class="btn btn-block btn-outline-primary btn-lg"
											style="display: inline; width: 15vh; height: 15vh; margin: 5vh;" onclick="loadParentHP();">출석</button>
										<button type="submit"
											class="btn btn-block btn-outline-danger btn-lg"
											style="display: inline; width: 15vh; height: 15vh; margin: 5vh;" onclick="canclemodify_go();">취소</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</section>
	<input id="studentId1" type="hidden" value="${studentById.id}">
	<form role="form" class="form-horizontal" action="inmodify.do"  method="post" >
		<input type="hidden" value="${IdList[0].studentId}" name="studentId">
	</form>	
	<form role="formCancle" class="form-horizontal" action="inmodifyCancle.do"  method="post" >
		<input type="hidden" value="${IdList[0].studentId}" name="studentId">
	</form>
<script>
window.onload=function(){

	let id = '${studentById.id}';
	//alert('get picture 실행 테스트');
	 $('div#profile').css({'background-image':'url('+"/manager/membermanagement/getPicture.do?id="+id+')',
         'background-position':'center',
         'background-repeat':'no-repeat'
         });
	 
	 console.log($('#schoolName').text())
	 
	if($('#schoolName').text() == " "){
		Swal.fire({
	        icon: 'error',
	        title: 'QR 체크 확인 대기중인 학생이 없습니다.',
//		        text: '문항정보가 저장되었습니다.',
	        showConfirmButton: false,
	    });
		 setTimeout(function() {
			 window.location.href="/manager/main.do"
				
		}, 1000);
	 }
	 
}
function modify_go(){
		//alert("modify btn click");
		
		var form=$('form[role="form"]');	
		form.submit();
	}
function canclemodify_go(){
		//alert("modify btn click");
		var form=$('form[role="formCancle"]');	
		form.submit();
	}
	
function loadParentHP(){
	var studentId1 = $('#studentId1').val();
	//var studentId1 = "hongsound@gmail.com";
	//console.log(studentId1);
	$.ajax({
		  url:"/manager/membermanagement/membermanagement/detail.do",
		  type:'post',
		  data:{"id" : studentId1},
	      success:function(data){
	    	  var parentHp = '';
	    	  var studentName1 = '';
	    	  //console.log(data);
	    	  parentHp = data.parent.parentHp;
	    	  studentName1 = data.student.name;
	    	  //console.log(parentHp);
	    	  //console.log(studentName1);
	    	  messageAlarmToParent(parentHp,studentName1);
	    	 },
	      error:function(error){
	      }
	});
}	

// 자녀 출석시 부모에게 문자보냄
function messageAlarmToParent(parentHp,studentName1){
	//console.log(parentHp);
	//console.log(studentName1);
	$.ajax({
		  url:"/manager/academymanagement/message/alarmSend.do",
		  type:'post',
		  data:{"parentHp" : parentHp,
			  	"studentName" : studentName1},
	      success:function(){
	    	  Swal.fire({
	  	        icon: 'success',
	  	        title: '부모님께 알람을 보냈습니다.',
	  	      }).then(function(){
	    	 	 modify_go();
				});
	    	},
	      error:function(error){
	      }
	});
	
}	
</script>	
</body>
</html>