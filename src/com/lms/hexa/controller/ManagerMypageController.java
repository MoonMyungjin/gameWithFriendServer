package com.lms.hexa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lms.hexa.dto.ManagerVO;
import com.lms.hexa.dto.ParentVO;
import com.lms.hexa.dto.StudentVO;
import com.lms.hexa.dto.UserVO;
import com.lms.hexa.service.ManagerService;
import com.lms.hexa.service.UserService;

@Controller
@RequestMapping("/manager/mypage")
public class ManagerMypageController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("/modify/passwordCheckForm")
	public void passwordCheckForm() throws Exception {}
	
	@RequestMapping("/modify/passwordCheck")
	public String passwordCheck(String id, String pw) throws Exception {
		String url = "";
		
		UserVO user = userService.getUser(id);
		
		String password = user.getPw();
		
		if(password.equals(pw)) {
			url = "manager/mypage/modify/modifyForm";
		} else {
			url = "manager/mypage/modify/passwordFail";
		}
		
		return url;
	}
	
	@RequestMapping("/attandance/list")
	public void idModifyList() throws Exception {}
	
	@RequestMapping("/modify/modifyForm")
	public void modify() throws Exception {}
	
	@RequestMapping("/modify/passwordModify")
	public String modifyPassword(HttpSession session, String id, String pw) throws Exception {
		
		String url = "/member/modify/modify_success";
		
		UserVO user = userService.getUser(id);

		String type = userService.getUserCategory(id);
		
		user.setPw(pw);
		
		if(type.equals("m")) {
			ManagerVO manager = managerService.getManager(id);
			manager.setPw(pw);
			managerService.modifyPwd(manager);
		}
		
		userService.modifyPwd(user);
		
		session.invalidate();
		
		return url;
	}
	
}
