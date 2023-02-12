package com.lms.hexa.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lms.hexa.service.AuthorityService;

@Controller
@RequestMapping("/manager/managermanagement")
public class AuthorityController {
	
	@Autowired
	private AuthorityService authorityService;
	
	@RequestMapping(value = "/authority/regist", method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public void registAuthority(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr) throws Exception{
		int result = authorityService.registAuthority(params);
		
		if(result>0) {
			rttr.addFlashAttribute("msg", "ok");
		}
			rttr.addFlashAttribute("msg", "ng");
		}
	
}
