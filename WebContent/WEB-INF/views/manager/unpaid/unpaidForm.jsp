<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />








<head>
  <meta charset="UTF-8">
  <title></title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
</head>

<body>
  <section class="content-header">
    <div class="container-fluid">
      <div class="row md-2">
        <div class="col-sm-6" style="display: flex;">
          <h1 data-userId="${loginUser.id }">미납현황</h1>
           <!--                즐겨찾기에 존재 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '미납현황') != -1}">
                  <i id="star" class="fa-solid fa-star on fa-2x" ></i>
               </c:if>
               
<!--                즐겨찾기에 존재하지 않음 -->
               <c:if test="${fn:indexOf(favoriteMenuListStr, '미납현황') == -1}">
                  <i id="star" class="fa-regular fa-star off fa-2x" ></i>
               </c:if>
               
        </div>
      </div>
    </div>
  </section>

  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12">
          <div class="card card-dark card-outline">
            <div class="card-header">
              <h3 class="card-title">
                <i class="fas fa-search" aria-hidden="true"></i>
            	    검색
              </h3>
              <div class="card-tools"></div>
            </div>
              <div class="card-body">
 		  <div class="row">
 		  <div class="col-sm-6"></div>
          <div class="col-sm-3">
          <table>
          <tr>
           <td>
             <input type="number" name="text" size="10" min="0" style="height: 30px; width:60px;  padding-top: 0px; margin-top: 1px;">
             </td>
             <td>
           
             <label id="days" style="margin: 0px; padding-bottom: 0px;">일 이상 미납일수</label>
           </td>
           <td>
				<button type="button" class="btn btn-dark btn-defalt" id="daysBtn">
				
				 <i class="fas fa-search"></i>
				</button>
			   </td>  
			   </tr> 
			    	</table>
			    	</div>
     


            	<div class="col-sm-3">
				<div class="input-group">
				<input type="text" class="form-control form-control-defalt" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }">
					<div class="input-group-append">
					<button type="button" class="btn btn-dark btn-defalt" id="searchBtn">
							<i class="fas fa-search"></i>
					</button>
			    	</div>
				</div>
			   </div>
                 </div>
          

            </div>
          </div>
        </div>

        <div class="col-sm-12">
          <div class="card card-dark card-outline">
            <div class="card-header">
             <div class="row">
            <div class="col-sm-8">
              <h3 class="card-title">
                <i class="fas fa-check" aria-hidden="true"></i>
                미납자 리스트
              </h3>
               </div>
              	<div class="col-sm-4" style="text-align: right; padding-top: 7px;">
										
				<h6 style="color:#395d83;">검색 결과 : ${fn:length(unPaymentList)}행</h6>
											
				</div>
              <div class="card-tools"></div>
            </div>
             </div>
            <div class="card-body">
              <div class="card-body p-0">
                <table id="all" class="table table-hover table-bordered text-nowrap">
                  <thead>
                    <tr>
                      <th>NO</th>
                      <th>구분</th>
                      <th>이름</th>
                      <th>반</th>
                      <th>학부모</th>
                      <th>학부모 연락처</th>
                      <th>결제예정일</th>
                      <th>미납일수</th>
                      <th>미납금액</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <c:if test="${not empty unPaymentList }">
                  <c:forEach items="${unPaymentList }" var="unPayment" varStatus="index">
                   
                    <tr>
                      <td>${index.index+1}.</td>
                      <td>${unPayment.studentGrade}</td>
                      <td style="font-weight: 900; cursor:pointer;" onclick="OpenWindow('/common/totalDetail.do?id='+'${unPayment.studentId}','회원상세보기',600,400);">${unPayment.studentName}</td>
                      <td>${unPayment.className}</td>
                      <td>${unPayment.parentName}</td>
                      <td>${unPayment.parentHp}</td>
                      <td class="paymentDuedate">${unPayment.paymentDuedate}</td>
                      <td class="overdueDay">${unPayment.paymentDuedate}</td>
                      <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${unPayment.paymentPrice}"/>원</td>
                   </tr>
                  </c:forEach>
                  
                    <tr style="background-color: lightgray;">
                          <th colspan="8">미납 총액</th>
                          <th id="sum" style="color: red; text-align: right;"></th>
                        </tr>
                        
                        </c:if>
                        <c:if test="${empty unPaymentList }">
                         <tr>
                   		   <td></td>
                   		   <td></td>
                   		   <td></td>
                      	   <td></td>
                      	   <td></td>
                      	   <td></td>
                      	   <td></td>
                      	   <td></td>
                    	</tr>
                    	* 미납 내역이 없습니다. 
                        </c:if>
                        
                  </tbody>
                </table>

              <!--   <div class="row">
					<div class="col-sm-6"></div>
					<div class="col-sm-12">
                    <table id="all" class="table table-hover table-bordered text-nowrap">
                      <thead>
                        <tr style="background-color: lightgray;">
                          <th>미납 총액</th>
                          <th id="sum">원</th>
                        </tr>
                      </thead>

                      <tbody>

                      </tbody>
                    </table> -->

                  </div>
                </div>
              </div>
            </div>
          </div>
            </div>
            
    <form id="jobForm">   
   <input type='hidden' name="page" value="" />
   <input type='hidden' name="perPageNum" value="300"/>
   <input type='hidden' name="searchType" value="" />
   <input type='hidden' name="keyword" value="" />
   <input type='hidden' name="studentId" value="studentId" />
   </form>
            
            
            
  </section>
<script>
window.onload=function(){
	calcSum();
	calOverdueDay();
	
	$("#daysBtn").on("click",function(){
		var days = $(this).parent().parent().children().eq(0).children().val();
		
		location.href = "/manager/unpaid/form.do?days="+days;
		
	});
	
	$("#searchBtn").on("click",function(){
		var search = $(this).parent().parent().children().val();
		
		location.href = "/manager/unpaid/form.do?search="+search;
		 
	});
}
</script>

<script>
function calcSum() {
  // table element 찾기
  const table = document.getElementById('all');
  
  // 합계 계산
  let sum = 0;
  for(let i = 1; i <= table.rows.length-2; i++)  {
	let temp = table.rows[i].cells[8].innerHTML.replace("원","").replace(",","");
    sum = parseInt(sum) + parseInt(temp);
  }
  
  // 합계 출력
  document.getElementById('sum').innerHTML = sum.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원";
}

</script>
<script>
function calOverdueDay() {
	let dueDateArr = [];
	$(".paymentDuedate").each(function(){
		let temp = moment($(this).text(), "YYYYMMDD");
		let today = moment();
		let val = today.diff(temp, 'days')+"일"
		dueDateArr.push(val);
	});
	console.log(dueDateArr);
	$(".overdueDay").each(function(i){
		$(this).text(dueDateArr[i]);
	});
}
</script>

<script>
function list_go(page,url){
      if(!url) url="/manager/unpaid/form.do";
      
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


