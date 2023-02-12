<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<head>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">

<style>
/* 	.btn-light { */
/*     color: #fdfbd7; */
/*     background-color: #3ab5eb; */
/*     border-color: #3ab5eb; */
/*     box-shadow: none; */
/* } */

	div.table1 {
		max-height: 230px;
		overflow-y: auto;
	}
	div.table2 {
		max-height: 230px;
		overflow-y: auto;
	}
</style>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>

<title>쪽지쓰기</title> 

<body> 
   <!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>쪽지쓰기</h1>
      </div>
    </div>
  </div>
</section>

<c:if test="${category eq 'm' }">
<section class="content container-fluid">
  <div class="row">
    <div class="col-sm-12">
      <div class="card card-dark card-outline card-info">
        <div class="card-header">
          <div class="card-title" style="display: inline-block; margin-top: 3px;">
            <h5>쪽지쓰기</h5>

          </div>
          <div class="card-tools">
            <button type="button" class="btn btn-sm btn-dark" id="registBtn">보내기</button>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-sm btn-secondary" id="cancelBtn" onclick="CloseWindow();">취 소</button>
          </div>
        </div>
        <!--end card-header  -->
        <div class="card-body">
<!--           <form enctype="multipart/form-data" role="form" method="post" action="regist.do" name="registForm"> -->

            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="writer">보내는 사람 </label>
                  <input type="text" id="writer" readonly name="writer" class="form-control" value="${loginUser.id }" style="width: 80%;">
<%--                   ${userCategory } --%>
                </div>
              </div>

              <div class="col-sm-6">
<!--                 <div class="form-group"> -->
<!--                   <label for="writer">날짜</label> -->
<!--                   <div> -->
<%--                   	<fmt:formatDate value="${ }" pattern="MM-dd hh:mm:ss" /> --%>
<!--                   </div> -->
<!--                 </div> -->
              </div>
            </div>

            <div>
              <label>받는 사람</label>
            </div>

            <div class="col-sm-5">
              <div class="card-tools" id="keyword">
                <div class="row">
                  <div id="" class="input-group row" style="padding: 5px;">
                    
                    <c:if test="${userCategory eq 'm' }">
	                    <select id="searchType" class="form-control" name="searchType" >
	                      <option selected>전체</option>
	                      <option>학생</option>
	                      <option>교사</option>
	                      <option>학부모</option>
	                    </select>
                    </c:if>
                    
                     <c:if test="${userCategory eq 's' }">
	                    <select id="searchType" class="form-control" name="searchType" >
	                      <option selected>교사</option>
	                    </select>
                    </c:if>
                    
                   

                    <input type="text" class="form-control" id="userName" name="userName" placeholder="이름" value="">
                    <div class="input-group-append">
                      <button type="button" class="btn btn-warning" onclick="list_go(1);" data-card-widget="search" id="searchUserNameBtn">
                        <i class="fas fa-search" aria-hidden="true"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-sm-5">
                <div class="card card-outline card-warning">
                  <div class="card-header">
                    <h3 class="card-title">
                      <i class="fa-solid fa-user"></i>
                      &nbsp; 전체
                    </h3>
                    <!--                <h3 class="card-title"></h3> -->
                    <!--                <div class="card-tools"> -->
                    <!--                   <div class="row"> -->
                    <!-- 				  </div> -->
                    <!--                </div> -->
                  </div>
                  <div class="card-body">
                    <div class="row table1">
                      <div class="card-body p-0">
                        <div id="userListDiv">
                          <div id="userList">
                          <table id="" class="table table-head-fixed table-bordered">
                            <thead>
                              <tr>
                                <th style="width: 25%">구분</th>
                                <th style="width: 30%">이름</th>
                                <th style="width: 45%">아이디</th>
                              </tr>
                            </thead>
                            <tbody id="leftth">
                              	 <c:forEach items="${userList }" var="user"> 
	                              <tr class="leftclickableTr">
		                                <td></td>
		                                <td></td>
		                                <td></td>
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
              <div class="col-sm-2" style="vertical-align: center;">
                <div class="row">
                  <div class="col-sm-1"></div>
                  <div class="col-sm-10">
                    <br>
                    <button id="moveAllLeft" type="button" class="btn-lg btn-block btn-warning btn-flat"><i class="fa-solid fa-angles-left"></i></button>
                    <button id="moveLeft" type="button" class="btn-lg btn-block btn-warning btn-flat"><i class="fa-solid fa-angle-left"></i></button>
                    <button id="moveRight" type="button" class="btn-lg btn-block btn-warning btn-flat"><i class="fa-solid fa-angle-right"></i></button>
                    <button id="moveAllRight" type="button" class="btn-lg btn-block btn-warning btn-flat"><i class="fa-solid fa-angles-right"></i></button>
                  </div>
                  <div class="col-sm-1"></div>
                </div>
              </div>
              <div class="col-sm-5">
                <div class="card card-outline card-warning">
                  <div class="card-header">
                    <h3 class="card-title">
                      <i class="fa-solid fa-user"></i>
                      &nbsp; 받는 사람
                    </h3>
                    <h3 class="card-title"></h3>
                  </div>  <!-- header end -->
                  
                  
                  <div class="card-body">
                    <div class="row table1">
                      <div class="card-body p-0">
                        <div id="studentNotIncludeListTableDiv">
                          <table id="studentNotIncludeListTable" class="table table-head-fixed table-bordered">
                            <thead>
                              <tr>
                                <th style="width: 25%">구분</th>
                                <th style="width: 30%">이름</th>
                                <th style="width: 45%">아이디</th>
                              </tr>
                            </thead>
                            
                            
                            <tbody>
                              <tr id="rightGhostTr"></tr>
                            </tbody>
                            
                            
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="form-group">
              <label for="title">제 목</label>
              <input type="text" id="title" name='title' class="form-control" placeholder="제목을 쓰세요">
            </div>

            <div class="form-group">
              <label for="content">내 용</label>
              <textarea class="form-control" name="content" id="content" rows="5" placeholder="1000자 내외로 작성하세요."></textarea>
            </div>
