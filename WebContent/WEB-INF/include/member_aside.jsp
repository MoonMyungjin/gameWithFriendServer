<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


	<aside class="main-sidebar sidebar-dark-primary elevation-4">
		
		<!-- 시스템 로고, 시스템 명 -->
		<a href="/member/index.do" class="brand-link"> <img
			src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/HexaLogo.png" alt="HEXA Logo"
			class="brand-image img-circle elevation-3" style="opacity: .8">
			<span class="brand-text font-weight-light">HEXA</span>
		</a>
	
		<!-- 사이드바 -->
		<div class="sidebar">
			
			<!-- 사이드바 메뉴리스트 -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column subMenuList" data-widget="treeview" role="menu" data-accordion="true">
				 <c:forEach items="${menuList }" var="menu">
				 	<c:if test="${menu.menuLevel eq '1'}">
					<!-- 상위메뉴 -->
					<li class="nav-item">
						<a href="javascript:${fn:replace(menu.menuUrl,')',menu.temp) }" class="nav-link">
						
							&nbsp;<i class="${menu.menuIcon }"></i>&nbsp;&nbsp;&nbsp;
							<p>${menu.menuName }
								<c:if test="${menu.menuHaschild eq 'Y'}">
									<i class="fas fa-angle-left right"></i>
								</c:if>
							</p>
						</a>
						<!-- 하위메뉴 -->
						<c:if test="${menu.menuHaschild eq 'Y'}">
									<ul class="nav nav-treeview" style="display: none;">
							<c:forEach items="${submenuList }" var="submenu">
								<c:if test="${submenu.menuUpcode eq menu.menuId}">
										<li class="nav-item">
											<a href="javascript:${fn:replace(submenu.menuUrl,')',submenu.temp) }" class="nav-link">
												
												<p style="margin-left: 3vh;">${submenu.menuName }</p>
											</a>
										</li>
								</c:if>
							</c:forEach>
							</ul>
						</c:if>
					</li>
				 	</c:if>
			     </c:forEach>  
				</ul>
			</nav>
			<!-- /.사이드바 메뉴리스트 -->
		</div>
		<!-- /.사이드바 -->
	</aside>
<script>

</script>
