<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title><decorator:title default="HEXA System"/></title>

	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  		<!-- jQuery -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
	
  	<decorator:head />
  	<style>
  		[class*=sidebar-dark-] {
		    background-color: rgb(32 73 105);
		}
		[class*=sidebar-dark-] .sidebar a {
		    color: rgb(253 251 216);
		}
		[class*=sidebar-dark-] .nav-treeview>.nav-item>.nav-link {
		    color: #fffcc8;
		}
		[class*=sidebar-dark] .brand-link {
			border-bottom: rgb(32 73 105);
		}
		
  	</style>
  	
</head>

<body>

	<div class="wrapper">
		<%@ include file="/WEB-INF/include/header.jsp" %>
		
<%-- 		<%@ include file="/WEB-INF/include/aside.jsp" %> --%>
			
			<div class="content-wrapper">
				<decorator:body />
			</div>
		
		<%@ include file="/WEB-INF/include/footer.jsp" %>
	</div>


	<script>
	window.onload = function(){
		$('body').attr("class",'sidebar-collapse');
	}
	</script> 
	
	<script defer src="<%=request.getContextPath() %>/resources/js/common.js"></script>  
</body>
</html>