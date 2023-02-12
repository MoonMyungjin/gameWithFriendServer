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
      
      <li class="nav-item">
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>
      
      

      <!-- Messages Dropdown Menu -->
<!--       <li class="nav-item dropdown"> -->
<!--         <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right"> -->
<!--           <a href="#" class="dropdown-item"> -->
<!--             Message Start -->
<!--             <div class="media"> -->
<!--               <img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle"> -->
<!--               <div class="media-body"> -->
<!--                 <h3 class="dropdown-item-title"> -->
<!--                   Brad Diesel -->
<!--                   <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span> -->
<!--                 </h3> -->
<!--                 <p class="text-sm">Call me whenever you can...</p> -->
<!--                 <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p> -->
<!--               </div> -->
<!--             </div> -->
<!--             Message End -->
<!--           </a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a href="#" class="dropdown-item"> -->
<!--             Message Start -->
<!--             <div class="media"> -->
<!--               <img src="dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3"> -->
<!--               <div class="media-body"> -->
<!--                 <h3 class="dropdown-item-title"> -->
<!--                   John Pierce -->
<!--                   <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span> -->
<!--                 </h3> -->
<!--                 <p class="text-sm">I got your message bro</p> -->
<!--                 <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p> -->
<!--               </div> -->
<!--             </div> -->
<!--             Message End -->
<!--           </a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a href="#" class="dropdown-item"> -->
<!--             Message Start -->
<!--             <div class="media"> -->
<!--               <img src="dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3"> -->
<!--               <div class="media-body"> -->
<!--                 <h3 class="dropdown-item-title"> -->
<!--                   Nora Silvester -->
<!--                   <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span> -->
<!--                 </h3> -->
<!--                 <p class="text-sm">The subject goes here</p> -->
<!--                 <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p> -->
<!--               </div> -->
<!--             </div> -->
<!--             Message End -->
<!--           </a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a href="#" class="dropdown-item dropdown-footer">See All Messages</a> -->
<!--         </div> -->
<!--       </li> -->
      <!-- Notifications Dropdown Menu -->
      <li>
         <a class="nav-link" href="javascript:goPage('/common/noteForm.do?loginUserId=${loginUser.id }')" role="button">
           <i class="far fa-paper-plane"></i>
         </a>
      </li>
<!--       <li class="nav-item dropdown"> -->
<!--         <a class="nav-link" data-toggle="dropdown" href="#"> -->
<!--           <i class="far fa-bell"></i> -->
<!--           <span class="badge badge-warning navbar-badge">15</span> -->
<!--         </a> -->
<!--         <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right"> -->
<!--           <span class="dropdown-header">15 Notifications</span> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a href="#" class="dropdown-item"> -->
<!--             <i class="fas fa-envelope mr-2"></i> 4 new messages -->
<!--             <span class="float-right text-muted text-sm">3 mins</span> -->
<!--           </a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a href="#" class="dropdown-item"> -->
<!--             <i class="fas fa-users mr-2"></i> 8 friend requests -->
<!--             <span class="float-right text-muted text-sm">12 hours</span> -->
<!--           </a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a href="#" class="dropdown-item"> -->
<!--             <i class="fas fa-file mr-2"></i> 3 new reports -->
<!--             <span class="float-right text-muted text-sm">2 days</span> -->
<!--           </a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a> -->
<!--         </div> -->
<!--       </li> -->
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
      <li>
         <button type="button" class="btn btn-sm btn-warning" onclick="location.href='<%=request.getContextPath() %>/common/logout.do';">로그아웃</button>
      </li>
      </div>
      
    </ul>
  </nav>
	<div id="userId" style="display: none;">
                     ${loginUser.id }
               </div>
  
 
  <script>

  </script>


</body>