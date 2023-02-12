<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

	<title><decorator:title default="Hexa System"/></title>


  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  <script src="https://kit.fontawesome.com/d7b47d7e08.js" crossorigin="anonymous"></script>
	
  <style>
   *{
   font-size: 14px;
   }
  	.card-dark.card-outline {
	    border-top: 4px solid #395d83;
	}
	.btn-dark {
	    color: #fdfbd7;
	    background-color: #395d83;
	    border-color: white;
	    box-shadow: none;
	}
	.card-light.card-outline {
	    border-top: 4px solid #9674d3cf;
	}
	.btn-light {
	    color: #fdfbd7;
	    background-color: #9674d3cf;
	    border-color: white;
	    box-shadow: none;
	}
	
	.card-default.card-outline {
	    border-top: 4px solid #3ab5eb;
	}
	.btn-default {
	    color: #fdfbd7;
	    background-color: #3ab5eb;
	    border-color: #3ab5eb;
	    box-shadow: none;
	}
	
	.table-head-fixed th {
		padding-top: 0.3em;
		padding-bottom: 0.3em;
	}
	.table-head-fixed td {
		padding-top: 0.3em;
		padding-bottom: 0.3em;
	}
	
		.card-body.p-0 .table thead>tr>th:first-of-type {
		padding-left: 12px;
	}
		.card-body.p-0 .table tbody>tr>td:first-of-type {
		padding-left: 12px;
	}
	.card-body.p-0 .table thead>tr>th:last-of-type {
		padding-right: 12px;
	}
		.card-body.p-0 .table tbody>tr>td:last-of-type {
		padding-right: 12px;
	}
	
	
	th, td {
		text-align: center;
	}
	.fa-solid.fa-star.on {
		color: #ffc107; 
/* 		margin-top: 15px; */
		margin-left: 7px;
		cursor: pointer;
		
	}
	
	.fa-regular.fa-star.off {
		color: #ffc107; 
		margin-left: 7px;
		cursor: pointer;
	}
	
/* 	.highlightWord{ */
/* 		background-color: yellow; */
/* 		color : red; */
/* 	} */
 	.highlightWord{ 
 		font-weight : bold;
 		color : red; 
 	} 
#load {
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    position: fixed;
    display: block;
    opacity: 0.8;
    background: white;
    z-index: 90;
    text-align: center;
}

#load > img {
    position: absolute;
    top: 40%;
    left: 40%;
    z-index: 100;
    width : 100px;
    height: 100px;
}
  </style>

<decorator:head />

</head>
<body>

<decorator:body />
<!-- jQuery -->
<script defer src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<!-- Bootstrap 4 -->
<script defer src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script defer src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- summernote -->
<script defer src="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>
<!-- pdf 저장 --> 
<script src="<%=request.getContextPath() %>/resources/js/html2canvas.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jspdf.min.js"></script>


<script defer src="<%=request.getContextPath() %>/resources/js/common.js"></script> 

 

<script defer src="<%=request.getContextPath() %>/resources/js/common.js"></script>  

<!-- excel 저장 -->
<script defer src='<%=request.getContextPath()%>/resources/js/jquery.table2excel.js'></script>	
<script defer src="<%=request.getContextPath() %>/resources/js/common.js"></script>  

</body>


</html>






