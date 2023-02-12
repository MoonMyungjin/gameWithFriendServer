<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="IdList" value="${dataMap.IdList }" />
<c:set var="studentById" value="${dataMap.studentById }" />
<c:set var="att" value="${dataMap.att }" />
<head>
<meta charset="UTF-8">
<title>하원</title>
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
									<i class="fa-solid fa-image-portrait fa-lg"></i> &nbsp;&nbsp; 하원
								</h1>
								<!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '하원') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '하원') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
								
							</div>
							<div class="row">
								<div class="col-sm-6" id="profile" style="  background-size: 80% 80%; height: 85vh;">
								</div>
								<div class="col-sm-6" style="height: 100%;">
									<div class="col-sm-12">
										<h3 style="text-align: center; margin-top: 10vh">${studentById.name}</h3>

										<table class="table table-hover text-nowrap">
											<tbody>
												<tr>
													<td>학교명</td>
													<td>${studentById.schoolNo}</td>
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
											style="display: inline; width: 15vh; height: 15vh; margin: 5vh;" onclick="modify_go();">하원</button>
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
	<form role="form" class="form-horizontal" action="outmodify.do"  method="post" >
		<input type="hidden" value="${IdList[0].studentId}" name="studentId">
	</form>	
	<form role="formCancle" class="form-horizontal" action="outmodifyCancle.do"  method="post" >
		<input type="hidden" value="${IdList[0].studentId}" name="studentId">
	</form>	
<script>
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
	
window.onload=function(){

	let id = '${studentById.id}';
	//alert('get picture 실행 테스트');
	 $('div#profile').css({'background-image':'url('+"/manager/membermanagement/getPicture.do?id="+id+')',
         'background-position':'center',
         'background-repeat':'no-repeat'
         });
	 
}	
</script>	
</body>
</html>