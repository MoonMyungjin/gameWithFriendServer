<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="noteReceiveList" value="${dataMapRe.noteReceiveList }" />
<c:set var= "noteSendList" value="${dataMapSe.noteSendList }" />
<c:set var= "userCa" value="${userCa }" />

<head>
  <meta charset="UTF-8">
  <title>Note</title>
  
 <c:if test="${category eq 'm' }">
  <style>
    .page-item.active .page-link {
      z-index: 3;
      color: #fff;
      background-color: #395d83;
      border-color: #395d83;
    }

    .page-link {
      color: #8c8588;
    }

    #title {
      font-size: 15px;
      text-align: center;
    }
  </style>
</c:if>

 <c:if test="${category eq 's' or category eq 'p'}">
  <style>
    .page-item.active .page-link {
      z-index: 3;
      color: #fff;
      background-color: #9674d3cf;
      border-color: #9674d3cf;
    }

    .page-link {
      color: #8c8588;
    }

    #title {
      font-size: 15px;
      text-align: center;
    }
  </style>
</c:if>
  
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
   <script type="text/javascript">
        
        // 헬퍼함수 만들기
        // 헬퍼함수는 Handlebars.registerHelper()를 사용해서 등록할 수 있다.
        // 헬퍼함수는 스크립트 상단에 선언하자 (호이스팅)
        // Handlebars.registerHelper("선언함수명", function(args..., option){ ... }
        // args 매개변수 인자보다.. 그냥 this.변수명 으로 접근은 편하다.
 
        Handlebars.registerHelper("msToDate", function(value) {
        		
     	let date = new Date(value);
     	let success = new Date(+new Date(date) + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '');
        
     	let nullable = "-";
//      	console.log(nullable);
     	
        if(value != null) {
        	return success;
        } else {
        	return nullable;
        }
 
        });
 
</script>
</head>

<body>
  <section class="content-header">
    <div class="container-fluid">
      <div class="row md-2">
        <div class="col-sm-6">
          <h1>쪽지함</h1>
        </div>
      </div>
    </div>
  </section>

<!-- 직원 -->

<c:if test="${category eq 'm' }">
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12">
          <div class="card card-dark card-outline card-outline-tabs">
            <div class="card-header p-0 border-bottom-0">
              <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true">받은쪽지함</a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile" aria-selected="false">보낸쪽지함</a>
                </li>

              </ul>
            </div>

            <div class="card-body">
              <div class="tab-content" id="custom-tabs-four-tabContent">
                <div class="tab-pane fade active show" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="row">
                        <div class="col-sm-9">

                        <c:if test="${userCa.category ne 'p' }">
                        	<button type="button" class="btn btn-dark btn-sm" id="registBtn" onclick="OpenWindow('noteRegistForm.do?userCategory=${userCa.category }','쪽지쓰기',900,800);">쪽지쓰기</button>
                        </c:if>
                        
                        
                        </div>
                        <div class="col-sm-3">
                        <div id="keyword" class="card-tools" style="width:200px;">
                          <div class="input-group row" style="margin-bottom: 10px;">

                            <input class="form-control float-right" id="searchNoteInput2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="">
                            <span class="input-group-append">
                              <button class="btn btn-dark" id="searchNoteBtn2" type="submit" data-card-widget="search">
                                <i class="fa fa-fw fa-search"></i>
                              </button>
                            </span>
                          </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="col-sm-12" id="noteListReDiv">
                      <table class="table table-hover table-bordered text-nowrap" id="noteListRe">
                        <thead>
                          <tr>
                            <th>보낸사람</th>
                            <th>제목</th>
                            <th>날짜</th>
                            <th>열람여부</th>
                          </tr>
                        </thead>
                        
                        <tbody>
                        
                        <c:forEach items="${noteReceiveList }" var="noteReceive">
                        
                          <tr onclick="OpenWindow('noteDetail.do?noteId=${noteReceive.noteId}','상세보기',600,400);" style="cursor:pointer">
                            <td name="noteId" style="display: none;">${noteReceive.noteId }</td>
                            <td style="display: none;">${noteReceive.noteSendUserId }</td>
                            <td style="width: 20%;" onclick="OpenWindow('/common/totalDetail.do?id='+'${noteReceive.noteSendUserId }','회원상세보기',600,400);"><strong>${noteReceive.noteSendUserName }</strong></td>
                            <td style="width: 50%;text-align:left;max-width: 120px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${noteReceive.noteTitle }</td>
                            <td style="width: 20%;"> <fmt:formatDate value="${noteReceive.noteSendDate }" pattern="yy-MM-dd hh:mm:ss" /></td>
                            <td style="width: 10%;">${noteReceive.noteReadYN }</td>
                            <td style="display: none;"><input type="hidden" id="loginUserId" name="loginUserId" value="${loginUser.id }"></td>
                          </tr>
                        </c:forEach>  
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>

                <div class="tab-pane fade show" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile">
                  <div class="row">
                    <div class="col-sm-12">
                          
                      <div class="row">
                        <div class="col-sm-9">

                        <c:if test="${userCa.category ne 'p' }">
                        	<button type="button" class="btn btn-dark btn-sm" id="registBtn" onclick="OpenWindow('noteRegistForm.do?userCategory=${userCa.category }','쪽지쓰기',900,800);">쪽지쓰기</button>
                        </c:if>
                        
                        
