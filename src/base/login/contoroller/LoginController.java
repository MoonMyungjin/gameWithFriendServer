package base.login.contoroller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import base.login.service.LoginService;
import util.CustomMap;

@RestController
public class LoginController {
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value="/login/loginCheck.do")
	public ModelAndView loginCheck(HttpServletRequest request, HttpMethod httpMethod, @RequestBody HashMap<String, Object> commandMap ) throws Exception{
		ModelAndView modelAndView = new ModelAndView("jsonView");

		Map<String, Object> returnMap = loginService.checkLoginUserInfo(commandMap);
		
		
		modelAndView.addObject("userInfo", returnMap);
		
		return modelAndView;
	}
	
	@CrossOrigin("http://localhost:3000")
	@RequestMapping(value="/login/saveUserNickName.do")
	public ModelAndView saveUserNickName(HttpServletRequest request, HttpMethod httpMethod, @RequestBody HashMap<String, Object> commandMap ) throws Exception{
		ModelAndView modelAndView = new ModelAndView("jsonView");
		Map<String, Object> returnMap = new CustomMap();
		
		String isSaved = "N";
		
		int cnt = loginService.saveUserNickName(commandMap);
		
		if (cnt == 1) {
			isSaved = "Y";
					
			returnMap = loginService.selectUserInfo(commandMap);
			
			modelAndView.addObject("userInfo", returnMap);
			modelAndView.addObject("isSaved", isSaved);
			
		} else {
			isSaved = "N";
		}
		
		return modelAndView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