<!--           </form> -->
        </div>
        <!--end card-body  -->
      </div><!-- end col-md-12 -->
    </div><!-- end row -->
  </div>

</section>
</c:if>


<c:if test="${category eq 's' or category eq 'p' }">
<section class="content container-fluid">
  <div class="row">
    <div class="col-sm-12">
      <div class="card card-light card-outline card-info">
        <div class="card-header">
          <div class="card-title" style="display: inline-block; margin-top: 3px;">
            <h5>쪽지쓰기</h5>

          </div>
          <div class="card-tools">
            <button type="button" class="btn btn-sm btn-light" id="registBtn">보내기</button>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-sm btn-secondary" id="cancelBtn" onclick="CloseWindow();">취 소</button>
          </div>
        </div>
        <!--end card-header  -->
        <div class="card-body">
<!--           <form enctype="multipart/form-data" role="form" method="post" action="regist.do" name="registForm"> -->

            <div class="row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="writer">보내는 사람 </label>
                  <input type="text" id="writer" readonly name="writer" class="form-control" value="${loginUser.id }" style="width: 80%;">
<%--                   ${userCategory } --%>
                </div>
              </div>

              <div class="col-sm-6">
<!--                 <div class="form-group"> -->
<!--                   <label for="writer">날짜</label> -->
<!--                   <div> -->
<%--                   	<fmt:formatDate value="${ }" pattern="MM-dd hh:mm:ss" /> --%>
<!--                   </div> -->
<!--                 </div> -->
              </div>
            </div>

            <div>
              <label>받는 사람</label>
            </div>

            <div class="col-sm-5">
              <div class="card-tools" id="keyword">
                <div class="row">
                  <div id="" class="input-group row" style="padding: 5px;">
                    
                    <c:if test="${userCategory eq 'm' }">
	                    <select id="searchType" class="form-control" name="searchType" >
	                      <option selected>전체</option>
	                      <option>학생</option>
	                      <option>교사</option>
	                      <option>학부모</option>
	                    </select>
                    </c:if>
                    
                     <c:if test="${userCategory eq 's' }">
	                    <select id="searchType" class="form-control" name="searchType" >
	                      <option selected>교사</option>
	                    </select>
                    </c:if>
                    
                   

                    <input type="text" class="form-control" id="userName" name="userName" placeholder="이름" value="">
                    <div class="input-group-append">
                      <button type="button" class="btn btn-warning" onclick="list_go(1);" data-card-widget="search" id="searchUserNameBtn">
                        <i class="fas fa-search" aria-hidden="true"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-sm-5">
                <div class="card card-outline card-warning">
                  <div class="card-header">
                    <h3 class="card-title">
                      <i class="fa-solid fa-user"></i>
                      &nbsp; 전체
                    </h3>
                    <!--                <h3 class="card-title"></h3> -->
                    <!--                <div class="card-tools"> -->
                    <!--                   <div class="row"> -->
                    <!-- 				  </div> -->
                    <!--                </div> -->
                  </div>
                  <div class="card-body">
                    <div class="row table1">
                      <div class="card-body p-0">
                        <div id="userListDiv">
                          <div id="userList">
                          <table id="" class="table table-head-fixed table-bordered">
                            <thead>
                              <tr>
                                <th style="width: 25%">구분</th>
                                <th style="width: 30%">이름</th>
                                <th style="width: 45%">아이디</th>
                              </tr>
                            </thead>
                            <tbody id="leftth">
                              	 <c:forEach items="${userList }" var="user"> 
	                              <tr class="leftclickableTr">
		                                <td></td>
		                                <td></td>
		                                <td></td>
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
              <div class="col-sm-2" style="vertical-align: center;">
                <div class="row">
                  <div class="col-sm-1"></div>
                  <div class="col-sm-10">
                    <br>
                    <button id="moveAllLeft" type="button" class="btn-lg btn-block btn-warning btn-flat"><i class="fa-solid fa-angles-left"></i></button>
                    <button id="moveLeft" type="button" class="btn-lg btn-block btn-warning btn-flat"><i class="fa-solid fa-angle-left"></i></button>
                    <button id="moveRight" type="button" class="btn-lg btn-block btn-warning btn-flat"><i class="fa-solid fa-angle-right"></i></button>
                    <button id="moveAllRight" type="button" class="btn-lg btn-block btn-warning btn-flat"><i class="fa-solid fa-angles-right"></i></button>
                  </div>
                  <div class="col-sm-1"></div>
                </div>
              </div>
              <div class="col-sm-5">
                <div class="card card-outline card-warning">
                  <div class="card-header">
                    <h3 class="card-title">
                      <i class="fa-solid fa-user"></i>
                      &nbsp; 받는 사람
                    </h3>
                    <h3 class="card-title"></h3>
                  </div>  <!-- header end -->
                  
                  
                  <div class="card-body">
                    <div class="row table1">
                      <div class="card-body p-0">
                        <div id="studentNotIncludeListTableDiv">
                          <table id="studentNotIncludeListTable" class="table table-head-fixed table-bordered">
                            <thead>
                              <tr>
                                <th style="width: 25%">구분</th>
                                <th style="width: 30%">이름</th>
                                <th style="width: 45%">아이디</th>
                              </tr>
                            </thead>
                            
                            
                         <tbody>
                              <tr id="rightGhostTr"></tr>
                            </tbody>
                            
                            
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="form-group">
              <label for="title">제 목</label>
              <input type="text" id="title" name='title' class="form-control" placeholder="제목을 쓰세요">
            </div>

            <div class="form-group">
              <label for="content">내 용</label>
              <textarea class="form-control" name="content" id="content" rows="5" placeholder="1000자 내외로 작성하세요."></textarea>
            </div>