<!--                           <button type="button" class="btn btn-default btn-sm" id="registBtn" onclick="OpenWindow('noteRegistForm.do','쪽지쓰기',900,800);">쪽지쓰기</button> -->
                        </div>
                        <div class="col-sm-3">
                        <div id="keyword" class="card-tools" style="width:200px;">
                          <div class="input-group row" style="margin-bottom: 10px;">
                            <input class="form-control float-right" type="text" id="searchNoteInput" name="keyword" placeholder="검색어를 입력하세요." value="">
                            <span class="input-group-append">
                              <button class="btn btn-dark" id="searchNoteBtn" type="submit" data-card-widget="search">
                                <i class="fa fa-fw fa-search"></i>
                              </button>
                            </span>
                          </div>
                          </div>
                        </div>
                      </div>
                    


                    <div class="col-sm-12" id="noteListSeDiv">
                      <table class="table table-hover table-bordered text-nowrap" id="noteListSe">
                        <thead>
                          <tr>
<!--                             <th>NO</th> -->
                            <th>받는사람</th>
                            <th>제목</th>
                            <th>날짜</th>
                            <th>읽은시간</th>
                          </tr>
                        </thead>
                        <tbody>
                        
                         <c:forEach items="${noteSendList }" var="noteSend">
                          <tr onclick="OpenWindow('noteDetailSend.do?noteId=${noteSend.noteId}','상세보기',600,400);" style="cursor:pointer">
                            <td style="display: none;">${noteSend.noteId }</td>
                            <td style="width: 20%;" onclick="OpenWindow('/common/totalDetail.do?id='+'${noteSend.noteReceivedUserId }','회원상세보기',600,400);"><strong>${noteSend.noteSendUserName }</strong></td>
                            
                            <td style="width: 40%;text-align:left;max-width: 120px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${noteSend.noteTitle }</td>
                            <td style="width: 20%;"><fmt:formatDate value="${noteSend.noteSendDate }" pattern="yy-MM-dd hh:mm:ss" /></td>
                            
                            <c:if test="${noteSend.noteReadDate eq null }">
	                            <td style="width: 20%;">
	                            	<span>-</span>
	                            </td>
                          	</c:if>
                            
                             <c:if test="${noteSend.noteReadDate ne null }">
	                            <td style="width: 20%;">
	                            	<fmt:formatDate value="${noteSend.noteReadDate }" pattern="yy-MM-dd hh:mm:ss"/>
	                            </td>
                          	</c:if>
                          
                          
                            <td style="display: none;"><input type="hidden" id="loginUserId" name="loginUserId" value="${loginUser.id }"></td>
                          </tr>
                         </c:forEach>
                          
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>

              </div>
            </div>
            <!-- 		card body end -->

            <!-- card footer start -->
            <div class="card-footer">
              <nav aria-label="Navigation">
                <ul class="pagination justify-content-center m-0">
                  <li class="page-item">
                    <a class="page-link" href="javascript:list_go(1);">
                      <i class="fas fa-angle-double-left"></i>
                    </a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="javascript:list_go('1');">
                      <i class="fas fa-angle-left"></i>
                    </a>
                  </li>
                  <li class="page-item active">
                    <a class="page-link" href="javascript:list_go('1');">1</a>
                  </li>

                  <li class="page-item ">
                    <a class="page-link" href="javascript:list_go('2');">2</a>
                  </li>

                  <li class="page-item">
                    <a class="page-link" href="javascript:list_go('1');">
                      <i class="fas fa-angle-right"></i>
                    </a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="javascript:list_go('2');">
                      <i class="fas fa-angle-double-right"></i>
                    </a>
                  </li>
                </ul>
              </nav>

              <form id="jobForm">
                <input type="hidden" name="page" value="">
                <input type="hidden" name="perPageNum" value="">
                <input type="hidden" name="searchType" value="">
                <input type="hidden" name="keyword" value="">
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
  </section>
