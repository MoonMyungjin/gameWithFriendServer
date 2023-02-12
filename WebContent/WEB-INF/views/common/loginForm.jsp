<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<head>
<style>
img{
 position: absolute;
width:1280px;
 height: 100%;

background-repeat: no-repeat;
background-size: cover;
opacity: 0.5;
}





</style>
</head>

<title>Login Page</title>
<body>

<!-- <div id="load"> -->
<!--     <img src="/resources/images/Book.gif" alt="loading"> -->
<!-- </div> -->

  <div class="hold-transition login-page">
	<img src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/back.png">

    <div class="login-logo">
<!--   	<i class="fa-solid fa-right-to-bracket"></i> -->
     <h1>로그인</h1>
    </div>
    <div class="col-12 col-sm-3">
      <div class="card card-primary card-tabs">
        <div class="card-header p-0 pt-1">
          <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" id="custom-tabs-one-home-tab" data-toggle="pill" href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home" aria-selected="false" onclick="studentAction();">학생</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="custom-tabs-one-profile-tab" data-toggle="pill" href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false" onclick="parentAction();">학부모</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="custom-tabs-one-messages-tab" data-toggle="pill" href="#custom-tabs-one-messages" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false" onclick="managerAction();">직원</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="custom-tabs-one-messages-tab2" data-toggle="pill" href="#custom-tabs-one-messages" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false" onclick="studentAction2();">등원</a>
            </li>
            <!-- 							<li class="nav-item"> -->
            <!-- 								<a class="nav-link" id="custom-tabs-one-settings-tab" data-toggle="pill" href="#custom-tabs-one-settings" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true">마스터</a> -->
            <!-- 							</li> -->
          </ul>
        </div>
        <div class="card">
          <div class="card-body login-card-body">
          
            <p class="login-box-msg">아이디와 패스워드를 입력하세요</p>

            <form id="formId" action="<%=request.getContextPath() %>/member/login.do" method="post">

              <div class="form-group has-feedback">
                <input id="id" type="text" class="form-control" name="id" placeholder="Id" value="${pastID }">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
              </div>

              <div class="form-group has-feedback">
              	<div class="input-group mb-3">
					<input id="password" type="password" class="form-control" name="pw" placeholder="Password" value="">
					<div class="input-group-append">
						<span class="input-group-text"><i id="showPW" class="fa-regular fa-eye"></i></span>
					</div>
				</div>
              </div>

              <div class="row">
                <div class="col-sm-8">
                  <div class="checkbox icheck">
                    <label> <input type="checkbox" name="rememberMe" value="check"> 아이디 기억하기
                    </label>
                  </div>
                </div>
<!--                 <!— /.col —> -->

                  <div class="col-sm-4">
                    <button type="submit" class="btn btn-primary btn-block">login</button>
                  </div>

<!--                   <!— /.col —> -->
              </div>
            </form>

            <a data-toggle="modal" href="#myModal" style="font-weight:bold;">비밀번호 빠른 변경</a><br>
            <div class="row">
	            <div class="col-sm-3">
	            	<button id="memberBtn" type="button" class="btn btn-light btn-block">member</button>
	            </div>
	            <div class="col-sm-3">
	            	<button id="memberBtn2" type="button" class="btn btn-light btn-block">attend</button>
	            </div>
	            <div class="col-sm-3">
	            	<button id="parentBtn" type="button" class="btn btn-light btn-block">parent</button>
	            </div>
	            <div class="col-sm-3">
	            	<button id="managerBtn" type="button" class="btn btn-dark btn-block">manager</button>
	            </div>
            
            </div>
            
            
          </div>
<!--           <!— /.login-box-body —> -->
        </div>

      </div>
    </div>
<!--     <!— /.login-box —> -->

  </div>

   <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    	
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <p class="modal-title">비밀번호 빠른 변경</p>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <div class="modal-body">
			<div class="card">
				<div class="card-body login-card-body">
				<p class="login-box-msg" style="padding-bottom: 10px;">인증번호는 email로 발송됩니다.</p>
					<div style="padding-bottom: 10px;">
						<select class="form-control" style="width:100px; height:30px; padding:2px; border:1px solid #ced4da;">
										<option>구분</option>
										<option>학생</option>
										<option>학부모</option>
										<option>직원</option>
									
						</select>
					</div>
					
					<div class="row">
						<div class="col-sm-12" style="padding-bottom: 10px;">
							<div class="row">
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="ID(email)" id="emailAddress">
								
								</div>
								<div class="col-sm-4">
									<button type="button" class="btn btn-block btn-default btn-sm" id="mailSendBtn">인증번호 발송</button>
								
								</div>
							</div>
						</div>
						<div class="col-sm-12" style="padding-bottom: 10px; display: none;" id="checkNum">
							<div class="row">
								<div class="col-sm-8">
									<input type="text" class="form-control" placeholder="인증번호" id="authNum">
								
								</div>
								<div class="col-sm-4">
									<button type="button" class="btn btn-block btn-default btn-sm" id="authNumCheckBtn">인증번호 확인</button>
								</div>
							</div>
						</div>						
					</div>
					
					
					<div class="row">
						<div class="col-sm-12" id="changePwdBtn" style="display: none;">
							<div class="input-group-append">
								<i class="fa-solid fa-check" style="padding-right: 10px;"></i>
							<p class="text-center" style="margin-bottom: 0rem;">비밀번호 변경을 누르면 비밀번호는 ID와 같아집니다.</p>
							</div>
							
							<button type="submit" class="btn btn-default btn-block" id="pwdChangeBtn">비밀번호 변경</button>
						</div>
					
					</div>

				
				<p class="mt-3 mb-1">
				<a href="login.html"></a>
				</p>
