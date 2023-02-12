<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<head>
  <meta charset="UTF-8">
  <title></title>

  <style>
    /* 	.form-control{ */
    /* 		height: 30px; */
    /* 		width: 120%; */
    /* 		font-size: 13px; */
    /* 	} */
    /* 	option{ */
    /* 		font-size: 13px; */
    /* 	} */
    /*     .editable { */
    /*       width: 100%; */
    /*       border: 0; */
    /*       height: 2em; */
    /*     } */
    #tb1 td,
    #tb1 th {
      padding: 0;
    }
  </style>

</head>

<body>
  <section class="content-header">
    <div class="container-fluid">
      <div class="row md-2">
        <div class="col-sm-6">
          <h1>팝업관리</h1>
        </div>
      </div>
    </div>
  </section>

  <section class="content">
    <div class="container-fluid">
      <div class="row">

        <div class="col-sm-8">
          <div class="card card-dark card-outline">
            <div class="card-header">
              <h3 class="card-title">
                <i class="fas fa-list" aria-hidden="true"></i>
                팝업 리스트
              </h3>
              <div class="card-tools">
              </div>
            </div>
            <div class="card-body">
              <div class="row">
                <div class="card-body p-0">

                  <table id="tb1" class="table table-hover table-bordered table-head-fixed">
                    <thead>
                      <tr>
                        <th>번호</th>
                        <th>이미지명</th>
                        <th>팝업이름</th>
                        <th>게시기간</th>
                        <th>거부기간</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>popup.jpg</td>
                        <td>2020 여름방학 특강</td>
                        <td>
                          22-03-28 ~ 22-04-05
                        </td>
                        <td>7일</td>
                      </tr>

                      <tr>
                        <td>2</td>
                        <td>popup.jpg</td>
                        <td>2020 겨울방학 특강</td>
                        <td>
                          22-03-28 ~ 22-04-05
                        </td>
                        <td>6일</td>
                      </tr>

                      <tr>
                        <td>3</td>
                        <td>popup.jpg</td>
                        <td>2021 여름방학 특강</td>
                        <td>
                          22-03-28 ~ 22-04-05
                        </td>
                        <td>5일</td>
                      </tr>

                      <tr>
                        <td>4</td>
                        <td>popup.jpg</td>
                        <td>2021 겨울방학 특강</td>
                        <td>
                          22-03-28 ~ 22-04-05
                        </td>
                        <td>3일</td>
                      </tr>

                      <tr>
                        <td>5</td>
                        <td>popup.jpg</td>
                        <td>2022 새학기 대비반</td>
                        <td>
                          22-03-28 ~ 22-04-05
                        </td>
                        <td>7일</td>
                      </tr>

                      <tr>
                        <td>6</td>
                        <td>notice.jpg</td>
                        <td>공지사항</td>
                        <td>
                          22-03-28 ~ 22-04-05
                        </td>
                        <td>7일</td>
                      </tr>

                      <tr>
                        <td>7</td>
                        <td>popup.jpg</td>
                        <td>2022 1학기 중간고사 학교별</td>
                        <td>
                          22-03-28 ~ 22-04-05
                        </td>
                        <td>7일</td>
                      </tr>

                      <tr>
                        <td>8</td>
                        <td>popup.jpg</td>
                        <td>학원 모의고사 답지</td>
                        <td>
                          22-03-28 ~ 22-04-05
                        </td>
                        <td>7일</td>
                      </tr>

                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-4">
          <div class="card card-dark card-outline">
            <div class="card-header">
              <div class="card-title">
                <i class="fas fa-check" aria-hidden="true"></i>
               				 팝업
              </div>

							

			<div class="card-tools" style="display: flex;">	
				<button type="button" class="btn btn-block btn-dark btn-sm">저장</button>
				<button type="button" class="btn btn-block btn-danger btn-sm" style="margin-top: 0px;">삭제</button>
			 </div>
			 
         </div>

            <div class="row">
              <div class="col-sm-12">
                <div class="card-body">
                  <div class="col-sm-12">
                    * 팝업의 이미지 크기는 10MB로 제한한다.
                    <div style="height:1vh;"></div>
                    <div style="border:2px solid #395d83; width:90%; height:30vh; padding-bottom:10px;"></div>
                    <div style="height:1vh;"></div>
                    <div class="custom-file">
                      <input type="file" class="custom-file-input" id="exampleInputFile">
                      <label class="custom-file-label" for="exampleInputFile" style="width:90%;">팝업 이미지 선택</label>

                    </div>
                  </div>
                </div>
              </div>

              <div class="col-sm-12">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="form-group">
                      <label for="exampleInputEmail1" style="margin-left : 10px;">팝업창 이름</label>
                      <input type="text" class="form-control form-control-sm" id="exampleInputEmail1" placeholder="팝업이름" style="width:140px; margin-left: 10px; margin-bottom: 5px;">

                    </div>
                  </div>
                  <div class="col-sm-12">
                    <div class="form-group">
                      <label for="exampleInputEmail1" style="padding-left : 10px;">팝업창 위치</label>
                      <div style="display: flex;">
                        <input type="email" class="form-control form-control-sm" id="exampleInputEmail1" placeholder="가로위치(X)" style="width:140px; margin-left: 10px; margin-right: 10px;">

                        <input type="email" class="form-control form-control-sm" id="exampleInputEmail1" placeholder="세로위치(Y)" style="width:140px;">
                      </div>
                    </div>
                  </div>

                  <div class="col-sm-12">
                    <div class="form-group">
                      <label for="exampleInputEmail1" style="padding-left : 10px;">팝업창 크기</label>
                      <div style="display: flex;">
                        <input type="email" class="form-control form-control-sm" id="exampleInputEmail1" placeholder="가로" style="width:140px; margin-left: 10px; margin-right: 10px;">

                        <input type="email" class="form-control form-control-sm" id="exampleInputEmail1" placeholder="세로" style="width:140px;">
                      </div>
                    </div>
                  </div>

                  <div class="col-sm-12">
                    <div class="form-group">
                      <label for="exampleInputEmail1" style="padding-left : 10px;">게시기간</label>
                      <div style="display: flex; padding-left: 10px;">
                        <span class="tag tag-success">
                          <input type="date" id="start" name="trip-start" value="2022-03-29" min="2022-01-01" max="2022-12-31" style="width:140px; margin-left: 3px; margin-right: 10px;">
                        </span>
                        ~
                        <span class="tag tag-success">
                          <input type="date" id="start" name="trip-start" value="2022-03-29" min="2022-01-01" max="2022-12-31" style="width:140px;">
                        </span>
                      </div>
                    </div>
                  </div>

                  <div class="col-sm-12">
                    <div class="form-group">
                      <div class="row">
                        <div class="col-sm-5">
                          <label for="exampleInputEmail1" style="padding-left : 10px; margin-top: 10px;">거부기간</label>
                        </div>
                        <div class="col-sm-7" style="margin-top: 3px;">
                          <select class="form-control" >
                            <option>1일</option>
                            <option>2일</option>
                            <option>3일</option>
                            <option>4일</option>
                            <option>5일</option>
                            <option>6일</option>
                            <option>7일</option>
                          </select>
                        </div>
                      </div>

                    </div>
                  </div>
                  