</c:if>


<!-- 학생, 부모 -->
<c:if test="${category eq 's' or category eq 'p' }">
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12">
          <div class="card card-light card-outline card-outline-tabs">
            <div class="card-header p-0 border-bottom-0">
              <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="custom-tabs-four-home-tab" data-toggle="pill" href="#custom-tabs-four-home" role="tab" aria-controls="custom-tabs-four-home" aria-selected="true">받은쪽지함</a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" id="custom-tabs-four-profile-tab" data-toggle="pill" href="#custom-tabs-four-profile" role="tab" aria-controls="custom-tabs-four-profile" aria-selected="false">보낸쪽지함</a>
                </li>

              </ul>
            </div>

            <div class="card-body">
              <div class="tab-content" id="custom-tabs-four-tabContent">
                <div class="tab-pane fade active show" id="custom-tabs-four-home" role="tabpanel" aria-labelledby="custom-tabs-four-home-tab">
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="row">
                        <div class="col-sm-9">

                        <c:if test="${userCa.category ne 'p' }">
                        	<button type="button" class="btn btn-light btn-sm" id="registBtn" onclick="OpenWindow('noteRegistForm.do?userCategory=${userCa.category }','쪽지쓰기',900,800);">쪽지쓰기</button>
                        </c:if>
                        
                        
                        </div>
                        <div class="col-sm-3">
                        <div id="keyword" class="card-tools" style="width:200px;">
                          <div class="input-group row" style="margin-bottom: 10px;">

                            <input class="form-control float-right" id="searchNoteInput2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="">
                            <span class="input-group-append">
                              <button class="btn btn-light" id="searchNoteBtn2" type="submit" data-card-widget="search">
                                <i class="fa fa-fw fa-search"></i>
                              </button>
                            </span>
                          </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="col-sm-12" id="noteListReDiv">
                      <table class="table table-hover table-bordered text-nowrap" id="noteListRe">
                        <thead>
                          <tr>
                            <th>보낸사람</th>
                            <th>제목</th>
                            <th>날짜</th>
                            <th>열람여부</th>
                          </tr>
                        </thead>
                        
                        <tbody>
                        
                        <c:forEach items="${noteReceiveList }" var="noteReceive">
                        
                         <tr onclick="OpenWindow('noteDetail.do?noteId=${noteReceive.noteId}','상세보기',600,400);" style="cursor:pointer">
                            <td name="noteId" style="display: none;">${noteReceive.noteId }</td>
                            <td style="display: none;">${noteReceive.noteSendUserId }</td>
                            <td style="width: 20%;" onclick="OpenWindow('/common/totalDetail.do?id='+'${noteReceive.noteSendUserId }','회원상세보기',600,400);">${noteReceive.noteSendUserName }</td>
                            <td style="width: 50%;text-align:left;max-width: 120px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${noteReceive.noteTitle }</td>
                            <td style="width: 20%;"> <fmt:formatDate value="${noteReceive.noteSendDate }" pattern="yy-MM-dd hh:mm:ss" /></td>
                            <td style="width: 10%;">${noteReceive.noteReadYN }</td>
                            <td style="display: none;"><input type="hidden" id="loginUserId" name="loginUserId" value="${loginUser.id }"></td>
                          </tr>
                          
                        </c:forEach>  
                          
                          
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>

                <div class="tab-pane fade show" id="custom-tabs-four-profile" role="tabpanel" aria-labelledby="custom-tabs-four-profile">
                  <div class="row">
                    <div class="col-sm-12">
                          
                      <div class="row">
                        <div class="col-sm-9">

                        <c:if test="${userCa.category ne 'p' }">
                        	<button type="button" class="btn btn-light btn-sm" id="registBtn" onclick="OpenWindow('noteRegistForm.do?userCategory=${userCa.category }','쪽지쓰기',900,800);">쪽지쓰기</button>
                        </c:if>
                        
                        