<!-- 				<p class="mb-0"> -->
<!-- 					<a href="register.html" class="text-center">Register a new membership</a> -->
<!-- 				</p> -->
				</div>
			</div>
        </div>
        
        
        <div class="modal-footer">
<!--           <button type="button" class="btn-xs btn-default" data-dismiss="modal">Close</button> -->
          <button type="button" class="btn btn-block btn-primary btn-sm" data-dismiss="modal" style="width:20%;">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  
<!--   modal end -->
  
 <script>

 


	window.onload=function(){
		
		
		
		
		

	    $("#myBtn").click(function(){
	        $("#myModal").modal();
	    });

	    
	    
	    // 메일 발송 이메일 확인
	    
	    $("#mailSendBtn").click(function(){
	    	
	    	
			let emailAddress = $("#emailAddress").val();

	    	console.log(emailAddress);

	    	$.ajax({
   		        type: "post"
   		       ,url : "/common/pwdChange.do"
   		       ,data : {"emailAddress" : emailAddress}
   		       ,success : function (data){
  					if(data=="success"){
	   		        	alert("이메일이 발송되었습니다");
	   		        	var con = document.getElementById("checkNum");
	   		  			if(con.style.display=='none'){
	   		  				con.style.display = 'block';
	   		  			}else{
	   		  				con.style.display = 'none';
	   		  			}
  					}
  					if(data=="notFound"){
  						alert("아이디를 다시 확인해주세요");
  					}
   		        }
   		       ,error : function(e){
   		    		alert("이메일 발송이 실패했습니다.");
   		        }
	    	});
	    });
	    
	    
	    // 인증번호 확인
	    
	    $("#authNumCheckBtn").click(function(){
	    	
	    	let authNum = $("#authNum").val();
	    	
	    	console.log(authNum);
	    	
	    	$.ajax({
   		        type: "post"
   		       ,url : "/common/authNumCheck.do"
   		       ,data : {"authNum" : authNum}
   		       ,success : function (data){
  					
   		    	  
   		    	   
   		    	   if(data == "success"){
   		    		   
   		    		 alert("확인되었습니다.");
   		    		   
	   		    	var con = document.getElementById("changePwdBtn");
	   		 		if(con.style.display=='none'){
	   		 			con.style.display = 'block';
	   		 		}else{
	   		 			con.style.display = 'none';
	   		 		}
   		    		   
   		    	   }
   		    	   
   		    	   if(data=="notFound"){
   		    			alert("인증번호를 다시 확인해주세요");
   		    	   }
   		    	   
   		        }
   		       ,error : function(e){
   		    		
   		    		
   		        }
	    	});
	    	
	    });
	    
	    
	    // 비밀번호 초기화
	    
	 $("#pwdChangeBtn").click(function(){
		 
		 let emailAddress = $("#emailAddress").val();

	     console.log(emailAddress);
		 
	    	$.ajax({
   		        type: "post"
   		       ,url : "/common/initialization.do"
   		       ,data : {"emailAddress" : emailAddress}
   		       ,success : function (data){
  					
   		    	   alert("비밀번호가 초기화 되었습니다.");
   		    	   
   		    		$('#myModal').modal('hide');
	   		    	
   		        }
   		       ,error : function(e){
   		    		alert("비밀번호 초기화 실패!");
   		    		
   		        }
	    	});
	    	
	    });
	    
	    let click = 1;
	    $(document).on("click","#showPW",function(){
	    	
	    	click++;
	    	if(click % 2 == 0){
	    		$("#password").attr("type","text");
	    		$(this).attr("class","fa-regular fa-eye-slash");
	    	} else {
	    		$("#password").attr("type","password");
	    		$(this).attr("class","fa-regular fa-eye");
	    	}
	    	
	    });
	    
	    $("#memberBtn").on("click",function(){
	    	$("#id").val("ddit32@hanmail.net");
	    	$("#password").val("jn6149");
	    	$('#custom-tabs-one-home-tab').click();
	    });
	    $("#memberBtn2").on("click",function(){
	    	$("#id").val("ddit32@hanmail.net");
	    	$("#password").val("jn6149");
	    	$('#custom-tabs-one-messages-tab2').click();
	    });
	    $("#parentBtn").on("click",function(){
	    	$("#id").val("reo0930@gmail.com");
	    	$("#password").val("reo0930");
	    	$('#custom-tabs-one-profile-tab').click();
	    });
	    $("#managerBtn").on("click",function(){
	    	$("#id").val("qwxqe152@gmail.com");
	    	$("#password").val("java");
	    	$('#custom-tabs-one-messages-tab').click();
	    });
	    
	}

	

	    
	

 	
 	function studentAction() {
		$("#formId").attr("action", "<%=request.getContextPath() %>/member/login.do");
	}
 	function studentAction2() {
		$("#formId").attr("action", "<%=request.getContextPath() %>/memberq/loginq.do");
	}
 	
 	function managerAction() {
 		$("#formId").attr("action", "<%=request.getContextPath() %>/manager/login.do");
 	}
 	function parentAction() {
 		$("#formId").attr("action", "<%=request.getContextPath() %>/parent/login.do");
 	}

//  	function doDisplay(){ 		
//  		var con = document.getElementById("changePwdBtn");
//  		if(con.style.display=='none'){
//  			con.style.display = 'block';
//  		}else{
//  			con.style.display = 'none';
//  		}
//  	}
 	
 	
 	
 </script> 


</body>