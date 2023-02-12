<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<meta charset="UTF-8">
<title></title>
<style>
	div.table2 {
		max-height: 230px;
		overflow-y: auto;
	}
	div #lessonArea{
		height: 263px;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<script src="https://www.eformsign.com/lib/js/efs_embedded_v2.js"/></script>
</head>
<body>
<section class="content-header">
   <div class="container-fluid">
        <div class="row md-2">
           <div class="col-sm-6">
              <h1>강의계획서</h1>              
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
   <div class="card-header">
      <div class="row">
        <div class="col-sm-12">
<!--       member -->
<!--       <div class="card card-outline card-light"> -->
<!--       manager -->
          <div class="card card-outline card-dark">
            <div class="card-header">
               <h3 class="card-title">
					<i class="fa-solid fa-chalkboard-user"></i>
					&nbsp;
					강의계획서보기
			   </h3>
            </div>
           	<div id="card-body">
           		<iframe id="SyllabusFrame" src="#" style="width:100%; height:800px">
				</iframe>
           	</div>
         </div>
		</div>         
      </div>
   </div>
   <div class="card-body">
   </div>
</section>

<script>
     window.onload=function(){
    	 
    	 var eformsign = new EformSignDocument();

    	 var document_option = {
    	    "company" : {
    	       "id" : "00feb6098afd4e52825ff4794c5783ed",            // Company ID 입력
    	       "country_code" : "kr",  // 국가 코드 입력 (ex: kr)
    	    },
    	    "user" : {
    	        "type" : "01" ,         // 사용자 구분 (01: 멤버, 02: 외부자)
    	        "id": "resta726@gmail.com" // 사용자 ID(이메일)
    	    },
    	     "mode" : {
    	         "type" : "02",      // 모드 (01: 새 문서 작성, 02: 문서 처리, 03: 문서 미리보기)
    	         "template_id" : "dc3bfb36db73433e9fd0d07fe6ca8a8e", // template id 입력
    	         "document_id" : "db55910b-5ddf-4c74-bfc2-4ca8ebabb3ee"  // document_id 입력
    	     },
    	     "layout" : {
    	         "lang_code" : "ko" // 이폼사인 언어. ko, en, ja
    	     },
    	     "prefill" : {
    	         "document_name": "", // 문서 제목 입력
    	         "fields": [
    	             {
    	                 "id" : "고객명",       // 필드명
    	                 "value" : "홍길동",    // 필드값
    	                 "enabled" : true,   // 활성화 여부
    	                 "required" : true   // 필수 여부
    	             }
    	         ],
    	         "recipients": [
    	             {
    	                 "step_idx" : "2",       // 워크플로우 순서. 수신자가 있을 경우 2부터 시작
    	                 "step_type": "06",      // 단계 종류. 05: 참여자, 06: 검토자
    	                 "name" : '김테스트',        // 수신자 이름
    	                 "id": "test@forcs.com", // 수신자 ID/이메일
    	                 "sms": "01023456789",   // 수신자 핸드폰 번호
    	                 "use_mail": true,       // 이메일 알림 사용 여부
    	                 "use_sms": true,        // SMS 알림 사용 여부
    	                 "auth": {
    	                     "password": "",     // 워크플로우 설정에서 문서 열람 전 본인확인 설정 - 본인확인 정보에 체크한 경우 비밀번호 입력
    	                     "password_hint": "",// 위 조건에 따라 비밀번호를 입력한 경우, 비밀번호 힌트
    	                     "valid": {
    	                         "day": 7,       // 문서 전송 기한 (일)
    	                         "hour": 0       // 문서 전송 기한 (시간)
    	                     }
    	                 }
    	             }
    	         ],
    	         "comment": "여기에 코멘트 입력"     // 메시지
    	     },
    	     "return_fields" : ['고객명']           // Success Callback에서 값을 확인할 수 있도록 넘겨줄 필드명
    	 };

    	 //callback option
    	 var success_callback = function(response){
    	     console.log(response.code);
    	     if( response.code == "-1"){
    	         //문서 작성 성공
    	         console.log(response.document_id);
    	         // return_fields에 넘긴 데이터를 조회 가능함. fields는 폼을 작성할 때 만든 입력 컴포넌트의 id를 의미함.
    	         console.log(response.field_values["company_name"]);
    	         console.log(response.field_values["position"]);
    	     }
    	 };

    	 var error_callback = function(response){
    	     console.log(response.code);
    	     //문서 작성 실패
    	     alert(response.message);
    	 };

    	 eformsign.document(document_option, "SyllabusFrame", success_callback, error_callback);
    	 eformsign.open(); 
 	}
</script>
</body>
</html>