<!--                           <button type="button" class="btn btn-default btn-sm" id="registBtn" onclick="OpenWindow('noteRegistForm.do','쪽지쓰기',900,800);">쪽지쓰기</button> -->
                        </div>
                        <div class="col-sm-3">
                        <div id="keyword" class="card-tools" style="width:200px;">
                          <div class="input-group row" style="margin-bottom: 10px;">
                            <input class="form-control float-right" type="text" id="searchNoteInput" name="keyword" placeholder="검색어를 입력하세요." value="">
                            <span class="input-group-append">
                              <button class="btn btn-light" id="searchNoteBtn" type="submit" data-card-widget="search">
                                <i class="fa fa-fw fa-search"></i>
                              </button>
                            </span>
                          </div>
                          </div>
                        </div>
                      </div>
                    


                    <div class="col-sm-12" id="noteListSeDiv">
                      <table class="table table-hover table-bordered text-nowrap" id="noteListSe">
                        <thead>
                          <tr>
<!--                             <th>NO</th> -->
                            <th>받는사람</th>
                            <th>제목</th>
                            <th>날짜</th>
                            <th>읽은시간</th>
                          </tr>
                        </thead>
                        <tbody>
                        
                         <c:forEach items="${noteSendList }" var="noteSend">
                          <tr onclick="OpenWindow('noteDetailSend.do?noteId=${noteSend.noteId}','상세보기',600,400);" style="cursor:pointer">
                            <td style="display: none;">${noteSend.noteId }</td>
                            <td style="width: 20%;" onclick="OpenWindow('/common/totalDetail.do?id='+'${noteSend.noteReceivedUserId }','회원상세보기',600,400);">${noteSend.noteSendUserName }</td>
                            
                            <td style="width: 40%;text-align:left;max-width: 120px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${noteSend.noteTitle }</td>
                            <td style="width: 20%;"><fmt:formatDate value="${noteSend.noteSendDate }" pattern="yy-MM-dd hh:mm:ss" /></td>
                            
                            <c:if test="${noteSend.noteReadDate eq null }">
	                            <td style="width: 20%;">
	                            	<span>-</span>
	                            </td>
                          	</c:if>
                            
                             <c:if test="${noteSend.noteReadDate ne null }">
	                            <td style="width: 20%;">
	                            	<fmt:formatDate value="${noteSend.noteReadDate }" pattern="yy-MM-dd hh:mm:ss"/>
	                            </td>
                          	</c:if>
                          
                          
                            <td style="display: none;"><input type="hidden" id="loginUserId" name="loginUserId" value="${loginUser.id }"></td>
                          </tr>
                         </c:forEach>
                          
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>

              </div>
            </div>
            <!-- 		card body end -->

            <!-- card footer start -->
            <div class="card-footer">
              <nav aria-label="Navigation">
                <ul class="pagination justify-content-center m-0">
                  <li class="page-item">
                    <a class="page-link" href="javascript:list_go(1);">
                      <i class="fas fa-angle-double-left"></i>
                    </a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="javascript:list_go('1');">
                      <i class="fas fa-angle-left"></i>
                    </a>
                  </li>
                  <li class="page-item active">
                    <a class="page-link" href="javascript:list_go('1');">1</a>
                  </li>

                  <li class="page-item ">
                    <a class="page-link" href="javascript:list_go('2');">2</a>
                  </li>

                  <li class="page-item">
                    <a class="page-link" href="javascript:list_go('1');">
                      <i class="fas fa-angle-right"></i>
                    </a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="javascript:list_go('2');">
                      <i class="fas fa-angle-double-right"></i>
                    </a>
                  </li>
                </ul>
              </nav>

              <form id="jobForm">
                <input type="hidden" name="page" value="">
                <input type="hidden" name="perPageNum" value="">
                <input type="hidden" name="searchType" value="">
                <input type="hidden" name="keyword" value="">
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
  </section>
</c:if>


