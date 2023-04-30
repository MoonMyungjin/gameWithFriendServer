<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>
    <!-- https://fontawesome.com/v5/icons/credit-card?s=regular -->

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      
<!--       <li class="nav-item"> -->
<!--         <div class="navbar-search-block"> -->
<!--           <form class="form-inline"> -->
<!--             <div class="input-group input-group-sm"> -->
<!--               <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search"> -->
<!--               <div class="input-group-append"> -->
<!--                 <button class="btn btn-navbar" type="submit"> -->
<!--                   <i class="fas fa-search"></i> -->
<!--                 </button> -->
<!--                 <button class="btn btn-navbar" type="button" data-widget="navbar-search"> -->
<!--                   <i class="fas fa-times"></i> -->
<!--                 </button> -->
<!--               </div> -->
<!--             </div> -->
<!--           </form> -->
<!--         </div> -->
<!--       </li> -->
      
      <li>
<%--          <a class="nav-link" href="javascript:goPage('/common/noteForm.do?loginUserId=${loginUser.id }')" role="button"> --%>
<!--            <i class="far fa-paper-plane"></i> -->
<!--          </a> -->
      </li>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <div style="display: flex; margin-top:6px;">
      <li id="idContainer">
         <c:if test="${category eq 's' }">
         <div class="row">
          <div id="profileS" style="border-radius: 100%;  height: 4vh; width: 4vh; margin-right :5px; padding: 0px;" ></div>
            [학생] ${loginUser.name }님
              </div>
         </c:if>
         <c:if test="${category eq 'p' }">
            [부모] ${loginUser.parentName }님
         </c:if>
         <c:if test="${category eq 'm' }">
         <div class="row">
           <div id="profile" style="border-radius: 100%;  height: 4vh; width: 4vh; margin-right :5px; padding: 0px;" ></div>
            [직원] ${loginUser.mngName}님
            </div>
         </c:if>
      </li>  &nbsp;&nbsp;&nbsp;&nbsp;
<!--       <li> -->
<%--          <button type="button" class="btn btn-sm btn-warning" onclick="location.href='<%=request.getContextPath() %>/common/logout.do';">로그아웃</button> --%>
<!--       </li> -->
      </div>
      
    </ul>
  </nav>
	<script>
	</script>
</body>