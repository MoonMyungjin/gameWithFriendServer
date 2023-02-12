package com.lms.hexa.interceptor;

import java.security.Principal;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.lms.hexa.dto.AcademyHomepageUseVO;
import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.service.AcademyHomepageUseService;
import com.lms.hexa.service.ManagerAttandanceService;
import com.lms.hexa.service.MenuService;

import oracle.sql.DATE;


public class CommonInterceptor extends HandlerInterceptorAdapter{
	     
	
		@Autowired
		AcademyHomepageUseService academyHomepageUseService2;
		
		@Autowired
		MenuService menuService2;
		
		private AcademyHomepageUseService academyHomepageUseService;
	
		public void setAcademyHomepageUseService(AcademyHomepageUseService academyHomepageUseService) {
			this.academyHomepageUseService = academyHomepageUseService;
		}
		
		private MenuService menuService;
		
		public void setMenuService(MenuService menuService) {
			this.menuService = menuService;
		}
	 
	    @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	    	
	    
			
	        Principal id = request.getUserPrincipal();
	        String ip = request.getRemoteAddr();	        
	        StringBuffer requestURL = request.getRequestURL();
			/* academyHomepageUseService.insert(); */
	        if (id != null) {

				/* AcademyHomepageUseVO insert = academyHomepageUseService2.insert(); */
	        	
				  
				/*
				 * String acaHuseUserId = insert.getAcaHuseUserId();
				 */
	        	
	        	String checkUrl = "";
	        	String[] strArr = requestURL.toString().split("/");
	        	if(strArr.length == 5) {
	        		
	        		checkUrl ="/"+strArr[3]+"/"+strArr[4];
	        		System.out.println(checkUrl);
	        	}else if(strArr.length == 6) {
	        		checkUrl ="/"+strArr[3]+"/"+strArr[4]+"/"+strArr[5];
	        		System.out.println(checkUrl);
	        	}else if(strArr.length == 7) {
	        		checkUrl ="/"+strArr[3]+"/"+strArr[4]+"/"+strArr[5]+"/"+strArr[6];
	        		System.out.println(checkUrl);
	        	}
	        	
	        		
	        	String menuName = menuService2.selectMenuNameByUrl(checkUrl);
	        	AcademyHomepageUseVO homeImpo = new AcademyHomepageUseVO();
	        	homeImpo.setAcaHuseIp(ip);
	        	homeImpo.setAcaHuseMenuName(menuName);
	        	homeImpo.setAcaHuseUrl(checkUrl);
	        	homeImpo.setAcaHuseUserId(id.getName());
				/*
				 * System.out.println(menuName); System.out.println(acaHuseUserId);
				 * System.out.println(ip);
				 */
	        	LocalDate date = LocalDate.now();
	        	System.out.println(date);
	        	String dateString = date.toString();
	        	System.out.println(dateString);
	        	homeImpo.setAcaHuseDate(dateString);
				System.out.println(requestURL);
				System.out.println(id.getName());



//				 academyHomepageUseService2.insertHomeUseImpo(homeImpo); 

			}
	       
	        return super.preHandle(request, response, handler);
	    }
	 
	   
	     
	}