<script>
	window.onload = function(){
		
		$(document).on("click", "#searchNoteBtn", function(){
			let name = $("#searchNoteInput").val();
			let loginUserId = $("#loginUserId").val();
// 			let date = $("#date").val();
			
// 			let date = new Date();
			
			console.log(name);
			console.log(loginUserId);
// 			console.log(date);
			
			
			$.ajax({
		        type: "post"
		       ,url : "/common/noteSearch.do"
		       ,data : {"name" : name,
		    	   		"loginUserId" :loginUserId
		    	   		}
		       ,success : function (data){
		    	   console.log(data);
		    	   for(var i = 0 ; i<data.noteListSe.length;i++){
		    		console.log(typeof data.noteListSe[i].noteSendUserName);
					let temp = data.noteListSe[i].noteSendUserName.replaceAll(name,"<span class='highlightWord'>"+name+"</span>");
		    	   data.noteListSe[i].noteSendUserName = temp;
				}
		    	   printData(data,$('#noteListSe'),$('#noteListSeDiv'),$('#teacherList-template'));
		    	   
		        }
		       ,error : function(e){
		        }
			});

		});
		
		
		
		$(document).on("click", "#searchNoteBtn2", function(){
			let name = $("#searchNoteInput2").val();
			let loginUserId = $("#loginUserId").val();
// 			console.log(name);
// 			console.log(loginUserId);
			
			
			$.ajax({
		        type: "post"
		       ,url : "/common/noteSearchRe.do"
		       ,data : {"name" : name,
		    	   		"loginUserId" :loginUserId
		    	   		}
		       ,success : function (data){
		    	   console.log(data);
		    	   for(var i = 0 ; i<data.noteListRe.length;i++){
			    		console.log(typeof data.noteListRe[i].noteSendUserName);
						let temp = data.noteListRe[i].noteSendUserName.replaceAll(name,"<span class='highlightWord'>"+name+"</span>");
			    	   data.noteListRe[i].noteSendUserName = temp;
					}
		    	   printData(data,$('#noteListRe'),$('#noteListReDiv'),$('#NoteReList-template'));
		    	   
		    	   
		        }
		       ,error : function(e){
		        }
			});

		});
		
	}
</script>

<script>
function printData(data,delArea,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	delArea.remove();
	target.after(html);
}
</script>

<script type="text/x-handlebars-template"  id="teacherList-template" >
<table class="table table-hover table-bordered text-nowrap" id="noteListSe">
                        <thead>
                          <tr>
                            <th>받는사람</th>
                            <th>제목</th>
                            <th>날짜</th>
                            <th>읽은시간</th>
                          </tr>
                        </thead>
                        <tbody id="searchResultTable">
                        
						{{#each noteListSe}}

                          <tr onclick="OpenWindow('noteDetailSend.do?noteId={{noteId}}','상세보기',600,400);" style="cursor:pointer">
                            <td style="display: none;">{{noteId}}</td>
                            <td>{{{noteSendUserName}}}</td>
                            
                            <td>{{noteTitle}}</td>
                            <td>{{msToDate noteSendDate}}</td>
                            <td>{{msToDate noteReadDate}}</td>
                           
                            <td style="display: none;"><input type="hidden" name="loginUserId" value="{{loginUser.id }}"></td>
                          </tr>

							{{/each}}

                        </tbody>
                      </table>
</script>

<script type="text/x-handlebars-template"  id="NoteReList-template" >
<table class="table table-hover table-bordered text-nowrap" id="noteListRe">
                        <thead>
                          <tr>
                            <th>보낸사람</th>
                            <th>제목</th>
                            <th>날짜</th>
                            <th>열람여부</th>
                          </tr>
                        </thead>
                        <tbody id="searchResultTable">
                        
						{{#each noteListRe}}

                          <tr onclick="OpenWindow('noteDetail.do?noteId={{noteId}}','상세보기',600,400);" style="cursor:pointer">
                            <td style="display: none;">{{noteId}}</td>
                            <td>{{{noteSendUserName}}}</td>
                            
                            <td>{{noteTitle}}</td>
                            <td>{{msToDate noteSendDate}}</td>
                            <td>{{noteReadYN}}</td>
                           
                            <td style="display: none;"><input type="hidden" name="loginUserId" value="{{loginUser.id }}"></td>
                          </tr>

							{{/each}}

                        </tbody>
                      </table>
</script>


  <c:if test="${from eq 'regist' }">
	<script>
		alert("쪽지를 보냈습니다!");
		window.close();
		window.opener.location.reload(true);

	</script>
  </c:if>


</body>