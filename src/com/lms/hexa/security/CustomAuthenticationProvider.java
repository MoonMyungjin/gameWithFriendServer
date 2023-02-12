package com.lms.hexa.security;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.ParentVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.dto.UserVO;
import com.lms.hexa.service.LoginUserService;

public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	private LoginUserService userService;
	public void setUserService(LoginUserService userService) {
		this.userService = userService;
	}
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		
		String login_id = (String) auth.getPrincipal(); // 로그인 시도한 ID를 가져온다
 		String login_pwd = (String) auth.getCredentials(); //로그인 시도한 Password 를 가져온다.
 		
 		
 		ManagerVO manager = null;
 		StudentVO student = null;
 		ParentVO parent = null;
 		
 		try {
 			UserVO user = userService.getUser(login_id);
 			String category = user.getCategory();
 			
 			if(category.equals("m")) {
 				manager = userService.getManager(login_id);
 			}
 			if(category.equals("s")) {
 				student = userService.getStudent(login_id);
 			}
 			if(category.equals("p")) {
 				parent = userService.getParent(login_id);
 			}
 			
 			System.out.println(manager);
 			System.out.println(student);
 			System.out.println(parent);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BadCredentialsException("서버 장애로 서비스가 불가합니다.");
		}
 		
 		if(manager != null) {
 			
 			if(login_pwd.equals(manager.getPw())) {//아이디 패스워드 일치
 				UserDetails authManager = new Manager(manager);
// 				boolean invalidCheck = authManager.isAccountNonExpired()
//					  	   && authManager.isAccountNonLocked()
//					  	   && authManager.isCredentialsNonExpired()
//					  	   && authManager.isEnabled();
// 				if(invalidCheck) {
// 					// 	스프링 시큐리티 내부 클래스로 인증 토큰 생성한다.
// 					UsernamePasswordAuthenticationToken result =
//							new UsernamePasswordAuthenticationToken(authManager.getUsername(),
//																	authManager.getPassword(),
//																	authManager.getAuthorities());
//			 		// 전달할 내용을 설정한 후 
//			         result.setDetails(authManager);
//			         // 리턴한다. successHandler로 전송된다.   
//			         return result;
// 				}
 				
 				UsernamePasswordAuthenticationToken result =
						new UsernamePasswordAuthenticationToken(authManager.getUsername(),
																authManager.getPassword(),
																authManager.getAuthorities());
 				result.setDetails(authManager);
 				
 				return result;
 				
// 				throw new BadCredentialsException("상태변경으로 로그인이 불가합니다.");
 			}else { // 패스워드 불일치
 				throw new BadCredentialsException("패스워드가 일치하지 않습니다.");
 			}
 			
 		} else if(student !=null) {
 			if(login_pwd.equals(student.getPw())) {//아이디 패스워드 일치
 				UserDetails authStudent = new Student(student);
 				
 				UsernamePasswordAuthenticationToken result =
						new UsernamePasswordAuthenticationToken(authStudent.getUsername(),
																authStudent.getPassword(),
																authStudent.getAuthorities());
 				result.setDetails(authStudent);
 				
 				return result;
 			} else {
 				throw new BadCredentialsException("패스워드가 일치하지 않습니다.");
 			}
 			
 		} else if(parent !=null){
 			if(login_pwd.equals(parent.getPw())) {//아이디 패스워드 일치
 				UserDetails authParent = new Parent(parent);
 				UsernamePasswordAuthenticationToken result = 
 						new UsernamePasswordAuthenticationToken(authParent.getUsername(),
 																authParent.getPassword(),
 																authParent.getAuthorities());
 				result.setDetails(authParent);
 				System.out.println("check");
 				
 				return result;
 				
 			}else {
 				throw new BadCredentialsException("패스워드가 일치하지 않습니다.");
 			}
 		}else { // 존재하지 않는 아이디
 			throw new BadCredentialsException("존재하지 않는 아이디입니다.");
 		}
	
	}

	@Override
	public boolean supports(Class<?> auth) {
		return auth.equals(UsernamePasswordAuthenticationToken.class);
	}
	
}