<!--           </form> -->
        </div>
        <!--end card-body  -->
      </div><!-- end col-md-12 -->
    </div><!-- end row -->
  </div>

</section>
</c:if>


 <script>
 	window.onload=function(){
 		
 		
 		// summernote
 		summernote_go($('#content'),'<%=request.getContextPath()%>');		
 		
 		
 		// tr 클릭
 		 $(document).on('click','.leftclickableTr',function(){
    		 $(this).css("background-color","skyblue");
    		 $(this).attr("class","leftselectedTr");
    	 });
    	 $(document).on('click','.leftselectedTr',function(){
    		 $(this).css("background-color","white");
 			 $(this).attr("class","leftclickableTr");
    	 });
    	 $(document).on('click','.rightclickableTr',function(){
    		 $(this).css("background-color","skyblue");
    		 $(this).attr("class","rightselectedTr");
    	 });
    	 $(document).on('click','.rightselectedTr',function(){
    		 $(this).css("background-color","white");
 			 $(this).attr("class","rightclickableTr");
    	 });
    	 
    	 
    	 // 버튼
    	 $("#moveLeft").click(function(){
    		 $("#leftGhostTr").after($(".rightselectedTr"));
    		 $(".rightselectedTr").css("background-color","white");
    		 $(".rightselectedTr").attr("class","leftclickableTr");
    		 $(".rightselectedTr").remove();
    	 });
    	 
    	 $("#moveRight").click(function(){
    		 $("#rightGhostTr").after($(".leftselectedTr"));
    		 $(".leftselectedTr").css("background-color","white");
    		 $(".leftselectedTr").attr("class","rightclickableTr");
    		 $(".leftselectedTr").remove();
    	 });
    	 
    	 $("#moveAllRight").click(function(){
    		 $("#rightGhostTr").after($(".leftselectedTr"));
    		 $("#rightGhostTr").after($(".leftclickableTr"));
    		 $(".leftselectedTr").css("background-color","white");
    		 $(".leftselectedTr").attr("class","rightclickableTr");
    		 $(".leftselectedTr").remove();
    		 $(".leftclickableTr").css("background-color","white");
    		 $(".leftclickableTr").attr("class","rightclickableTr");
    		 $(".leftclickableTr").remove();
    	 });
    	 
    	 $("#moveAllLeft").click(function(){
    		 $("#leftGhostTr").after($(".rightselectedTr"));
    		 $("#leftGhostTr").after($(".rightclickableTr"));
    		 $(".rightselectedTr").css("background-color","white");
    		 $(".rightselectedTr").attr("class","rightclickableTr");
    		 $(".rightselectedTr").remove();
    		 $(".rightclickableTr").css("background-color","white");
    		 $(".rightclickableTr").attr("class","leftclickableTr");
    		 $(".rightclickableTr").remove();
    	 });
    	 
		
    	 $("#registBtn").click(function(){
    		 var rightTrs = [];
    		 var rightIds = [];
    		
    		 
    		 rightTrs.push($(".rightselectedTr"));
    		 rightTrs.push($(".rightclickableTr"));
    		
    		 
    		 var title = $("#title").val();
    		 var content = $("#content").val();
    		 var loginUserId = $("#loginUserId").val();
    		 let noteInfoArr = new Array();
    		 
    		 
//     		 console.log(title);
//     		 console.log(content);
			console.log(loginUserId);
    		 
    		 for (var i=0; i<rightTrs[1].length; i++) {
    			 let noteInfo = new Object();	// vo
    			 noteInfo.title = title;
    			 noteInfo.content = content;
    			 noteInfo.receiveUser = rightTrs[1][i].getAttribute("userId");
    			 noteInfo.loginUserId = loginUserId;
    			 noteInfoArr.push(noteInfo);
    		 }
    		
    		console.log(noteInfoArr);
    		
    		let dataItem = {
    				userList : noteInfoArr
    		};
    		
    		console.log(dataItem); 
			dataItem = JSON.stringify(dataItem);
   		 	
   		 	$.ajax({
		        type: "post"
		       ,url : "/noteRegist.do"
		       ,contentType: 'application/json'
		       ,data : dataItem
		       ,success : function (data){
// 		    	   	console.log(data);
// 		    	   	alert("쪽지를 보냈습니다!");
		    	    Swal.fire({
		    	        icon: 'success',
		    	        title: '완료!',
		    	        text: '쪽지를 보냈습니다!',
		    	    });
		    	    
		    	    setTimeout(function() {
		    			window.close();
		    			window.opener.location.reload(true);
		    	}, 1300);
// 		    	    window.close();
// 		    	    window.opener.location.reload(true);
		        }
		       ,error : function(e){
		        }
			});   	
    	 });
    	 
    	 
    	 
    	// select box 클릭 후 데이터 넘기기 
 		
 		let type = $("#searchType option:selected").val();
 		let name = $("#userName").val();
 		
		$.ajax({
	        type: "post"
	       ,url : "/common/note/userList.do"
	       ,data : 
	    	   {
	    	   		"Search1" : type
	    	   	   ,"Search2" : name
	    	   }
	       ,success : function (data){
	    	   console.log(data);
	    	   printData(data,$('#userList'),$('#userListDiv'),$('#userList-template'));
	        }
	       ,error : function(e){
	        }
		});
		
 		$("#searchType").on("change", function(){
 			type = $("#searchType option:selected").val();
 			name = $("#userName").val();
 			
 			$.ajax({
 		        type: "post"
 		       ,url : "/common/note/userList.do"
 		       ,data : 
 		    	   {
 		    	   		"Search1" : type
 		    	   	   ,"Search2" : name
 		    	   }
 		       ,success : function (data){
 		    	   console.log(data);
 		    	   printData(data,$('#userList'),$('#userListDiv'),$('#userList-template'));
 		        }
 		       ,error : function(e){
 		        }
 			});
 		});
 		
 		$("#searchUserNameBtn").on("click", function(){
 			type = $("#searchType option:selected").val();
 			name = $("#userName").val();
 			
 			$.ajax({
 		        type: "post"
 		       ,url : "/common/note/userList.do"
 		       ,data : 
 		    	   {
 		    	   		"Search1" : type
 		    	   	   ,"Search2" : name
 		    	   }
 		       ,success : function (data){
 		    	   console.log(data);
 		    	   printData(data,$('#userList'),$('#userListDiv'),$('#userList-template'));
 		        }
 		       ,error : function(e){
 		        }
 			});

 			
 		});
 	}
 	
 	function printData(data,delArea,target,templateObject){
 		var template=Handlebars.compile(templateObject.html());
 		var html = template(data);	
 		delArea.remove();
 		target.after(html);
 	}
 	 