<!--                   <div class="col-sm-12"> -->
<!--                     <div class="form-group"> -->
<!--                       <div class="row"> -->
<!--                       	<div class="col-sm-3"></div> -->
<!--                       	<div class="col-sm-3"></div> -->
<!--                         <div class="col-sm-3"> -->
<!--                           <button type="button" class="btn btn-block btn-dark btn-sm">저장</button> -->
<!--                         </div> -->
                        
<!--                         <div class="col-sm-3"> -->
<!--                           <button type="button" class="btn btn-block btn-danger btn-sm">삭제</button> -->
<!--                         </div> -->
<!--                       </div> -->

<!--                     </div> -->
<!--                   </div> -->
                  
                  
                  
                  
                  
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </div>
  </section>

  <script>
    function formPlus() {
      alert("폼추가");
    }

    function upload_go() {
      //alert('upload btn click');
      if (!$('input[name="pictureFile"]').val()) {
        alert("사진을 선택하세요.");
        $('input[name="pictureFile"]').click();
        return;
      }
      if ($('input[name="checkUpload"]').val() == 1) {
        alert("이미업로드 된 사진입니다.");
        return;
      }
      $.ajax({
        url: "picture.do",
        data: formData,
        type: 'post',
        processData: false,
        contentType: false,
        success: function(data) {
          //업로드 확인변수 세팅
          $('input[name="checkUpload"]').val(1);
          //저장된 파일명 저장.
          $('input#oldFile').val(data); // 변경시 삭제될 파일명	          
          $('form[role="form"]  input[name="picture"]').val(data);
          alert("사진이 업로드 되었습니다.");
        },
        error: function(error) {
          //alert("현재 사진 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
          AjaxErrorSecurityRedirectHandler(error.status);
        }
      });
    }
  </script>

</body>

</html>