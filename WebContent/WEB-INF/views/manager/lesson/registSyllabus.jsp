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
</style>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
<script src="<%=request.getContextPath() %>/resources/js/html2canvas.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jspdf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
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
					강의계획서 작성
			   </h3>
            	<div class="card-tools" style="width: 20%">
                <div class="row">
                  <div class="col-md-1">
					<button id="savePdf" type="button" class="btn btn-block btn-danger">PDF</button>
				  </div>
				</div>
               </div>
            </div>
           	<div id="card-body">
           		<div id="savePdf">
           		<textarea class="form-control" name="content" id="content" rows="20">
					<table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="446" style="width: 334.25pt;">
 <tbody><tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes;height:20.4pt;mso-row-margin-right:
  10.2pt">
  <td width="432" nowrap="" colspan="2" rowspan="3" style="width:324.05pt;padding:0cm 4.95pt 0cm 4.95pt;
  height:20.4pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0cm; line-height: normal; word-break: keep-all;"><u><span style="font-size:
  22.0pt;mso-ascii-font-family:&quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;
  mso-hansi-font-family:&quot;맑은 고딕&quot;;mso-bidi-font-family:굴림;color:black;mso-font-kerning:
  0pt">강 의 계 획 서<span lang="EN-US"><o:p></o:p></span></span></u></p>
  </td>
  <td style="mso-cell-special:placeholder;border:none;padding:0cm 0cm 0cm 0cm" width="14"><p class="MsoNormal">&nbsp;</p></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:20.4pt;border:none" width="0" height="27"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:1;height:16.5pt">
  <td width="14" nowrap="" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;
  height:16.5pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:16.5pt;border:none" width="0" height="22"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:2;height:17.25pt">
  <td width="14" nowrap="" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;
  height:17.25pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:17.25pt;border:none" width="0" height="23"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:3;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  mso-border-top-alt:1.0pt;mso-border-left-alt:1.0pt;mso-border-bottom-alt:
  .5pt;mso-border-right-alt:.5pt;mso-border-color-alt:windowtext;mso-border-style-alt:
  solid;background:#DBDBDB;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0cm; line-height: normal; word-break: keep-all;"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">강 의 명<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:solid windowtext 1.0pt;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext 1.0pt;mso-border-bottom-alt:solid windowtext .5pt;
  mso-border-right-alt:solid black 1.0pt;padding:0cm 4.95pt 0cm 4.95pt;
  height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:4;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;background:
  #DBDBDB;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0cm; line-height: normal; word-break: keep-all;"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">강 의 실<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:5;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;background:
  #DBDBDB;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0cm; line-height: normal; word-break: keep-all;"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">강 사 명<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:6;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;background:
  #DBDBDB;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0cm; line-height: normal; word-break: keep-all;"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">강의기간<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:7;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext .5pt;background:
  #DBDBDB;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0cm; line-height: normal; word-break: keep-all;"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">교 재 명<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:8;height:23.1pt">
  <td width="104" nowrap="" rowspan="2" style="width:78.0pt;border-top:none;
  border-left:solid windowtext 1.0pt;border-bottom:solid black 1.0pt;
  border-right:solid windowtext 1.0pt;mso-border-left-alt:solid windowtext 1.0pt;
  mso-border-bottom-alt:solid black 1.0pt;mso-border-right-alt:solid windowtext .5pt;
  background:#DBDBDB;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0cm; line-height: normal; word-break: keep-all;"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">강의목표<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" rowspan="2" style="width:246.05pt;border-top:none;
  border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:9;height:23.1pt">
  <td width="14" nowrap="" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;
  height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:10;height:20.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;background:
  #DBDBDB;padding:0cm 4.95pt 0cm 4.95pt;height:20.1pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0cm; line-height: normal; word-break: keep-all;"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">차 시<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext 1.0pt;mso-border-top-alt:solid windowtext 1.0pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  background:#DBDBDB;padding:0cm 4.95pt 0cm 4.95pt;height:20.1pt">
  <p class="MsoNormal" align="center" style="margin-bottom: 0cm; line-height: normal; word-break: keep-all;"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">내<span lang="EN-US">&nbsp; </span>용<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:20.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:20.1pt;border:none" width="0" height="27"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:11;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;padding:
  0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:12;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;padding:
  0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:13;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;padding:
  0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:14;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;padding:
  0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:15;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;padding:
  0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:16;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;padding:
  0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:17;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;padding:
  0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:18;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;padding:
  0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:19;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;padding:
  0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:20;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;padding:
  0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:21;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-left-alt:solid windowtext 1.0pt;mso-border-bottom-alt:
  solid windowtext .5pt;mso-border-right-alt:solid windowtext 1.0pt;padding:
  0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;
  mso-border-bottom-alt:solid windowtext .5pt;mso-border-right-alt:solid black 1.0pt;
  padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
 <tr style="mso-yfti-irow:22;mso-yfti-lastrow:yes;height:23.1pt">
  <td width="104" nowrap="" style="width:78.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="328" nowrap="" style="width:246.05pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid black 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;padding:0cm 4.95pt 0cm 4.95pt;
  height:23.1pt">
  <p class="MsoNormal" align="left" style="margin-bottom:0cm;text-align:left;
  line-height:normal;mso-pagination:widow-orphan;text-autospace:ideograph-numeric ideograph-other;
  word-break:keep-all"><span style="font-size:11.0pt;mso-ascii-font-family:
  &quot;맑은 고딕&quot;;mso-fareast-font-family:&quot;맑은 고딕&quot;;mso-hansi-font-family:&quot;맑은 고딕&quot;;
  mso-bidi-font-family:굴림;color:black;mso-font-kerning:0pt">　<span lang="EN-US"><o:p></o:p></span></span></p>
  </td>
  <td width="14" style="width:10.2pt;padding:0cm 4.95pt 0cm 4.95pt;height:23.1pt"></td>
  <!--[if !supportMisalignedRows]-->
  <td style="height:23.1pt;border:none" width="0" height="31"></td>
  <!--[endif]-->
 </tr>