</script>

<script type="text/x-handlebars-template" id="userList-template">
<table id="userList" class="table table-head-fixed table-bordered">
 <thead>
   <tr>
     <th style="width: 25%">구분</th>
     <th style="width: 30%">이름</th>
     <th style="width: 45%">아이디</th>
   </tr>
 </thead>
 <tbody>
	
	<tr id = "leftGhostTr"></tr>

   {{#each managerList}}
      <tr class="leftclickableTr" userId="{{id}}">
            <td>교사</td>
            <td>{{isFirstLogin}}</td>
            <td>{{id}}</td>
			<td style="display:none;">
				<input type="text" id="loginUserId" name="loginUserId" class="form-control" value="${loginUser.id }">	
			</td>
      </tr>
    {{/each}}


   {{#each studentList}}
      <tr class="leftclickableTr" userId="{{id}}">
            <td>학생</td>
            <td>{{isFirstLogin}}</td>
            <td>{{id}}</td>
			<td style="display:none;">
				<input type="text" id="loginUserId" name="loginUserId" class="form-control" value="${loginUser.id }">	
			</td>
      </tr>
   {{/each}}


   {{#each parentList}}
      <tr class="leftclickableTr" userId="{{id}}">
            <td>부모</td>
            <td>{{isFirstLogin}}</td>
            <td>{{id}}</td>
			<td style="display:none;">
			<input type="text" id="loginUserId" name="loginUserId" class="form-control" value="${loginUser.id }">	
			</td>
      </tr>
   {{/each}}


 </tbody>
</table>
</script>




<script>
var dataNum=0;

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
	
	if($("input[name='title']").val()==""){ //form.title.value
		alert("제목은 필수입니다.");
		$("input[name='title']").focus();
		return;
	}
	
	$("form[role='form']").submit()

	
}

</script> 

</body>






