package com.lms.hexa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.hexa.dto.ParentVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.dto.UserVO;
import com.lms.hexa.service.ParentService;
import com.lms.hexa.service.StudentService;
import com.lms.hexa.service.UserService;

@Controller
@RequestMapping("/member")
public class MemberInfoModifyController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ParentService parentService;
	
	@RequestMapping("/modify/passwordCheckForm")
	public void passwordCheckForm() throws Exception {}
	
	@RequestMapping("/modify/passwordCheck")
	public String passwordCheck(String id, String pw) throws Exception {
		String url = "";
		
		UserVO user = userService.getUser(id);
		
		String password = user.getPw();
		
		if(password.equals(pw)) {
			url = "member/modify/modifyForm";
		} else {
			url = "member/modify/passwordFail";
		}
		
		return url;
	}
	
	@RequestMapping("/modify/modifyForm")
	public void modify()throws Exception{}
	
	@RequestMapping("/modify/passwordModify")
	public String modifyPassword(HttpSession session, String id, String pw) throws Exception {
		
		String url = "/member/modify/modify_success";
		
		UserVO user = userService.getUser(id);

		String type = userService.getUserCategory(id);
		
		user.setPw(pw);
		
		if(type.equals("s")) {
			StudentVO student = studentService.getStudent(id);
			student.setPw(pw);
			studentService.modifyPwd(student);
			
		}else if(type.equals("p")) {
			ParentVO parent = parentService.getParent(id);
			parent.setPw(pw);
			parentService.modifyPwd(parent);
		}
		
		userService.modifyPwd(user);
		
		session.invalidate();
		
		return url;
	}
	
}
