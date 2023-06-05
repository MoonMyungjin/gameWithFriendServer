<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	
    <!-- Left navbar links -->
    <ul class="navbar-nav">
    <a href="/" class="brand-link"> <img
		src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/HexaLogo.png" alt="HEXA Logo"
		class="brand-image img-circle elevation-3" style="opacity: .8">
	</a>
	<a href="/admin/userList.do">[회원관리]</a>&emsp;
	<a href="/admin/champion/list.do">[LOL 챔피언 정보관리]</a>&emsp;
	<a href="/admin/option/list.do">[옵션 정보관리]</a>&emsp;
    </ul>
    <ul class="navbar-nav ml-auto">
	<li id="idContainer">
		gameWithFriend 관리자
	</li>
      
    </ul>
  </nav>
</body>