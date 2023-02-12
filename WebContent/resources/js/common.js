// 로딩 이미지




//검색 후 검색결과 하이라이팅
function HighLightSearchResult(table,tabletext,searchKeyword){
	
	let result = tabletext.replaceAll(searchKeyword,"<span class='highlightWord'>"+searchKeyword+"</span>");
	
	return result;
}

//pdf 저장
function PDFSave(table,userSetfileName){
	
	html2canvas(table[0]).then(function(canvas) { //저장 영역 div id
		
	    // 캔버스를 이미지로 변환
	    var imgData = canvas.toDataURL('image/png');
		     
	    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
	    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	    var imgHeight = canvas.height * imgWidth / canvas.width;
	    var heightLeft = imgHeight;
	    var margin = 10; // 출력 페이지 여백설정
	    var doc = new jsPDF('p', 'mm');
	    var position = 30;
	       
	    // 첫 페이지 출력
	    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
	    heightLeft -= pageHeight;
	         
	    // 한 페이지 이상일 경우 루프 돌면서 출력
	    while (heightLeft >= 20) {
	        position = heightLeft - imgHeight;
	        doc.addPage();
	        doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
	        heightLeft -= pageHeight;
	    }
	 	let fileName = userSetfileName;
	    // 파일 저장
	    doc.save(fileName);

		});
}


//팝업창들 띄우기
//새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
							+"height="+ WinHeight +", top="+ wintop +", left=" 
							+ winleft +", resizable=yes, status=yes"  );
	win.focus() ; 
}

//팝업창 닫기
function CloseWindow(){
	
	window.opener.location.reload(true);		
	window.close();
}



//사용자 사진 출력
function MemberPictureThumb(contextPath){
	 for(var target of document.querySelectorAll('.manPicture')){	
		 var id = target.getAttribute('data-id');
		 
		 target.style.backgroundImage="url('"+contextPath+"/member/getPicture.do?id="+id+"')";
		 target.style.backgroundPosition="center";
		 target.style.backgroundRepeat="no-repeat";
		 target.style.backgroundSize="cover";
	}
}

//summernote
var contextPath = "";

function summernote_go(target,context,height){
	contextPath = context;
	console.log(height);
	if(height==null){
		height = 250;
	}
	
	target.summernote({
		placeholder:'여기에 내용을 적으세요.',
		lang:'ko-KR',
		height:250,
		disableResizeEditor: true,
		callbacks:{
			onImageUpload : function(files, editor, welEditable) {
				for(var file of files){
					//alert(file.name);
					
					if(file.name.substring(file.name.lastIndexOf(".")+1).toUpperCase() != "JPG"){
						alert("JPG 이미지형식만 가능합니다.");
						return;
					}
					if(file.size > 1024*1024*5){
						alert("이미지는 5MB 미만입니다.");
						return;
					}		
				}
				
				//alert("선택된 파일은 유효합니다.");
				
				for (var file of files) {
					sendFile(file,this);
				}
			},
			onMediaDelete : function(target) {
				//alert("image delete");
				//alert(target[0].src);
				//alert(target.attr("src"));
				deleteFile(target[0].src);	
			}
		}
	});	
}


function sendFile(file, el) {
	var form_data = new FormData();
	form_data.append("file", file); 
	$.ajax({
    	url: contextPath+'/uploadImg.do',
    	data: form_data,
    	type: "POST",	    	
    	contentType: false,	    	
    	processData: false,
    	success: function(img_url) {
    		//alert(img_url);
      		$(el).summernote('editor.insertImage', img_url);
    	},
    	error:function(error){
    		//alert(file.name+" 업로드에 실패했습니다.");
    		 AjaxErrorSecurityRedirectHandler(error.status);		
    	}
  	});
}


function deleteFile(src) {		
	var splitSrc= src.split("=");
	var fileName = splitSrc[splitSrc.length-1];
	
	var fileData = {fileName:fileName};
	
	$.ajax({
		url:contextPath+"/deleteImg.do",
		data : JSON.stringify(fileData),
		type:"post",
		contentType:"application/json",
		success:function(res){
			console.log(res);
		},
		error:function(error){
			//alert("이미지 삭제가 불가합니다.");
			 AjaxErrorSecurityRedirectHandler(error.status);		
		}
	});
 }

//spring_security redirect loginForm
function AjaxErrorSecurityRedirectHandler(status) {
	if (status == "302") {
		alert("세션이 만료되었습니다.\n로그인 하세요.");
		location.reload();

	}else if(status == "403"){
		alert("권한이 유효하지 않습니다.");
		history.go(-1);		
	}else {
		alert("시스템장애로 실행이 불가합니다.");
		history.go(-1);
	}

}

// 즐겨찾기 별 클릭

 $("#star").click(function(){

	// console.log($(this).attr("class"));
	// console.log($(this).attr("class").indexOf("on"));
	
	if($(this).attr("class").indexOf("on") == -1){
		
		let menuName = $(this).prev().text();
		let userId = $(this).prev().attr("data-userId");
	
		
		//db 저장 (insert)
		
		$.ajax({
	        type: "post"
	       ,url : "/common/favorites.do"
	       ,data : 
	    	   {
	    	   		"menuName" : menuName
	    	   	   ,"userId" : userId
	    	   }
	       ,success : function (data){
	    	   console.log(data);
	    	   
	    	   if(data == "success"){
				$("#star").attr("class","fa-solid fa-star on fa-2x");	    	   	
	    	   }

	    	   if(data == "overflow"){
	    	   		alert("즐겨찾기는 3개까지만 추가 가능합니다");
	    	   }
	    	   
				parent.document.location.reload();
	    	  
	        }
	       ,error : function(e){
	        }
		});
		
		
		
	} else {
		//db 삭제 (remove) 후 별 색 바꾸기
		let userId = $(this).prev().attr("data-userId");
		let menuName = $(this).prev().text();
		
		

		$.ajax({
	        type: "post"
	       ,url : "/common/favoritesRemove.do"
	       ,data : 
	    	   {
	    	   		"userId" : userId,
	    	   		"menuName" : menuName
	    	   }
	       ,success : function (data){
	       
	    	   console.log(data);
	    	   
	    	   if(data == "success"){
					$("#star").attr("class","fa-regular fa-star off fa-2x");	  	   	
	    	   }

	    	parent.document.location.reload();

	    	  
	        }
	       ,error : function(e){
	        }
		});
			
			
			
		
		
		
	}
});
	