</tbody></table>
				</textarea>
</div>
           	</div>
         </div>
		</div>         
      </div>
   </div>
</section>
	
<script>
window.onload = function(){
	$('#content').summernote({
		height : 800,
		focus : true,
		lang : "ko-KR",
		toolbar: [
			
		]        

	});
	
<%-- 	summernote_go($('#content'),'<%=request.getContextPath()%>');		 --%>
	$('#savePdf').click(function() { // pdf저장 button id
		let fileName;
		let lessonAssignmentId;
	    html2canvas($('.note-editing-area')[0]).then(function(canvas) { //저장 영역 div id
		
	    // 캔버스를 이미지로 변환
	    var imgData = canvas.toDataURL('image/png');
		     
	    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
	    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	    var imgHeight = canvas.height * imgWidth / canvas.width;
	    var heightLeft = imgHeight;
	    var margin = 10; // 출력 페이지 여백설정
	    var doc = new jsPDF('p', 'mm');
	    var position = 0;
	       
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
	 	lessonAssignmentId = ${lessonAssignmentId};
	 	fileName = uuidv4()+'$$'+lessonAssignmentId+'.pdf';
	    // 파일 저장
	    doc.save(fileName);

			let sdataSet = {
					"file" : "C:\\Users\\zs0ad\\Downloads\\"+fileName
				   ,"lessonAssignmentId" : lessonAssignmentId
			};
			
			sdataSet = JSON.stringify(sdataSet);
			console.log("here");
			$.ajax({
		        type: "post"
		       ,url : "/manager/lesson/registSyllabusToDataBase.do"
		       ,contentType: 'application/json'
		       ,data : sdataSet
		       ,success : function (data){
				   console.log(data);		    	   
		        }
		       ,error : function(e){
		        }
			});
			
		});

		$("#savePdf").css("display","none");
		
		Swal.fire({
			   title: '강의계획서가 등록되었습니다!',
	   			icon: 'success'
		   });
		setTimeout(function() {
			CloseWindow();
			}, 3000);
	});
	
	function uuidv4() {
		  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
		    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
		    return v.toString(16);
		  });
		}
	
}
</script>
<script>
</script>
</body>
</html>