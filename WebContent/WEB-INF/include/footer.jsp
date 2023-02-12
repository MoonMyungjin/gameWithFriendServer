<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="academyinfoList" value="${dataMap.academyinfoList }" />

<footer class="main-footer" style="padding: 0px; font-size: 15px;">
	
	<div class="row">
		<div class="col-sm-12">
			<div class="row">
				<span style="margin-left: 20px;" id="acaIpoName"></span>
				<div id="acaIpoName" style="margin-left: 10px;"></div>
				<div id="acaIpoCeoName" style="margin-left: 10px;"></div>
				<div id="acaIpoPhone" style="margin-left: 10px;"></div>
				<div id="acaIpoOnNumber" style="margin-left: 10px;"></div>
				<div id="acaIpoAddress" style="margin-left: 20px;"></div>
				<div id="acaIpoFax" style="margin-left: 10px;"></div>
				<div id="acaIpoCopy" style="margin-left: 20px;"></div>
			</div>
		</div>
<!-- 		<div class="col-sm-12"> -->
<!-- 			<div class="row"> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>





	
	<script>
		window.onload = function(){
			
			goPage('<%=request.getContextPath()%>${menu.menuUrl}','${menu.menuId}');
			
	    	$.ajax({
   		        type: "post"
   		       ,url : "/manager/academyinfo/footer.do"

   		       ,success : function (data){
   		    	  console.log(data);
   		    	  let aca = data.academyinfoVO;
//    		    	  console.log(aca);
   		    	  let acaIpoCeoName = aca.acaIpoCeoName;
   		    	  let acaIpoName = aca.acaIpoName;
   		    	  let acaIpoAddress = aca.acaIpoAddress;
   		    	  let acaIpoOnNumber = aca.acaIpoOnNumber;
   		    	  let acaIpoPhone = aca.acaIpoPhone;
   		    	  let acaIpoFax = aca.acaIpoFax;
   		    	  let acaIpoCopy = aca.acaIpoCopy;
   		    	  
				  $("#acaIpoCeoName").text("대표자  : " + acaIpoCeoName);
				  $("#acaIpoName").text("학원명 : " + acaIpoName);
				  
				  $("#acaIpoAddress").text("주소 : " + acaIpoAddress);
				  $("#acaIpoOnNumber").text("사업자 등록번호 : " + acaIpoOnNumber);
				  $("#acaIpoPhone").text("TEL : " + acaIpoPhone);
				  $("#acaIpoFax").text("FAX : " + acaIpoFax);
				  $("#acaIpoCopy").text("COPYRIGHT " + acaIpoCopy);
   		       }
   		       ,error : function(e){
   		    		alert("실패!");
   		    		
   		        }
	    	});
	    	
	    	
	    	
	    	if($('#profile').length){
	    	let id = '${loginUser.id }';
	    	console.log(id);
	    	//alert('get picture 실행 테스트');
	    	 $('div#profile').css({'background-image':'url('+"/manager/mamagermanagement/getManagerPicture.do?id="+id+')',
	    	     'background-position':'center',
	    	     'background-size':'cover',
	    	     'background-repeat':'no-repeat'
	    	     });
	    	 console.log('test');
	    	}
	    	
	    	
	          if($('#profileS').length){
	    			let id = '${loginUser.id}';
	    			console.log(id);
	    			//alert('get picture 실행 테스트');
	    			 $('div#profileS').css({'background-image':'url('+"/manager/membermanagement/getPicture.do?id="+id+')',
	    		         'background-position':'center',
	    		         'background-size':'cover',
	    		         'background-repeat':'no-repeat'
	    		        
	    		         });
	    			 
	    	 }
	    	
	    	
	    	
		}
			 
		
	</script>
	
</footer>
  
