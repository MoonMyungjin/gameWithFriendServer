<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
  <meta charset="UTF-8">
  <title></title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
</head>

<body>
<section class="content-header">
  <div class="container-fluid">
    <div class="row md-2">
      <div class="col-sm-6">
        <h1>환불처리</h1>
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
					<i class="fas fa-check" aria-hidden="true"></i>
						환불 신청 리스트</h3>
				<div class="card-tools"></div>
			</div>	
		<div class="card-body">
          <div class="card-body p-0">
            <table class="table table-hover table-bordered text-nowrap">
              <thead>
                <tr>
                  <th>NO</th>
                  <th>수강취소 회원</th>
                  <th>수업참여일</th>
                  <th>수업시작일</th>
                  <th>총 수업시간</th>
                  <th>회원수강시간</th>
                  <th>수강취소일</th>
                  <th>강의금액</th>
                  <th>환불금액</th>
                  <th>환불하기</th>
                </tr>
              </thead>
              <tbody>
               <c:forEach items="${refundList}" var="refundList" varStatus="index">
                <tr>
                  <td>${index.index+1}.</td>
                  <td  style="font-weight: 900; cursor:pointer;"  onclick="OpenWindow('/common/totalDetail.do?id='+'${refundList.studentId}','회원상세보기',600,400);">${refundList.studentName}</td>
                  <td class="taApllydate">${fn:substring(refundList.taApllydate,0,4)}-${fn:substring(refundList.taApllydate,4,6)}-${fn:substring(refundList.taApllydate,6,8)}</td>
                  <td class="laStartDate" data-lessonHours="${refundList.lessonHours }" data-taApllydate="${refundList.taApllydate }"  data-lessonPrice="${refundList.lessonPrice}" data-cancelDate="${refundList.taCancledate }" data-endDate="${refundList.laEndDate}" data-startDate="${refundList.laStartDate}">${fn:substring(refundList.laStartDate,0,4)}-${fn:substring(refundList.laStartDate,4,6)}-${fn:substring(refundList.laStartDate,6,8)}</td>
                  <td>${refundList.lessonHours}시간</td>
                  <td>회원수강시간</td>
                   <td>${fn:substring(refundList.taCancledate,0,4)}-${fn:substring(refundList.taCancledate,4,6)}-${fn:substring(refundList.taCancledate,6,8)}</td>
                   <td style="text-align: right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${refundList.lessonPrice}"/>원</td>
                  <td style="padding:0px; margin:0px;"> <input type="text" value="" id="cnsltSchTime"class="form-control"></td>
                  <td>
                  	<button data-studentId="${refundList.studentId }" data-lessonAssignmentId="${refundList.lessonAssignmentId }"  type="button" class="btn btn-block btn-dark btn-xs refundBtn">환불하기</button>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
</div>	
        </div>
	</div>
	<div class="col-sm-12">
		<section class="content">
			<div class="card">
				<div class="card-header" style="background-color: rgb(32 73 105); color:white;">
					<div>	
						
						<h5 class="card-title">교습기간이 1개월 이내인 경우</h5>
					</div>
					
					<div class="card-tools">
						<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
							<i class="fas fa-minus"></i>
						</button>
					</div>
					
				</div>
				<div class="card-body" style="font-size: 90%">
					▶ 총 교습시간의 1/3 경과 전  : 이미 납부한 교습비의 2/3에 해당하는 금액 <br>
					▶ 총 교습시간의 2/3 경과 전  : 이미 납부한 교습비의 1/2에 해당하는 금액 <br>
					▶ 총 교습시간의 2/3 경과 후  : 반환하지 않음
				</div>
			</div>
		</section>
		
		
	</div>
	<div class="col-sm-12">
		<section class="content">
			<div class="card">
				<div class="card-header" style="background-color: rgb(32 73 105); color:white;">
					<h5 class="card-title">교습기간이 1개월 초과한 경우</h5>
					<div class="card-tools">
						<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
							<i class="fas fa-minus"></i>
						</button>
					</div>
				</div>
				<div class="card-body" style="font-size: 90%">
					▶ 교습 시작 전  : 이미 납부한 교습비의 전액 환불 <br>
					▶ 교습시작 후   : 반환사유가 발생한 해당 월의 반환대상 교습비등 (교습기간이 1개월 이내인 경우의 기준에 따라 산출된 금액) 나머지 월의 교습비 등의 전액을 합산한 금액
<!-- 					         &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; -->
					                  
				</div>
			</div>
		</section>
	</div>
</div>
</div>

  <input type='hidden' name="studentId" value="studentId" />
</section>


<script>
window.onload = function(){
	
	$(".taApllydate").each(function(){
		var apllydate = $(this).text().trim();
		var startDate = $(this).next().text().trim();
		if (apllydate < startDate){
			$(this).text(startDate);
		}
	});
	
	$(".laStartDate").each(function(){
		let startDatestr = $(this).attr("data-startDate");
		let endDatestr = $(this).attr("data-endDate");
		let cancelDatestr = $(this).attr("data-cancelDate");
		let lessonPrice = $(this).attr("data-lessonPrice").replace("원","");
		let apllyDate = $(this).attr("data-taApllydate");
		let lessonHour = $(this).attr("data-lessonHours");
		let price;
		if (apllyDate < startDatestr){
			apllyDate = startDatestr
		}
		if(moment(cancelDatestr).diff(moment(startDatestr))<0){
			$(this).parent().children().eq(5).text("0시간");	
			$(this).parent().children().eq(8).children().eq(0).val(lessonPrice);	
			return;
		}
		let comparisonVal = moment(endDatestr).diff(moment(startDatestr),'days');
		let participationDate = moment(cancelDatestr).diff(moment(apllyDate),'days');
		let ratio = participationDate/comparisonVal;
		let userLessonTime = lessonHour*ratio;
		$(this).parent().children().eq(5).text(Math.ceil(userLessonTime)+"시간");
		
		if(ratio<=0.33){
			lessonPrice = Math.ceil((lessonPrice*2/3)/100)*100;
			$(this).parent().children().eq(8).children().eq(0).val(lessonPrice);
		}
		if(ratio>0.33 && ratio<=0.66){
			lessonPrice = Math.ceil((lessonPrice*1/2)/100)*100;
			$(this).parent().children().eq(8).children().eq(0).val(lessonPrice);
		}
		if(ratio>0.66){
			$(this).parent().children().eq(8).children().eq(0).val(0);
		}
		console.log(ratio);
	});
	
	$(".refundBtn").on("click",function(){
		let refundPrice = $(this).parent().parent().children().eq(8).children().eq(0).val();
		let studentId = $(this).attr("data-studentId");
		let lessonAssignmentId = $(this).attr("data-lessonAssignmentId");
		
		location.href = "/manager/refund/refund.do?refundPrice="+refundPrice+"&studentId="+studentId+"&lessonAssignmentId="+lessonAssignmentId;
	});
}
	
	






</script>






























</body>
</html>