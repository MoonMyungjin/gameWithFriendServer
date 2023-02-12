package com.lms.hexa.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.lms.hexa.dto.StudentVO;

public class StudentLoginSuccessHandler2 extends SavedRequestAwareAuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		Student student = (Student)authentication.getDetails();	
		StudentVO loginUser = student.getStudentVO();  
		HttpSession session = request.getSession();		
		session.setAttribute("loginUser", loginUser);
		session.setAttribute("category", "s");
		session.setAttribute("from", "from");
		session.setMaxInactiveInterval(60*30);
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}
