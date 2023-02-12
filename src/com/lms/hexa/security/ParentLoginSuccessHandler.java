package com.lms.hexa.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.lms.hexa.dto.ParentVO;

public class ParentLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		Parent parent = (Parent)authentication.getDetails();	
		ParentVO loginUser = parent.getParentVO();  
		HttpSession session = request.getSession();		
		session.setAttribute("loginUser", loginUser);
		session.setAttribute("category", "p");
		session.setMaxInactiveInterval(60*30);
		System.out.println("successhandler까지옴");
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}
